---
title: DaVinci Data Exchange For Quality Measures Implementation Guide
layout: default
active: home
topofpage: true
---

<!-- add to  preprocesser to update the title to IG name -->


<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

##  Introduction

The purpose of this implementation guide is to support value based care data exchange in the US Realm.  However, this Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the US Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards. The intent of the framework defined in this guide is to enable automatic data collection and submission limiting the need for manual processing and intervention.  Ultimately, a national standard based on FHIR for data structure and exchange will reduce the burden on clinicians of transforming data between systems.

This Implementation Guide is based upon the prior work from the [US Core], [QI Core], and [HEDIS] Implementation Guides and the [QRDA] Category I and III reporting specifications. This Implementation Guide is supported by the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard balloting process.

## How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for the Clinical Quality Measures Ecosystem and The Data Exchange For Quality Measures.

- [Framework]\: These pages provide guidance on the set of FHIR transactions that provide a general framework to enable the exchange of measure data.

  -  [General Guidance] gives overall guidance including preconditions, assumptions and an overview of the FHIR artifacts used in the different  reporting scenarios.

  -  [Data Exchange] gives guidance on the interactions between Consumers and Producers to exchange the data of interest for a measure.

  -  [Individual Reporting] gives guidance on the interactions between Reporters and Receivers to exchange the individual reports for a measure.

  -  [Summary Reporting] gives guidance on the interactions between Reporters and Receivers to exchange the summary reports for a measure.

- [Use cases]\: Three exemplar use cases are presented to demonstrate how to implement the DEQM framework for a particular measure.

    - [Medication Reconciliation (MRP)]\: This example shows how to implement a data exchange, and individual and summary measure reporting for the medication reconciliation post-discharge measure.

    - [Colorectal Cancer Screening (COL)]\: The colonoscopy measure is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.

    - [Venous Thromboembolism Prophylaxis (VTE-1)]\: This example is based on an existing CMS Eligible Hospital program measure (CMS108v7).  It is an example of a process measure, using proportion scoring and is within the Preventative Care Meaningful Measure Area.

- [Profiles and Extensions]\: This page lists the set of Profile and Extension that are defined in this guide to exchange quality data.

- [Capability statements]\: This set of pages describes the expected FHIR capabilities of the various DEQM actors.

- [Examples]\: List of all the examples used in this guide.

- [Downloads]\: This page provides links to downloadable artifacts.


## Background

<!-- Quality Improvement Ecosystem -->
{% include quality-improvement-ecosystem.md %}

<!-- Quality Measurement Standards Landscape -->
{% include quality-measurement-standards-landscape.md %}

<!-- Data Model Standards Landscape -->
{% include data-model-standards-landscape.md %}


## Quality Reporting Scenarios

