#!/usr/bin/env python3
# Instructions:
# 1. Save this script in the root IG directory.
# 2. Uncomment all conformance-verb-related issues that may be suppressed in
#    ignoreWarnings.txt.
# 3. Run:
#       python process_conformance_deqm_resources.py
# 4. Review the proposed tagged verbs in:
#       PROPOSED_conformance_statements.csv
# 5. Insert the tagged-verb table on an IG page using:
#       §§§
# 6. Run:
#       python process_conformance_deqm_resources.py --apply
# 7. Review the narrative text for expected tagging, the newly created table,
#    and the QA page.
#
"""Tag DEQM narrative conformance statements in Markdown and resource descriptions.

Scans by default:
  input/pagecontent/**/*.md
  input/includes/**/*.md
  input/resources/**/*.json  (string-valued description properties only)
  input/resources/**/*.xml   (<description value="..."/> only)

Preview:
  python process_conformance_deqm_consistent.py

Apply:
  python process_conformance_deqm_consistent.py --apply

Publisher source syntax:
  §deqm-78: The client **SHALL** support the operation. §       (Markdown)
  §deqm-79: The server <b>SHALL</b> support the operation. §    (JSON/XML)

The §deqm-##: prefix and closing § are Publisher source markers. They should
not appear in the rendered IG. The Publisher should render the original
sentence followed only by its linked superscript and should populate the
§§§ narrative-conformance table.

Formatting rules:
- Markdown narrative: recognized verbs are wrapped in **.
- JSON/XML description strings: recognized verbs are wrapped in <b>.
- Existing Publisher blocks are preserved by identifier and normalized to the
  appropriate formatting style for their source type.
"""

from __future__ import annotations

import argparse
import csv
import html
import json
import os
import re
import sys
import tempfile
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

MARKDOWN_DIRS = [Path("input/pagecontent"), Path("input/includes")]
RESOURCE_DIR = Path("input/resources")
EXISTING_CSV_FILE = Path("conformance_statements.csv")
PROPOSED_CSV_FILE = Path("PROPOSED_conformance_statements.csv")
STANDARD_FIELDS = ["reference", "statement", "sourcefile", "line", "location"]
EXCLUDE_FILES = {
    "changehistory.md", "change-notes.md", "narrative-conformance.md",
    "todo.md", "error-note.md",
}

VERB_TEXT = r"SHALL NOT|SHOULD NOT|MUST NOT|SHALL|SHOULD|MUST|MAY"
ANY_VERB_PATTERN = re.compile(rf"\b({VERB_TEXT})\b")
MARKDOWN_BOLDED_VERB_PATTERN = re.compile(
    rf"\*\*\s*({VERB_TEXT})\s*\*\*"
)
HTML_BOLDED_VERB_PATTERN = re.compile(
    rf"<b\b[^>]*>\s*({VERB_TEXT})\s*</b>",
    re.IGNORECASE,
)
REFERENCE_PATTERN = re.compile(r"§deqm-(\d+)", re.IGNORECASE)
PUBLISHER_BLOCK_PATTERN = re.compile(
    r"§deqm-(\d+)\s*:(.*?)§", re.IGNORECASE | re.DOTALL
)
SENTENCE_BOUNDARY_PATTERN = re.compile(r"(?<=[.!?])(?=\s+)")
JSON_DESCRIPTION_PATTERN = re.compile(
    r'("description"\s*:\s*)("(?:(?:\\.)|[^"\\])*")', re.DOTALL
)
XML_DESCRIPTION_PATTERN = re.compile(
    r"(<description\b[^>]*?\bvalue\s*=\s*)([\"'])(.*?)(\2)([^>]*?/?>)",
    re.IGNORECASE | re.DOTALL,
)


@dataclass(frozen=True)
class Statement:
    reference: str
    statement: str
    sourcefile: str
    line: int
    location: str

    def as_dict(self) -> dict[str, str]:
        return {
            "reference": self.reference,
            "statement": self.statement,
            "sourcefile": self.sourcefile,
            "line": str(self.line),
            "location": self.location,
        }


@dataclass(frozen=True)
class ExistingMarker:
    number: int
    sourcefile: str
    line: int
    location: str
    contains_bold_verb: bool


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Tag DEQM conformance statements in narrative source."
    )
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--existing-csv", type=Path, default=EXISTING_CSV_FILE)
    parser.add_argument("--proposed-csv", type=Path, default=PROPOSED_CSV_FILE)
    parser.add_argument("--verbose", action="store_true")
    parser.set_defaults(normalize_existing=True)
    parser.add_argument(
        "--normalize-existing", dest="normalize_existing", action="store_true",
        help="Normalize verb bolding inside existing Publisher blocks (default).",
    )
    parser.add_argument(
        "--no-normalize-existing", dest="normalize_existing", action="store_false",
    )
    return parser.parse_args()


