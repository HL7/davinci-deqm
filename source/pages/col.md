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

### Summary COL Technical Workflow

The technical Workflow is outlined in the following figure.

    ...todo  WF figure and text ...

**Summary of FHIR Artifacts used for Medication Reconciliation**

### FHIR Resource Overview

#### Resources supported for this use case:
{:.no_toc}

    ....todo ...
    DEQM Individual Measure Report  do we need Summary measure report too?
    QI Core Measure (Bryn is that right or will one be profiled under QI Measure IG?)  is it  DEQM ? or QI Core ?
    QI Core Observation is it  Hedis COL ? or HEDIS or QI Core ?
    QI Core Coverage  is it QI Core coverage or DEQM Coverage?
    Using Task?
    Change all HEDIS MRP to HEDIS COL?

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition (STU3)]|[QI Core Condition (R4)]|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport (STU3)]|[QI Core DiagnosticReport (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|HEDIS MRP Observation Profile|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure (STU3)]|[QI Core Procedure (R4)]|
|Task|HEDIS MRP Task Profile|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|


### Graph of COL resources:

In a screening measure, you report both what is done that meets the screening requirement as well as information that would exclude the patient from being required to meet the measure.

Below are listed the resource diagrams that meet each situation in the COL screening measure.


#### Option 1: Measure Report Using Observation
{:.no_toc}

When certain laboratory results are done in a specified time period, the patient has been screened for colorectal cancer.  The valueset binding (i.e., list of codes) in the measure will inform you as to which laboratory results qualify for meeting this measure.  Below is the data structure for what would be included with a DEQM Individual Measure Report when the patient has had a laboratory test to meet the screen measure.

{% include img.html img="DEQM Resource Diagram - COL1.jpg" %}

#### Option 2:MeasureReport using DiagnosticReport
{:.no_toc}

Another way a COL screening measure is met is when certain procedures are performed and a report generated.  In FHIR, the report is represented by a DiagnosticReport.  The measure indicates what ValueSets/Codes can be used to report this meaure. The following diagram shows how that would be represented in a DEQM Individual MeasureReport with associated resources.


{% include img.html img="DEQM Resource Diagram - COL2.jpg" %}

#### Option 3: MeasureReport using Procedure
{:.no_toc}

There are often times exclusions in a screening measure.  An exclusion is something that removes the requirement for a screening measure.  For example, a certain procedure removes the requirement for Colorectal Cancer Screening.  As with the other options, the measure defines the valueset/codes that constitute a qualifying procedure.  The following diagram shows how you would use a DEQM Individual MeasureReport and associated resources to report a procedure.

 {% include img.html img="DEQM Resource Diagram - COL3.jpg" %}

#### Option 4: MeasureReport using Condition
 {:.no_toc}

 An additional way exclusions are met in the Colorectal Cancer Screening measure is with certain conditions.  The valuesets/codes that allow for the patient not to be screened for colorectal cancer are specified in the measure.  The following MeasureReport diagram shows the related resources that can be used to represent when you need to send a Condition that represents an exclusion to the measure.


 {% include img.html img="DEQM Resource Diagram - COL4.jpg" %}


### COL FHIR Transactions:

#### Gather Data Requirements From Payer
{:.no_toc}

    ....todo review if this is a step and update example....

In this optional step, the Provider queries the Payer("Aggregator") for which resources are needed for COL measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

The required data for COL is discovered by invoking the|[Data Requirements] operation on the payer's `Measure/measure-mrp` endpoint.

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
{:.no_toc}
    ....todo review if this is a step and update example....


{% include img-narrow.html img="submit-mrp-data.jpg" caption="Submit data Operation" %}

##### Submit Data to a Payer's Measure endpoint
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for Colorectal Cancer Screening to the payer.  For COL the Provider may submit either an *Observation*, *DiagnosticReport*, *Condition*, or *Procedure as the primary resource used to evaluate the measure.

#### OPTION 2: Collect Data from Provider
{:.no_toc}
    ....todo review if this is a step and update example....


#### OPTION 3: Subscribe for Notification when data is available
{:.no_toc}
    ....todo review if this is a step and update example....


#### OPTION 4: CDS Hooks
{:.no_toc}

    Note to Balloters if there is a use case for using CDS Hooks to report the COL Measure



{% include link-list.md %}
