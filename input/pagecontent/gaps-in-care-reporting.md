
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

<div class="new-content" markdown="1">
### Introduction

(TODO: introduction for gaps in care reporting.)

To succeed in population health and value-based care, gaps in care and information must be addressed efficiently and in a timely manner. Anticipating or closing gaps in care, at point of care, is an opportunity to improve care quality and cost of care.

Gaps in care information can adversely affect member outcomes and contribute to inappropriate costs. For providers and payers to improve population health value based care two items must be addressed: 1) Gaps in Care Information: Disparities in claims vs. clinical information which makes it difficult to assess if best practices are being followed: e.g. a diabetic member with no A1C or a member being prescribed insulin with no diabetes diagnosis. 2) Incomplete Healthcare Information: For example, a request for cancer treatment without providing date of diagnosis or stage of illness at time of diagnosis to support effective care coordination.

Bi-directional, real-time, FHIR-based communication that reconciles payer information with clinical EHR data to ensure best practices are followed, improve outcomes, and exchange information to reduce expense and disruption to provider workflows.

Research has shown that care gaps can be both harmful and costly when not properly managed. For example, not managing certain chronic diseases (e.g., diabetes) can lead to serious complications and escalating treatment costs. Resolving gaps in care is important to payers, providers, and the patients they serve. Doing so can positively influence patient health and lead to improvements in quality scores and reimbursement under risk-sharing arrangements such as Medicare.

### Gaps in Care Reporting
(TODO: describe gaps in Care reporting.

{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

### How to Construct a Gaps in Care Report
(TODO: describe use of care-gaps operation and parameters, the return structure of gaps in care report)

#### Attribution
Member attribution establishes associations between providers and payers. The process of establishing and exchanging member lists for gaps in care reports is not in the scope of the DEQM IG. Gaps in care reporting references the standards specified in the [Da Vinci - Risk Based Contracts Member Attribution (ATR) List IG] for exchanging Member Attribution Lists between providers and payers.

#### Future Considerations
Structure measures are not in scope for this version. Structure measure that is not patient centric, such as measuring number of ventilators of an organization.

### Default Profiles

The following resources are used in the gaps in care measure reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]|
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]|
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]|
|Group|DEQM Gaps In Care Group Profile|[DEQM Gaps In Care Group Profile]|
|Individual MeasureReport|DEQM Gaps In Care Individual MeasureReport Profile|[DEQM Gaps In Care Individual MeasureReport Profile]|

### Gaps in Care Reporting
(TODO: descriptions about gaps in care reporting)

#### Usage
{:.no_toc}

`POST|[base]`

##### Bulk Data
{:.no_toc}  

If Clients are requesting Gaps in Care reports for many patients/members, they might want to make use of the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

**Example**  
Scenario: The client wants Gaps in Care Reports on many patients. They have created a FHIR Group Resource ([DEQM Gaps In Care Group Profile]) with the id of 123.  Because they expect the creation of the reports to take a while and many FHIR bundles will be returned and be processed, they want to make the request in an asynchronous manner returning NDJSON, which is easier for them to process.</br>
The request below asks for Group id of 123 to be run asynchronously with FHIR+ndjson as the output format.  The header portions should be entered in the API client header section (example in Postman Headers section tab, enter “Prefer” in Key and “respond-async” in Value)
{% include examplebutton.html example="post-indv-report-example" b_title = "This is a placeholder, example coming" %}

Run $care-gaps operation in an asynchronous mode:
```
GET [base]/Measure/$care-gaps?subject=Group/123&periodStart=2020-01-01&periodEnd=2020-07-01_outputFormat=application/fhir+ndjson
```
Headers:
* `Prefer respond-async`
* `Accept application/fhir+json`

NDJSON response:

<br />

</div>

{% include link-list.md %}
