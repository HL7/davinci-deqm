---
title: Individual Measure Reporting Interactions
layout: default
active: guidance
topofpage: true
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

An individual patient level report contains quality data for one patient for one or more Clinical Quality Measures (CQMs).  The [data of interest] is the source data (raw applicable patient data) needed to calculate a CQM.  The data elements in the report are defined by the particular CQM being reported on.   When pooled and analyzed, each report contributes the quality data necessary to calculate population measure metrics.

The Individual reporting scenario is supported by the [DEQM Individual MeasureReport Profile]. Transactions between Reporters (for example, an organizations that deliver care to patients, such as a practice or hospital) and Receivers (organizations that want to evaluate CQMs, such as quality reporting programs) are triggered by specific administrative events such as the submission of individual patient level quality reports for CQMs to various quality reporting programs.

### Relationship of Measure and MeasureReport Resources
{:.no_toc}

The [Quality Reporting] Page in the R4 Release of the FHIR Specification provides an overview of CQM structures, how CQMs are represented using the Measure resource, and how CQMs are reported using the MeasureReport resource. The [Reporting Individual Data] section describes how to use a MeasureReport resource to represent the results of an individual calculation.

### Relationship between QI Core, DEQM, and CQMs
{:.no_toc}

As described in the Quality Measurement Standards Landscape section of this implementation guide, the QI Core IG defines a set of FHIR profiles with extensions and bindings needed to create interoperable, quality-focused applications. For implementers that are familiar with the previous generation of standards that supports individual reporting---Quality Data Model (QDM), Clinical Quality Language (CQL), and the Quality Reporting Document Architecture Category I (QRDA Category I), QI Core profiles are equivalent to the Quality Data Model (QDM) that is used in the QDM-CQL-QRDA paradigm. The collection of resources consisting of the DEQM Individual MeasureReport Profile and the relevant QI Core and DEQM profiles representing the detailed patient data to support calculations of those CQMs is similar to the QRDA Category I in the QDM-CQL-QRDA paradigm.

## Constructing an Individual Report

### Generate a DEQM Individual MeasureReport for Which Patients
{:.no_toc}

Some quality programs may require that individual measure report be
submitted for only those CQMs for which the corresponding Initial
Population (IPOP) criteria have been met. Other quality programs may
require individual reports be sent to reference a pre-negotiated set of
measures. An individual measure report should be created for each
patient meeting the Initial Population criteria of a CQM. No individual
measure report should be created for patients that fail to meet any of
the initial population criteria.

Often times, a quality program implementing DEQM Individual
MeasureReport will provide prescriptive guidelines that define the exact
rules for which CQMs to reference individual MeasureReport instance or
the exact triggers for sending an individual MeasureReport. Where such
prescriptive guidelines exist, they take precedence over the more
general guidance provided here.

### How Much Data Should be Sent
{:.no_toc}

In general, reporting assumes that Reporters know what measures they select in order to meet their reporting requirements.
A quality program supporting the individual reporting scenario will
often provide prescriptive guidelines that define additional data,
outside the smoking gun, that may or must be sent (such as the complete
problem or medication list). Where such prescriptive guidelines exist,
those take precedence over the more general guidance provided here.

The recipient of the report may not have access to additional EHR data about an individual subject.  Therefore, it is important that the report includes all the data relevant to computing CQM criteria, as well as the other data defined in a CQM (for example, data for stratification, risk adjustment, etc). Data for every data element present in the EHR that is required by the referenced CQM shall be included in the resulting MeasureReport bundle.  Additional non-clinical data needed for reporting such as organization, location and submitter is also be reported.

At the very least, an individual measure report should include:

-  For each data element in each referenced CQM, smoking gun data that offer confirmatory proof, where a patient has met the criterion.  For disjunctive criteria (i.e., where a criterion can be satisfied by one of multiple data elements) include minimal smoking gun data for at least one data element.

-  Stratification variables, supplemental data elements, risk adjustment variables, and any other data element specified in the referenced CQM(s)

- The conclusive evidence needed to confirm that a criterion was met for that CQM.  For instance, a record for a patient who has been in the Intensive Care Unit undergoing continuous blood pressure monitoring may have much more blood pressure observations than are needed to compute the criteria.

### Missing Data
{:.no_toc}

Not all data elements defined within the referenced CQM will always be present in the EHR for each patient for which an individual measure report is to be sent. Therefore,  an individual measure report will not contain data for these data elements.  For example, if a CQM has a criterion for "blue eyed patients" and the source system does not capture eye color, then the corresponding report for that patient will missing that observation.

Whereas individual measure reporting scenario defines this consistent
approach to missing data, specifications of CQMs define the logical
processing of missing data (e.g., how to classify a patient into various
populations in the absence of an eye color observation). In other words,
the CQM addresses how it factors in missing data when calculating
criteria, and it is the job of the individual measure report to include
relevant data that was present in the EHR, and to not include data that
was missing from the EHR.

{:.no_toc}

## Profiles

The following resources are used in all individual reporting transactions.

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
|Organization|DEQM Organization Profile|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|

Depending on the specific Measure and Interaction, various DEQM and QI Core Profiles are used in addition to the profiles listed above.

## Individual Measure Reporting

When the results of a CQM are completed they are POSTed to the quality measure Receiver's FHIR Server. The Individual MeasureReport(s) and all the referenced resources are bundled together as a set of `POST` interactions and sent as a single [transaction] interaction using the Standard FHIR API.

Note that Multiple individual reports either for the same or multiple patient for the same or multiple CQMs can be sent in a single transaction as described below by packaging them all together in a single FHIR Bundle.  Since each referenced resource is represented only once in the Bundle even though it may be referenced by multiple times, this may reduce the reporting overhead for the Reporter when compared to reporting each individual report separately. (See the FHIR specification for more information about using [Bundles] and resolving references in Bundles)

{% include img-narrow.html  img="indv_report_post.jpg" caption="Figure 2-10 POST Individual Report" %}

### Usage
{:.no_toc}

`POST|[base]`

{% include examplebutton.html example="post-indv-report-example" b_title = "Click Here To See Example POST Individual Report (edited for brevity)" %}

For a complete un-edited examples for both *single* and *multiple* patients see the [MRP Individual MeasureReport], [COL Individual MeasureReport], and [VTE Individual MeasureReport] examples.

<br />

{% include link-list.md %}
