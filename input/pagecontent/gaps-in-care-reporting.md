
### Introduction

As supported in this guide, a gap in care is defined as a discrepancy between standards of care specified in quality measures and the services that were provided. Gaps in care may be identified because no care was provided, or because data about care provided is missing from the system calculating the data.

Actual gaps in care can adversely affect member outcomes, and lack of awareness that care was provided can contribute to unnecessary costs. Identifying, anticipating, and communicating gaps in care between involved actors, at the point of care, is critical for providing opportunities to improve quality of care.

Research has shown that care gaps can be both harmful and costly when they are not properly managed. For example, not managing specific aspects of chronic diseases (e.g., hemoglobin A1C control with respect to diabetes management) can lead to serious complications and escalate healthcare costs. Resolving gaps in care is important to payers, providers, and the patients they serve. Performing care that resolves gaps in care can positively influence patient health and improve quality scores and reimbursement under risk-sharing arrangements.
Gaps in care may exist for several reasons. The following are some common scenarios where an actual or potential gap may exist.

 - Recommended care was not provided
 - Recommended care was provided but not documented where expected
 - Recommended care was provided outside of the health system expected by the organization reporting the gap
 - Recommended care was provided prior to the coverage by the current payer
 - Recommended Care was provided between generation of a Gap in Care Report and receipt of the report.

A Gaps in Care Report is designed to communicate actual or perceived gaps in care between systems, such as the payer’s system and provider’s EMR. The report provides opportunities for providers to provide missing care and/or to communicate care provision data to payers. The report may also provide information for upcoming care opportunities, prospective gaps.

In Figure 2-12, the red circle represents the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem. Please see [The Quality Improvement Ecosystem Diagram].

{% include img-portrait.html img="gic-ecosystem_new.png" caption = "Figure 2-12 Quality Improvement Ecosystem - Gaps in Care" %}

The gaps in care flow is between a provider and a measurement organization’s system performing analytics.

Note that this implementation guide does not address actual workflow around managing the process of requesting a Gaps in Care Report and to whom the report should be sent.

Figure 2-13 reflects the details within the red circle representing the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem.

{% include img-portrait.html img="gic-reporting-flow.png" caption = "Figure 2-13 Gaps in Care Reporting Flow" %}

#### Relationship of Individual Reporting and Gaps in Care Reporting
{:.no_toc}

The Gaps in Care Reporting uses the [DEQM Individual MeasureReport Profile]. This allows the Gaps in Care Reporting to use the same machinery as the Individual Reporting to calculate measures and represent the results of individual calculation.

### Default Profiles

The following resources are used in the Gaps in Care Reporting Scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|DEQM Gaps In Care Bundle Profile|[DEQM Gaps In Care Bundle Profile]|
|Composition|DEQM Gaps In Care Composition Profile|[DEQM Gaps In Care Composition Profile]|
|DetectedIssue|DEQM Gaps In Care DetectedIssue Profile|[DEQM Gaps In Care DetectedIssue Profile]|
|Group|DEQM Gaps In Care Group Profile|[DEQM Gaps In Care Group Profile]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
{: .grid}

Figure 2-14 provides a graphical view of how these resources are related. A Composition is created for each Patient (linked via `subject` element) and is contained in a Bundle. The Composition resource references one or more DEQM Individual MeasureReport resources. One MeasureReport for each Measure included in the report. If the generator of the MeasureReport resource has data used in the Measure, they are linked under `evaluatedResource` element. The [DEQM Population Reference Extension] on the `evaluatedResource` documents how that resource contributed to the measure, i.e. numerator, denominator, etc.

{% include img-portrait.html img="gic-resources.png" caption = "Figure 2-14 Gaps In Care Resources" %}

### Gaps in Care Reporting

#### Gaps Through Period (Retrospective vs. Prospective)
{:.no_toc}

[Gaps through period] is the time period defined by a Client for running the Gaps in Care Report. When the [gaps through period] ends on a date that is in the future, the Gaps in Care Reporting is said to look for care gaps prospectively. In this scenario, it provides providers with opportunities to assess anticipated [open gaps] and take proper actions to close the gaps. When the [gaps through period] ends on a date that is in the past, the Gaps in Care Reporting is said to look for care gaps retrospectively. In the retrospective scenario, identified [open gaps] can no longer be acted upon to meet the quality measure. In the example below, Colorectal Cancer Screening ([CMS130]) with measureId EXM130-7.3.000 is used as an example measure.

