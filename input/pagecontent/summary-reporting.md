

### Introduction

A summary report contains calculated summary data for one or more Clinical Quality Measures (CQMs) for a specified population of patients within a particular health system over a specific period of time. For example, a colorectal cancer screening CQM has patient counts for the initial population, denominator, denominator exclusions, and numerator respectively for a specified population of patients. Summary reports may also contain summary data for stratifier criteria (such as gender or age) as defined in a CQM.

The Summary reporting scenario is supported by the [DEQM Summary MeasureReport Profile]. Transactions between Reporters (for example, organizations that deliver care to patients, such as a practice or hospital) and Receivers (organizations that want to evaluate CQMs, such as quality reporting programs) are triggered by specific administrative events such as the submission of summary level quality reports for CQMs to various quality reporting programs.

### Relationship of Measure and MeasureReport Resources

The [Quality Reporting] Page in the R4 Release of the FHIR Specification provides an overview of CQM structures, how CQMs are represented using the Measure resource, and how CQMs are reported using the MeasureReport resource. The [Reporting Individual Data] section describes how to use a MeasureReport resource to represent the results of an individual calculation, as well as how to use the [$evaluate-measure](https://hl7.org/fhir/R4/operation-measure-evaluate-measure.html) operation to generate an individual MeasureReport from a Measure.

As the quality reporting implementation guides have evolved, implementation feedback has informed the base FHIR specification, resulting in changes to the Measure and MeasureReport resources, as well as the reporting operations. As a result, the profiles and operations in this implementation guide are aligned with the direction of changes in the base specification, including changes published in R5, and changes that will be published as part of R6. In particular, the change to always specify calculation elements on all groups, instead of at the root, as well as the use of the new [$evaluate](OperationDefinition-evaluate.html) operation, and deprecation of the $evaluate-measure operation, are all aligned with what will be published in R6.

### DEQM Summary Resource Diagram

The following diagram shows the relationships of resources required for summary reporting. Depending on the specific Measure and interaction being performed, additional DEQM profiles and resources may also be required beyond those listed above.

{% include img-narrow.html img="summary_resource_diagram.jpg" caption="Figure 2-25 Summary Resource Diagram" %}

### Supplemental Data Resources in MeasureReport

The [supplementalData extension](https://hl7.org/fhir/R5/measurereport-definitions.html#MeasureReport.supplementalData) allows supplementalData to be included in the MeasureReport. For supplementalData that is a calculation, this will be a reference to an Observation containing the result of the supplementalData calculation. For supplementalData that is a resource, this will be a reference to the supplementalData resource. For supplementalData that is calculated only for the measure being reported the resource may be in a contained resource.

### Summary Measure Reporting
{: #summary-measure-reporting}
When the results of a quality measure are completed for a population at the end of a measurement period, they are POSTed to the quality measure Receiver's FHIR Server. The report may only consist of the Summary MeasureReport in which case it is POSTed to the MeasureReport endpoint.  If there are other referenced resources all the resources are bundled together as a set of `POST` interactions and sent as a single [transaction] interaction using the Standard FHIR API. Multiple summary results can be sent in a single FHIR Bundle as described [here](indv-reporting.html#individual-measure-reporting).  (Note that if the Bundle consist of only Summary MeasureReports, then a [collection] bundle is used.)

In order to support real-world implementations where:

-  External producers submit summary MeasureReport resources for multiple providers in a single bundle.

-  FHIR servers often act as facade layers over existing APIs (e.g., Measurement  /api/submissions/measurements) that perform individual POST/PUT operations atomically.

-  In scenarios where the FHIR layer interacts directly with the database, supporting true bundle-level atomicity (e.g., 500+ entries) often requires pessimistic locking of rows or tables, increasing the risk of contention and deadlocks.

All systems **SHALL** support one of "batch" or "transaction", and that the server **SHALL** declare its support in the capability statement for these Bundle transaction types.

Posting a Summary Measure Report is typically a one time event, although there may be a need to amend or update a report or to report periodically based on the reporting program.  If the payload is a single Summary MeasureReport it is updated using the PUT or Delete transactions. Otherwise, the FHIR transaction bundle is used and **SHALL** contain only the new and updated DEQM and QI-Core Profiles since the last transaction or those that need to be deleted. (`Bundle.request.method` = POST, PUT, or DELETE).

{% include img-narrow.html img="summ_report_post.jpg" caption="Figure 2-11 POST Summary Report" %}

#### Usage
{:.no_toc}

for a single MeasureReport:

`POST|[base]/MeasureReport`

for a Bundle Transaction:

`POST|[base]`

{% include error-note.md transaction = 'Summary Reporting' %}

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See POST summary Report Example" %}

for an example of a Summary MeasureReport with counts for multiple populations and stratifiers specified in a quality measure see the [Medicare Stratification Example].  For an example of a Bundle of multiple summary results see the [Bundle Multiple Summ Report].

<br />

{% include link-list.md %}
