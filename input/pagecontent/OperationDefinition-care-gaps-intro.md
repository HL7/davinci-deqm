
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

{% assign id = {{page.id}} %}

This is the new $care-gaps operation. The intent is to replace the existing $care-gaps operation in the Clinical Reasoning module with this new $care-gaps operation when FHIR R4 moves to the next version.
{:.note-to-balloters}

<div class="new-content" markdown="1">
Conformance Requirement 1:
<br>
A $care-gaps operation SHALL provide at least periodStart, periodStop, and subject|provider|organization, which could be one of the following:
  - A $care-gaps operation SHALL provide periodStart, periodStop, and a subject; OR
  - A $care-gaps operation SHALL provide periodStart, periodStop, and an organization; OR
  - A $care-gaps operation SHALL provide periodStart, periodStop, and a provider and an organization
</div>

{% include link-list.md %}
