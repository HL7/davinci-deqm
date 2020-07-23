
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle.
{:.note-to-balloters}

<div class="new-content" markdown="1">
### Introduction

A gap in care is defined as a discrepancy between recommended best practices and the services that are actually provided and documented. Gaps in care can adversely affect member outcomes and contribute to inappropriate costs. Identifying, anticipating, and communicating care gaps to provider practices, at the point of care, is critical for providing opportunities to improve care quality and reduce cost of care. To succeed in population health and value-based care, gaps in care must be addressed efficiently and in a timely manner.

For providers and payers to improve population health and value-based care, the following two items must be addressed: gaps in care information and incomplete healthcare information.

 - Gaps in Care Information: Disparities in claims vs. clinical information, which makes it difficult to assess if best practices are being followed, e.g., a diabetic member with no A1C or a member being prescribed insulin with no diabetes diagnosis.

 Research has shown that care gaps can be both harmful and costly when not properly managed. For example, not managing certain chronic diseases (e.g., diabetes) can lead to serious complications and escalating treatment costs. Resolving gaps in care is important to payers, providers, and the patients they serve. Doing so can positively influence patient health and lead to improvements in quality scores and reimbursement under risk-sharing arrangements such as Medicare.

 There are several potential causes of gaps in care. The most straight forward reason is that the care needed has not yet been provided for the patient. While providers cannot always control these gaps being closed, in many situations it can be easily remedied with an office visit, lab order, prescription or other clinical practices.

 - Incomplete Healthcare Information: For example, a request for cancer treatment without providing date of diagnosis or stage of illness at the time of diagnosis to support effective care coordination.

 An organization or tool that collects the data, may have information about the patient that the provider is not aware of. For example, a payer might have paid a claim for a self-ordered mammogram and the provider may not be aware that test was completed. Using the gaps in care reporting, it allows the payer to share that information with the provider managing the patient's care, and provides an opportunity to help address incomplete healthcare information.

{% include img-portrait.html img="gic-ecosystem.png" caption = "Figure 2-12 Quality Measure Ecosystem - Gaps in Care" %}
In Figure 2-12, the cloud represents the Gaps in Care reporting portion of the Quality Improvement Ecosystem. In this case between a clinician and a measurement organization, such as a payer, or quality measurement/ population health tool.  Note that a measurement organization might also make the request of their own system.

#### Relationship of Individual Reporting and Gaps In Care Reporting
{:.no_toc}

The Gaps In Care Reporting is built on the Individual Reporting, where a new [DEQM Gaps In Care Individual MeasureReport Profile] is created based on the [DEQM Individual MeasureReport Profile] by adding extensions to support Gaps In Care Reporting specific requirements. This allows the Gaps In Care Reporting to use the same machinery as the Individual Reporting to calculate measures and represent the results of individual calculation.

### Gaps in Care Reporting

#### Gaps Through Period (Retrospective vs. Prospective)
Gaps through period is the time period defined by a Client for running the gaps in care report. When the gaps through period ends on a date that is in the future, the Gaps in Care Reporting is said to look for care gaps prospectively. In this scenario, it provides providers with opportunities to assess anticipated open gaps and take proper actions to close the gaps. When the gaps through period ends on a date that is in the past, the Gaps in Care Reporting is said to look for care gaps retrospectively. In the retrospective scenario, identified open gaps can no longer be acted upon.   

|Use Case|care-gaps Operation|Gaps Through Period|Report Creation Date|Gaps In Care Report Results|
|---|---|---|---|---|
|**Prospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-09-30|2020-01-01 through 2020-09-30|2020-07-01|Returns gaps through 2020-09-30. Example: If the patient had colonoscopy on 2010-07-03, the report would indicate a gap. Since by 2020-09-30, the colonoscopy would be over 10 years.|
|**Retrospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-06-30|2020-01-01 through 2020-06-30|2020-07-01|Returns gaps through 2020-06-30. Example: If a patient had colonoscopy on 2010-07-03, the report would not indicate a gap. Since on 2020-07-01, the procedure would have occurred within the specified 10-year timeframe.|

#### Care Gaps Operation

