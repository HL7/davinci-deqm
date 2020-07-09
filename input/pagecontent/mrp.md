
*ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle. This example use case is not in scope for ballot comment.
{:.stu-note}

## Introduction

The Medication Reconciliation Use Case defines the process by which the MRP Measure data can be exchanged between a provider acting in the role of the Producer to a Payer which is acting in the role of the Consumer.  MRP Measure is an attestation that a medication reconciliation post-discharge was performed on a covered member. This use case covers both the request to send attestation information and the unsolicited submission of that data.

## MRP Use Case Background

In the case of medication reconciliation after discharge from the hospital, the patient’s discharge medication(s) is compared with the medication(s) the patient was taking prior to hospitalization. This can avoid medication errors such as omissions, duplications, dosing errors or drug interactions, and should be done at every transition of care in which new medications are ordered or existing orders are rewritten.  This attestation message is intended to be performed by the next provider where the patient returns for follow-up and can then be used by the payer to show compliance for the HEDIS measure Medication Reconciliation Post-Discharge. (Any necessary documentation will also be put in the record)  

In the past, attestation to the reconciliation had been done by posting a CPT Category II code on a claim typically for a small monetary amount that was then denied by the payer and had to be written off by the provider.  This is a cumbersome process and most providers are no longer doing this.

Proof of 30 day medication reconciliations is increasingly required for value based care incentives.  Providers and care coordinators face the challenge of collecting accurate and complete patient medication records across care settings. Today’s manual and ad hoc processes are costly and will not scale.  Payers and providers need common standards to share the data required to complete medication reconciliation at all transitions of care, for care management plans, and during medication changes.  Vendors are actively leveraging FHIR resources to improve partner’s access to patient medication history by unlocking existing silos of this critical data from vendor systems, healthcare operations systems and provider EHRs.

Note that the exchange of the reconciled medication list, indication of conversations with the patient, and notification of discharge from inpatient systems are out of scope for this version of the use case.

## FHIR Resource Overview

### Resources supported for this Use Case
{:.no_toc}

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Coverage|QI Core Coverage Profile|[QI Core Coverage]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter]|
|Location|QI Core Location Profile|[QI Core Location]|
|Library|CQFM Library Profile|[CQFM Library]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile]|
|Observation|QI Core Observation Profile|[QI Core Observation]|
|Organization|DEQM Organization Profile[^9]|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|
|Practitioner|DEQM Practitioner Profile[^9]|[DEQM Practitioner]|
|Task|QI Core Task Profile|[QI Core Task]|

## Graph of MRP Resources

For MRP either a *Task* resource or an *Observation* resource can be used as the primary resource for evaluating the measure. The *Task* resource is more appropriate to represent an administrative activity that can be performed and the state of completion of that activity tracked.  In the case where systems do not support *Task*, *Observation* can be used to track the status of the process.  The table below compares how the activity is represented

|Data element| Task | Observation|
|---|---|---|
|The activity|`Task.code`|`Observation.code`|
|The state of completion|`Task.status`|`Observation.valueBoolean`(= "true" for complete) + `Observation.status`|
{:.grid}

{% include img.html img="mrp-task.jpg" caption="Figure 3-1 MRP Using Task" %}

{% include img.html img="mrp-observation.jpg" caption="Figure 3-2 MRP Using Observation" %}

## MRP Data Exchange Interactions

In the following interactions, the Provider is acting in the role of the *Producer* and the Payer (“Aggregator”) is acting in the role of the *Consumer*.

### Gather Data Requirements from Payer
{:.no_toc}

   In this optional step, the Provider queries the Payer (“Aggregator”) for which resources are needed for MRP measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

        {% include examplebutton.html example="data-requirements-example" b_title = "Click Here To See Example Data Requirements operation" %}

### Data Exchange Using the Submit Data Operation
{:.no_toc}

The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the Payer.  Note that the Collect Data and Subscription Operations are not supported for this use case.

The technical Workflow is outlined in the following figure.  The parts outlined in orange are the actual FHIR transactions that are the focus of this Guide and are described in detail in the following sections:

{% include img-portrait.html img="MRP_Technical_Workflow.jpg" caption="Figure 3-3 Submit Data Technical Workflow" %}

{% include examplebutton.html example="submit-data-task" b_title = "Click Here To See Example Submit Data operation using Task option" %}

<!--
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->

{% include examplebutton.html example="submit-data-observation"  b_title = "Click Here To See Example Submit Data operation using Observation option" %}

## MRP Measure Reporting Interactions

In the following interactions,  The Payer ("Aggregator") is acting in the role of the *Reporter*.

### Individual MeasureReport

The Payer (“Aggregator”) pushes the Bundle of supporting resources with the MRP Individual MeasureReport Bundle to the Receiver.

{% include img-portrait.html img="mrp_indv_report.jpg" caption = "Figure 3-4 Individual Reporting Technical Workflow" %}

{% include examplebutton.html example="single-indv-mrp-task-report" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport using Task" %}

{% include examplebutton.html example="multiple-indv-mrp-task-report" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport for Multiple Patients using Task" %}

{% include examplebutton.html example="single-indv-mrp-obs-report" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport using Observation" %}

{% include examplebutton.html example="multiple-indv-mrp-obs-report" b_title = "Click Here To See Example Post Bundle with MRP Individual MeasureReport for Multiple Patients using Observation" %}

### Summary MeasureReport

The Payer (“Aggregator”) pushes the MRP Summary MeasureReport to the Receiver.

{% include img-portrait.html img="mrp_summ_report.jpg" caption = "Figure 3-5 Summary Reporting Technical Workflow" %}

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See Example Post MRP Summary MeasureReport" %}

---

{% include link-list.md %}