|Use Case|care-gaps Operation|Gaps Through Period Start Date|Gaps Through Period End Date|Report Calculated Date|Colorectal Cancer Screening - Colonoscopy Date|Gaps in Care Report|
|---|---|---|---|---|---|
|**Prospective Use Case**|$care-gaps?periodStart=2021-01-01&periodEnd=2021-06-30&subject=Patient/123&measureId=EXM130-7.3.000&status=open-gap|2021-01-01|2021-06-30|2021-04-01|Example: patient had colonoscopy on 2011-05-03|Returns gaps through 2021-06-30. The Gaps in Care Report indicates the patient has a [prospective gap] for the colorectal cancer screening measure. By 2021-06-30, the colonoscopy would be over 10 years.|
|**Retrospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-12-31&subject=Patient/123&measureId=EXM130-7.3.000&status=open-gap|2020-01-01|2020-12-31|2021-04-01|Example: patient had colonoscopy on 2011-05-03|Returns gaps through 2020-12-31. The Gaps in Care Report indicates the patient has a [closed gap] for the colorectal cancer screening measure. Since on 2020-12-31, the procedure would have occurred within the specified 10-year timeframe.|
{: .grid}

The timeline below represents the data described above. A colonoscopy procedure per the Colorectal Cancer Screen measure is required every 10 years. If as in the example above, the patient had a colonoscopy done on May 3rd, 2011, another one would be due and the gap opened on May 3rd, 2021.

{% include img-portrait.html img="gic-prospective-retrospective.png" caption = "Figure 2-15 Prospective and Retrospective Use Case" %}

#### Care Gaps Operation
{:.no_toc}

The [care-gaps](OperationDefinition-care-gaps.html) operation is used to run a Gaps in Care Report. In this guide, we have updated the [base care-gaps operation] in the R4 Release of the FHIR (FHIR R4) Specification to allow for the specification of additional parameters that will be useful to the communities needing this report. This operation is run on the Measure resource and allows a Server to create a Gaps in Care Report based on the quality measures available in the Server’s system.

A report calculated on any given date provides all of the data from the server's system as of that date. A request for a previous time period will still show all data available as of the date the report is calculated. Therefore, a requester can ask for multiple reports, save them and compare them, but not request data "as of" previous dates.

The updated operation, [care-gaps](OperationDefinition-care-gaps.html), makes the following changes to the existing input parameters in the base operation:
- **periodStart** is still required, but the description is modified to reference the start date of the [gaps through period].
- **periodEnd** is still required, but the description is modified to reference the end of the [gaps through period].
-	**topic** is an optional parameter for which the cardinality has been updated to allow multiple topics to be specified.
-	**subject** can now point to either a patient or a group of patients. Subject is optional when run a Gaps in Care Report for an organization or a practitioner of an organization.

Several new input parameters are specified and added to the [care-gaps](OperationDefinition-care-gaps.html) operation defined in this guide:
- **practitioner** references a practitioner for which the Gaps in Care Report will be created.
- **organization** references an organization for which the Gaps in Care Report will be created.
-	**status** is required, it SHALL be a code from the [gaps status value set], which indicates an open-gap or a closed-gap. For the Gaps in Care Report to return both the [open and closed gaps], status equals to open-gap and closed-gap both need to be provided.
-	**measureId** is the id of a Measure resource that is on the server for which the gaps in care will be reported. The Client will need to check with the Server to know the identifiers used by the Server to uniquely identify measures. This parameter is one of the three options provided by this operation to specify one or more measures for which the Gaps in Care Report will be created.
- **measureIdentifier** is the business identifier for a measure. This parameter is one of the three options provided by this operation to specify one or more measures for the which the Gaps in Care Report will be created.  
- **measureUrl** is the url of a measure. This parameter is one of the three options provided by this operation to specify one or more measures for the which the Gaps in Care Report will be created.  
-	**program** is used to specify one or more programs that a provider or an organization participates in. For example, the program may be a risk based, value based, or other performance program such as the Merit-based Incentive Payment System (MIPS) and Hospital Quality Reporting programs of CMS.

The [care-gaps](OperationDefinition-care-gaps.html) operation has an out parameter: **return**. In comparison to the return output parameter specified in the [base care-gaps operation], the **return** here returns a Parameters resource that contains zero or more `parameter`, with each `parameter` containing a Bundle resource that conforms to the [DEQM Gaps In Care Bundle Profile].

