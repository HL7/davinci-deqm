
### Introduction

This page describes the gaps in care reporting. Contents coming ...

### Gaps in Care Reporting

Description of Gaps in Care Reporting. Contents coming ...

{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

### How to Construct a Gaps in Care Report
TODO: This section describes  ...

#### Attribution
This section describes the relationship with the ATR IG and how attributions for the gaps in care report are depend on the ATR IG.

### Default Profiles

The following resources are used in the summary reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]|
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]|
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]|
|Individual MeasureReport|DEQM Gaps In Care Individual MeasureReport Profile||

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