def markdown_files() -> list[Path]:
    files: list[Path] = []
    for directory in MARKDOWN_DIRS:
        if not directory.exists():
            print(f"Warning: directory not found: {directory}", file=sys.stderr)
            continue
        files.extend(
            path for path in directory.rglob("*.md")
            if path.name not in EXCLUDE_FILES
        )
    return sorted(set(files), key=lambda p: p.as_posix().lower())


def resource_files() -> list[Path]:
    if not RESOURCE_DIR.exists():
        print(f"Warning: directory not found: {RESOURCE_DIR}", file=sys.stderr)
        return []
    files = list(RESOURCE_DIR.rglob("*.json"))
    files.extend(RESOURCE_DIR.rglob("*.xml"))
    return sorted(set(files), key=lambda p: p.as_posix().lower())


def read_csv_rows(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    if not path.exists():
        return STANDARD_FIELDS.copy(), []
    try:
        with path.open("r", newline="", encoding="utf-8-sig") as handle:
            reader = csv.DictReader(handle)
            if reader.fieldnames is None:
                raise ValueError(f"{path} does not contain a CSV header")
            return list(reader.fieldnames), [dict(row) for row in reader]
    except PermissionError as exc:
        raise PermissionError(
            f"Cannot read {path}. Close it in Excel or another application."
        ) from exc


def atomic_write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".tmp",
        dir=str(path.parent.resolve()), text=True,
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8", newline="") as handle:
            handle.write(content)
        os.replace(tmp, path)
    except Exception:
        try:
            os.unlink(tmp)
        except OSError:
            pass
        raise


def atomic_write_csv(
    path: Path, fieldnames: list[str], rows: Iterable[dict[str, str]]
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".tmp",
        dir=str(path.parent.resolve()), text=True,
    )
    try:
        with os.fdopen(fd, "w", newline="", encoding="utf-8") as handle:
            writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
            writer.writeheader()
            for row in rows:
                writer.writerow({field: row.get(field, "") for field in fieldnames})
        os.replace(tmp, path)
    except PermissionError as exc:
        try:
            os.unlink(tmp)
        except OSError:
            pass
        raise PermissionError(
            f"Cannot write {path}. Close it in Excel or another application."
        ) from exc
    except Exception:
        try:
            os.unlink(tmp)
        except OSError:
            pass
        raise


def line_number_at(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def highest_reference_in_csv(rows: Iterable[dict[str, str]]) -> int:
    highest = 0
    for row in rows:
        for value in row.values():
            if value:
                for match in REFERENCE_PATTERN.finditer(value):
                    highest = max(highest, int(match.group(1)))
    return highest


def strip_verb_formatting(text: str) -> str:
    """Remove only Markdown/HTML bold wrappers around recognized verbs."""
    text = MARKDOWN_BOLDED_VERB_PATTERN.sub(lambda m: m.group(1), text)
    text = HTML_BOLDED_VERB_PATTERN.sub(lambda m: m.group(1), text)
    return text


def format_verbs(text: str, style: str) -> str:
    """
    Apply source-appropriate bold formatting to every recognized verb.

    style="markdown" -> **SHALL**
    style="html"     -> <b>SHALL</b>
    """
    normalized = strip_verb_formatting(text)

    if style == "markdown":
        return ANY_VERB_PATTERN.sub(lambda m: f"**{m.group(1)}**", normalized)
    if style == "html":
        return ANY_VERB_PATTERN.sub(lambda m: f"<b>{m.group(1)}</b>", normalized)

    raise ValueError(f"Unsupported verb formatting style: {style}")


def normalize_existing_blocks(text: str, style: str) -> str:
    """
    Preserve existing requirement identifiers and normalize only the verb
    formatting inside each Publisher block.
    """
    return PUBLISHER_BLOCK_PATTERN.sub(
        lambda match: format_verbs(match.group(0), style),
        text,
    )


def existing_markers_in_text(
    text: str, sourcefile: str, location: str, base_line: int = 1
) -> list[ExistingMarker]:
    results: list[ExistingMarker] = []
    for match in PUBLISHER_BLOCK_PATTERN.finditer(text):
        block = match.group(0)
        results.append(
            ExistingMarker(
                number=int(match.group(1)),
                sourcefile=sourcefile,
                line=base_line + text.count("\n", 0, match.start()),
                location=location,
                contains_bold_verb=bool(
                    MARKDOWN_BOLDED_VERB_PATTERN.search(block)
                    or HTML_BOLDED_VERB_PATTERN.search(block)
                ),
            )
        )
    return results


def visible_statement(text: str) -> str:
    text = re.sub(r"^\s*§deqm-\d+\s*:\s*", "", text, flags=re.IGNORECASE)
    text = re.sub(r"\s*§\s*$", "", text)
    text = strip_verb_formatting(text)
    return " ".join(text.split())


def wrap_segment(segment: str, reference: str, style: str) -> str:
    """
    Wrap one complete sentence in Publisher marker syntax while retaining list
    syntax outside the block. The requirement prefix exists only in source;
    the Publisher is expected to replace it with a linked superscript.
    """
    leading_match = re.match(r"^\s*", segment)
    trailing_match = re.search(r"\s*$", segment)
    leading = leading_match.group(0) if leading_match else ""
    trailing = trailing_match.group(0) if trailing_match else ""
    end = len(segment) - len(trailing) if trailing else len(segment)
    core = segment[len(leading):end]

    list_match = re.match(r"^([-+*]|\d+\.)\s+", core)
    if list_match:
        prefix = list_match.group(0)
        core = core[len(prefix):]
        formatted = format_verbs(core, style)
        return f"{leading}{prefix}§{reference}: {formatted} §{trailing}"

    formatted = format_verbs(core, style)
    return f"{leading}§{reference}: {formatted} §{trailing}"


def process_plain_text(
    text: str,
    next_number: int,
    sourcefile: str,
    base_line: int,
    location: str,
    style: str,
) -> tuple[str, list[Statement], int]:
    """
    Tag each untagged sentence containing a recognized conformance verb.

    Existing Publisher blocks are protected and are never assigned a new ID.
    """
    scan_text = strip_verb_formatting(text)
    if not ANY_VERB_PATTERN.search(scan_text):
        return text, [], next_number

    protected: dict[str, str] = {}

    def protect(match: re.Match[str]) -> str:
        token = f"\x00DEQM_BLOCK_{len(protected)}\x00"
        protected[token] = match.group(0)
        return token

    working = PUBLISHER_BLOCK_PATTERN.sub(protect, text)
    segments = SENTENCE_BOUNDARY_PATTERN.split(working)
    output: list[str] = []
    found: list[Statement] = []
    offset = 0

    for segment in segments:
        if any(token in segment for token in protected):
            output.append(segment)
            offset += len(segment)
            continue

        if not ANY_VERB_PATTERN.search(strip_verb_formatting(segment)):
            output.append(segment)
            offset += len(segment)
            continue

        reference = f"deqm-{next_number:02d}"
        output.append(wrap_segment(segment, reference, style))
        found.append(
            Statement(
                reference=f"§{reference}",
                statement=visible_statement(segment),
                sourcefile=sourcefile,
                line=base_line + text.count("\n", 0, offset),
                location=location,
            )
        )
        next_number += 1
        offset += len(segment)

    result = "".join(output)
    for token, block in protected.items():
        result = result.replace(token, block)
    return result, found, next_number


def process_markdown_file(
    path: Path, next_number: int, normalize_existing: bool
) -> tuple[str, list[Statement], int]:
    original = path.read_text(encoding="utf-8")
    working = normalize_existing_blocks(original, "markdown") if normalize_existing else original
    lines = working.splitlines(keepends=True)
    output: list[str] = []
    found: list[Statement] = []

    in_fence = False
    fence_char: str | None = None
    in_html_code = False
    in_liquid_highlight = False

    for line_number, line in enumerate(lines, start=1):
        if line.endswith("\r\n"):
            body, newline = line[:-2], "\r\n"
        elif line.endswith("\n"):
            body, newline = line[:-1], "\n"
        else:
            body, newline = line, ""

        stripped = body.strip()
        lower = stripped.lower()
        fence = re.match(r"^\s*(```+|~~~+)", body)
        if fence:
            current = fence.group(1)[0]
            if not in_fence:
                in_fence, fence_char = True, current
            elif fence_char == current:
                in_fence, fence_char = False, None
            output.append(line)
            continue

        if lower.startswith("{% highlight"):
            in_liquid_highlight = True
            output.append(line)
            continue
        if lower.startswith("{% endhighlight"):
            in_liquid_highlight = False
            output.append(line)
            continue
        if "<pre" in lower or "<code" in lower:
            in_html_code = True

        skip = (
            in_fence or in_html_code or in_liquid_highlight
            or not stripped or stripped.startswith("#")
        )
        if skip:
            output.append(line)
            if "</pre>" in lower or "</code>" in lower:
                in_html_code = False
            continue
        if "</pre>" in lower or "</code>" in lower:
            in_html_code = False

        updated, statements, next_number = process_plain_text(
            body,
            next_number,
            path.as_posix(),
            line_number,
            "Markdown narrative",
            "markdown",
        )
        output.append(updated + newline)
        found.extend(statements)

    return "".join(output), found, next_number


def process_json_file(
    path: Path, next_number: int, normalize_existing: bool
) -> tuple[str, list[Statement], int]:
    original = path.read_text(encoding="utf-8")
    pieces: list[str] = []
    found: list[Statement] = []
    last = 0

    for index, match in enumerate(JSON_DESCRIPTION_PATTERN.finditer(original)):
        pieces.append(original[last:match.start()])
        value = json.loads(match.group(2))
        if normalize_existing:
            value = normalize_existing_blocks(value, "html")
        updated, statements, next_number = process_plain_text(
            value,
            next_number,
            path.as_posix(),
            line_number_at(original, match.start(2)),
            f"JSON description[{index}]",
            "html",
        )
        pieces.append(match.group(1) + json.dumps(updated, ensure_ascii=False))
        found.extend(statements)
        last = match.end()

    pieces.append(original[last:])
    return "".join(pieces), found, next_number


def process_xml_file(
    path: Path, next_number: int, normalize_existing: bool
) -> tuple[str, list[Statement], int]:
    original = path.read_text(encoding="utf-8")
    pieces: list[str] = []
    found: list[Statement] = []
    last = 0

    for index, match in enumerate(XML_DESCRIPTION_PATTERN.finditer(original)):
        pieces.append(original[last:match.start()])
        value = html.unescape(match.group(3))
        if normalize_existing:
            value = normalize_existing_blocks(value, "html")
        updated, statements, next_number = process_plain_text(
            value,
            next_number,
            path.as_posix(),
            line_number_at(original, match.start(3)),
            f"XML description[{index}]",
            "html",
        )
        encoded = html.escape(updated, quote=True)
        if match.group(2) == "'":
            encoded = encoded.replace("&#x27;", "&apos;")
        pieces.append(
            match.group(1) + match.group(2) + encoded
            + match.group(4) + match.group(5)
        )
        found.extend(statements)
        last = match.end()

    pieces.append(original[last:])
    return "".join(pieces), found, next_number


def inventory_markers(md_files: list[Path], res_files: list[Path]) -> list[ExistingMarker]:
    markers: list[ExistingMarker] = []
    for path in md_files:
        text = path.read_text(encoding="utf-8")
        markers.extend(existing_markers_in_text(text, path.as_posix(), "Markdown narrative"))

    for path in res_files:
        text = path.read_text(encoding="utf-8")
        if path.suffix.lower() == ".json":
            for index, match in enumerate(JSON_DESCRIPTION_PATTERN.finditer(text)):
                markers.extend(
                    existing_markers_in_text(
                        json.loads(match.group(2)), path.as_posix(),
                        f"JSON description[{index}]", line_number_at(text, match.start(2))
                    )
                )
        else:
            for index, match in enumerate(XML_DESCRIPTION_PATTERN.finditer(text)):
                markers.extend(
                    existing_markers_in_text(
                        html.unescape(match.group(3)), path.as_posix(),
                        f"XML description[{index}]", line_number_at(text, match.start(3))
                    )
                )
    return markers


def row_for_schema(statement: Statement, fields: list[str]) -> dict[str, str]:
    source = statement.as_dict()
    row = {field: "" for field in fields}
    aliases = {
        "reference": {"reference", "ref", "id", "identifier"},
        "statement": {"statement", "conformance_statement", "requirement", "text"},
        "sourcefile": {"sourcefile", "source_file", "file", "filename", "path"},
        "line": {"line", "line_number", "linenumber"},
        "location": {"location", "field", "element", "source_location"},
    }
    normalized = {
        field: re.sub(r"[^a-z0-9]+", "_", field.lower()).strip("_")
        for field in fields
    }
    for source_key, names in aliases.items():
        for field, normalized_name in normalized.items():
            if normalized_name in names:
                row[field] = source[source_key]
                break
    return row


def reminders() -> None:
    print("\nReminders:")
    print("1) Consider deleting PROPOSED_conformance_statements.csv after review and application.")
    print("2) If this is the first time conformance verbs are being tagged in this IG, consider where to insert the tagged verb table within the IG.")


def main() -> int:
    args = parse_args()
    md_files = markdown_files()
    res_files = resource_files()
    if not md_files and not res_files:
        print("No supported source files found.", file=sys.stderr)
        return 1

    existing_fields, existing_rows = read_csv_rows(args.existing_csv)
    markers = inventory_markers(md_files, res_files)
    grouped: dict[int, list[ExistingMarker]] = defaultdict(list)
    for marker in markers:
        grouped[marker.number].append(marker)
    duplicates = {number: rows for number, rows in grouped.items() if len(rows) > 1}

    highest_source = max(grouped.keys(), default=0)
    highest_existing = max(highest_source, highest_reference_in_csv(existing_rows))
    next_number = highest_existing + 1
    proposed: list[Statement] = []
    modified: dict[Path, str] = {}

    for path in md_files:
        updated, found, next_number = process_markdown_file(
            path, next_number, args.normalize_existing
        )
        if updated != path.read_text(encoding="utf-8"):
            modified[path] = updated
        proposed.extend(found)

    for path in res_files:
        if path.suffix.lower() == ".json":
            updated, found, next_number = process_json_file(
                path, next_number, args.normalize_existing
            )
        else:
            updated, found, next_number = process_xml_file(
                path, next_number, args.normalize_existing
            )
        if updated != path.read_text(encoding="utf-8"):
            modified[path] = updated
        proposed.extend(found)

    atomic_write_csv(
        args.proposed_csv, STANDARD_FIELDS,
        [statement.as_dict() for statement in proposed]
    )

    bold_markers = [marker for marker in markers if marker.contains_bold_verb]
    print(f"Markdown files scanned: {len(md_files)}")
    print(f"Resource files scanned: {len(res_files)}")
    print("Resource fields inspected: description only")
    print(f"Existing conformance rows preserved: {len(existing_rows)}")
    print(f"Highest existing DEQM number: {highest_existing}")
    print(f"Proposed new conformance statements: {len(proposed)}")
    print(f"Existing blocks with recognized verb formatting: {len(bold_markers)}")
    print(f"Duplicate existing identifiers: {len(duplicates)}")
    if proposed:
        print(f"Proposed numbering: {proposed[0].reference} through {proposed[-1].reference}")

    if duplicates:
        print("\nDuplicate identifiers must be resolved before --apply:")
        for number, occurrences in sorted(duplicates.items()):
            print(f"  §deqm-{number:02d}")
            for item in occurrences:
                print(f"    {item.sourcefile}:{item.line} ({item.location})")

    if args.verbose:
        if bold_markers:
            print("\nExisting blocks whose verb formatting will be normalized:")
            for item in bold_markers:
                print(f"  §deqm-{item.number:02d} {item.sourcefile}:{item.line} ({item.location})")
        if proposed:
            print("\nProposed statements:")
            for item in proposed:
                print(f"  {item.reference} {item.sourcefile}:{item.line} ({item.location}) {item.statement}")

    if not args.apply:
        print(f"Source files that would change: {len(modified)}")
        print(f"Existing CSV left unchanged: {args.existing_csv}")
        print(f"Proposed CSV written to: {args.proposed_csv}")
        print("No source files were modified. Re-run with --apply to write changes.")
        reminders()
        return 0

    if duplicates:
        print("\nApply cancelled because duplicate identifiers exist.", file=sys.stderr)
        return 2

    for path, updated in modified.items():
        atomic_write_text(path, updated)

    if args.existing_csv.exists():
        combined = list(existing_rows)
        combined.extend(row_for_schema(item, existing_fields) for item in proposed)
        fields = existing_fields
    else:
        combined = [item.as_dict() for item in proposed]
        fields = STANDARD_FIELDS
    atomic_write_csv(args.existing_csv, fields, combined)

    print(f"New conformance statements applied: {len(proposed)}")
    print(f"Total conformance rows now present: {len(combined)}")
    print(f"Source files changed: {len(modified)}")
    print(f"Updated CSV: {args.existing_csv}")
    print(f"Proposed CSV retained at: {args.proposed_csv}")
    reminders()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
