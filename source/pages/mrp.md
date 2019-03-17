---
title: Medication Reconciliation Process
layout: default
active: guidance
topofpage: true
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

The Medication Reconciliation Use Case defines the process by which the MRP Measure data can be exchanged between a provider acting in the role of the Producer to a Payer which is acting in the role of the Consumer.  MRP Measure is an attestation that a medication reconciliation post-discharge was performed on a covered member. This use case covers both the request to send attestation information and the unsolicitated submission of that data.

## MRP Use Case Background

In the case of medication reconciliation after discharge from the hospital, the patient’s discharge medication(s) is compared with the medication(s) the patient was taking prior to hospitalization. This can avoid medication errors such as omissions, duplications, dosing errors or drug interactions, and should be done at every transition of care in which new medications are ordered or existing orders are rewritten.  This attestation message is intended to be performed by the next provider where the patient returns for follow-up and can then be used by the payer to show compliance for the HEDIS measure Medication Reconciliation Post-Discharge. (Any necessary documentation will also be put in the record)  

In the past, attestation to the reconciliation had been done by posting a CPT2 code on a claim typically for a small monetary amount that was then denied by the payer and had to be written off by the provider.  This is a cumbersome process and most providers are no longer doing this.

Proof of 30 day medication reconciliations is increasingly required for value based care incentives.  Providers and care coordinators face the challenge of collecting accurate and complete patient medication records across care settings. Today’s manual and ad hoc processes are costly and will not scale.  Payers and providers need common standards to share the data required to complete medication reconciliation at all transitions of care, for care management plans, and during medication changes.  Vendors are actively leveraging FHIR resources to improve partner’s access to patient medication history by unlocking existing silos of this critical data from vendor systems, healthcare operations systems and provider EHRs.

Note that the exchange of the reconciled medication list, indication of conversations with the patient, and notification of discharge from inpatient systems are out of scope for this version of the use case.

## FHIR Resource Overview

### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Library|CFQM Library Profile|[CFQM Library (STU3)]|[CFQM Library (R4)]|
|Measure|CQFM Measure Profile|[CFQM Measure (STU3)]|[CFQM Measure (R4)]|
|Data Exchange MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|HEDIS MRP Observation Profile[^8]|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile[^4]|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile[^4]|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile[^8]|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

## Graph of MRP resources:

For MRP either a *Task* resource or an *Observation* resource can be used as the primary resource for evaluating the measure.

{% include img.html img="mrp-task.jpg" caption="Option 1: MRP using Task" %}

{% include img.html img="mrp-observation.jpg" caption="Option 2: MRP using Observation" %}

## MRP Data Exchange Interactions

In the following interactions, the Provider is acting in the role of the *Producer* and the Payer("Aggregator") is acting in the role of the *Consumer*.

### Gather Data Requirements From Payer
{:.no_toc}

   In this optional step, the Provider queries the Payer("Aggregator") for which resources are needed for MRP measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

        {% include examplebutton.html example="data-requirements" b_title = "Click Here To See Example Data Requirements operation" %}

### Data Exchange Using The Submit Data Operation
{:.no_toc}

The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the Payer.  Note that the Collect Data and Subscription Operations are not supported for this use case.

The technical Workflow is outlined in the following figure.  The parts outlined in red are the actual FHIR transactions that are the focus of this Guide and are described in detail in the following sections:

{% include img-portrait.html img="MRP_Technical_Workflow.jpg" caption=" Technical Workflow" %}

{% include examplebutton.html example="submit-data-task" b_title = "Click Here To See Example Submit Data operation using Task option" %}

<!--
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->

{% include examplebutton.html example="submit-data-observation"  b_title = "Click Here To See Example Submit Data operation using Observation option" %}

## MRP Measure Reporting Interactions:

In the following interactions,  The Payer("Aggregator") is acting in the role of the *Reporter*.

### Individual MeasureReport

The Payer("Aggregator") pushes the Bundle of supporting resources with the MRP Individual MeasureReport Bundle to the Receiver.

{% include img-portrait.html img="mrp_indv_report.jpg" caption = "Technical Workflow" %}

{% include examplebutton.html example="mrp-indv-report-example1" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport using Task" %}

{% include examplebutton.html example="mrp-indv-report-example2" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport using Observation" %}

### Summary MeasureReport

The Payer("Aggregator") pushes the MRP Summary MeasureReport to the Receiver.

{% include img-portrait.html img="mrp_summ_report.jpg" caption = "Technical Workflow" %}

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See Example Post MRP Summary MeasureReport" %}

---

{% include link-list.md %}
