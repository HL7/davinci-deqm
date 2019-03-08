---
title: General Guidance and Definitions
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

## Introduction

Clinical Quality Measures are a common tool used throughout healthcare to help evaluate and understand the impact and quality of the care being provided to an individual or population.

The Data Exchange for Quality Measure (DEQM) Implementation Guide defines the interactions for two purposes in the Quality Measure Ecosystem.  The first interaction is when a producer, such as a practitioner, or owner of data needs to exchange that data with a consumer of that data, such as a payer, a registry or public health.  We call this the [Data Exchange Scenario]. Examples of this interaction might be when a provider has patient information from a recent visit that he needs to share with a payer under a value based contract.

The second scenario defined in this guide is when a measure report needs to be exchanged with another entity. FHIR allows for three possible types of reports that can be shared - the [Individual Measure Report], the [Summary Report] and the Subject-List Report.  This guide addresses the Individual Measure Report and the Summary Report.  Reviewers are asked to comment if a Subject-List Report would be useful.  Examples of these reports are Individual Measure Reports that are used by hospitals to report a measure and Summary Reports that could be given to a payer on their yearly eCQM results for specific measures.

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

## DEQM MeasureReport Profiles:

The MeasureReport resource is used as an organizer for both the data exchange scenario and for measure reporting scenario. To meet the different needs in these scenarios, DEQM has created 3 profiles on the MeasureReport resource.

### Data Exchange

When a data producer needs to send data to a data consumer, they use the
[DEQM Data-Exchange MeasureReport Profile]. Along with the MeasureReport profile, the data producer sends the Organization, Patient and any relevant resources for the measure they have produced data on. When a data producer, such as a practitioner,  sends a MeasureReport bundle, they may not have all the data that is required to calculate the measure report. One example might be because the measure requires outcome data from at a later point in time during the measurement period. Another example where the data producer may not have all the data would be continuous coverage period as the producer of the data may know the patient was covered on the day the patient was seen, the aggregator, in this case the payer, is the owner/"source of truth" for knowing all coverage information.  And therefore only the aggregator could determine if the continuous coverage period requirement is met.  Data Exchange is used to get the data from the producer to a consumer of the data.  This consumer might be a system that calculates the measure report but they could also be an aggregator who sends that data on to another system to do measure calculation and reporting.

### Measure Reporting

Measure Reporting is done by an aggregators who has all of the data that is required to generate a report(s). Two profiles for measure reporting are being defined in this guide.

The [DEQM Individual MeasureReport Profile] is used when a measure is reported an aggregator for one specific patient. It contains all of the data that is relevant to generate the report including the measure outcome and is similar to a [QRDA Category 1 report].  In addition to the MeasureReport, the report would be collected in a Bundle with the Organization, Patient and any other resources that were used to calculate this measure.

The [DEQM Summary MeasureReport Profile] is used when a measure is reported an aggregator for  for a group of patients. It contains all of the data that is relevant to generate the report including the measure outcome and is similar to a [QRDA Category 3 report].  Unlike the [DEQM Individual MeasureReport Profile], the report is typically transacted as a single MeasureReport report.

While there are several differences among these profiles, you can determine the profile can be determined by the meta profile tag or by the `type` element as described above.  
FHIR allows for a fourth type of MeasureReport, subject-list. This would be similar to what was proposed to be a [QRDA Category 2 report].  However, this level of measure reporting is out of scope for this version of the Implementation Guide. Reviewers are asked to comment if they believe there is a need for this profile in future versions of this IG.

## Other profiles

Depending on the specific Measure and Interaction, various DEQM and QI Core Profiles are used *in addition* to the profiles listed above

## Must Support

- This guide adopts the [QI Core *Must Support*] definition with the following additional expectations:

1.  The receiver of data may not be able to complete processing and may report an error if a Must Support element is unavailable.

{% include link-list.md %}
