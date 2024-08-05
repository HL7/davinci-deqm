

### Introduction

A summary report contains calculated summary data for one or more Clinical Quality Measures (CQMs) for a specified population of patients within a particular health system over a specific period of time. For example, a colorectal cancer screening CQM has patient counts for the initial population, denominator, denominator exclusions, and numerator respectively for a specified population of patients. Summary reports may also contain summary data for stratifier criteria (such as gender or age) as defined in a CQM.

The Summary reporting scenario is supported by the [DEQM Summary MeasureReport Profile]. Transactions between Reporters (for example, organizations that deliver care to patients, such as a practice or hospital) and Receivers (organizations that want to evaluate CQMs, such as quality reporting programs) are triggered by specific administrative events such as the submission of summary level quality reports for CQMs to various quality reporting programs.

### Relationship of Measure and MeasureReport Resources

The Quality Reporting Page in the R4 Release of the FHIR Specification provides an overview of CQM structures, how CQMs are represented using the Measure resource, and how CQMs are reported using the MeasureReport resource. The [Reporting Population Data]section describes how to use a MeasureReport resource to represent the results of a summary calculation, as well as how to use the $evaluate-measure operation to generate a summary MeasureReport from a Measure.

### Supplemental Data Resources in MeasureReport

The [supplementalData extension](http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-supplementalData) allows supplementalData to be included in the MeasureReport. For supplementalData that is a calculation, this will be a reference to an Observation containing the result of the supplementalData calculation. For supplementalData that is a resource, this will be a reference to the supplementalData resource. For supplementalData that is calculated only for the measure being reported the resource may be in a contained resource.

### Relationship between QI Core, DEQM, and CQMs
{: #qualityMeasurementStandardsLandscapeSummary}
<span class="bg-success"> As described in the [Quality Measurement Standards Landscape](index.html#quality-measurement-standards-landscape) section of this implementation guide, </span>the QI Core IG defines a set of FHIR profiles with extensions and bindings needed to create interoperable, quality-focused applications. For implementers that are familiar with the previous generation of standards that supports summary reporting---Quality Data Model (QDM), Clinical Quality Language (CQL), and the Quality Reporting Document Architecture Category III (QRDA Category III), QI Core profiles are equivalent to the Quality Data Model (QDM) and the DEQM Summary MeasureReport Profile is equivalent to the QRDA Category III in the QDM-CQL-QRDA paradigm.
### Default Profiles
The following resources are used in the summary reporting scenario:

|Resource Type| Profile Name                       |Link to Profile|
|---|------------------------------------|---|
|Measure| CQFM Measure Profile               |[CQFM Measure]|
|Summary MeasureReport| DEQM Summary MeasureReport Profile |[DEQM Summary MeasureReport Profile]|
|Organization| QICore Organization Profile        |[QI Core Organization] |

### Summary Measure Reporting
{: #summary-measure-reporting}
When the results of a quality measure are completed for a population at the end of a measurement period, they are POSTed to the quality measure Receiver's FHIR Server. The report may only consist of the Summary MeasureReport in which case it is POSTed to the MeasureReport endpoint.  If there are other referenced resources all the resources are bundled together as a set of `POST` interactions and sent as a single [transaction] interaction using the Standard FHIR API. Multiple summary results can be sent in a single FHIR Bundle as described [here](indv-reporting.html#individual-measure-reporting).  (Note that if the Bundle consist of only Summary MeasureReports, then a [collection] bundle is used.)

Posting a Summary Measure Report is typically a one time event, although there may be a need to amend or update a report or to report periodically based on the reporting program.  If the payload is a single Summary MeasureReport it is updated using the PUT or Delete transactions. Otherwise, the FHIR transaction bundle is used and **SHALL** contain only the new and updated DEQM and QI Core Profiles since the last transaction or those that need to be deleted. (`Bundle.request.method` = POST, PUT, or DELETE).

{% include img-narrow.html img="summ_report_post.jpg" caption="Figure 2-11 POST Summary Report" %}

#### Usage
{:.no_toc}

for a single MeasureReport:

`POST|[base]/MeasureReport`

for a Bundle Transaction:

`POST|[base]`

{% include error-note.md transaction = 'Summary Reporting' %}

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See POST summary Report Example" %}

for an example of a Summary MeasureReport with counts for multiple populations and stratifiers specified in an eCQM see the [Medicare Stratification Example].  For an example of a Bundle of multiple summary results see the [Bundle Multiple Summ Report].

<br />

{% include link-list.md %}
