
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

In Figure 3.6-1, the red circle represents the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem. Please see [The Quality Improvement Ecosystem Diagram](background.html#quality-improvement-ecosystem).

{% include img-portrait.html img="gic-ecosystem_new.png" caption = "Figure 3.6-1 Quality Improvement Ecosystem - Gaps in Care" %}

The gaps in care flow is between a provider and a measurement organization’s system performing analytics.

Note that this implementation guide does not address actual workflow around managing the process of requesting a Gaps in Care Report and to whom the report should be sent.

Figure 3.6-2 reflects the details within the red circle representing the Gaps in Care Reporting flow portion of the Quality Improvement Ecosystem.

{% include img-portrait.html img="gic-reporting-flow.png" caption = "Figure 3.6-2 Gaps in Care Reporting Flow" %}

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
|GuideanceResponse|DEQM Detailed Care Gap Guidance Response|[DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html)|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
{: .grid}

Figure 3.6-3 provides a graphical view of how these resources are related. A Composition is created for each Patient (linked via `subject` element) and is contained in a Bundle. The Composition resource references one or more DEQM Individual MeasureReport resources. One MeasureReport for each Measure included in the report. If the generator of the MeasureReport resource has data used in the Measure, they are linked under `evaluatedResource` element. The [CQF Criteria Reference Extension] on the `evaluatedResource` documents how that resource contributed to the measure, i.e. numerator, denominator, etc.

{% include img-portrait.html img="gic-resources.png" caption = "Figure 3.6-3 Gaps In Care Resources" %}

### Gaps in Care Reporting

#### Gaps Through Period (Retrospective vs. Prospective)
{:.no_toc}

[Gaps through period] is the time period defined by a Client for running the Gaps in Care Report. When the [gaps through period] ends on a date that is in the future, the Gaps in Care Reporting is said to look for care gaps prospectively. In this scenario, it provides providers with opportunities to assess [prospective gaps] and take proper actions to close the gaps. When the [gaps through period] ends on a date that is in the past, the Gaps in Care Reporting is said to look for care gaps retrospectively. In the retrospective scenario, identified [open gaps] can no longer be acted upon to meet the quality measure. In the example below, Colorectal Cancer Screening ([CMS130]) with measureId EXM130-7.3.000 is used as an example measure.

|Use Case|care-gaps Operation|Gaps Through Period Start Date|Gaps Through Period End Date|Report Calculated Date|Colorectal Cancer Screening - Colonoscopy Date|Gaps in Care Report|
|---|---|---|---|---|---|
|**Prospective Use Case**|$care-gaps?periodStart=2021-01-01&periodEnd=2021-06-30&subject=Patient/123&measureId=EXM130-7.3.000&status=open-gap|2021-01-01|2021-06-30|2021-04-01|Example: patient had colonoscopy on 2011-05-03|Returns gaps through 2021-06-30. The Gaps in Care Report indicates the patient has a [prospective gap] for the colorectal cancer screening measure. By 2021-06-30, the colonoscopy would be over 10 years.|
|**Retrospective Use Case**|$care-gaps?periodStart=2020-01-01&periodEnd=2020-12-31&subject=Patient/123&measureId=EXM130-7.3.000&status=open-gap|2020-01-01|2020-12-31|2021-04-01|Example: patient had colonoscopy on 2011-05-03|Returns gaps through 2020-12-31. The Gaps in Care Report indicates the patient has a [closed gap] for the colorectal cancer screening measure. Since on 2020-12-31, the procedure would have occurred within the specified 10-year timeframe.|
{: .grid}

The timeline below represents the data described above. A colonoscopy procedure per the Colorectal Cancer Screen measure is required every 10 years. If as in the example above, the patient had a colonoscopy done on May 3rd, 2011, another one would be due and the gap opened on May 3rd, 2021.

{% include img-portrait.html img="gic-prospective-retrospective.png" caption = "Figure 3.6-4 Prospective and Retrospective Use Case" %}

#### Care Gaps Operation
{:.no_toc}

The [care-gaps](OperationDefinition-care-gaps.html) operation is used to run a Gaps in Care Report. In this guide, we have updated the [base care-gaps operation] in the R4 Release of the FHIR (FHIR R4) Specification to allow for the specification of additional parameters that will be useful to the communities needing this report. This operation is run on the Measure resource and allows a Server to create a Gaps in Care Report based on the quality measures available in the Server’s system.

A report calculated on any given date provides all of the data from the server's system as of that date. A request for a previous time period will still show all data available as of the date the report is calculated. Therefore, a requester can ask for multiple reports, save them and compare them, but not request data "as of" previous dates.

The [care-gaps](OperationDefinition-care-gaps.html) operation has an out parameter, **return**, which returns a Parameters resource that contains zero or more `parameter`, with each `parameter` containing a Bundle resource that conforms to the [DEQM Gaps In Care Bundle Profile].

Figure 2-16 shows an example workflow for running the [care-gaps](OperationDefinition-care-gaps.html) operation against a payer's system for a single patient.
{% include img-narrow.html img="gic-care-gaps-operation-single-patient-2026.png" caption="Figure 2-16 Care Gaps Operation - Single Patient" %}

Figure 2-17 shows an example workflow for running the [care-gaps](OperationDefinition-care-gaps.html) operation against a payer's system for a group of patients.
{% include img-narrow.html img="gic-care-gaps-operation-group-2026.png" caption="Figure 2-17 Care Gaps Operation - Group of Patients" %}

#### Measure Evaluation for a Gap in Care
{:.no_toc}

As shown in Figure 3.6-5 and 3.6-6 above, gaps in care reporting leverages the quality measure evaluation capability of $evaluate to produce one or more Individual Measure Report, which are then utilized by the gaps in care service to determine a gap status that is reported in a detected issue. Because the $care-gaps operation utilizes $evaluate, any QMIG profile requirements for $evaluate apply to $care-gaps as well (e.g. the CQMComputableMeaure profile, depending on the server implementation).

This IG provides guidance for inferring that a care gap has occurred (or will occur, or is closed) based on the scoring type of the measure, specifically proportion measures and ratio measures. Other care gap inferences are possible but not specified in this IG. A detected issue uses its `gapStatus` element, bound to the [DEQM Gaps In Care Gap Status Value Set], to communicate if the gap is open, prospective, closed, or not-applicable. §deqm-12: If the status is not-applicable the measureScore **SHALL NOT** be included in the DEQM Individual MeasureReport. §

Patient-based measures lend themselves most readily to gaps in care calculations because they are evaluated over a long time period. Other measure bases, such as an encounter-based measure, typically happen over shorter time spans. The types of population bases to support is at the server’s discretion. §deqm-13: Servers **SHOULD** support patient-based measures, and **MAY** support any other base. §

Measures with multiple groups (a multiple rate measure) have the potential to create multiple gaps in care for a single patient. The extension [DEQM Criteria Reference Extension] allows the detected issue to reference which group or population from the measure report led to the creation of the detected issue.

#### How to Construct a Gaps in Care Report
{:.no_toc}

This section describes the profiles used for Gaps in Care Reporting and how they are used to construct a Gaps in Care Report.

The [care-gaps](OperationDefinition-care-gaps.html) operation returns zero or more bundles, one for each input patient. §deqm-14: If `isDocument` is true, each bundle **SHALL** conform to the [DEQM Gaps In Care Bundle Profile], otherwise, each bundle **SHALL** contain the MeasureReport(s) and related resources, but does not have to contain any of the gaps-in-care-specific resources. § A Gaps In Care Bundle can optionally contain a Composition entry, which uses the [DEQM Gaps In Care Composition Profile], to define a document composition consisting of one or more MeasureReports.

The [DEQM Gaps in Care Composition Profile] builds on the base FHIR Composition resource, where its type code is constrained to a fixed LOINC code to identify the Composition as a Gaps in Care Report. The `subject` of a Gaps In Care Composition is required, it is used to reference the patient, [QI Core Patient](https://hl7.org/fhir/us/qicore/StructureDefinition-qicore-patient.html), the Gaps in Care Report is for. §deqm-15: The Gaps In Care Composition **SHALL** contain one to many section(s). § Each `section` has a `focus` element that references an Individual MeasureReport for a specific measure. §deqm-16: All Individual MeasureReport referenced **SHALL** be for the same patient specified in the Composition `subject`. § §deqm-17: Each `section` **SHALL** also contain one or more `entry` of `DetectedIssue` using the [DEQM Gaps In Care DetectedIssue Profile] for the measure regardless of its gap status (e.g., open or closed). §

- §deqm-18: The Individual MeasureReport **SHALL** conform to the [DEQM Individual MeasureReport Profile]. § This profile contains an optional extension, [CQF Criteria Reference Extension], on the `evaluatedResource` element. This extension allows the Server to indicate how an evaluatedResource, such as a colonoscopy procedure, was used to produce the measure calculation results by linking it to a specific population criteria identified by the population criteria id that equals to `Measure.group.population.id`. If an evaluatedResource contributes to multiple population criteria such as denominator and numerator, this can be represented by having two population reference extensions. One extension has `value` that references the denominator population criteria id and the other extension has `value` that references the numerator population criteria id.  

- The [DEQM Gaps In Care DetectedIssue Profile] has a fixed code CAREGAP indicating the detected issue is in the Care Gaps detected issue category. §deqm-19: Each `DetectedIssue` **SHALL** contain at least one `evidence` element that each evidence **SHALL** provide a detail that references either a DEQM Individual MeasureReport of the measure or a `GuidanceResponse`. §  

- The [DEQM Gaps in Care Composition Profile] may also contain all supporting resources referenced by the Composition and its contained measure reports. As with other compositions, this resource can contain a narrative which can be displayed as a textual report.

- The `date` element of the MeasureReport resource contains the date the open/closed gap was calculated.


#### Gaps in Care Bundle Structure
{:.no_toc}

The `isDocument` in parameter determines which of two shapes the Server returns. In effect, it selects between a Gaps in Care *document* and a plain *measure report* bundle:

|`isDocument`|`Bundle.type`|Composition|DetectedIssue|What the Client receives|
|---|---|---|---|---|
|`true` (default)|`document`|Required, first entry|Required, one or more per section|The gap determination: the Server states the gap status for each measure|
|`false`|`collection`|Permitted, not required|Permitted, not required|At minimum the measure calculation: the MeasureReport(s) and the data evaluated to produce them|
{: .grid}

When `isDocument` is true the returned bundle is a document bundle, and must conform to the rules specified for a document bundle, which means that a DEQM Gaps In Care Bundle must have an identifier with a system and a value, have a date, and have the DEQM Gaps In Care Composition as the first resource.

Figure 3.6-7 illustrates the structure of a DEQM Gaps In Care Bundle returned when `isDocument` is true.
- The [DEQM Gaps In Care Bundle Profile] shall include both the [DEQM Gaps In Care MeasureReport](StructureDefinition-deqm-individualmeasurereport.html) and [DEQM Gaps In Care DetectedIssue Profile] and optionally the resources included in the [DEQM Gaps In Care Composition Profile].
- In addition, the bundle shall include entries for all resources referenced by the included DEQM Gaps In Care MeasureReport, for example, the patient resource, the organization, the resources for the colonoscopy procedure and FOBT lab observation as shown in the figure.
- The bundle shall also include entries for the resources referenced by the [DEQM Gaps In Care DetectedIssue Profile], for example, `GuidanceResponse` if it is included.

{% include img-narrow.html img="gic-bundle-structure-edit.png" caption="Figure 3.6-7 DEQM Gaps In Care Bundle" %}

##### Requesting the Measure Calculation Without a Document (isDocument=false)
{:.no_toc}

When `isDocument` is false, the Server returns a `collection` bundle containing the DEQM Individual MeasureReport(s) and every resource referenced by those MeasureReports - the subject, the reporter, and each `evaluatedResource`. There is no Composition organizing the report into sections, so the bundle is not a document.

As described in [How to Construct a Gaps in Care Report](#how-to-construct-a-gaps-in-care-report) above, the gaps-in-care-specific resources are permitted in this bundle but are not required. A Server may include a DetectedIssue to convey `gapStatus`, and may include other gaps-in-care resources such as a `GuidanceResponse`, alongside the measure calculation. Both of the following are valid responses to the same request:

- **Measure calculation only** - the MeasureReport(s) and the resources they evaluated. This is the minimal form, and is what the example below shows.
- **Measure calculation with gap status** - the same content plus one or more DetectedIssue resources, conveying the Server's gap determination without the document wrapper.

Because the gaps-in-care resources are optional, a Client cannot rely on their presence and needs to handle a bundle that carries only the measure calculation. This shape suits a Client that wants the measure calculation rather than the Server's gap determination: a Client that ingests the MeasureReport into its own analytics or quality dashboard, a Client that applies its own gap logic to the evaluated data, or a Client that already has a workflow keyed on individual measure reports and does not need the document wrapper.

When no DetectedIssue is returned, the gap status is not communicated explicitly, and the Client determines the gap for itself from the measure score, together with the scoring type and `improvementNotation` of the measure, as described in [Measure Evaluation for a Gap in Care](#measure-evaluation-for-a-gap-in-care). The `evaluatedResource` entries, and the [CQF Criteria Reference Extension] on them, still show which data contributed to which population criteria, so the Client can see the basis for the score.

{% include examplebutton.html example="get-gaps-non-document-example" b_title = "Click Here To See Example GET Gaps in Care Report with isDocument=false" %}

#### Detailed Care Gap Guidance Response
{:.no_toc}

{: .stu-note}
We are looking for feedback from the community on this revised section.

Derived from the FHIR `GuidanceResponse` resource, the DEQM [Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) profile provides additional information about why a care gap was identified and what evidence may help resolve or reassess the reported gap. It complements the [DEQM Gaps In Care DetectedIssue Profile], which communicates whether the gap is open, prospective, closed, or not applicable. Together, these profiles provide recipients with both the outcome of the measure evaluation and the information needed to understand, investigate, and respond to a reported care gap. The `reasonCode` and `dataRequirement` elements communicate the rationale for the reported gap and the evidence that may satisfy the measure criteria or support reevaluation.

##### Actual and Perceived Care Gaps
{:.no_toc}

A reported care gap may represent either an actual gap in care or a perceived gap caused by missing, delayed, unavailable, or non-computable evidence.

An actual care gap exists when recommended care has not been performed and no applicable exclusion, exception, or other measure-defined reason applies.

A perceived care gap exists when the calculating system does not have usable evidence that the recommended care was performed. The care may have been completed, but the evidence is unavailable, not yet ingested, or not computable at the time the report was generated.

The absence of numerator-satisfying evidence does not necessarily establish that care was not performed. Implementers should avoid characterizing a gap as confirmed “care not performed” solely because the calculating system did not locate qualifying evidence. The table below summarizes the interpretation but specific follow-up workflows are outside of the scope of this IG. 

| Scenario | Interpretation | Typical follow-up to consider |
|:---|:---|:---|
| Care not performed | Available evidence and subsequent review indicate that the recommended care was not completed and no applicable exclusion or exception is documented. | Schedule, order, or perform the care; address barriers; or document an applicable exclusion, exception, contraindication, or refusal. |
| Evidence not available to the calculating system | The system did not identify qualifying evidence, but the care may already have been performed. | Retrieve or submit evidence, reconcile outside records, correct coding or documentation, or recalculate the report after additional data become available. |
{:.grid}

##### Representing Care Gap Information
{:.no_toc}

The following table summarizes how the primary DEQM profiles and elements work together to communicate the status of a reported care gap, the rationale for its identification, the evidence considered during measure evaluation, and the information needed to resolve or reassess the gap

| Profile / Artifact | Element | Intended use |
|:---|:---|:---|
| [DEQM Gaps In Care DetectedIssue Profile] | `DetectedIssue.gapStatus` | Indicates whether the gap is open, prospective, closed, or not applicable. |
| [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) | `GuidanceResponse.reasonCode` | Communicates the reason or rationale for the identified gap, such as required evidence not being found or a value falling outside an expected range. |
| [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) | Reason Detail extension | Identifies the specific data element or attribute associated with the reason for the gap. |
| [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) | `GuidanceResponse.dataRequirement` | Describes the evidence that may help resolve or reassess the gap, including the applicable resource type, profile, terminology, date, code, or value constraints. |
| [DEQM Individual MeasureReport Profile] | `MeasureReport.evaluatedResource` | Identifies the resources the calculating system considered during measure evaluation. The CQF Criteria Reference extension may indicate how an evaluated resource contributed to specific measure criteria. |
| [DEQM Individual MeasureReport Profile] | `MeasureReport.date` | Identifies when the gap was calculated and helps the recipient determine whether subsequent care or newly available evidence may not be reflected in the report. |
| [DEQM Gaps In Care DetectedIssue Profile] | Care Gap Remark extension | Supports feedback from the recipient following review of the report, such as indicating that care was completed, evidence exists elsewhere, the care was deferred, or attribution is incorrect. |
{:.grid}

##### Using reasonCode
{:.no_toc}

The `GuidanceResponse.reasonCode` has a preferred binding to the Care Gap Reasons ValueSet. It communicates the reason the calculating system identified the gap and supports more targeted follow-up than an open-gap status alone.

The reason communicates the calculating system's basis for identifying the gap and its level of certainty. Depending on the available information, the reason can identify:
 - qualifying evidence was not found; 
 - a required result or value was unavailable; 
 - an observed value was outside the range required to satisfy the measure; 
 - available documentation was not computable; 
 - additional external evidence is needed; or 
 - the report requires recalculation after newer data are ingested.

The gap status and reason serve different purposes. An open status indicates that the measure criteria were not satisfied based on the available data, while the reason provides additional information about why the gap was identified.

##### Using dataRequirement
{:.no_toc}

The `GuidanceResponse.dataRequirement` identifies the data that may help address or reassess the gap. In addition to the `codeFilter` and `dateFilter` available in the base resource, the [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) adds a `valueFilter` extension that can communicate expected values or ranges. 

The data requirement describes the evidence needed to resolve or reassess the identified gap. Depending on the measure, it can identify:
 - a procedure or service; 
 - an observation or laboratory result; 
 - a medication order, administration, or dispensing event; 
 - a diagnosis or clinical assessment; 
 - a claim or encounter; 
 - a documented exclusion, exception, contraindication, or refusal; or 
 - other numerator-satisfying evidence. 

The data requirement can also include the applicable profile, terminology, timeframe, and expected value constraints, enabling the receiving system to determine what evidence could close the gap without requiring a clinician to interpret the complete measure specification manually.

##### Common Care Gap Scenarios
{:.no_toc}

The following table provides examples of common care gap scenarios and the DEQM profiles and elements that support communicating the gap, the rationale for its identification, the evidence considered during measure evaluation, and the information needed to resolve or reassess the gap. Not every scenario maps to a single element, and implementations may use combinations of the available profiles and elements to communicate the information needed to understand and resolve a reported care gap.

| Scenario | Recommended representation and follow-up | Profile and element |
|:---|:---|:---|
| Actual care not performed | Represent the gap as open and indicate that the recommended care was not performed. Use `dataRequirement` to describe the recommended care or qualifying evidence. | [DEQM Gaps In Care DetectedIssue Profile] – gapStatus, [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) – `reasonCode`, `dataRequirement` |
| Evidence not found | Indicate that required evidence was not found and specify the evidence needed. This does not confirm that the care was not performed. | [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) – `reasonCode`, `dataRequirement` |
| Documented elsewhere | Communicate that the calculating system lacks the evidence. The recipient can indicate that the care is documented elsewhere and reference or submit the external evidence. | [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) – `reasonCode`, DEQM Care Gap Remark – code, relatedData |
| Documented but not computable | Identify the documentation or data element that could not be evaluated and describe the structured or coded evidence needed. | [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) – `reasonCode`, Reason Detail extension, `dataRequirement` |
| Known but not yet ingested | Indicate that evidence has not yet been processed and use the report calculation date to determine whether newer evidence may not be reflected. Recalculate after ingestion. | DEQM Care Gap Remark – code, [DEQM Individual MeasureReport Profile] – date |
| Performed after report generation | Compare the date of care with the report calculation date. Recalculate or update the gap rather than initiating duplicate outreach. | [DEQM Individual MeasureReport Profile] – dateClinical evidence resource (for example, Procedure.performed[x] or Observation.effective[x]), DEQM Care Gap Remark – code |
| Evidence held by a prior payer or during prior coverage | Submit the qualifying evidence and reevaluate the gap after the evidence has been incorporated into the measure evaluation. | [DEQM Detailed Care Gap Guidance Response](StructureDefinition-deqm-detailedcaregapguidanceresponse.html) – `reasonCode` DEQM Care Gap Remark – code |
| Attribution mismatch | Indicate that the patient is not actively managed by the receiving provider or organization and route the gap to the appropriate entity. | DEQM Care Gap Remark – codeApplicable attribution resource or workflow |
| Clinical exception or not applicable | Represent the applicable exclusion, exception, contraindication, refusal, or other measure-defined criterion and update the gap status when supported by the measure logic. | [DEQM Gaps In Care DetectedIssue Profile] – gapStatusClinical evidence resource documenting the exclusion, exception, contraindication, or refusalDEQM Care Gap Remark – code |
{:.grid}


Example Business Use Cases:

- `Diabetes Management. In this scenario, a patient has an open gap for the Diabetes: Hemoglobin A1c Poor Control (>9%) quality measure. The Detailed Care Gap Guidance Response profile is utilized to provide guidance on addressing this open gap. The reasonCode element may include a code “NotFound” indicating the most recent HbA1c result is missing for the patient. The dataRequirement element then specifies the requirement for a HbA1c test for the patient in order to help address the open gap.`

[Diabetes Management Detailed Care Gap Guidance Response Example](GuidanceResponse-detailedguidanceresponse01.html)


- `Medication Adherence. This use case involves a quality measure highlighting low medication adherence rates among a certain patient population. The Detailed Care Gap Guidance Response profile is employed to provide guidance on improving medication adherence for a patient. The reasonCode element might indicate non-compliance with medication regimens. The dataRequirement element may include medication history, prescription records, and patient-reported data. The guidance response offers strategies for enhancing patient education, optimizing medication schedules, and utilizing adherence monitoring tools to address the care gap effectively.`

[Medication Adherence Detailed Care Gap Guidance Response Example](GuidanceResponse-detailedguidanceresponse02.html)


#### Add Remark to Gaps in Care Report
{:.no_toc}

{: .stu-note}
We are actively seeking input on [remark codes](CodeSystem-deqm-care-gap-remark.html), the [remark value set](ValueSet-care-gap-remark.html), and the remark workflow.

When considering a Gaps in Care Report, providers may communicate additional information about a reported care gap using the [Care Gap Remark](StructureDefinition-deqm-careGapRemark.html) extension. Remarks may be used to document actions taken, provide supporting context or indicate reasons a gap remains open. It is important to note that a gap cannot be closed based on a care gap remark alone, a gap is closed only when the supporting data is provided. Common concepts for Care Gap Remarks are included in the [Care Gap Remark Value Set](ValueSet-care-gap-remark.html). If a remark is added to a Gaps in Care Report, the Care Gap Remark extension may be added to the MeasureReport using a [PATCH](https://www.hl7.org/fhir/http.html#patch) request, or an updated MeasureReport containing the extension may be submitted using a POST interaction.

A ([DEQM Parameters Care Gap Remark Patch Profile](StructureDefinition-deqm-caregapremarkpatchparameters.html)) is defined to specify the required structures to send the remark using a PATCH request.

This implementation guide does not direct any action be taken by the payer upon receipt of an Individual MeasureReport with added gaps in care remark(s).

This care gap remark can be used in a similar way to how the condition category remark is used in the [Da Vinci Risk Adjustment IG](https://hl7.org/fhir/us/davinci-ra/cc-remark.html).

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

Note that both Prefer and Accept are required. §deqm-20: **Prefer** specifies the response is immediate or asynchronous, which **SHALL** be set to *respond-async*. § **Accept** specifies the format of the optional OperationOutcome response to the kick-off request. Any of the Serialization Format Representations are supported. See the base FHIR specification [Asynchronous Request Patterns] for details.

Query Parameters:
* `_outputFormat (string, optional, defaults to application/fhir+ndjson)`

Currently, only *application/fhir+ndjson* is supported.

<br />


{% include link-list.md %}
