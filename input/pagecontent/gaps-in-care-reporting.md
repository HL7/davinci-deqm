
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

<div class="new-content" markdown="1">
### Introduction

A “Gap In Care” is defined as a discrepancy between recommended best practices and the services that are actually provided and documented. To succeed in population health and value-based care, gaps in care and information must be addressed efficiently and in a timely manner. Anticipating or closing gaps in care, at point of care, is an opportunity to improve care quality and cost of care.

Another benefit of this type of report is that the organization or tool that collects the data, may have information about the patient that the provider is not aware of. For example, a payer might have paid a claim for a self-ordered mammogram and the provider may not be aware that test was completed. The Gaps in Care report defined here, would allow the payer to share that information with the provider managing the patient’s care.

Gaps in care information can adversely affect member outcomes and contribute to inappropriate costs. For providers and payers to improve population health value based care two items must be addressed: 1) Gaps in Care Information: Disparities in claims vs. clinical information which makes it difficult to assess if best practices are being followed: e.g. a diabetic member with no A1C or a member being prescribed insulin with no diabetes diagnosis. 2) Incomplete Healthcare Information: For example, a request for cancer treatment without providing date of diagnosis or stage of illness at time of diagnosis to support effective care coordination.

Bi-directional, real-time, FHIR-based communication that reconciles payer information with clinical EHR data to ensure best practices are followed, improve outcomes, and exchange information to reduce expense and disruption to provider workflows.

Research has shown that care gaps can be both harmful and costly when not properly managed. For example, not managing certain chronic diseases (e.g., diabetes) can lead to serious complications and escalating treatment costs. Resolving gaps in care is important to payers, providers, and the patients they serve. Doing so can positively influence patient health and lead to improvements in quality scores and reimbursement under risk-sharing arrangements such as Medicare.

There are several potential causes of gaps in care. The most straight forward reason is that the care needed has not yet been provided for the patient. While providers cannot always control these gaps being closed, in many situations it can be easily remedied with an office visit, lab order, prescription or other clinical practices.

Additionally, an organization or tool that contains the data for the patients might be missing information that is documented elsewhere and therefore think a Gap in Care exists.  Using this reporting, the two entities managing the patient’s care can identify where there is an issue with documentation and close that gap.

{% include img-portrait.html img="gic-ecosystem.png" caption = "Figure 2-12 Quality Measure Ecosystem - Gaps in Care" %}
In Figure 2-12, the cloud represents the Gaps in Care reporting portion of the Quality Improvement Ecosystem.  In this case between a clinician and a measurement organization, such as a payer, or quality measurement/ population health tool.   Note that a measurement organization might also make the request of their own system.

### Gaps in Care Reporting

|Use Case|care-gaps Operation|Gaps Through Period|Report Creation Date|Gaps In Care Report Results|
|---|---|---|---|---|
|**Prospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-09-30|2020-01-01 through 2020-09-30|2020-07-01|Returns gaps through 2020-09-30. Example: If the patient had colonoscopy on 2010-07-03, the report would indicate a gap. Since by 2020-09-30, the colonoscopy would be over 10 years.|
|**Retrospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-06-30|2020-01-01 through 2020-06-30|2020-07-01|Returns gaps through 2020-06-30. Example: If a patient had colonoscopy on 2010-07-03, the report would not ID a gap since on 2020-07-01, the procedure would have occurred within the specified 10-year timeframe.|

*Note: If a report is run on 2021-01-03 for a gaps through period from 2020-01-01 to 2020-12-31, this should use $evaluate-measure operation instead of the $care-gaps operation since it is a retrospective report for the entire Performance Period.*


