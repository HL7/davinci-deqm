
##  Introduction

Gaps In Care Examples:


### Use Cases

|Use Case|care-gaps Operation|Gaps Through Period|Report Creation Date|Gaps In Care Report Results|
|---|---|---|---|---|
|Prospective Use Case|$care-gaps?periodStart=2020-01-01&periodEnd=2020-09-30|2020-01-01 through 2020-09-30|2020-07-01|Returns gaps through 2020-09-30. Example: If the patient had colonoscopy on 2010-07-03, the report would indicate a gap. Since by 2020-09-30, the colonoscopy would be over 10 years.|
|Retrospective Use Case|$care-gaps?periodStart=2020-01-01&periodEnd=2020-06-30|2020-01-01 through 2020-06-30|2020-07-01|Returns gaps through 2020-06-30. Example: If a patient had colonoscopy on 2010-07-03, the report would not ID a gap since on 2020-07-01, the procedure would have occurred within the specified 10-year timeframe.|

*Note: If a report is run on 2021-01-03 for a gaps through period from 2020-01-01 to 2020-12-31, this should use $evaluate-measure operation instead of the $care-gaps operation since it is a retrospective report for the entire Performance Period.*

## FHIR Resource Overview



### Resources Supported for this Use Case
{:.no_toc}

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter]|
|Library|CQFM Library Profile|[CQFM Library]|
|Location|QI Core Location Profile|[QI Core Location]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Gaps In Care Individual MeasureReport Profile|[DEQM Gaps In Care Individual MeasureReport Profile]|
|Observation|QI Core Observation Profile|[QI Core Observation]|
|Organization|DEQM Organization Profile|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure]|

#### Care Gaps Operation {#care-gaps}
{:.no_toc}
The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for Colorectal Cancer Screening to the payer.  

{% include img-portrait.html img="gaps-swimlane-caregap-report.png" caption = "Figure 3-xx Care Gaps Workflow" %}

### Gaps In Care MeasureReport
{:.no_toc}

{% include img-portrait.html img="gic-col-no-gaps.png" caption = "Figure 3-xx Colorectal Cancer Screening Measure - Closed Gap/No Gap" %}

---

{% include link-list.md %}