This implementation guide describes two groups of quality reporting scenarios as shown in Figure 1-4 below. The first group are *Exchange Scenarios* which focus on exchanging subsets of the [data of interest](#data-of-interest) for a particular measure or set of measures throughout the [reporting period](#reporting period).  Note that there are use cases for sharing data from a consumer to a producer as well (for example, payers may share screening information with providers). The Second group are *Reporting Scenarios* which focus on communicating the results of a quality measure at the end of a reporting period as part of a quality improvement initiative.

{% include img-portrait.html  caption = "Figure 1-4 Quality Reporting Scenarios" img="quality-reporting-scenarios.png" %}

### Exchange Scenarios

Exchange scenarios are used to exchange subsets of the data of interest for a measure or set of measures throughout the [measurement period](#measurement-period). These scenarios enable providers and quality stakeholders such as payers, accountable care organizations, and other secondary use partners to keep better track of how patients are performing with respect to a particular quality measure during the measurement period.

<p>The three exchange scenarios are:</p>

1. <b>Submit Data</b> - Used by a producing system to submit a subset of the data of interest for a measure to a consuming system
1. <b>Collect Data</b> - Used by a consuming system to collect a subset of the data of interest for a measure from a producing system
1. <b>Subscription</b> - Used to allow the producing system to notify the consuming system when new or updated data of interest for a measure is available  *NOTE: This exchange scenario is out of scope for this version of the Implementation Guide.*

For these scenarios, the actors are Producers and Consumers, used in the same sense as the Producers and Consumers stakeholders in the Quality Measurement Standards Landscape diagram. Note that within any particular use case, different stakeholders will play the same roles. For example, a Provider may be playing the role of Producer in a particular exchange, while the Payer may be playing the role of Consumer.

### Reporting Scenarios

Reporting scenarios are used to report the results of quality measures on patients or populations at the end of a measurement period. Measure reports are provided to attest the standard of care given to patients in a population as measured by specific quality measures. The measures are typically identified as part of a quality improvement program or initiative by a payer or other quality improvement stakeholder such as Public Health with use cases that are typically more focused on the reporting scenarios.

The reporting scenarios are:

1. **Individual** - Used to report the results of a quality measure for a particular patient along with the complete set of data of interest to a quality reporting receiver
1. **Summary** - Used to report the results of a quality measure for the applicable population to a quality reporting receiver
1. **Patient-List** - A patient list report that includes a listing of patients that satisfied each population criteria in the measure *NOTE: This reporting scenario is out of scope for this version of the Implementation Guide.*

For the reporting scenarios, the actors are Reporters and Receivers:

**Reporters** are the actors submitting the results of a quality measure. Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the reporter may be different stakeholders such as providers, provider organizations, aggregators, or payers.

**Receivers** are the actors receiving the results of quality measures. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations.

## Glossary
{: #data-of-interest}Data of Interest
  : The data elements that are required to determine whether a case (for example, patient) is in the population as defined by the clinical quality measure. In FHIR these data elements are satisfied by the combination of FHIR resources covering clinical events and requests such as Procedures, Observations, or ServiceRequests. For example, for a particular measure the data of interest could be the set of Conditions, Procedures, and Observations related to determining whether a patient is in the initial population, denominator, denominator exclusions, and/or numerator.

{: #incremental-update}Incremental Update
  : In contrast to the Snapshot Update, the FHIR [Parameters] resource used in a Submit Data or the Collect Data scenario contains only the *new and updated* DEQM and QI Core Profiles since the last transaction.

{: #measurement-period}Measurement Period
  : Also known as the **Reporting Period**, it refers to the time frame for which a measure will be calculated and is defined by the measure.  (In FHIR is represented by the element Measure.effectivePeriod)

{: #snapshot-update}Snapshot Update
  : In contrast to the Incremental Update, the FHIR [Parameters] resource used in a Submit Data or the Collect Data scenario is contains *all* the DEQM and QI Core Profiles for each transaction.

{: #submission-period}Submission period
  : The specified time window in which the Producer reports the data of interest for measure to the Consumer

For additional definitions see the [eCQI Resource Center Glossary]


## Table of Acronyms

|Acronym|Definition|
|---|---|
|API|Application Program Interface|
|CDS|Clinical Decision Support|
|CMS |Centers for Medicare and Medicaid Services |
|COL |Colorectal Cancer Screening Measure|
|CQFM|Clinical Quality Framework Measures|
|CQL |Clinical Quality Language|
|CQM |Clinical Quality Measures|
|eCQM|electronic Clinical Quality Measures|
|DEQM|Data Exchange For Quality Measures|
|EHR|Electronic Health Record|
|FHIR|Fast Healthcare Interoperability Resources|
|MRP|Medication Reconciliation Post-discharge Measure|
|QDM|Quality Data Model|
|R4|FHIR Release 4|
|REST|Representational State Transfer|
|STU3|FHIR Release 3 (STU)|
|VTE-1|Venous Thromboembolism Prophylaxis Measure|

<br />

---

**This Implementation Guide was made possible by the thoughtful contributions of the following people and organizations:**

- *The twenty-two founding [Da Vinci Project](http://www.hl7.org/about/davinci/index.cfm?ref=common) member organizations.*

- *Bryn Rhodes, Bryn Rhodes, Dynamic Content Group*
- *Eric Haas, Health eData Inc*
- *Floyd Eisenberg, iParsimony LLC*
- *Jocelyn Keegan, Point of Care Partners*
- *Linda Michaelsen, Optum*
- *Lloyd Mckenzie, Gevity*
- *Robert Dieterle, EnableCare*
- *Robert Samples, ESAC*
- *Viet Nguyen, Stratametrics*
- *Yan Heras, Optimum eHealth LLC*

---

{% include link-list.md %}
