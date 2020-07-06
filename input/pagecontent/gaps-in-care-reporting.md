
### Introduction

(TODO: introduction for gaps in care reporting.)

To succeed in population health and value-based care, gaps in care and information must be addressed efficiently and in a timely manner. Anticipating or closing gaps in care, at point of care, is an opportunity to improve care quality and cost of care.

Gaps in care information can adversely affect member outcomes and contribute to inappropriate costs. For providers and payers to improve population health value based care two items must be addressed: 1) Gaps in Care Information: Disparities in claims vs. clinical information which makes it difficult to assess if best practices are being followed: e.g. a diabetic member with no A1C or a member being prescribed insulin with no diabetes diagnosis. 2) Incomplete Healthcare Information: For example, a request for cancer treatment without providing date of diagnosis or stage of illness at time of diagnosis to support effective care coordination.

Bi-directional, real-time, FHIR-based communication that reconciles payer information with clinical EHR data to ensure best practices are followed, improve outcomes, and exchange information to reduce expense and disruption to provider workflows.

### Gaps in Care Reporting
(TODO: describe gaps in Care reporting.

{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

### How to Construct a Gaps in Care Report
(TODO: describe use of care-gaps operation and parameters, the return structure of gaps in care report)

#### Attribution
(TODO: describe the relationship with the ATR IG and how attributions for the gaps in care report are depend on the ATR IG.)

### Default Profiles

The following resources are used in the gaps in care measure reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]|
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]|
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]|
|Group|DEQM Gaps In Care Group Profile|[DEQM Gaps In Care Group Profile]|
|Individual MeasureReport|DEQM Gaps In Care Individual MeasureReport Profile|[DEQM Gaps In Care Individual MeasureReport Profile]|

### Gaps in Care reporting

#### $care-gaps Care Gaps Operation
(TODO: describe operation)

#### Usage
{:.no_toc}

for a single MeasureReport:

`POST|[base]/MeasureReport`

for a Bundle Transaction:

`POST|[base]`

<!--
{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See POST summary Report Example" %}

for an example of a Summary MeasureReport with counts for multiple populations and stratifiers specified in an eCQM see the [Medicare Stratification Example] and the  [COL Summary MeasureReport].  For an example of a Bundle of multiple summary results see the [Bundle Multiple Summ Report].-->

#### Bulk Data
(TODO: describe how Bulk Data is used in gaps in care reporting)

<br />

{% include link-list.md %}
