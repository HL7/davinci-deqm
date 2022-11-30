
<div class="new-content" markdown="1">

Where possible, new and updated content will be highlighted with green text and background

{{ site.data.package_list.list[0].desc }}

</div>

###  Introduction

The purpose of this implementation guide is to support value based care data exchange in the US Realm.  However, this Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the US Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards. The intent of the framework defined in this guide is to enable automatic data collection and submission limiting the need for manual processing and intervention.  Ultimately, a national standard based on FHIR for data structure and exchange will reduce the burden on clinicians of transforming data between systems.

This Implementation Guide is supported by the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. Like all Da Vinci Implementation Guides, it follows the [HL7 Da Vinci Guiding Principles] for exchange of patient health information.  The guide is based upon the prior work from the [US Core], [QI Core], and [HEDIS] Implementation Guides and the [QRDA] Category I and III reporting specifications. Changes to this specification are managed by the sponsoring HL7 [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard HL7 balloting process.

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for the Clinical Quality Measures Ecosystem and The Data Exchange For Quality Measures.

- [Framework]\: These pages provide guidance on the set of FHIR transactions that provide a general framework to enable the exchange of measure data.

  -  [General Guidance] gives overall guidance including preconditions, assumptions and an overview of the FHIR artifacts used in the different  reporting scenarios.

  -  [Data Exchange] gives guidance on the interactions between Consumers and Producers to exchange the data of interest for a measure.

  -  [Individual Reporting] gives guidance on the interactions between Reporters and Receivers to exchange the individual reports for a measure.

  -  [Summary Reporting] gives guidance on the interactions between Reporters and Receivers to exchange the summary reports for a measure.


  -  [Gaps in Care Reporting] gives guidance on the interactions between Clients and Servers to exchange the Gaps in Care Reports for a measure. Note that Clients and Servers are defined in section 1.7.3. Gaps in Care Reporting Scenarios.


- [Use cases]\: Three* exemplar use cases are presented to demonstrate how to implement the DEQM framework for a particular measure.

    - [Medication Reconciliation (MRP)]\: This example shows how to implement a data exchange, and individual and summary measure reporting for the medication reconciliation post-discharge measure.

    - [Colorectal Cancer Screening (COL)]\: The colonoscopy measure is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.

    - [Venous Thromboembolism Prophylaxis (VTE-1)]\: This example is based on an existing CMS Eligible Hospital program measure (CMS108v7).  It is an example of a process measure, using proportion scoring and is within the
   Preventative Care Meaningful Measure Area.

   -  [Gaps in Care]\: This page lists example use cases for Gaps in Care Reporting.

*Additional use cases and examples will be developed and made available [here](https://confluence.hl7.org/display/DVP/DEQM+with+Gaps+in+Care+Supplemental+Guide) outside this implementation guide .
{:.stu-note}

- [Profiles and Extensions]\: This page lists the set of Profile and Extension that are defined in this guide to exchange quality data.

- [Capability statements]\: This set of pages describes the expected FHIR capabilities of the various DEQM actors.

- [Examples]\: List of all the examples used in this guide.

- [Downloads]\: This page provides links to downloadable artifacts.


- [Terminology]\: This page lists code systems and value sets defined in this guide.

- [Operations]\: This page lists the Operation that is defined in this guide to exchange Gaps in Care Report.

### Background
{: #background}

<!-- Quality Improvement Ecosystem -->
{% include quality-improvement-ecosystem.md %}

<!-- Quality Measurement Standards Landscape -->
{% include quality-measurement-standards-landscape.md %}

<!-- Data Model Standards Landscape -->
{% include data-model-standards-landscape.md %}


#### Data Quality  
The default profiles in this implementation guide provide a baseline for data validation, but note that additional validation criteria may be expressed via Measure specific profiles.  This process begins by modeling the data quality requirements in CQL, then extending one of the default profiles in this guide with the updated CQL, and specifying the profile in the meta data of the FHIR Measure resource.  In effect, the `Measure.meta.profile` field will hold a link to a data profile that contains the CQL script that can be used for data quality, data itegrity checks, and data validation.  

### Quality Reporting Scenarios

This implementation guide describes two groups of quality reporting scenarios as shown in Figure 1-4 below. The first group are *Exchange Scenarios* which focus on exchanging subsets of the [data of interest](#data-of-interest) for a particular measure or set of measures throughout the [measurement period](#measurement-period).  Note that there are use cases for sharing data from a consumer to a producer as well (for example, payers may share screening information with providers). The Second group are *Reporting Scenarios* which focus on communicating the results of a quality measure at the end of a measurement period as part of a quality improvement initiative.

{% include img-portrait.html  caption = "Figure 1-4 Quality Reporting Scenarios" img="quality-reporting-scenarios.png" %}

#### Exchange Scenarios

Exchange scenarios are used to exchange subsets of the data of interest for a measure or set of measures throughout the measurement period. These scenarios enable providers and quality stakeholders such as payers, accountable care organizations, and other secondary use partners to keep better track of how patients are performing with respect to a particular quality measure during the measurement period.

<p>The three exchange scenarios are:</p>

1. <b>Submit Data</b> - Used by a producing system to submit a subset of the data of interest for a measure to a consuming system
1. <b>Collect Data</b> - Used by a consuming system to collect a subset of the data of interest for a measure from a producing system
1. <b>Subscription</b> - Used to allow the producing system to notify the consuming system when new or updated data of interest for a measure is available  *NOTE: This exchange scenario is out of scope for this version of the Implementation Guide.*

For these scenarios, the actors are Producers and Consumers, used in the same sense as the Producers and Consumers stakeholders in the Quality Measurement Standards Landscape diagram. Note that within any particular use case, different stakeholders will play the same roles. For example, a Provider may be playing the role of Producer in a particular exchange, while the Payer may be playing the role of Consumer.

#### Reporting Scenarios

Reporting scenarios are used to report the results of quality measures on patients or populations at the end of a measurement period. Measure reports are provided to attest the standard of care given to patients in a population as measured by specific quality measures. The measures are typically identified as part of a quality improvement program or initiative by a payer or other quality improvement stakeholder such as Public Health with use cases that are typically more focused on the reporting scenarios.

The reporting scenarios are:

1. **Individual** - Used to report the results of a quality measure for a particular patient along with the complete set of data of interest to a quality reporting receiver
1. **Summary** - Used to report the results of a quality measure for the applicable population to a quality reporting receiver
1. **Patient-List** - A patient list report that includes a listing of patients that satisfied each population criteria in the measure *NOTE: This reporting scenario is out of scope for this version of the Implementation Guide.*

For the reporting scenarios, the actors are Reporters and Receivers:

**Reporters** are the actors submitting the results of a quality measure. Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the reporter may be different stakeholders such as providers, provider organizations, aggregators, or payers.

**Receivers** are the actors receiving the results of quality measures. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations.

#### Gaps in Care Reporting Scenarios
Gaps in Care Reporting is added as a new group of quality reporting scenarios supported in this version of the guide. Similar to the reporting scenarios, a Gaps in Care Report is used to report the results of quality measures on patients or population, but for a [gaps through period] that is of interest for a Client.

1. **Gaps in Care** - Used to report the results of [open and/or closed gaps] of a quality measure or quality measures for a patient or a group of patients to a Client. Optionally, it is also used to provide details to the open and/or closed gaps.

The process below can be run as many times as useful during the reporting period to assure that all [open gaps] are closed.

{% include img-portrait.html  caption = "Figure 1-5 Gaps in Care Reporting Scenarios" img="gaps-reporting-scenario.png" %}

For the Gaps in Care Reporting Scenarios, the actors are Clients and Servers.

**Clients** are the actors requesting gaps in care results of quality measure(s). Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the clients may be different stakeholders such as providers, provider organizations, aggregators, or payers. For example, if a provider requests a report from the payer's system, then the provider serves as the client. If a payer requests a report from their own system, they are the client.

**Servers** are the actors receiving the request for the Gaps in Care Report and producing it based on the information they have in their system. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations. For example, if a provider requests a report from the payer's system, then the payer's system serves as the server. If a payer requests a report from their own system, the payer's system serves as the server.

### Glossary
{: #closed-gap}Closed Gap
  : No discrepancy exists between recommended best practices and the services that are actually provided and documented. A previously identified open gap may become closed, if actions were taken to close the open gaps.

{: #data-of-interest}Data of Interest
  : The data elements that are required to determine whether a case (for example, patient) is in the population as defined by the clinical quality measure. In FHIR these data elements are satisfied by the combination of FHIR resources covering clinical events and requests such as Procedures, Observations, or ServiceRequests. For example, for a particular measure the data of interest could be the set of Conditions, Procedures, and Observations related to determining whether a patient is in the initial population and included or excluded from the denominator.

{: #gaps-in-care}Gaps In Care
  : Gaps in care are defined as discrepancies between recommended best practices and the services that are actually provided and documented. The terms gaps in care and care gaps may be used interchangeably.

{: #gaps-through-period}Gaps Through Period
  : The period of time defined by a Client for running the Gaps in Care Report. When the end period date of the gaps is specified as a date in the future, it indicates the Gaps in Care Report will be run prospectively, which provides opportunity for actions to be taken to close the identified gaps. When the end period date of the gaps is specified as a date in the past, it indicates the Gaps in Care Report will be run retrospectively.

{: #incremental-update}Incremental Update
  : In contrast to the Snapshot Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains only the new and updated DEQM and QI Core Profiles since the last transaction. If the Consumer supports incremental updates, the contents of the updated payload updates the previous payload data.

{: #inverse-measure}Inverse Measure
  : A lower calculated performance rate for this measure indicates better clinical care or control. The Diabetes: Hemoglobin A1c (HbA1c) Poor Control (>9%) measure is an example of inverse measure.

{: #measurement-period}Measurement Period
  : The period of time which a measure will be calculated.  It is defined by the measure (In FHIR represented by the element `Measure.effectivePeriod`).

{: #open-gap}Open Gap
  : A discrepancy exists between recommended best practices and the services that are actually provided and documented. For example, individuals missing colonoscopy or other screening tests as specified in the Colorectal Cancer Screening measure based on their age groups. For a positive measure, open gaps are identified if an individual is not in the numerator population as specified by the measure. For an inverse measure, open gaps are identified if an individual is in the numerator population as specified by the measure.

{: #positive-measure}Positive Measure
  : A higher calculated performance rate for this measure indicates better clinical care or control. The Colorectal Cancer Screening measure is an example of positive measure.

{: #reporting-period}Reporting Period
  : The period of time defined by the reporting program for a set of data to be submitted.  This term is not used in this implementation guide to avoid confusion with program specific definitions. This can be equal to or a subset of the Measurement Period.

{: #snapshot-update}Snapshot Update
  : In contrast to the Incremental Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains all the DEQM and QI Core Profiles for each transaction.  If the Consumer supports snapshot updates, the contents of the updated payload entirely replaces the previous payload.

{: #submission-period}Submission period
  : For this Implementation guide, submission period is the period of time in which data can exchanged when describing the FHIR transactions for data exchange, and measure reporting. The submission period typically overlaps with the measurement period and reporting period.

For additional definitions see the [eCQI Resource Center Glossary]


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
