
### Introduction

This page describes the gaps in care reporting. Contents coming ...

### Gaps in Care Reporting

Description of Gaps in Care Reporting. Contents coming ...

{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

### How to Construct a Gaps in Care Reports
Gaps through Concept
Prospectively
Retrospectively
[Bundle]
DetectedIssue

#### Attribution
This section describes the relationship with the ATR IG and how attributions for the gaps in care report are depend on the ATR IG.

### Default Profiles

The following resources are used in the summary reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM GIC Bundle Profile||
|Composition|DEQM GIC Composition Profile||
|DetectedIssue|DEQM GIC Detected Issue Profile||
|MeasureReport|DEQM GIC MeasureReport Profile||

### Gaps in Care reporting

#### $care-gaps Care Gaps Operation

#### Usage
{:.no_toc}

for a single MeasureReport:

`POST|[base]/MeasureReport`

for a Bundle Transaction:

`POST|[base]`

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See POST summary Report Example" %}

for an example of a Summary MeasureReport with counts for multiple populations and stratifiers specified in an eCQM see the [Medicare Stratification Example] and the  [COL Summary MeasureReport].  For an example of a Bundle of multiple summary results see the [Bundle Multiple Summ Report].

#### Bulk Data
This section describes how Bulk Data is used in

<br />

{% include link-list.md %}
