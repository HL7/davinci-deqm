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

##  Introduction

The Medication Reconciliation Use Case defines the process by which a message can be sent from a provider EHR to a Payer attesting that a medication reconciliation post-discharge was performed on a covered member. This attestation message can then be used by the payer to show compliance for the HEDIS measure Medication Reconciliation Post-Discharge.   (Any necessary documentation will also be put in the record)

In the case of medication reconciliation after discharge from the hospital, the patient’s discharge medication(s) is compared with the medication(s) the patient was taking prior to hospitalization. This can avoid medication errors such as omissions, duplications, dosing errors or drug interactions, and should be done at every transition of care in which new medications are ordered or existing orders are rewritten.

In the past, attestation to the reconciliation had been done by posting a CPT2 code on a claim typically for a small monetary amount that was then denied by the payer and had to be written off by the provider.  This is a cumbersome process and most providers are no longer doing this.

Payers and providers need common standards to share the data required to complete medication reconciliation at all transitions of care, for care management plans, and during medication changes. Proof of 30 day medication reconciliations is increasingly required for value based care incentives.  Providers and care coordinators face the challenge of collecting accurate and complete patient medication records across care settings. Today’s manual and ad hoc processes are costly and will not scale. Vendors are actively leveraging FHIR resources to improve partner’s access to patient medication history by unlocking existing silos of this critical data from vendor systems, healthcare operations systems and provider EHRs.

As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring workgroup, Clinical Quality Information, and incorporated as part of the standard balloting process. The current roadmap follows closely behind the base FHIR roadmap, and QI Core Implementation Guide.

Exchange of the reconciled medication list, indication of conversations with the patient, and notification of discharge from inpatient systems are out of scope for this version of the use case.

### Summary MRP Technical Workflow

The technical Workflow is outlined in the following figure.  The parts outlined in red are the actual FHIR transactions that are the focus of this Guide and are described in detail in the following sections:

{% include img-portrait.html img="MRP_Technical_Workflow.jpg" caption="MRP Technical Workflow" %}

**Summary of FHIR Artifacts used for Medication Reconciliation**

## FHIR Resource Overview

#### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|MeasureReport|DEQM MeasureReport Profile|[DEQM MeasureReport (STU3)]|[DEQM MeasureReport (R4)]|
|Observation|HEDIS MRP Observation Profile|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

## MRP FHIR Transactions:

{% include img.html img="mrp-wf-overview.jpg" %}

### Gather Data Requirements From Payer


In this optional step, the Provider queries the Payer("Aggregator") for which resources are needed for MRP measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

The required data for MRP is discovered by invoking the|[Data Requirements] operation on the payer's `Measure/measure-mrp` endpoint.

#### APIs
{:.no_toc}

These artifacts are used in this transaction:

1. Data Requirements: [$data-requirements (R4)] operation  (Note - the same operation is used for both version STU3 and R4 transaction)

#### Usage
{:.no_toc}

Using either the `GET` and `POST` Syntax the operation can be invoked as follows:

`GET|[base]/Measure/measure-mrp/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`
`POST|[base]/Measure/measure-mrp/$data-requirements`

{% include examplebutton.html example="measure-requirements" b_title = "Example Data Requirements operation" %}

---

### Submit Data to Payer

{% include img-narrow.html img="submit-mrp-data.jpg" caption="Submit data Operation" %}

#### Submit Data to a Payer's Measure endpoint
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the payer.  (Note that the Collect Data and Subscription Operations are not supported for this use case.)  For MRP the Provider may submit either a *Task* resource or an *Observation* resource as the primary resource used to evaluate the measure.

#### Graph of MRP resources:
{:.no_toc}

{% include img.html img="mrp-task.jpg" caption="Option 1: MRP using Task" %}

{% include img.html img="mrp-observation.jpg" caption="Option 2: MRP using Observation" %}

#### APIs
{:.no_toc}

These artifacts are used in this transaction:

1. Submit Data operation: [$submit-data (R4)]  ( Note - the same operation is used for both version STU3 and R4 transaction)
1. DEQM Coverage Profile
1. QI Core Encounter Profile
1. QI Core Location Profile
1. HEDIS MRP Measure Profile
1. DEQM MeasureReport Profile
1. DEQM Organization Profile
1. QI Core Patient Profile
1. DEQM Practitioner Profile
1. HEDIS MRP Task Profile or HEDIS MRP Observation Profile

#### Usage
{:.no_toc}

A provider `POST`s the MRP resources to the payer using:

`POST|[base]/Measure/measure-mrp/$submit-data`



{% include examplebutton.html example="submit-data" b_title = "Example Submit Data operation using Task option" %}

<!--
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->


{% include examplebutton.html example="submit-data-observation"  b_title = "Example Submit Data operation using Observation option" %}

<!-- >[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->

---
<!--{% raw %}

### Usage

example how to use a button to expand an inline example....

{% include examplebutton.html example="foo" %}

{% endraw %}-->

{% include link-list.md %}
