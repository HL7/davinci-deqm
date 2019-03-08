---
title: Medication Reconciliation Process
layout: default
active: guidance
topofpage: true
r4: http://build.fhir.org/
r3: http://hl7.org/fhir/STU3/
qi_r4: todo.html
qi_r3: http://build.fhir.org/ig/cqframework/qi-core/
deqm_r4: todo.html
deqm_r3: ''
hedis_r4: todo.html
hedis_r3: http://build.fhir.org/ig/cqframework/hedis-ig/
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

The Medication Reconciliation Use Case defines the process by which a message can be sent from a provider EHR to a Payer attesting that a medication reconciliation post-discharge was performed on a covered member. The Medication Reconciliation Process (MRP) use case covers both the request to send attestation information and the unsolicitated submission of that data. This attestation message is intended to be performed by the next provider where the patient returns for follow-up and can then be used by the payer to show compliance for the HEDIS measure Medication Reconciliation Post-Discharge. (Any necessary documentation will also be put in the record)

In the case of medication reconciliation after discharge from the hospital, the patient’s discharge medication(s) is compared with the medication(s) the patient was taking prior to hospitalization. This can avoid medication errors such as omissions, duplications, dosing errors or drug interactions, and should be done at every transition of care in which new medications are ordered or existing orders are rewritten.

In the past, attestation to the reconciliation had been done by posting a CPT2 code on a claim typically for a small monetary amount that was then denied by the payer and had to be written off by the provider.  This is a cumbersome process and most providers are no longer doing this.

Payers and providers need common standards to share the data required to complete medication reconciliation at all transitions of care, for care management plans, and during medication changes. Proof of 30 day medication reconciliations is increasingly required for value based care incentives.  Providers and care coordinators face the challenge of collecting accurate and complete patient medication records across care settings. Today’s manual and ad hoc processes are costly and will not scale. Vendors are actively leveraging FHIR resources to improve partner’s access to patient medication history by unlocking existing silos of this critical data from vendor systems, healthcare operations systems and provider EHRs.

As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring workgroup, Clinical Quality Information, and incorporated as part of the standard balloting process. The current roadmap follows closely behind the base FHIR roadmap, and QI Core Implementation Guide.

Exchange of the reconciled medication list, indication of conversations with the patient, and notification of discharge from inpatient systems are out of scope for this version of the use case.

## FHIR Resource Overview

### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Library|CQFM Library Profile|[CQFM Library (STU3)]|[CQFM Library (R4)]|
|Measure|CQFM Measure Profile|[CQFM Measure (STU3)]|[CQFM Measure (R4)]|
|Data Exchange MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|HEDIS MRP Observation Profile[^3]|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile[^4]|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile[^4]|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile[^3]|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

## Graph of MRP resources:

For MRP the Provider may submit either a *Task* resource or an *Observation* resource as the primary resource used to evaluate the measure.

{% include img.html img="mrp-task.jpg" caption="Option 1: MRP using Task" %}

{% include img.html img="mrp-observation.jpg" caption="Option 2: MRP using Observation" %}

## MRP Data Exchange Interactions

### Gather Data Requirements From Payer (TODO link)
{:.no_toc}

   In this optional step, the Provider queries the Payer("Aggregator") for which resources are needed for MRP measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

        {% include examplebutton.html example="measure-requirements-example" b_title = "Example Data Requirements operation" %}

### Data Exchange Using The Submit Data Operation (TODO link)
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the payer.  Note that the Collect Data and Subscription Operations are not supported for this use case.

The technical Workflow is outlined in the following figure.  The parts outlined in red are the actual FHIR transactions that are the focus of this Guide and are described in detail in the following sections:

{% include img-portrait.html img="MRP_Technical_Workflow.jpg" caption=" Technical Workflow" %}

{% include examplebutton.html example="submit-data-example" b_title = "Example Submit Data operation using Task option" %}

<!--
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->

{% include examplebutton.html example="submit-data-observation"  b_title = "Example Submit Data operation using Observation option" %}

### MRP Measure Reporting Interactions:

#### Individual MeasureReport

Aggregator pushed the Bundle of supporting resource with COL Individual MeasureReport Bundle to the end user.

{ % include img-portrait.html img="MRP Worklow Diagram - Data Exchange Indv report.jpg" caption = "Technical Workflow" % }

{  % include examplebutton.html example=mrp-indv-report-example" b_title = "Post Bundle with COL Individual MeasureReport" % }

#### Summary MeasureReport

Aggregator pushed the Bundle of supporting resource with COL Individual MeasureReport Bundle to the end user.

{ % include img-portrait.html img="MRP Worklow Diagram - Data Exchange Summary report.jpg" caption = "Technical Workflow" % }

{  % include examplebutton.html example=mrp-summary-report-example" b_title = "Post COL Summary MeasureReport" % }

---

{% include link-list.md %}
