
ONLY the new content for Gaps in Care is in the scope for ballot for the September, 2020 Ballot Cycle. This example use case is not in scope for ballot comment.
{:.note-to-balloters}

##  Introduction

The colonoscopy measure such as *HEDIS Colorectal Cancer Screening/CMS130*[^10] is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.

#### COL Use Case Background

In the case of colorectal cancer screening, two types of data are reported: 1) testing to detect colorectal cancer and polyps and 2)  information that would exclude the patient from needing testing.  For background on the clinical guideline that the measure was built off of see the [Colorectal Cancer Screening Recommendation Statement] published by the Electronic Clinical Quality Improvement (eCQI) Resource Center.

### FHIR Resource Overview



#### Resources Supported for this Use Case
{:.no_toc}

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter]|
|Library|CQFM Library Profile|[CQFM Library]|
|Location|QI Core Location Profile|[QI Core Location]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile]|
|Observation|QI Core Observation Profile|[QI Core Observation]|
|Organization|DEQM Organization Profile|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure]|

### Graph of COL Resources

For COL either an *Observation*, *DiagnosticReport*, *Condition*, or *Procedure* is the primary resource used to evaluate the measure. Below are listed the resource diagrams that meet each situation in the COL screening measure.  Note that overlapping boxes in the diagrams represents a choice of one or the resources.

#### Option 1: MeasureReport Using Observation
{:.no_toc}

When certain laboratory results such as fecal occult blood (FOBT) and FIT-DNA are done in a specified time period, the patient has been screened for colorectal cancer.  The valueset binding (i.e., list of codes) in the measure will inform you as to which laboratory results qualify for meeting this measure.  The following resource graph diagram shows how a laboratory test to meet the screen measure would be represented using a DEQM Individual MeasureReport and its associated resources.

{% include img.html img="DEQM Resource Diagram - COL1.jpg" caption ="Figure 3-5 Measure Report Using Observation" %}

#### Option 2: MeasureReport Using DiagnosticReport
{:.no_toc}

Another way a COL screening measure is met is when certain procedures such as flexible sigmoidoscopy and colonoscopy are performed and a report generated.  In FHIR, the report is represented by a DiagnosticReport.  The measure indicates what ValueSets/Codes can be used to report this measure. The following diagram shows how a procedure report to meet a screening measure would be represented in a DEQM Individual MeasureReport and its associated resources.


{% include img.html img="DEQM Resource Diagram - COL2.jpg" caption ="Figure 3-6 Measure Report Using DiagnosticReport" %}

#### Option 3: MeasureReport Using Procedure
{:.no_toc}

There are often times exclusions in a screening measure.  An exclusion is something that removes the requirement for a screening measure.  For example, a total colectomy removes the requirement for Colorectal Cancer Screening.  As with the other options, the measure defines the valueset/codes that constitute a qualifying procedure.  The following diagram shows how you would use a DEQM Individual MeasureReport and its associated resources to report a procedure that represents an exclusion to the measure.

 {% include img.html img="DEQM Resource Diagram - COL3.jpg" caption ="Figure 3-7 Measure Report Using Procedure"%}

#### Option 4: MeasureReport Using Condition
{:.no_toc}

 An additional way exclusions are met in the Colorectal Cancer Screening measure is with certain conditions such as colorectal cancer.  The valuesets/codes that allow for the patient not to be screened for colorectal cancer are specified in the measure.  The following MeasureReport diagram shows how you would use a DEQM Individual MeasureReport and its associated resources to represent a condition that represents an exclusion to the measure.


 {% include img.html img="DEQM Resource Diagram - COL4.jpg" caption ="Figure 3-8 Measure Report Using Condition"%}

### COL Data Exchange Interactions

In the following interactions, the Provider is acting in the role of the *Producer* and the Payer ("Aggregator") is acting in the role of the *Consumer*.

#### Gather Data Requirements from Payer {#data-requirements}
{:.no_toc}

   In this optional step, the Provider queries the Payer ("Aggregator") for which resources are needed for COL measure reporting.  Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

        {% include examplebutton.html example="col-requirements-example" b_title = "Click Here To See Example COL Data Requirements" %}

#### Exchange of Quality Measure Data Options
{:.no_toc}

We are seeking input on the feasibility and interest in using *CDS Hooks* to report on Screening data.
{:.stu-note}

##### Data Exchange Using the Submit Data Operation {#submit-data}
{:.no_toc}
The Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for Colorectal Cancer Screening to the payer.  

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv submit-data.jpg" caption = "Figure 3-9 Submit Data Technical Workflow" %}

{% include examplebutton.html example="col-submit-example" b_title = "Click Here To See Example COL Submit Data" %}

##### Data Exchange Using the Collect Data Operation  {#collect-data}
{:.no_toc}
 Payer/Aggregator retrieves Colorectal Cancer Screening Data from Provider using the Collect Data operation.  The Provider returns the MeasureReport and referenced resources as supporting evidence for Colorectal Cancer Screening.

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange Indiv collect-data.jpg" caption = "Figure 3-10 collect Data Technical Workflow" %}

{% include examplebutton.html example="col-collect-example" b_title = "Click Here To See Example COL Collect Data" %}

<!-- {%raw%}
##### Payer/Aggregator Subscribes for Notification when Data is Available
{:.no_toc}
Payer/Aggregator subscribes to the Provider for notification when Colorectal Cancer Screening data is available.  The Provider notifies the Aggregator when the data is available and Payer/Aggregator uses the Collect Data operations as described above to retrieve the data.

{% include img-portrait.html img="COL Worklow Diagram - Data Exchange subscription.jpg" caption = "Figure 3-11 Subscription Technical Workflow" %}

{% include examplebutton.html example="subscribe-measure-example" b_title = "Click Here To See Example COL Subscription" %}

{%endraw%} -->

### COL Measure Reporting Interactions

In the following interactions, The Payer ("Aggregator") is acting in the role of the *Reporter*.

#### Individual MeasureReport
{:.no_toc}

Payer in the role of the Reporter pushes the Bundle of supporting resource with COL Individual MeasureReport resource to the end user.

{% include img-portrait.html img="col_indv_report.jpg" caption = "Figure 3-12 Individual Reporting Technical Workflow" %}

{% include examplebutton.html example="col-indv-report-example" b_title = "Click Here To See Post Bundle with COL Individual MeasureReport" %}

#### Summary MeasureReport
{:.no_toc}

Payer in the role of the Reporter posts the COL Summary MeasureReport to the Receiver

{% include img-portrait.html img="col_summ_report.jpg" caption = "Figure 3-13 Summary Reporting Technical Workflow" %}

{% include examplebutton.html example="col-summary-report-example" b_title = "Click Here To See Post COL Summary MeasureReport" %}

---

{% include link-list.md %}