The [care-gaps](OperationDefinition-care-gaps.html) operation is used to run a gaps in care report. In this guide, we have extended the care-gap operation in the R4 Release of the FHIR (FHIR R4) Specification allowing for the specification of additional parameters that will be useful to the communities needing this report. This operation is run on the Measure resource and allows a Server to create a gaps in care report based on quality measures available on the Server’s system.

The [base care-gaps operation] in FHIR R4 only allows for 4 input parameters. Those parameters are still allowed although some of the parameters have been modified. The extended operation, [care-gaps](OperationDefinition-care-gaps.html), makes the following changes to the existing input parameters in the base operation:
- **periodStart** this existing in parameter is still required, but the description is modified to reference the start date of the gaps through period
- **periodEnd** this existing in parameter is still required, but the description is modified to reference the end of the gaps through period
-	**topic** is now an optional parameter and the cardinality is updated to allow providing multiple topics
-	**subject** can now point to either a patient or a group of patients. Subject is optional when run a gaps in care report for an organization or a practitioner of an organization.

Several new input parameters are specified and added to the [care-gaps](OperationDefinition-care-gaps.html) defined in this guide:
- **practitioner** references a practitioner for which the gaps in care report will be created.
- **organization** references an organization for which the gaps in care report will be created.
-	**status** if provided, must be a code from the [gaps-status value set], which indicates an open-gap or a closed-gap. If status parameter is not provided when the care-gaps operation is called, it defaults to both open and closed gaps
-	**measure** is used to input a measure identifier. A Client may call the care-gaps operation to run the gaps in care report on a measure or a list of measures. As a precondition, the Client must communicate with the Server and know the measure identifiers used by the Server to uniquely identify measures
-	**program** is used to specify one or more programs that a provider or an organization participates in, for example, risk based, value based, or other performance program such as CMS MIPS, HQR programs.

The [care-gaps](OperationDefinition-care-gaps.html) operation has an out parameter, **return**. In comparison to the return output parameter specified in the [base care-gaps operation], the *return* here returns a Bundle resource, but conforms to the [DEQM Gaps In Care Bundle Profile]. It now also allows 0 to many bundles to be returned.

Through the requirement analysis of the Gaps In Care Reporting for this ballot, it is determined that existing care-gaps operation in FHIR R4 requires a re-design. The plan is to promote the care-gaps operation specified in this guide to the next release of the base FHIR specification.
{:.note-to-balloters}

Figure 2-12 shows a workflow for running the care-gaps operation for a single patient.
{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-12 Care Gaps Operation - Single Patient" %}

Figure 2-13 shows a workflow for running the care-gaps operation for a group of patients.
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-13 Care Gaps Operation - Group of Patients" %}

#### How to Construct a Gaps In Care Report and Bundle

The [care-gaps](OperationDefinition-care-gaps.html) operation returns a document bundle for each patient for which a gaps in care report is generated, the bundle must conform to the [DEQM Gaps In Care Bundle Profile]. As profiled, the document that is returned is further constrained to use the [DEQM Gaps In Care Composition Profile] and [DEQM Gaps In Care Individual MeasureReport Profile]. The [DEQM Gaps in Care Composition Profile] modifies the base FHIR Composition to have a specific code to identify the composition as a Gaps in Care report. The patient and organization are profiled to use QI Core and DEQM profiles respectively. It also requires a reference to the [DEQM Gaps in Care Individual Measure Report]. And allows for a reference to a [DEQM Gaps In Care Detected Issue Profile]; this profile is explained further below. As with other compositions, this resource can contain a narrative which can be displayed as a textual report.

The [DEQM Gaps In Care Individual MeasureReport Profile] is based on the [DEQM Individual MeasureReport Profile] but has added an optional extension to the Evaluated Resources to allow you to indicate how the resource contributed to the measure population type, i.e. initial population, numerator, denominator, numerator-exclusion, etc.

Another new profile added to the Gaps in Care Bundle, is the [DEQM Gaps In Care DetectedIssue Profile]. This resource should only be created when there is an open gap. In addition to being a simplistic way to determine if the patient has an open gap (Measure Report contains this information as well in measure score), it can also be loaded by receiving systems and used as a way to track the open gap to resolution.  

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
GET [base]/Measure/$care-gaps?subject=Group/123&periodStart=2020-01-01&periodEnd=2020-07-01&_outputFormat=application/fhir+ndjson
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