Figure 2-16 shows an example workflow for running the [care-gaps](OperationDefinition-care-gaps.html) operation against a payer's system for a single patient.
{% include img-narrow.html img="gic-care-gaps-operation-single-patient.png" caption="Figure 2-16 Care Gaps Operation - Single Patient" %}

Figure 2-17 shows an example workflow for running the [care-gaps](OperationDefinition-care-gaps.html) operation against a payer's system for a group of patients.
{% include img-narrow.html img="gic-care-gaps-operation-group.png" caption="Figure 2-17 Care Gaps Operation - Group of Patients" %}

#### How to Construct a Gaps in Care Report
{:.no_toc}

This section describes the profiles used for Gaps in Care Reporting and how they are used to construct a Gaps in Care Report.

The [care-gaps](OperationDefinition-care-gaps.html) operation returns a [Parameters](https://www.hl7.org/fhir/parameters.html) resource that contains zero or more `parameter` with document bundle for each patient for which a Gaps in Care report is calculated. The bundle SHALL conform to the [DEQM Gaps In Care Bundle Profile]. A Gaps In Care Bundle SHALL contain a Composition entry, which uses the [DEQM Gaps In Care Composition Profile].

The [DEQM Gaps in Care Composition Profile] builds on the base FHIR Composition resource, where its type code is constrained to a fixed LOINC code to identify the Composition as a Gaps in Care Report. The `subject` of a Gaps In Care Composition is required, it is used to reference the patient, [QICore Patient], the Gaps in Care Report is for. The Gaps In Care Composition SHALL contain one to many section(s). Each `section` has a `focus` element that references an Individual MeasureReport for a specific measure. All Individual MeasureReport referenced SHALL be for the same patient specified in the Composition `subject`. Each `section` SHALL also contain one or more `entry` of DetectedIssue using the [DEQM Gaps In Care DetectedIssue Profile] for the measure regardless of its gap status (e.g., open or closed).

- The Individual MeasureReport SHALL conform to the [DEQM Individual MeasureReport Profile]. This profile contains an optional extension, [DEQM Population Reference Extension], on the `evaluatedResource` element. This extension allows the Server to indicate how an evaluatedResource, such as a colonoscopy procedure, was used to produce the measure calculation results by linking it to a specific population criteria identified by the population criteria id that equals to `Measure.population.group.id`. If an evaluatedResource contributes to multiple population criteria such as denominator and numerator, this can be represented by having two population reference extensions. One extension has `value` that references the denominator population criteria id and the other extension has `value` that references the numerator population criteria id.  

- The DEQM Gaps In Care DetectedIssue Profile has a fixed code CAREGAP indicating the detected issue is in the Care Gaps detected issue category. Each DetectedIssue SHALL contain at least one `evidence` element that each evidence SHALL provide a detail that references either a DEQM Individual MeasureReport of the measure or a GuidanceResponse.  

- The [DEQM Gaps in Care Composition Profile] may also contain all supporting resources referenced by the Composition and its contained measure reports. As with other compositions, this resource can contain a narrative which can be displayed as a textual report.

- The `date` element of the MeasureReport resource contains the date the open/closed gap was calculated.


#### Gaps in Care Bundle Structure
{:.no_toc}

The [DEQM Gaps In Care Bundle](StructureDefinition-gaps-bundle-deqm.html) can be defined as a document bundle (`bundle.type` is `document`), then, it must conform to the rules specified for a document bundle, which means that a DEQM Gaps In Care Bundle must have an identifier with a system and a value, have a date, and have the DEQM Gaps In Care Composition as the first resource. However, the isDocument in parameter allows for specifying that it will not return the document bundle (`bundle.type` is `collection`).

Figure 2-18 illustrates structure of a DEQM Gaps In Care Bundle.
- The DEQM Gaps In Care Bundle shall include both the [DEQM Gaps In Care MeasureReport](StructureDefinition-indv-measurereport-deqm.html) and [DEQM Gaps In Care DetectedIssue](StructureDefinition-gaps-detectedissue-deqm.html) and optionally the resources included in the [DEQM Gaps In Care Composition](StructureDefinition-gaps-composition-deqm.html). 
- In addition, the bundle shall include entries for all patient specific resources including evaluated resources referenced by the included DEQM Gaps In Care MeasureReport, for example, the patient resource, the resources for the colonoscopy procedure and FOBT lab observation as shown in the figure.
- The bundle shall also include entries for the resources referenced by the DEQM Gaps In Care DetectedIssue, for example, GuidanceResponse if it is included.

{% include img-narrow.html img="gic-bundle-structure.png" caption="Figure 2-18 DEQM Gaps In Care Bundle" %}

#### Detailed Care Gap Guidance Response
{:.no_toc}

Derived from the GuidanceResponse resource, the  [Detailed Care Gap Guidance Response](StructureDefinition-gaps-guidanceresponse-detailedcaregap.html) supports the functionality of providing reason for guidance and detailed guidance to help address care gaps and close open gaps. This section provides a detailed description of how the profile should be used, with a focus on the utilization of the `reasonCode` and the `dataRequirement` along with some practical business use cases.

- **reasonCode** The `GuidanceResponse.reasonCode` has a preferred binding to the Care Gap Reasons value set. It contains codes that represent the reason or rationale behind the identified care gap, such as data element is not found or value is out of the specified range. It helps in categorizing and organizing the gaps based on their underlying causes, facilitating a more targeted approach to addressing them.

- **dataRequirement** The Detailed Care Gap Guidance Response profile added a valueFilter extension to the dataRequirement element, this is in addition to the codeFilter and dateFilter that are specified in the base GuidanceResponse resource. These filters could be used to specify what data are required to address the identified care gaps.

Example Business Use Cases:

- `Diabetes Management. In this scenario, In this scenario, a patient has an open gap for the Diabetes: Hemoglobin A1c Poor Control (>9%) quality measure. The Detailed Care Gap Guidance Response profile is utilized to provide guidance on addressing this open gap. The reasonCode element may include a code “NotFound” indicating the most recent HbA1c result is missing for the patient. The dataRequirement element then specifies the requirement for a HbA1c test for the patient in order to help address the open gap. `

[Diabetes Management Detailed Care Gap Guidance Response Example](GuidanceResponse-detailedguidanceresponse01.html)


- `Medication Adherence. This use case involves a quality measure highlighting low medication adherence rates among a certain patient population. The Detailed Care Gap Guidance Response profile is employed to provide guidance on improving medication adherence for a patient. The reasonCode element might indicate non-compliance with medication regimens. The dataRequirement element may include medication history, prescription records, and patient-reported data. The guidance response offers strategies for enhancing patient education, optimizing medication schedules, and utilizing adherence monitoring tools to address the care gap effectively.`

[Medication Adherence Detailed Care Gap Guidance Response Example](GuidanceResponse-detailedguidanceresponse02.html)


By incorporating the [Detailed Care Gap Guidance Response profile](StructureDefinition-gaps-guidanceresponse-detailedcaregap.html), healthcare organizations can receive tailored and actionable guidance on addressing specific care gaps. The inclusion of `reasonCode` and `dataRequirement` enables standardized categorization, context-specific recommendations, and ensures a more focused approach to quality improvement efforts.

#### Attribution
{:.no_toc}

Member attribution establishes associations between providers and payers. The process of establishing and exchanging member lists for Gaps in Care Reports is not in the scope of the DEQM IG. One possible way of exchanging Member Attribution Lists between providers and payers is described in the [Da Vinci - Risk Based Contracts Member Attribution (ATR) List IG].

#### Usage
{:.no_toc}

`GET|[base]`

{% include examplebutton.html example="get-gaps-caregap-usage-example" b_title = "Click Here To See Example GET Gaps in Care Report" %}

##### Bulk Data
{:.no_toc}  

If Clients are requesting Gaps in Care Reports for many patients/members, they may consider using the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

`GET|[base]`

{% include examplebutton.html example="get-gaps-caregap-usage-bulk-example" b_title = "Click Here To See Example GET Gaps in Care Report Using Bulk Data" %}

Headers:
* `Prefer respond-async`
* `Accept application/fhir+json`

Note that both Prefer and Accept are required. **Prefer** specifies the response is immediate or asynchronous, which SHALL be set to *respond-async*. **Accept** specifies the format of the optional OperationOutcome response to the kick-off request. Any of the Serialization Format Representations are supported. See the base FHIR specification [Asynchronous Request Patterns] for details.

Query Parameters:
* `_outputFormat (string, optional, defaults to application/fhir+ndjson)`

Currently, only *application/fhir+ndjson* is supported.

<br />


{% include link-list.md %}
