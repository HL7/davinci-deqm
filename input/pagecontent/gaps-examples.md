
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

<div class="new-content" markdown="1">
###  Introduction

The Gaps In Care is a powerful report that when used along with other DEQM functionality can result in better care results for the payer, the provider and most importantly the patient.  Below we show a simplistic example to show its potential power.

In our scenario, we imagine that a provider has requested a Gaps in Care report for the Colorectal Screening Measure  from ABC Insurance for his patients using the care-gaps operation.  She does not specify open or closed gaps so she gets both. The report returns two patients.  One patient has a closed gap and the other has an open gap.

As it turns out, the patient with the open gap had a promotion through his employer to try a FitDNA kit for free.  The results were sent to the provider but the payer was unaware.

When the provider notices this in the patient’s chart, she uses the DEQM Submit Data functionality to update the payer’s database.
Later, the provider again runs the same report but with an updated periodEnd date and both patients now showing as having their Colorectal Cancer Screening Measure Closed

#### Use Cases

### FHIR Resource Overview

#### Resources Supported for this Use Case
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

### Care Gaps Operation
{:.no_toc}
A Client, such as a provider, will use the [care-gaps](OperationDefinition-care-gaps.html) operation to request a report from the Server, such as a payer, on his/her patients that have Colorectal Cancer Screening gaps in care. When the provider sees that he/she has a patient showing as having an open gap, she/he looks at the chart and sees that a FitDNA test was done. He/she then submits a DEQM Data Exchange MeasureReport and the referenced resources required as supporting evidence for Colorectal Cancer Screening to the payer. Later, the provider repeats the care-gaps operation for Colorectal Cancer Screening to ensure the gaps is now closed.

The Figure 3-22 shows the workflow for gaps in care.

{% include img-portrait.html img="gaps-swimlane-caregap-report.png" caption = "Figure 3-22 Care Gaps Workflow" %}

### Gaps In Care MeasureReport
{:.no_toc}

The Resource Graph below represents the structure of the resources returned in the first Care_Gaps operation.  Notice there are two patients.  The first is the patient with the open gap because there were no resources in the payers system related to Gaps in Care.  It also contains a Detected Issue resource for tracking that this is an open gap

The second patient has a closed gap.  You notice on the left the evaluatedResources point to two resources that closed the gap, a colonoscopy in 2018 and a fecal occult blood test in 2019.  You will also notice that because the gap is closed, there is no Detected Issue Resource present.

(TODO: replace with an updated diagram and revise the narratives above)

{% include img-portrait.html img="gic-colonoscopy-example1.png" caption = "Figure 3-23 Gaps in Care Resources Colonoscopy Example 1" %}

(TODO: add operation example and output example)

Because the provider knows the first patient has an open Colorectal Cancer Screening, but he as an FitDNA result for the patient, he needs to send this observation to the payer.  To do that he will use the DEQM Data Exchange profile(s) to accomplish that. Please see Colorectal Cancer Screening (COL) Use Case for details on how to complete the DEQM Data Exchange.

Several days later he reruns the Colorectal Cancer Screening care gaps report and confirms that the gap for the first patient was closed.  Note in the Resource Graph below that there is no longer a Detected Issue because both gaps are closed.  And the first patient now has the FitDNA Observation as an evaluated resource.

{% include img-portrait.html img="gic-colonoscopy-example2.png" caption = "Figure 3-24 Gaps in Care Resources Colonoscopy Example 2" %}

(TODO: the re-run operation and example output)

---
</div>
{% include link-list.md %}
