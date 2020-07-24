
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
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]
|Encounter|QI Core Encounter Profile|[QI Core Encounter]|
|Library|CQFM Library Profile|[CQFM Library]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Gaps In Care Individual MeasureReport Profile|[DEQM Gaps In Care Individual MeasureReport Profile]|
|Organization|DEQM Organization Profile|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure]|

### Care Gaps Operation
{:.no_toc}
A Client, such as a provider, will use the [care-gaps](OperationDefinition-care-gaps.html) operation to request a report from the Server, such as a payer, on his/her patients that have Colorectal Cancer Screening gaps in care. When the provider sees that he/she has a patient showing as having an open gap, she/he looks at the chart and sees that a FitDNA test was done. He/she then submits a DEQM Data Exchange MeasureReport and the referenced resources required as supporting evidence for Colorectal Cancer Screening to the payer. Later, the provider repeats the care-gaps operation for Colorectal Cancer Screening to ensure the gaps is now closed.

The Figure 3-22 shows the workflow for gaps in care.

{% include img-portrait.html img="gaps-swimlane-caregap-report.png" caption = "Figure 3-22 Care Gaps Workflow" %}

### Gaps In Care Report
{:.no_toc}

This section contains an example that begins with a provider requesting a Gaps In Care Report for his/her patients from the payer. The provider receives the report, he/she then submit additional data to the payer for the patient that was indicated as having open gaps in the report. He/she then later request a Gaps In Care Report again for the these patients from the payer.

#### Step 1 - Initial Run for a Gaps In Care Report
The resource graphs below represents the structure of the resources returned in the first [care-gaps](OperationDefinition-care-gaps.html) operation.  Figure 3-23 shows the patient with the open gap because there were no resources in the payers system related to Gaps in Care. It also contains a DetectedIssue resource for tracking that this is an open gap. Figure 3-24 shows the second patient that has a closed gap. The evaluatedResources point to a colonoscopy done in 2018 that closed the gap. Since this is not an open gap, there is no DetectedIssue Resource present.

{% include img-portrait.html img="gic-colonoscopy-example-pt1-step1-open-gap.png" caption = "Figure 3-23 Gaps in Care Resources Colonoscopy Patient 1 Example: Step 1 - Open Gap" %}

{% include img-portrait.html img="gic-colonoscopy-example-pt2-step1-no-gap.png" caption = "Figure 3-24 Gaps in Care Resources Colonoscopy Patient 2 Example: Step 1- Closed Gap" %}

{% include examplebutton.html example="get-gaps-bundle-initial-run-example" b_title = "Click Here To See Example of the Gaps In Care Report Described in Step 1 Initial Run" %}

#### Step 2 - Data Exchange to Submit Data for Closing Gaps

The provider noticed an open gap was identified for Patient 1 for Colorectal Cancer Screening, it appeared that the payer system did not have the latest information on the colonoscopy performed on this patient. The provider then used the DEQM Data Exchange profile(s) to submit additional data to the payer. Please see [Colorectal Cancer Screening (COL)] Use Case for details on how to complete the DEQM Data Exchange.

#### Step 3 - Rerun for a Gaps In Care Report

Several days later, the provider reruns the Colorectal Cancer Screening care gaps report and confirms that the gap for the first patient was closed.  Note in the Figure 3-25 below, there is no longer a DetectedIssue for patient 1, because the gap is now closed.  The patient 1 has a recent colonoscopy. In Figure 3-26, there is no change to the patient 2, it still shows closed gap.

{% include img-portrait.html img="gic-colonoscopy-example-pt1-step3-gap-closed.png" caption = "Figure 3-25 Gaps in Care Resources Colonoscopy Patient 1 Example: Step 3 - Open Gap Closed" %}

{% include img-portrait.html img="gic-colonoscopy-example-pt2-step1-no-gap.png" caption = "Figure 3-26 Gaps in Care Resources Colonoscopy Patient 2 Example: Step 3 - Closed Gap" %}

{% include examplebutton.html example="get-gaps-bundle-rerun-example" b_title = "Click Here To See Example of the Gaps In Care Report Described in Step 3 Rerun" %}

---
</div>
{% include link-list.md %}
