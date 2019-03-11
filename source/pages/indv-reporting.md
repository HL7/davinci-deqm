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

Measure reporting scenarios include individual patient level quality reporting scenario (referred to as individual reporting) and summary level quality reporting scenario (referred to as summary reporting). This section provides guidance to the individual reporting scenario.

An individual patient level report contains quality data for one patient
for one or more Clinical Quality Measures (CQMs), where the data
elements in the report are defined by the particular CQMs being reported
on. The intent of "data-of-interest" is the source data (raw applicable
patient data) needed to calculate a CQM, as specified by the data
requirements of the measure. When pooled and analyzed, each report
contributes the quality data necessary to calculate population measure
metrics. For example, for a venous thromboembolism prophylaxis CQM, the
data-of-interest is the set of conditions, procedures, and observations
related to determining whether a patient is in the initial population,
denominator, denominator exclusions, and numerator of the CQM.

Individual reporting scenario is supported by the [DEQM Individual
MeasureReport
Profile](http://build.fhir.org/ig/HL7/davinci-deqm/StructureDefinition-datax-measurereport-deqm.html).
The MeasureReport.type element in this profile is set to "individual".
Transactions between Providers (organizations that deliver care to
patients, such as practices and hospitals) and Data "Aggregators"
(organizations that want to evaluate CQMs, such as quality reporting
programs) are triggered by specific administrative events such as the
submission of individual patient level quality reports for CQMs to
various quality reporting programs.

### Relationship of Measure and MeasureReport Resources
{:.no_toc}

The [Quality Reporting] Page in the R4 Release of the FHIR Specification
provides an overview of CQM structures, how CQMs are represented using
the Measure resource, and are reported using the MeasureReport resource.
The [Reporting Individual Data] section describes how to use a MeasureReport resource to represent the results of
an individual calculation, the MeasureReport SHALL have a
MeasureReport.type code of `individual` and SHALL have a reference to
a patient that is the subject of the report. In addition, the result
SHOULD include a references to the patient-specific resources that were used to calculate the result.

### Relationship between QI Core, DEQM, and CQMs
{:.no_toc}

As described in the Quality Measurement Standards Landscape section of this implementation guide, QI Core IG defines a set of FHIR profiles with extensions and bindings needed to create interoperable, quality-focused applications. For implementers that are familiar with the previous generation of standards that supports individual reporting---Quality Data Model (QDM), Clinical Quality Language (CQL), and the Quality Reporting Document Architecture Category I (QRDA Category I), QI Core profiles are equivalent to the Quality Data Model (QDM) that is used in the QDM-CQL-QRDA paradigm. The use of [DEQM Individual MeasureReport Profile](http://build.fhir.org/ig/HL7/davinci-deqm/StructureDefinition-datax-measurereport-deqm.html), along with relevant QI Core profiles, results in a bundle containing CQM information and detailed patient data to support calculations of those CQMs. This could be considered as similar to QRDA Category I in the QDM-CQL-QRDA paradigm that provides a framework, guidance, and necessary operations to support exchange of individual patient level quality report.

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

The recipient of the report may not have access to additional EHR data about an individual subject.  Therefore, it is important that the report includes all the data relevant to computing CQM criteria, as well as the other data defined in a CQM ( for example data for stratification, risk adjustment, etc). Data for every data element present in the EHR that is required by the referenced CQM, not just those needed to compute criteria, shall be included in the resulting MeasureReport bundle.

 At a minimum, the conclusive evidence needed to confirm that a criterion was met shall be included in the MeasureReport bundle created for that patient and for that CQM.  For instance, a record for a patient who has been in the Intensive Care Unit undergoing continuous blood pressure monitoring may have much more blood pressure observations than are needed to compute the criteria.

At the very least, an individual measure report should include:

-   For each data element in each referenced CQM, smoking gun data that offer confirmatory proof, where a patient has met the criterion.  For disjunctive criteria (i.e., where a criterion can be satisfied by one of multiple data elements) include minimal smoking gun data for at least one data element.

-   Stratification variables, supplemental data elements, risk adjustment variables, and any other data element specified in the referenced CQM(s)

A quality program supporting the individual reporting scenario will
often provide prescriptive guidelines that define additional data,
outside the smoking gun, that may or must be sent (such as the complete
problem or medication list). Where such prescriptive guidelines exist,
those take precedence over the more general guidance provided here.

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

## Profiles

The following resources are used in all individual reporting transactions.

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|

Depending on the specific Measure and Interaction, various DEQM and QI Core Profiles are used in addition to the profiles listed above.

## POST Data Operation

<br />

{% include link-list.md %}