{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

### How to Construct a Gaps in Care Report
In this guide, we have extended base FHIR R4’s [$care-gap] operation allowing for the specification of additional parameters that will be useful to the communities needing this report. This operation is run on the Measure resource and allows a Server to create a gaps in care report based on quality measures available on the Server’s system.

The base $care-gap operation in FHIR R4 only allows for 4 input parameters. Those parameters are still allowed although some of the parameters have been modified. The periodStart and periodEnd parameters are still required. Topic is still present but optional. And subject has been modified as below. The output parameter is still a document bundle but further definition has been added.
The extended operation, [$care-gaps] operation, makes the following changes to the existing input parameters:
-	**topic** is an optional parameter, but cardinalities is updated to 0 to many to allow multiple topics be specified
-	**subject** can now point to either a patient or a group of patients, as profiled in the [DEQM Gaps In Care Group Profile]
New optional input parameters are as follows:
- **practitioner** – this is a reference to a [DEQM Practitioner]. Only 1 practitioner can be specified
- **organization** – this is a reference to a [DEQM Organization].  Only a single Organization resource can be used
-	**status** – this must be a code from the [gaps-status value set], which indicates an open-gap or a closed-gap. This is an optional parameter. If status is not provided as an input parameter when running the $care-gaps operation, the gaps in care reports return both open and closed gaps
-	**measure** – this is a string input parameter that allows for you to specify one or more measure for which you want a gaps in care report.  You will need to check with the server where you are running your measures to identify how measures are enumerated on their system, i.e. Colorectal Cancer Screening or ABS or CMS111, etc.
-	**program** – this is another string input parameter that allows you to specify one or more programs that your provider or organization participates in, example risk based, value based, or other performance program such as CMS MIPS, HQR programs. See the care-gaps operation for additional details on using this parameter
- The output parameter, **return**, has been modified.  It still allows for the return of a document bundle for each patient for which a report is generated but the bundle is now profiled, [Gaps In Care Bundle Profile]. As profiled, the document that is returned is further constrained to use the [DEQM Gaps In Care Composition Profile] and [DEQM Gaps In Care Individual MeasureReport Profile]. The [DEQM Gaps in Care Composition Profile] modifies the base FHIR Composition to have a specific code to identify the composition as a Gaps in Care report. The patient and organization are profiled to use QI Core and DEQM profiles respectively. It also requires a reference to the [DEQM Gaps in Care Individual Measure Report]. And allows for a reference to a [DEQM Gaps In Care Detected Issue Profile]; this profile is explained further below. As with other compositions, this resource can contain a narrative which can be displayed as a textual report.

The [DEQM Gaps In Care Individual MeasureReport Profile] is based on the [DEQM Individual MeasureReport Profile] but has added an optional extension to the Evaluated Resources to allow you to indicate how the resource contributed to the measure population type, i.e. initial population, numerator, denominator, numerator-exclusion, etc.

Another new profile added to the Gaps in Care Bundle, is the [DEQM Gaps In Care Detected Issue Profile]. This resource should only be created when there is an open gap. In addition to being a simplistic way to determine if the patient has an open gap (Measure Report contains this information as well in measure score), it can also be loaded by receiving systems and used as a way to track the open gap to resolution.  

The code in the Detected Issue contains the value “care-gap”.  Since the value to represent this type of issue did not exist on the referenced code system but extensions are allowed, we added care-gaps value and code system. The evidence for this Detected Issue points to the DEQM Gaps In Care Individual Measure Report which will identify the specific measure that has not been closed.  As with all other DEQM profiles, we reference the QI Core profile on patient.

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

{% include img-portrait.html img="gic-resources.png" caption = "Figure 2-14 Gaps In Care Resources" %}

### Gaps in Care Reporting
(TODO: descriptions about gaps in care reporting)

#### Usage
{:.no_toc}

`POST|[base]`

##### Bulk Data
{:.no_toc}  

If Clients are requesting Gaps in Care reports for many patients/members, they might want to make use of the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

**Example**  
Scenario: The client wants Gaps in Care Reports on many patients. They have created a FHIR Group Resource ([DEQM Gaps In Care Group Profile]) with the id of 123.  Because they expect the creation of the reports to take a while and many FHIR bundles will be returned and be processed, they want to make the request in an asynchronous manner returning NDJSON, which is easier for them to process.

The request below asks for Group id of 123 to be run asynchronously with FHIR+ndjson as the output format.  The header portions should be entered in the API client header section (example in Postman Headers section tab, enter “Prefer” in Key and “respond-async” in Value)
{% include examplebutton.html example="post-indv-report-example" b_title = "This is a placeholder, example coming" %}

Run $care-gaps operation in an asynchronous mode:
```
GET [base]/Measure/$care-gaps?subject=Group/123&periodStart=2020-01-01&periodEnd=2020-07-01_outputFormat=application/fhir+ndjson
```
Headers:
* `Prefer respond-async`
* `Accept application/fhir+json`

Note that both Accept and Prefer are required. Prefer specifies the response is immediate or asynchronous, which MUST be set to respond-async. Accept specifies the format of the optional OpeartionOutcome response to the kick-off request. Currently, only application/fhir+json is supported.

Query Parameters:
* `_outputFormat (string, optional, defaults to application/fhir+ndjson)`

NDJSON Response:

<br />

</div>

{% include link-list.md %}
