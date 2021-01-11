
### Introduction

As supported in this guide, a gap in care is defined as a discrepancy between standards of care specified in quality measures and the services that were provided. Gaps in care may be identified because no care was provided, or because data about care provided is missing from the system calculating the data.

Actual gaps in care can adversely affect member outcomes, and lack of awareness that care was provided can contribute to unnecessary costs. Identifying, anticipating, and communicating gaps in care between involved actors, at the point of care, is critical for providing opportunities to improve quality of care.

Research has shown that care gaps can be both harmful and costly when they are not properly managed. For example, not managing specific aspects of chronic diseases (e.g., hemoglobin A1C control with respect to diabetes management) can lead to serious complications and escalate healthcare costs. Resolving gaps in care is important to payers, providers, and the patients they serve. Performing care that resolves gaps in care can positively influence patient health and improve quality scores and reimbursement under risk-sharing arrangements.
Gaps in Care may exist for several reasons. The following are some common scenarios where an actual or potential gap may exist.

 - Recommended care was not provided
 - Recommended care was provided but not documented where expected
 - Recommended care was provided outside of the health system expected by the organization reporting the gap
 - Recommended care was provided prior to the coverage by the current payer
 - Recommended Care was provided between generation of a Gap in Care Report and receipt of the report.

A Gap in Care Report is designed to communicate actual or perceived gaps in care between systems, such as the payer’s system and provider’s EMR. The report provides opportunities for providers to provide missing care and/or to communicate care provision data to payers. The report may also provide information for upcoming care opportunities, prospective gaps.

In Figure 2-12, the red circle represents the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem. Please see [The Quality Improvement Ecosystem Diagram].

{% include img-portrait.html img="gic-ecosystem.png" caption = "Figure 2-12 Quality Measure Ecosystem - Gaps in Care" %}

The Gap in Care flow is between a provider and a measurement organization’s system performing analytics.

Figure 2-13 reflects the details within the red circle representing the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem.

{% include img-portrait.html img="gic-operation.png" caption = "Figure 2-13 Gaps in Care Reporting Flow" %}

#### Relationship of Individual Reporting and Gaps in Care Reporting
{:.no_toc}

The Gaps in Care Reporting is built on the [DEQM Individual MeasureReport Profile]. This allows the Gaps in Care Reporting to use the same machinery as the Individual Reporting to calculate measures and represent the results of individual calculation.


### Default Profiles

The following resources are used in the Gaps in Care Reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]|
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]|
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]|
|Group|DEQM Gaps In Care Group Profile|[DEQM Gaps In Care Group Profile]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|

Figure 2-14 provides a graphical view of how these resources are related. A Composition Bundle is created for each Patient(linked via subject element).  The Composition resource references one or more DEQM Individual MeasureReport resources.  One MeasureReport for each Measure included in the report. If the generator of the MeasureReport resource has data used in the Measure, they are linked under evaluatedResource element. The [DEQM Population Reference Extension] element on the resource documents how that resource contributed to the measure, i.e. numerator, denominator, etc.
{% include img-portrait.html img="gic-resources.png" caption = "Figure 2-14 Gaps In Care Resources" %}

### Gaps in Care Reporting

#### Gaps Through Period (Retrospective vs. Prospective)
{:.no_toc}

Gaps through period is the time period defined by a Client for running the gaps in care report. When the gaps through period ends on a date that is in the future, the Gaps in Care Reporting is said to look for care gaps prospectively. In this scenario, it provides providers with opportunities to assess anticipated open gaps and take proper actions to close the gaps. When the gaps through period ends on a date that is in the past, the Gaps in Care Reporting is said to look for care gaps retrospectively. In the retrospective scenario, identified open gaps can no longer be acted upon to meet the quality measure.  In the example below, CMS Colorectal Cancer Screen [CMS130v8] is used.

|Use Case|care-gaps Operation|Gaps Through Period Start Date|Gaps Through Period End Date|Report Creation Date|Colorectal Cancer Screening - Colonoscopy Date|Gaps in Care Report|
|---|---|---|---|---|---|
|**Prospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-09-30&subject=Patient/123&measure=CMS130v8|2020-01-01|2020-09-30|2020-07-01|Example: patient had colonoscopy on 2010-07-03|Returns gaps through 2020-09-30. The gaps in care report indicates the patient has an open gap for the colorectal cancer screening measure. By 2020-09-30, the colonoscopy would be over 10 years.|
|**Retrospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-06-30&subject=Patient/123&measure=CMS130v8|2020-01-01|2020-06-30|2020-07-01|Example: patient had colonoscopy on 2010-07-03|Returns gaps through 2020-06-30. The gaps in care report indicates the patient has a closed gap for the colorectal cancer screening measure. Since on 2020-07-01, the procedure would have occurred within the specified 10-year timeframe.|

We seek examples of continuous variable measure where prospective use case might be applicable.
{:.note-to-balloters}

#### Care Gaps Operation
{:.no_toc}

The [care-gaps](OperationDefinition-care-gaps.html) operation is used to run a gaps in care report. In this guide, we have extended the [base care-gaps operation] in the R4 Release of the FHIR (FHIR R4) Specification to allow for the specification of additional parameters that will be useful to the communities needing this report. This operation is run on the Measure resource and allows a Server to create a gaps in care report based on the quality measures available in the Server’s system.

The extended operation, [care-gaps](OperationDefinition-care-gaps.html), makes the following changes to the existing input parameters in the base operation:
- **periodStart** is still required, but the description is modified to reference the start date of the gaps through period.
- **periodEnd** is still required, but the description is modified to reference the end of the gaps through period.
-	**topic** is an optional parameter for which the cardinality has been updated to allow multiple topics to be specified.
-	**subject** can now point to either a patient or a group of patients. Subject is optional when run a gaps in care report for an organization or a practitioner of an organization.

