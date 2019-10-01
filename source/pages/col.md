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

The colonoscopy measure such as [HEDIS Colorectal Cancer Screening/CMS130] [^10] is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.

### COL Use Case Background

In the case of colorectal cancer screening, both tests to detect colorectal cancer and polyps and information that would exclude the patient from being required meet the measure are reported.  For background on methods used to screen people for colorectal cancer see [Colorectal Cancer Screening (PDQ®)-Patient Version], and for background on benefits of screening see [Colorectal Cancer Screening (PDQ®)–Health Professional Version] both published by the National Cancer Institute.

## FHIR Resource Overview



### Resources Supported for this Use Case
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition (STU3)]|[QI Core Condition (R4)]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport (STU3)]|[QI Core DiagnosticReport (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Library|CQFM Library Profile|[CQFM Library (STU3)]|[CQFM Library (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Measure|CQFM Measure Profile|[CQFM Measure (STU3)]|[CQFM Measure (R4)]|
|MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|QI Core Observation Profile|[QI Core Observation (STU3)]|[QI Core Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure (STU3)]|[QI Core Procedure (R4)]|

## Graph of COL Resources

For COL either an *Observation*, *DiagnosticReport*, *Condition*, or *Procedure* is the primary resource used to evaluate the measure. Below are listed the resource diagrams that meet each situation in the COL screening measure.  Note that overlapping boxes in the diagrams represents a choice of one or the resources.

### Option 1: MeasureReport Using Observation
{:.no_toc}

When certain laboratory results such as fecal occult blood (FOBT) and FIT-DNA are done in a specified time period, the patient has been screened for colorectal cancer.  The valueset binding (i.e., list of codes) in the measure will inform you as to which laboratory results qualify for meeting this measure.  The following resource graph diagram shows how a laboratory test to meet the screen measure would be represented using a DEQM Individual MeasureReport and its associated resources.

{% include img.html img="DEQM Resource Diagram - COL1.jpg" caption ="Figure 3-5 Measure Report Using Observation" %}

### Option 2: MeasureReport Using DiagnosticReport
{:.no_toc}

Another way a COL screening measure is met is when certain procedures such as flexible sigmoidoscopy and colonoscopy are performed and a report generated.  In FHIR, the report is represented by a DiagnosticReport.  The measure indicates what ValueSets/Codes can be used to report this measure. The following diagram shows how a procedure report to meet a screening measure would be represented in a DEQM Individual MeasureReport and its associated resources.


{% include img.html img="DEQM Resource Diagram - COL2.jpg" caption ="Figure 3-6 Measure Report Using DiagnosticReport" %}

### Option 3: MeasureReport Using Procedure
{:.no_toc}

There are often times exclusions in a screening measure.  An exclusion is something that removes the requirement for a screening measure.  For example, a total colectomy removes the requirement for Colorectal Cancer Screening.  As with the other options, the measure defines the valueset/codes that constitute a qualifying procedure.  The following diagram shows how you would use a DEQM Individual MeasureReport and its associated resources to report a procedure that represents an exclusion to the measure.

 {% include img.html img="DEQM Resource Diagram - COL3.jpg" caption ="Figure 3-7 Measure Report Using Procedure"%}

### Option 4: MeasureReport Using Condition
{:.no_toc}

 An additional way exclusions are met in the Colorectal Cancer Screening measure is with certain conditions such as colorectal cancer.  The valuesets/codes that allow for the patient not to be screened for colorectal cancer are specified in the measure.  The following MeasureReport diagram shows how you would use a DEQM Individual MeasureReport and its associated resources to represent a condition that represents an exclusion to the measure.


 {% include img.html img="DEQM Resource Diagram - COL4.jpg" caption ="Figure 3-8 Measure Report Using Condition"%}

## COL Data Exchange Interactions

In the following interactions, the Provider is acting in the role of the *Producer* and the Payer ("Aggregator") is acting in the role of the *Consumer*.

### Gather Data Requirements from Payer
{:.no_toc}

   In this optional step, the Provider queries the Payer ("Aggregator") for which resources are needed for COL measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

        {% include examplebutton.html example="col-requirements-example" b_title = "Click Here To See Example COL Data Requirements" %}

### Exchange of Quality Measure Data Options
{:.no_toc}

Note to Balloters: We are actively seeking input on the feasibility and interest in using *CDS Hooks* to report on Screening data.
{:.note-to-balloters}

#### Data Exchange Using the Submit Data Operation
{:.no_toc}
The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for Colorectal Cancer Screening to the payer.  

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv submit-data.jpg" caption = "Figure 3-9 Submit Data Technical Workflow" %}

{% include examplebutton.html example="col-submit-example" b_title = "Click Here To See Example COL Submit Data" %}

#### Data Exchange Using the Collect Data Operation
{:.no_toc}
 Payer/Aggregator retrieves Colorectal Cancer Screening Data from Provider using the Collect Data operation.  The Provider returns the MeasureReport and referenced resources as supporting evidence for Colorectal Cancer Screening.

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv collect-data.jpg" caption = "Figure 3-10 collect Data Technical Workflow" %}

{% include examplebutton.html example="col-collect-example" b_title = "Click Here To See Example COL Collect Data" %}

<!-- {%raw%}
#### Payer/Aggregator Subscribes for Notification when Data is Available
{:.no_toc}
Payer/Aggregator subscribes to the Provider for notification when Colorectal Cancer Screening data is available.  The Provider notifies the Aggregator when the data is available and Payer/Aggregator uses the Collect Data operations as described above to retrieve the data.

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange subscription.jpg" caption = "Figure 3-11 Subscription Technical Workflow" %}

{% include examplebutton.html example="subscribe-measure-example" b_title = "Click Here To See Example COL Subscription" %}

{%endraw%} -->

## COL Measure Reporting Interactions

In the following interactions, The Payer ("Aggregator") is acting in the role of the *Reporter*.

### Individual MeasureReport
{:.no_toc}

Payer in the role of the Reporter pushes the Bundle of supporting resource with COL Individual MeasureReport resource to the end user.

{% include img-portrait.html img="col_indv_report.jpg" caption = "Figure 3-12 Individual Reporting Technical Workflow" %}

{% include examplebutton.html example="col-indv-report-example" b_title = "Click Here To See Post Bundle with COL Individual MeasureReport" %}

### Summary MeasureReport
{:.no_toc}

Payer in the role of the Reporter posts the COL Summary MeasureReport to the Receiver

{% include img-portrait.html img="col_summ_report.jpg" caption = "Figure 3-13 Summary Reporting Technical Workflow" %}

{% include examplebutton.html example="col-summary-report-example" b_title = "Click Here To See Post COL Summary MeasureReport" %}

---

{% include link-list.md %}
