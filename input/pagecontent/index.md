
### Introduction

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care (VBC) stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards. The intent of the framework defined in this guide is to enable automatic data collection and submission limiting the need for manual processing and intervention. Ultimately, a national standard based on FHIR for data structure and exchange will reduce the burden on clinicians of transforming data between systems.

This Data Exchange for Quality Measures (DEQM) Implementation Guide (IG) supports VBC data exchange through the collection, generation, and submission of measure reports and [data of interest]. For explanatory purposes, some of this guide, particularly the Example Use Cases, assumes that the data exchange takes place within a larger data exchange architecture that is specific to the US Realm. In fact, DEQM supports other information modes, measures, and use cases that enable VBC data exchange and is not tied to a specific architecture.

This Implementation Guide is supported by the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate VBC data exchange across communities. Like all Da Vinci Implementation Guides, it follows the [HL7 Da Vinci Guiding Principles] for exchange of patient health information. This IG is built upon on [FHIR Version R4](http://hl7.org/fhir/R4/index.html). Changes to this specification are managed by the sponsoring HL7 [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard HL7 balloting process.

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: Introduction for the [Quality Improvement Ecosystem](#quality-improvement-ecosystem) and this DEQM IG.

- [Framework]\: Guidance on the FHIR transactions that provide a framework for the exchange of measure data.

  - [General Guidance]\: Overall guidance including preconditions, assumptions, and an overview of the FHIR artifacts used in the different reporting scenarios.

  - [Data Exchange]\: Guidance on the interactions between [Consumers and Producers](#quality-measurement-standards-landscape) to exchange the [data of interest](#data-of-interest) for a measure.

  - [Individual Reporting]\: Guidance on the interactions between [Reporters and Receivers](#reporting-scenarios) to exchange Individual MeasureReports for a single subject.

  - [Summary Reporting]\: Guidance on the interactions between [Reporters and Receivers](#reporting-scenarios) to exchange Summary MeasureReports for a population defined by the measure.

  - [Subject List Reporting]\: Guidance on the interaction between [Reporters and Receivers](#reporting-scenarios) to exchange Subject List MeasureReports for a FHIR Group with references to a FHIR List that references Individual MeasureReports.

  - [Gaps in Care Reporting]\: Guidance on the interactions between [Clients and Servers](#gaps-in-care-reporting-scenarios) to exchange [Gaps in Care Reports](#gaps-in-care) for a measure.

- [Example Use Cases]\: Example use cases to demonstrate how to implement DEQM for a particular measure within a particular use case.

  - [Medication Reconciliation (MRP)]\: Example of data exchange, and individual and summary measure reporting for the medication reconciliation post-discharge measure.

  - [Colorectal Cancer Screening (COL)]\: The colonoscopy measure is an example of a process measure evaluating screenings for preventive health services. Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.

  - [Venous Thromboembolism Prophylaxis (VTE-1)]\: This example is based on an existing CMS Eligible Hospital program measure. It is an example of a process measure that uses proportion scoring and is within the Preventative Care Meaningful Measure Area.

  - [Gaps in Care]\: Example use cases for Gaps in Care Reporting.

*Additional use cases and examples will be developed and made available [here](https://confluence.hl7.org/display/DVP/DEQM+with+Gaps+in+Care+Supplemental+Guide) outside this implementation guide .
{:.stu-note}

- [Profiles and Extensions]\: Lists the set of Profile and Extension that are defined in this guide.

- [Capability statements]\: Describes the expected FHIR capabilities of the various DEQM actors.

- [Examples]\: List of all the examples used in this guide.

- [Downloads]\: Links to downloadable artifacts.

- [Terminology]\: Lists code systems and value sets defined in this guide.

- [Operations]\: Lists the operations defined in this guide.

### Background

This section describes DEQM's role within the Quality Improvement Ecosystem, which is further defined in the Quality Measurement Standards Landscape by enumerating standards that support a US Realm use case. However, DEQM has generalized its implementation so that it can support use cases both within and outside the US Realm. This section is useful as an example of how DEQM functions within an ecosystem, but it is not the only ecosystem in which DEQM can be used. In the ecosystem described below, DEQM reports measures that are defined in the Quality Mesaure IG and expressed with CQL, using using a data model defined in QI-Core. In other ecosystems, the measures, expression language, and data model would be defined in other IGs.

{: #background}

<!-- Quality Improvement Ecosystem -->
{% include quality-improvement-ecosystem.md %}

<!-- Quality Measurement Standards Landscape -->
{% include quality-measurement-standards-landscape.md %}

<!-- Data Model Standards Landscape -->
{% include data-model-standards-landscape.md %}

### Quality Reporting Scenarios

This implementation guide describes two groups of quality reporting scenarios as shown in Figure 1-4 below. The first group is *Exchange Scenarios*, which focuses on exchanging subsets of the [data of interest](#data-of-interest) for a particular measure or set of measures throughout the [measurement period](#measurement-period). Note that there are use cases for sharing data from a consumer to a producer as well (for example, payers may share screening information with providers). The Second group is *Reporting Scenarios*, which focuses on communicating the results of a quality measure at the end of a measurement period as part of a quality improvement initiative.

{% include img-portrait.html caption = "Figure 1-4 Quality Reporting Scenarios" img="quality-reporting-scenarios.png" %}

#### Exchange Scenarios

Exchange scenarios are used to exchange subsets of the data of interest for a measure or set of measures throughout the measurement period. These scenarios enable providers and quality stakeholders such as payers, accountable care organizations, and other secondary use partners to keep better track of how patients are performing with respect to a particular quality measure during the measurement period.

The three exchange scenarios are:

1. **Submit Data** - Used by a producing system to submit a subset of the data of interest for a measure to a consuming system.
1. **Collect Data** - Used by a consuming system to collect a subset of the data of interest for a measure from a producing system.
1. **Subscription** - Used to allow the producing system to notify the consuming system when new or updated data of interest for a measure is available. *NOTE: This exchange scenario is out of scope for this version of the Implementation Guide.*

For these scenarios, the actors are Producers and Consumers, used in the same sense as the Producers and Consumers stakeholders in the Quality Measurement Standards Landscape diagram. Note that within any particular use case, different stakeholders will play the same roles. For example, a Provider may be playing the role of Producer in a particular exchange, while the Payer may be playing the role of Consumer.

#### Reporting Scenarios

Reporting scenarios are used to report the results of quality measures individual subjects or on groups for a measurement period. Measure reports are provided to attest the standard of care given to subjects in a population as measured by specific quality measures. The measures are typically identified as part of a quality improvement program or initiative by a payer or other quality improvement stakeholder such as Public Health with use cases that are typically more focused on the reporting scenarios.

The reporting scenarios are:

1. **Individual Reporting** - Used to report the results of a quality measure for an individual subject along with the complete set of data of interest to a quality reporting receiver.
1. **Summary Reporting** - Used to report the results of a quality measure for the applicable population to a quality reporting receiver.
1. **Subject List Reporting** - A subject list report that includes a listing of subjects that satisfied each population criteria in the measure.

For the reporting scenarios, the actors are Reporters and Receivers:

**Reporters** are the actors submitting the results of a quality measure. Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the reporter may be different stakeholders such as providers, provider organizations, aggregators, or payers.

**Receivers** are the actors receiving the results of quality measures. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations.

#### Gaps in Care Reporting Scenarios

Similar to the reporting scenarios, a Gaps in Care Report is used to report the results of quality measures on a subject or group, but for a [gaps through period] that is of interest for a Client.

1. **Gaps in Care** - Used to report the results of [open and/or closed gaps] of a one or more quality measures for a subject or a group of patients to a Client. Optionally, it is also used to provide details to the open and/or closed gaps.

The process below can be run as many times as useful during the reporting period to assure that all [open gaps] are closed.

{% include img-portrait.html caption = "Figure 1-5 Gaps in Care Reporting Scenarios" img="gaps-reporting-scenario.png" %}

For the Gaps in Care Reporting Scenarios, the actors are Clients and Servers.

**Clients** are the actors requesting gaps in care results of quality measure(s). Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the clients may be different stakeholders such as providers, provider organizations, aggregators, or payers. For example, if a provider requests a report from the payer's system, then the provider serves as the client. If a payer requests a report from their own system, they are the client.

**Servers** are the actors receiving the request for the Gaps in Care Report and producing it based on the information they have in their system. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations. For example, if a provider requests a report from the payer's system, then the payer's system serves as the server. If a payer requests a report from their own system, the payer's system serves as the server.

### Glossary

{: #closed-gap}Closed Gap
  : No discrepancy exists between recommended best practices and the services that are actually provided and documented. A previously identified open gap may become closed if actions were taken to close the open gap.

{: #data-of-interest}Data of Interest
  : The data elements that are required to determine whether a case (for example, patient) is in the population as defined by the clinical quality measure. In FHIR these data elements are satisfied by the combination of FHIR resources covering clinical events and requests such as Procedures, Observations, or ServiceRequests. For example, for a particular measure the data of interest could be the set of Conditions, Procedures, and Observations related to determining whether a patient is in the initial population and included or excluded from the denominator.

{: #gaps-in-care}Gaps In Care
  : Gaps in care are defined as discrepancies between recommended best practices and the services that are actually provided and documented. The terms "gaps in care" and "care gaps" may be used interchangeably.

{: #gaps-through-period}Gaps Through Period
  : The period of time defined by a Client for running the Gaps in Care Report. When the end period date of the gaps is specified as a date in the future, it indicates the Gaps in Care Report will be run prospectively, which provides opportunity for actions to be taken to close the identified gaps. When the end period date of the gaps is specified as a date in the past, it indicates the Gaps in Care Report will be run retrospectively.

{: #incremental-update}Incremental Update
  : In contrast to the Snapshot Update, in an Incremental Update the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains only the new and updated DEQM resources and data of interest since the last transaction. If the Consumer supports incremental updates, the contents of the updated payload updates the previous payload data.

{: #inverse-measure}Inverse Measure
  : A lower calculated performance rate for this measure indicates better clinical care or control. The Diabetes: Hemoglobin A1c (HbA1c) Poor Control (>9%) measure is an example of an inverse measure.

{: #measurement-period}Measurement Period
  : The period of time for which a measure will be calculated. It is defined by the measure and in FHIR is represented by the element `Measure.effectivePeriod`.

{: #open-gap}Open Gap
  : A discrepancy exists between recommended best practices and the services that are actually provided and documented. For example, individuals missing colonoscopy or other screening tests as specified in the Colorectal Cancer Screening measure based on their age groups would have an open gap. For a positive measure, open gaps are identified if an individual is not in the numerator population as specified by the measure. For an inverse measure, open gaps are identified if an individual is in the numerator population as specified by the measure.

{: #positive-measure}Positive Measure
  : A higher calculated performance rate for this measure indicates better clinical care or control. The Colorectal Cancer Screening measure is an example of positive measure.

{: #reporting-period}Reporting Period
  : The period of time defined by the reporting program for a set of data to be submitted. This term is not used in this implementation guide to avoid confusion with program specific definitions. This can be equal to or a subset of the Measurement Period.

{: #snapshot-update}Snapshot Update
  : In contrast to the Incremental Update, in a Snapshot Update the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains all the DEQM resources and data of interest for the entire transaction. If the Consumer supports snapshot updates, the contents of the updated payload entirely replaces the previous payload.

{: #submission-period}Submission period
  : For this implementation guide, submission period is the period of time in which data can exchanged when describing the FHIR transactions for data exchange and measure reporting. The submission period typically overlaps with the measurement period and reporting period.

For additional definitions see the [eCQI Resource Center Glossary].


### Table of Acronyms

|Acronym|Definition|
|---|---|
|API|Application Program Interface|
|CDS|Clinical Decision Support|
|CMS |Centers for Medicare and Medicaid Services |
|COL |Colorectal Cancer Screening Measure|
|CQFM|Clinical Quality Framework Measures|
|CQL |Clinical Quality Language|
|CQM |Clinical Quality Measures|
|DEQM|Data Exchange For Quality Measures|
|eCQM|electronic Clinical Quality Measures|
|EHR|Electronic Health Record|
|FHIR|Fast Healthcare Interoperability Resources|
|GIC|Gaps In Care|
|MRP|Medication Reconciliation Post-discharge Measure|
|QDM|Quality Data Model|
|R4|FHIR Release 4|
|REST|Representational State Transfer|
|STU3|FHIR Release 3 (STU)|
|VTE-1|Venous Thromboembolism Prophylaxis Measure|

---

**This Implementation Guide was made possible by the thoughtful contributions of the following people and organizations:**

- *The twenty-two founding [Da Vinci Project](http://www.hl7.org/about/davinci/index.cfm?ref=common) member organizations.*
- *Bryn Rhodes, Dynamic Content Group*
- *Eric Haas, Health eData Inc*
- *Floyd Eisenberg, iParsimony LLC*
- *Gay Dolin, Namaste Informatics, LLC*
- *Jocelyn Keegan, Point of Care Partners*
- *Linda Michaelsen, Optum*
- *Lloyd Mckenzie, Gevity*
- *Rob Reynolds, Dynamic Content Group*
- *Robert Dieterle, EnableCare*
- *Robert Samples, ESAC*
- *Sam Sayer, The MITRE Corporation*
- *Viet Nguyen, Stratametrics*
- *Yan Heras, Optimum eHealth LLC*

---

{% include link-list.md %}
