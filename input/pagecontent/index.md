

###  Introduction

The purpose of this implementation guide is to support value-based care data exchange in the US Realm.  However, this Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the US Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards. The intent of the framework defined in this guide is to enable automatic data collection and submission limiting the need for manual processing and intervention.  Ultimately, a national standard based on FHIR for data structure and exchange will reduce the burden on clinicians of transforming data between systems.

This Implementation Guide is supported by the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. Like all Da Vinci Implementation Guides, it follows the [HL7 Da Vinci Guiding Principles] for exchange of patient health information.  The guide is based upon the prior work from the [US Core], [QI-Core], and [HEDIS] Implementation Guides and the [QRDA] Category I and III reporting specifications. Changes to this specification are managed by the sponsoring HL7 [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard HL7 balloting process.

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [**Home**](index.html): The home page provides the introduction for The Data Exchange For Quality Measures (DEQM) implementation guide.
- [**Scenarios**](#scenarios): This topic provides an overview of the scenarios supported by the DEQM framework.
- [**Background**](background.html): This page provides background for the Clinical Quality Measures Ecosystem and Quality Reporting use cases.
- [**Framework**](framework.html): These pages provide guidance on the set of FHIR transactions that provide a general framework to enable the exchange of measure data.
  - [**General Guidance**](guidance.html) gives overall guidance including preconditions, assumptions and an overview of the FHIR artifacts used in the different  reporting scenarios.
  - [**Data Exchange**](datax.html) gives guidance on the interactions between Consumers and Producers to exchange the data of interest for a measure.
  - [**Individual Reporting**](indv-reporting.html) gives guidance on the interactions between Reporters and Receivers to exchange the individual reports for a measure.
  - [**Summary Reporting**](summary-reporting.html) gives guidance on the interactions between Reporters and Receivers to exchange the summary reports for a measure.
  - [**Subject List Reporting**](subjectlist-reporting.html) gives guidance on the interactions between Reporters and Receivers to exchange the subject-list reports for a measure.
  - [**Gaps in Care Reporting**](gaps-in-care-reporting.html) gives guidance on the interactions between Clients and Servers to exchange the Gaps in Care Reports for a measure. Note that Clients and Servers are defined in section 1.7.3. Gaps in Care Reporting Scenarios.
- [**Use cases**](usecases.html): Three example use cases are presented to demonstrate how to implement the DEQM framework for a particular measure.
    - [**Medication Reconciliation (MRP)**](mrp.html): This example shows how to implement a data exchange, and individual and summary measure reporting for the medication reconciliation post-discharge measure.
    - [**Colorectal Cancer Screening (COL)**](col.html): The colonoscopy measure is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening for all patients in the population receiving care during the measurement period.
    - [**Venous Thromboembolism Prophylaxis (VTE-1)**](vte1.html): This example is based on an existing CMS Eligible Hospital program measure (CMS108v7).  It is an example of a process measure, using proportion scoring and is within the
   Preventative Care Meaningful Measure Area.
   -  [**Gaps in Care**](gaps-examples.html): This page lists example use cases for Gaps in Care Reporting.
- [**FHIR Artifacts**](artifacts.html): List of all DEQM FHIR artifacts.
  - [**Profiles and Extensions**](profiles.html): A list of all DEQM FHIR profiles and extensions.
  - [**Operations**](operations.html): A list of all DEQM operations.
  - [**Terminology**](terminology.html): A list of all DEQM terminology code systems and value sets.
  - [**Capability statements**](capstatements.html): A list of all DEQM capability statements for the various DEQM roles.
- [**Examples**](examples.html): List of all the examples used in this guide.
- [**Downloads**](downloads.html): This page provides links to downloadable artifacts.

> NOTE: Additional use cases and examples will be developed and made available [here](https://confluence.hl7.org/display/DVP/DEQM+with+Gaps+in+Care+Supplemental+Guide) outside this implementation guide .
{:.stu-note}

### Scenarios

This implementation guide defines a framework to support quality measurement, reporting, and related use cases by enabling both the exchange of the [_data of interest_](glossary.html#data-of-interest) for a measure or set of measures, as well as the reporting of quality measurement results, with or without the data involved in calculating those results. The following scenarios illustrate the various ways that this framework can be used, providing an overview of and index into the more detailed use cases and specification documentation in the implementation guide.

Broadly, these scenarios fall into three categories: 1) *Reporting Scenarios*, focused on communicating the results of a quality measure calculation at the end of a [_measurement period_](glossary.html#measurement-period) as part of a quality improvement initiative, 2) *Exchange Scenarios*, focused on echanging the data of interest for a measure or set of measures throughout the measurement period, and 3) Gaps in care scenarios.

As a precondition, systems in these scenarios have already obtained the relevant measure specifications being reported from a measure repository as described in the [Quality Measure IG Measure Repository]({{site.data.fhir.ver.cqfm}}/measure-repository-service.html).

#### Reporting Scenarios

Reporting scenarios are used to report the results of quality measures on patient populations at the end of a measurement period. Measure reports are provided to attest the standard of care given to patients in a population as measured by specific quality measures. The measures are typically identified as part of a quality improvement initiative by a payer or other quality improvement stakeholder such as public health agencies with use cases that are typically more focused on the reporting scenarios.

For the reporting scenarios, the actors are Reporters and Receivers:

**Reporters** are the actors submitting the results of a quality measure. Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the reporter may be different stakeholders such as providers, provider organizations, aggregators, or payers. In general, a _reporter_ will consist of at least a **Clinical Data Repository**, the clinical system or systems containing information generated by or derived from the delivery of healthcare, and a **Measure Evaluation Service**, the system responsible for calculation of measure results.

**Receivers** are the actors receiving the results of quality measures. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations.

In each of these scenarios, the patients to be considered are determined by _attribution_. Since different quality initiatives may use the same measures with different attribution models, attribution is typically not specified as part of the measure specifications. The [DaVinci Member Attribution List](https://hl7.org/fhir/us/davinci-atr/) implementation guide supports the definition and exchange of member attribution lists as a potential approach to identifying patients to be considered for reporting.

##### Population Reporting Without Supporting Data

In this scenario, a _reporter_ such as a clinic submits a summary level quality measure report for a specific measure, attributed patients, and measurement period:

{% include img.html img="population-reporting-no-supporting-data.png" %}

1. The _measure evaluation service_ gathers the _data of interest_ from the _clinical data repository_ using the FHIR API
2. The _measure evaluation service_ calculates the measure, producing the MeasureReport
3. The _measure evaluation service_ then POSTs the MeasureReport to the _receiver_

In this scenario, the resulting MeasureReport is a _summary_ level measure report which includes only the population counts and calculated measure score. This scenario does not result in any patient-level data being communicated to the receiving system.

For more details on this scenario, see the [Summary Reporting](summary-reporting.html) framework topic.

##### Population Reporting With Supporting Data

In this scenario, a _reporter_ such as a hospital submits individual level quality measure reports for a specific measure and measurement period, for each attributed patient:

{% include img.html img="population-reporting-supporting-data.png" %}

1. The _measure evaluation service_ gathers the _data of interest_ from the _clinical data repository_ using the FHIR API
2. The _measure evaluation service_ calculates the measure, producing a MeasureReport for each attributed patient
3. The _measure evaluation service_ assembles a Bundle for each patient, consisting of the calculated MeasureReport and any data referenced during the calculation (i.e. evaluatedResource)
4. The _measure evaluation service_ POSTs the measure report Bundles to the _receiver_

In this scenario, there is a Bundle of individual-level patient data for each attributed Patient. Determining the overall measure score then requires the additional step of aggregating the individual MeasureReport resources. Alternatively, a subject-list report can be included that references all the individual-level MeasureReports and provides the summary level measure score.

For more details on this scenario, see the [Individual Reporting](individual-reporting.html) and [Subject-list Reporting](subjectlist-reporting.html) framework topics.

##### Bulk Data

In each of the scenarios described above, the FHIR API is used directly to access the data of interest for the measure being reported. To support large volumes of data, [Bulk Data](https://hl7.org/fhir/uv/bulkdata/) may be used to transfer the data of interest between the clinical data repository and the measure evaluation service. As of the time of this publication, the Bulk Data specification is being updated to include important capabilities that will improve the performance of bulk data for the quality reporting use case, in particular the ability to organize bulk data feeds by patient. A future version of this publication will provide more detail on how this capability can be used directly once the updated Bulk Data specification is published.

##### Aggregated Reporting

In aggregated reporting, the _measure calculation service_ gathers _data of interest_ from multiple _clinical data repositories_, allowing for reporting in a variety of ways, including multiple facilities for a single provider, as well as multi-provider organizations:

Because data from multiple facilities and organizations can be aggregated in many ways; this specification is not prescriptive about how that aggregation is performed.

##### Multiple Measures and Data Requirements

For simplicity, each of the above reporting scenarios is specified in terms of a single measure. However, all the framework operations and scenarios support specifying any number of measures to be reported. Reporting on multiple measures impacts:

1. _data requirements_: For reporting on multiple measures, data requirements can be combined across measures to determine overall reporting requirements
2. _data of interest_: Exchanging data of interest for multiple measures prevents data elements that are used by multiple measures from being communicated more than once
3. _submitted data_: In submitted measure report bundles, multiple MeasureReports may be included, allowing each measure report to reference only data used by that measure

In the simplest case, this approach identifies all the data required for calculation of any measure used in the quality initiative.

However, the approach also allows for submitting systems to choose which measures they are reporting, and determine only the data required for those measures.

For more details on data requirements, see the [Data Requirements](datax.html#gather-data-requirements-from-consumer) framework topic.

#### Exchange Scenarios

Exchange scenarios are used to exchange subsets of the data of interest for a measure or set of measures throughout the measurement period. These scenarios enable providers and quality stakeholders such as payers, accountable care organizations, and other secondary use partners to keep better track of how patients are performing with respect to a particular quality measure during the measurement period.

<p>The three exchange scenarios are:</p>

1. <b>Submit Data</b> - Used by a producing system to submit a subset of the data of interest for a measure to a consuming system
1. <b>Collect Data</b> - Used by a consuming system to collect a subset of the data of interest for a measure from a producing system
1. <b>Subscription</b> - Used to allow the producing system to notify the consuming system when new or updated data of interest for a measure is available  *NOTE: This exchange scenario is out of scope for this version of the Implementation Guide.*

For these scenarios, the actors are Producers and Consumers, used in the same sense as the Producers and Consumers stakeholders in the Quality Measurement Standards Landscape diagram. Note that within any particular use case, different stakeholders will play the same roles. For example, a Provider may be playing the role of Producer in a particular exchange, while the Payer may be playing the role of Consumer.

#### Gaps in Care Reporting Scenarios

Gaps in Care Reporting is a reporting scenario supported in this implementation guide. Similar to the quality reporting scenarios, a Gaps in Care Report is used to report the results of quality measures on patients or population, but for a [gaps through period] that is of interest for a Client.

1. **Gaps in Care** - Used to report the results of [open, closed, and/or prospective gaps] of a quality measure or quality measures for a patient or a group of patients to a Client. Optionally, it is also used to provide details to the open, closed, and/or prospective gaps.

The process below can be run as many times as useful during the reporting period to assure that all [open gaps] are closed.

{% include img-portrait.html  caption = "Figure 1-5 Gaps in Care Reporting Scenarios" img="gaps-reporting-scenario.png" %}

For the Gaps in Care Reporting Scenarios, the actors are Clients and Servers.

**Clients** are the actors requesting gaps in care results of quality measure(s). Depending on the reporting requirements for a particular scenario as well as the technical capabilities of the systems involved, the clients may be different stakeholders such as providers, provider organizations, aggregators, or payers. For example, if a provider requests a report from the payer's system, then the provider serves as the client. If a payer requests a report from their own system, they are the client.

**Servers** are the actors receiving the request for the Gaps in Care Report and producing it based on the information they have in their system. Again, depending on the reporting requirements and technical capabilities, receivers may be different stakeholders, but are typically aggregate-level stakeholders such as healthcare agencies, payers, and quality improvement organizations. For example, if a provider requests a report from the payer's system, then the payer's system serves as the server. If a payer requests a report from their own system, the payer's system serves as the server.

### Acknowledgements

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
