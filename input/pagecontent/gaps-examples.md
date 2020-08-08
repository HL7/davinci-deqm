
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

<div class="new-content" markdown="1">
###  Introduction

The Gaps in Care is a powerful report that when used along with other DEQM functionality can result in better care results for the payer, the provider, and most importantly the patient. A simplistic example described below shows its potential power.

In this scenario, a provider has requested a Gaps in Care report for the Colorectal Cancer Screening Measure from ABC Insurance for their patients using the [care-gaps](OperationDefinition-care-gaps.html) operation. Since the provider does not specify open or closed gaps, both open and closed gaps will be returned as default. The gaps in care report returns two patients. The first patient has an open gap and the second patient has a closed gap.

The first patient with the open gap had a colonoscopy done recently and the ABC Insurance has not yet been made aware of. The provider uses the DEQM Submit Data functionality to update the payer’s database.

Later, the provider runs the same Gaps in Care report again, both patients now showing as having their Colorectal Cancer Screening Measure gaps closed.

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
A Client, such as a provider, will use the [care-gaps](OperationDefinition-care-gaps.html) operation to request a Colorectal Cancer Screening measure gaps in care report for his/her patients from the Server, such as a payer. The provider receives the report from the payer system and notices that the report identifies one of the patients as having an open gap. He/she looks at the chart and sees that a colonoscopy was done recently for that patient. He/she then submits a DEQM Data Exchange MeasureReport and the referenced resources required as supporting evidence for the Colorectal Cancer Screening measure to the payer. Later, the provider repeats the care-gaps operation for Colorectal Cancer Screening to ensure the open gaps is now closed for that patient.

The Figure 3-22 shows the workflow for gaps in care.

{% include img-portrait.html img="gaps-swimlane-caregap-report.png" caption = "Figure 3-22 Gaps in Care Workflow" %}

### Gaps in Care Report
{:.no_toc}

This section contains an example that begins with a provider requesting a Gaps in Care Report for his/her patients from the payer. The provider receives the report, he/she then submits additional data to the payer for the patient that was identified as having open gaps in the report. He/she then later requests a Gaps in Care Report for these patients again from the payer.

#### Step 1 - Initial Run for a Gaps in Care Report
The resource graphs below represent the structure of the resources returned from the first [care-gaps](OperationDefinition-care-gaps.html) operation. Figure 3-23 shows the patient, *Gaps Patient01*, has an open gap because there were no resources in the payer system that would put her in numerator or denominator exclusion of the Colorectal Cancer Screening measure. The DetectedIssue resource contained in this gaps in care report serves as a flag indicating *Gaps Patient01* has an open gap for this measure. Figure 3-24 shows the second patient, *Gaps Patient02*, that is in the report has a closed gap. The evaluatedResource points to a colonoscopy procedure done in 2018 that had met the numerator criteria and resulted as a closed gap. Notice that there is no DetectedIssue resource present because *Gaps Patient02* does not have an open gap.

{% include img-portrait.html img="gic-colonoscopy-example-pt1-step1-open-gap.png" caption = "Figure 3-23 Gaps in Care Resources Colonoscopy Gaps Patient01 Example: Step 1 - Open Gap" %}

{% include img-portrait.html img="gic-colonoscopy-example-pt2-step1-no-gap.png" caption = "Figure 3-24 Gaps in Care Resources Colonoscopy Gaps Patient02 Example: Step 1- Closed Gap" %}

{% include examplebutton.html example="get-gaps-bundle-initial-run-example" b_title = "Click Here To See Example of the Gaps in Care Report Described in Step 1" %}

#### Step 2 - Data Exchange to Submit Data for Closing Gaps

The provider noticed *Gaps Patient01* was indicated as having an open gap for Colorectal Cancer Screening. The provider ordered an colonscopy and the patient was able to get it done in the next few days. Since the payer system did not have this new data, the provider then used the DEQM Data Exchange profile(s) to submit additional data to the payer. Please see [Colorectal Cancer Screening (COL)] Use Case for details on how to complete the DEQM Data Exchange.

#### Step 3 - Rerun for a Gaps in Care Report

The provider rerun the Colorectal Cancer Screening gaps in care report and confirmed that the open gap for *Gaps Patient01* was closed. Note that in the Figure 3-25 below, *Gaps Patient01* no longer has a DetectedIssue, because the open gap is now closed. The *Gaps Patient01* shows a recent colonoscopy. Figure 3-26 shows that there are no changes to *Gaps Patient02* comparing to the initially generated report, it still shows closed gap.

{% include img-portrait.html img="gic-colonoscopy-example-pt1-step3-gap-closed.png" caption = "Figure 3-25 Gaps in Care Resources Colonoscopy Gaps Patient01 Example: Step 3 - Open Gap Closed" %}

{% include img-portrait.html img="gic-colonoscopy-example-pt2-step1-no-gap.png" caption = "Figure 3-26 Gaps in Care Resources Colonoscopy Gaps Patient02 Example: Step 3 - Closed Gap" %}

{% include examplebutton.html example="get-gaps-bundle-rerun-example" b_title = "Click Here To See Example of the Gaps in Care Report Described in Step 3" %}

---
</div>
{% include link-list.md %}
