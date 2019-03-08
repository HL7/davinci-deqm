---
title: Individual Measure Reporting Interactions
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

Guidance -- Individual Reporting

## Introduction

In addition to the data exchange scenario, this implementation guide
also supports measure reporting scenarios. Measure reporting scenarios
include individual patient level quality reporting scenario (referred to
as individual reporting) and summary level quality reporting scenario
(referred to as summary reporting). This section provides guidance to
the individual reporting scenario.

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

[The Clinical Quality Framework (CQF) Implementation
Guide](http://hl7.org/fhir/STU3/cqif/cqif-quality-reporting.html)
provides an overview of CQM structures, how CQMs are represented using
the Measure resource, and are reported using the MeasureReport resource.
As indicated in the [Reporting Individual
Data](http://hl7.org/fhir/STU3/cqif/cqif-quality-reporting.html#reporting-individual-data)
section, when using a MeasureReport resource to represent the results of
an individual calculation, the MeasureReport SHALL have a
MeasureReport.type code of \"individual\" and SHALL have a reference to
a patient that is the subject of the report. In addition, the result
SHOULD include a reference to a Bundle containing the patient-specific
resources that were used to calculate the result.

### Relationship between QI Core, DEQM, and CQMs
{:.no_toc}

As described in the Quality Measurement Standards Landscape section of this implementation guide, QI Core IG defines a set of FHIR profiles with extensions and bindings needed to create interoperable, quality-focused applications. For implementers that are familiar with the previous generation of standards that supports individual reporting---Quality Data Model (QDM), Clinical Quality Language (CQL), and the Quality Reporting Document Architecture Category I (QRDA Category I), QI Core profiles are equivalent to the Quality Data Model (QDM) that is used in the QDM-CQL-QRDA paradigm. The use of [DEQM Individual MeasureReport Profile](http://build.fhir.org/ig/HL7/davinci-deqm/StructureDefinition-datax-measurereport-deqm.html), along with relevant QI Core profiles, results in a bundle containing CQM information and detailed patient data to support calculations of those CQMs. This could be considered as similar to QRDA Category I in the QDM-CQL-QRDA paradigm that provides a framework, guidance, and necessary operations to support exchange of individual patient level quality report.

## QI Core Based DEQM Individual Report Construction Rules

### How many DEQM Individual MeasureReport Should be Created?
{:.no_toc}
TODO

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

When the recipient of the instance has access to no other EHR data, it
is important that the instance include data elements relevant to
computing CQM criteria, as well as the other data elements defined in a
CQM---for stratification, for risk adjustment, etc. Every data element
present in the EHR that is required by the referenced CQM, not just
those needed to compute criteria, shall be included in the resulting
MeasureReport bundle.

The EHR may have more data than are relevant to the referenced CQM and
more data than are needed to compute the criteria. For instance, a
patient who has been in the Intensive Care Unit undergoing continuous
blood pressure monitoring will have reams of blood pressure
observations. At a minimum, the conclusive evidence needed to confirm
that a criterion was met shall be included in the MeasureReport bundle
created for that patient and for that CQM.

At the very least, an individual measure report should include:

-   For each data element in each referenced CQM, smoking gun data that
    > offer confirmatory proof, where a patient has met the
    > criterion---For disjunctive criteria (i.e., where a criterion can
    > be satisfied by one of multiple data elements) include minimal
    > smoking gun data for at least one data element.

-   Stratification variables, supplemental data elements, risk
    > adjustment variables, and any other data element specified in the
    > referenced CQM(s)

A quality program supporting the individual reporting scenario will
often provide prescriptive guidelines that define additional data,
outside the smoking gun, that may or must be sent (such as the complete
problem or medication list). Where such prescriptive guidelines exist,
those take precedence over the more general guidance provided here. In
other words, the "smoking gun" heuristic ensures that the minimum is
present in the individual measure report, and does not preclude
inclusion of additional data.

### What if There are No Data in the EHR?
{:.no_toc}

Not all data elements defined within the referenced CQM will be present
in the EHR for each patient for which an individual measure report is to
be sent. An individual measure report will not contain data elements
that aren\'t present in the source system. For instance, if a CQM has a
criterion "patient is in the Numerator if they have blue eyes" and the
patient doesn\'t have eye color captured in the source system, then the
corresponding measure report bundle will not contain an eye color
observation for that patient.

Whereas individual measure reporting scenario defines this consistent
approach to missing data, specifications of CQMs define the logical
processing of missing data (e.g., how to classify a patient into various
populations in the absence of an eye color observation). In other words,
the CQM addresses how it factors in missing data when calculating
criteria, and it is the job of the individual measure report to include
relevant data that was present in the EHR, and to not include data that
was missing from the EHR.

### Generating a QICore-Based Individual MeasureReport from a QICore-Based eCQM
{:.no_toc}

TODO

### Not Done with a Reason
{:.no_toc}
TODO

## Preconditions and Assumptions

-   The "Aggregator" may be a Payer or another organization that is
    monitoring various clinical quality measures for the members of a
    population.

-   The Measure resource is used to provide both human- and
    machine-readable definitions of a quality measure

-   The MeasureReport provides an association to a specific quality
    measure and links the submitted data together to simplify processing
    for the receiver.

-   The required data is represented in the referenced resources defined
    by the MeasureReport.

-   Aggregators and providers *should* both use a common clinical
    quallity language (CQL) that would allow the same measures to be
    applied in healthcare and at the aggregator. This would also enable
    the application of the same measures across populations that span
    multiple Aggregators (payers).

## Profiles

The following resources are used in the individual reporting scenario:

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|

## POST Data Operation

<br />

{% include link-list.md %}
