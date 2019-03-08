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

The colonoscopy measure ([HEDIS Colorectal Cancer Screening/CMS130]) is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening services during the measurement period.

[HEDIS Measure Description for Colorectal Cancer Screening]

## FHIR Resource Overview

### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition (STU3)]|[QI Core Condition (R4)]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport (STU3)]|[QI Core DiagnosticReport (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Library|CFQM Library Profile|[CFQM Library (STU3)]|[CFQM Library (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Measure|CFQM Measure Profile|[CFQM Measure (STU3)]|[CFQM Measure (R4)]|
|Data Exchange MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|QI Core Observation Profile|[QI Core Observation (STU3)]|[QI Core Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure (STU3)]|[QI Core Procedure (R4)]|

## Graph of COL Resources:

In a screening measure, you report both what is done that meets the screening requirement as well as information that would exclude the patient from being required to meet the measure.

For COL either an *Observation*, *DiagnosticReport*, *Condition*, or *Procedure* is the primary resource used to evaluate the measure. Below are listed the resource diagrams that meet each situation in the COL screening measure.  

### Option 1: Measure Report Using Observation
{:.no_toc}

When certain laboratory results are done in a specified time period, the patient has been screened for colorectal cancer.  The valueset binding (i.e., list of codes) in the measure will inform you as to which laboratory results qualify for meeting this measure.  Below is the data structure for what would be included with a DEQM Individual Measure Report when the patient has had a laboratory test to meet the screen measure.

{% include img.html img="DEQM Resource Diagram - COL1.jpg" %}

### Option 2:MeasureReport using DiagnosticReport
{:.no_toc}

Another way a COL screening measure is met is when certain procedures are performed and a report generated.  In FHIR, the report is represented by a DiagnosticReport.  The measure indicates what ValueSets/Codes can be used to report this measure. The following diagram shows how that would be represented in a DEQM Individual MeasureReport with associated resources.


{% include img.html img="DEQM Resource Diagram - COL2.jpg" %}

### Option 3: MeasureReport using Procedure
{:.no_toc}

There are often times exclusions in a screening measure.  An exclusion is something that removes the requirement for a screening measure.  For example, a certain procedure removes the requirement for Colorectal Cancer Screening.  As with the other options, the measure defines the valueset/codes that constitute a qualifying procedure.  The following diagram shows how you would use a DEQM Individual MeasureReport and associated resources to report a procedure.

 {% include img.html img="DEQM Resource Diagram - COL3.jpg" %}

### Option 4: MeasureReport using Condition
{:.no_toc}

 An additional way exclusions are met in the Colorectal Cancer Screening measure is with certain conditions.  The valuesets/codes that allow for the patient not to be screened for colorectal cancer are specified in the measure.  The following MeasureReport diagram shows the related resources that can be used to represent when you need to send a Condition that represents an exclusion to the measure.


 {% include img.html img="DEQM Resource Diagram - COL4.jpg" %}

## COL Data Exchange Interactions

### Gather Data Requirements From Payer (TODO link)
{:.no_toc}

{  % include examplebutton.html example=col-requirements-example" b_title = "Example COL Data Requirements" % }

### Exchange of Quality Measure Data Options (TODO link)
{:.no_toc}

Note to Balloters: We are actively seeking input on the feasibility and interest in using *CDS Hooks* to report on Screening data.
{:.note-to-balloters}

#### Data Exchange Using The Submit Data Operation**
{:.no_toc}
The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for Colorectal Cancer Screening to the payer.  

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv submit-data.jpg" caption = "Technical Workflow" %}

{ % include examplebutton.html example=col-submit-example" b_title = "Example COL Submit Data" % }

#### Data Exchange Using The Collect Data Operation**
{:.no_toc}
 Payer/Aggregator retrieves for Colorectal Cancer Screening Data from Provider using the Collect Data operation.  The Provider returns the MeasureReport and referenced resources as supporting evidence for Colorectal Cancer Screening.

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv collect-data.jpg" caption = "Technical Workflow" %}

{  % include examplebutton.html example=col-collect-example" b_title = "Example COL Collect Data" % }

#### Payer/Aggregator Subscribes for Notification when data is available**
{:.no_toc}
Payer/Aggregator subscribes to the Provider for notification when Colorectal Cancer Screening data is available.  The Provider notifies the Aggregator when the data is available and Payer/Aggregator uses the Collect Data operations as described above to retrieve the data.

{ % include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv subscribe.jpg" caption = "Technical Workflow" % }

{  % include examplebutton.html example=col-subscription-example" b_title = "Example COL Subscription" % }

## COL Measure Reporting Interactions:

### Individual MeasureReport
{:.no_toc}

Aggregator pushed the Bundle of supporting resource with COL Individual MeasureReport Bundle to the end user.

{ % include img-portrait.html img="COL Worklow Diagram - Data Exchange Indv report.jpg" caption = "Technical Workflow" % }


{  % include examplebutton.html example=col-indv-report-example" b_title = "Post Bundle with COL Individual MeasureReport" % }

### Summary MeasureReport
{:.no_toc}

Aggregator pushed the Bundle of supporting resource with COL Individual MeasureReport Bundle to the end user.

{ % include img-portrait.html img="COL Worklow Diagram - Data Exchange Summ report.jpg" caption = "Technical Workflow" % }

{  % include examplebutton.html example=col-summary-report-example" b_title = "Post COL Summary MeasureReport" % }

---

{% include link-list.md %}
