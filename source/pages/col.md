---
title: Colorectal Cancer Screening Use Case
layout: default
active: guidance
topofpage: true
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

##  Introduction

The colonoscopy measure (HEDIS Colorectal Cancer Screening/CMS130) is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening services during the measurement period.

    ...todo background ...

[NQF Measure Description for Colorectal Cancer Screening]

[HEDIS Measure Description for Colorectal Cancer Screening]

### Summary MRP Technical Workflow

The technical Workflow is outlined in the following figure.

    ...todo  WF figure and text ...

**Summary of FHIR Artifacts used for Medication Reconciliation**

### FHIR Resource Overview

#### Resources supported for this use case:
{:.no_toc}

    ....todo update this  ...

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|HEDIS MRP Observation Profile|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

### MRP FHIR Transactions:

#### Gather Data Requirements From Payer

     ....todo review if this is a step and update example....

In this optional step, the Provider queries the Payer("Aggregator") for which resources are needed for MRP measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

The required data for MRP is discovered by invoking the|[Data Requirements] operation on the payer's `Measure/measure-mrp` endpoint.

##### APIs
{:.no_toc}

These artifacts are used in this transaction:

1. Data Requirements: [$data-requirements (R4)] operation  (Note - the same operation is used for both version STU3 and R4 transaction)

##### Usage
{:.no_toc}

Using either the `GET` and `POST` Syntax the operation can be invoked as follows:

`GET|[base]/Measure/measure-mrp/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`
`POST|[base]/Measure/measure-mrp/$data-requirements`

{% include examplebutton.html example="measure-requirements-example" b_title = "Example Data Requirements operation" %}

---

#### OPTION 1: Submit Data to Payer

     ....todo review if this is a step and update example....


{% include img-narrow.html img="submit-mrp-data.jpg" caption="Submit data Operation" %}

##### Submit Data to a Payer's Measure endpoint
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence to provide the MRP attestation to the payer.  (Note that the Collect Data and Subscription Operations are not supported for this use case.)  For MRP the Provider may submit either a *Task* resource or an *Observation* resource as the primary resource used to evaluate the measure.

#### OPTION 2: Collect Data from Provider

     ....todo review if this is a step and update example....


#### OPTION 3: Subscribe for Notification when data is available

     ....todo review if this is a step and update example....

#### OPTION 4: CDS Hooks

     ....todo review if this is a step and update example....

### Graph of MRP resources:

     ...todo more document options and exclusions

**Options:**
1. For fecal occult blood adn FITDNA Testing:

{% include img-80.html img="DEQM Resource Diagram - COL1.svg" %}

1. For flexible sigmoidoscopy and colonoscopy:

{% include img-80.html img="DEQM Resource Diagram - COL2.svg" %}

1. For total colectomy which is an exclusion for the COL Measure:

 {% include img-80.html img="DEQM Resource Diagram - COL3.svg" %}

1. For COL Measure exclusions:

 {% include img-80.html img="DEQM Resource Diagram - COL4.svg" %}


{% include link-list.md %}