Several new input parameters are specified and added to the [care-gaps](OperationDefinition-care-gaps.html) operation defined in this guide:
- **practitioner** references a practitioner for which the gaps in care report will be created.
- **organization** references an organization for which the gaps in care report will be created.
-	**status** if provided, shall be a code from the [gaps status value set], which indicates an open-gap or a closed-gap. If the status parameter is not provided when running the care-gaps operation, the gaps in care report will return both the open and closed gaps.
-	**measure** is used to specify one or more measures for which the gaps in care report will be created. The Client will need to check with the Server to know the identifiers used by the Server to uniquely identify measures.
-	**program** is used to specify one or more programs that a provider or an organization participates in. For example, the program may be a risk based, value based, or other performance program such as the Merit-based Incentive Payment System (MIPS) and Hospital Quality Reporting programs of CMS.

The [care-gaps](OperationDefinition-care-gaps.html) operation has an out parameter: **return**. In comparison to the return output parameter specified in the [base care-gaps operation], the **return** here returns 0 to many Bundle resource that conforms to the [DEQM Gaps In Care Bundle Profile].

Through the requirement analysis of the Gaps in Care Reporting for this ballot, it is determined that existing care-gaps operation in FHIR R4 requires a re-design. The plan is to promote the care-gaps operation specified in this guide to the next release of the base FHIR specification.
{:.note-to-balloters}

Figure 2-15 shows a workflow for running the care-gaps operation for a single patient.
{% include img-narrow.html img="Care Gaps Operation Single Patient.png" caption="Figure 2-15 Care Gaps Operation - Single Patient" %}

Figure 2-16 shows a workflow for running the care-gaps operation for a group of patients.
{% include img-narrow.html img="Care Gaps Operation.png" caption="Figure 2-16 Care Gaps Operation - Group of Patients" %}

#### How to Construct a Gaps in Care Report
{:.no_toc}

This section describes the profiles used for Gaps in Care Reporting and how they are used to construct a gaps in care report.

The [care-gaps](OperationDefinition-care-gaps.html) operation returns a document bundle for each patient for which a gaps in care report is generated, the bundle shall conform to the [DEQM Gaps In Care Bundle Profile]. A Gaps In Care Bundle shall contain a Composition entry, which uses the [DEQM Gaps In Care Composition Profile].

The [DEQM Gaps in Care Composition Profile] builds on the base FHIR Composition, where its type code is constrained to a specific code to identify the Composition as a gaps in care report. The subject of a Gaps In Care Composition is required, it is used to reference the patient, [QI Core Patient], the gaps in care report is for. The Gaps In Care Composition shall contain one to many section(s). Each section references an Individual MeasureReport for a specific measure. All Individual MeasureReport referenced shall be for the same patient specified in the Composition subject.

- The Individual MeasureReport shall conform to the [DEQM Individual MeasureReport Profile]. This profile contains an optional extension, [DEQM Population Reference Extension], on the evaluatedResource. This extension allows the Server to indicate how an evaluatedResource, such as a colonoscopy procedure, was used to produce the measure calculation results by linking it to a specific population criteria identified by the measure population type, i.e. initial population, numerator, denominator, numerator-exclusion, etc.

- If an open gap is identified for a measure that is included in the Gaps In Care Composition, then this Composition shall also contain an entry of DetectedIssue using the [DEQM Gaps In Care DetectedIssue Profile] for the measure. There shall be one DetectedIssue entry for each measure that has open gaps. This resource should only be created when there is an open gap. In addition to being a simplistic way to determine if the patient has an open gap (MeasureReport contains this information as well in measureScore), it can also be loaded by the Client and used as a way to track the open gap to resolution. Note that the code in the DetectedIssue contains the value “care-gap”, which was added to the referenced code system as an extension. The evidence element of the DetectedIssue resource points to the DEQM Individual MeasureReport which will identify the specific measure that has not been closed.  

- The [DEQM Gaps in Care Composition Profile] may also contain all supporting resources referenced by the composition and its contained measure reports. As with other compositions, this resource can contain a narrative which can be displayed as a textual report.

#### Attribution
{:.no_toc}

Member attribution establishes associations between providers and payers. The process of establishing and exchanging member lists for gaps in care reports is not in the scope of the DEQM IG. Gaps in Care Reporting references the standards specified in the [Da Vinci - Risk Based Contracts Member Attribution (ATR) List IG] for exchanging Member Attribution Lists between providers and payers.

#### Usage
{:.no_toc}

`GET|[base]`

{% include examplebutton.html example="get-gaps-caregap-usage-example" b_title = "Click Here To See Example GET Gaps in Care Report" %}

##### Bulk Data
{:.no_toc}  

If Clients are requesting gaps in care reports for many patients/members, they may consider using the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

`GET|[base]`

{% include examplebutton.html example="get-gaps-caregap-usage-bulk-example" b_title = "Click Here To See Example GET Gaps in Care Report Using Bulk Data" %}

Headers:
* `Prefer respond-async`
* `Accept application/fhir+json`

Note that both Prefer and Accept are required. **Prefer** specifies the response is immediate or asynchronous, which SHALL be set to *respond-async*. **Accept** specifies the format of the optional OperationOutcome response to the kick-off request. Currently, only *application/fhir+json* is supported. See the base FHIR specification [Asynchronous Request Patterns] for details.

Query Parameters:
* `_outputFormat (string, optional, defaults to application/fhir+ndjson)`

<br />


{% include link-list.md %}
