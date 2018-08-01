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

The MRP Use Case fulfils the following HEDIS Measure...

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
|Measure|HEDIS MRP Measure Profile|[HEDIS MRP Measure (STU3)]|[HEDIS MRP Measure (R4)]|
|MeasureReport|DEQM MeasureReport Profile|[DEQM MeasureReport (STU3)]|[DEQM MeasureReport (R4)]|
|Observation|HEDIS MRP Observation Profile|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

<!--
|Resource|Argo DSTU2|US Core STU3|Argonaut/USCore R4|
|---|---|---|---|
|Patient|Y|Y|Pending  publication of R4|
|Practitioner|Y|Y|Pending  publication of R4|
|Organization|Y|Y|Pending  publication of R4|
|Location|N|Y|Pending  publication of R4|
|PractionerRole|N|Y|Pending  publication of R4|
|Procedure|Y|Y|Pending  publication of R4|
|Coverage|N|N|No Plans|
|Observation|Y ( as vitals, lab results, smoking|Y ( as vitals, lab results, smoking|Pending  publication of R4|
|Task|N|N|No Plans|

-->

## MRP FHIR Transactions:

{% include img.html img="mrp-wf-overview.jpg" caption="MRP FHIR transactions" %}

### Gather Data Requirements From Payer


In this optional step, the payer queries the payer for the which resources are needed for MRP measure reporting.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

The required data for each Measure is discovered by invoking the|[Data Requirements] operation on the payer's `Measure/measure-mrp` endpoint.

#### APIs
{:.no_toc}

These artifacts are used in this transaction:

[Data Requirements] operation

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

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the payer.  For the MRP use the provider may submit either a *Task* resource or an *Observation* resource as the primary resource used to evaluate the measure.

#### Graph of MRP resources for this option:
{:.no_toc}

{% include img.html img="mrp-task.jpg" caption="Option 1: MRP using Task" %}

{% include img.html img="mrp-observation.jpg" caption="Option 2: MRP using Observation" %}

#### APIs
{:.no_toc}

These artifacts are used in this transaction:

1. [Submit Data] operation
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


{% include examplebutton.html example="submit-data-observation"  b_title = "Example Submit Data operation using Operation option" %}

<!-- >[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)
-->

---
<!--{% raw %}

### Usage

example how to use a button to expand an inline example....

{% include examplebutton.html example="foo" %}

{% endraw %}-->

{% include link-list.md %}
