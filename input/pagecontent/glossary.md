### Glossary

The terms Producer, Consumer, Reporter, Receiver, Client, and Server name the **roles** systems play in a DEQM interaction, not categories of stakeholder. A single stakeholder may play any or all of these roles, and commonly plays different roles in different interactions. For example, a payer may act as the Consumer while gathering the data of interest during the measurement period, and then as the Reporter when submitting the resulting measure reports to a quality reporting program.

{: #client}Client
  : In the Gaps in Care Reporting scenarios, the system requesting gaps in care results for one or more quality measures over a [gaps through period](#gaps-through-period). Depending on the reporting requirements and the technical capabilities of the systems involved, the stakeholder acting as the Client may be a provider, provider organization, aggregator, or payer. For example, if a provider requests a report from a payer's system, the provider is the Client; if a payer requests a report from its own system, the payer is the Client. See also [Server](#server).

{: #closed-gap}Closed Gap
  : No discrepancy exists between recommended best practices and the services that are actually provided and documented. A previously identified open gap may become closed, if actions were taken to close the open gaps.

{: #consumer}Consumer
  : In the Exchange scenarios, the system requesting or receiving the [data of interest](#data-of-interest) for a measure or set of measures from a [Producer](#producer). A Consumer may evaluate the measure itself, or it may aggregate the data and forward it to another system for calculation and reporting. Depending on the exchange, the stakeholder acting as the Consumer may be a payer, registry, aggregator, health information exchange, public health agency, or other secondary use partner. Corresponds to the Data Consumers stakeholders in the [Quality Measurement Standards Landscape](background.html#quality-measurement-standards-landscape). See also [Producer](#producer).

{: #data-of-interest}Data of Interest
  : The data elements that are required to determine whether a case (for example, patient) is in the population as defined by the clinical quality measure. In FHIR these data elements are satisfied by the combination of FHIR resources covering clinical events and requests such as Procedures, Observations, or ServiceRequests. For example, for a particular measure the data of interest could be the set of Conditions, Procedures, and Observations related to determining whether a patient is in the initial population and included or excluded from the denominator. Formally, this is the data that satisfies the _effective data requirements_ of the measure, as defined in the [Data Criteria]({{site.data.fhir.ver.cqm}}/measure-conformance.html#data-criteria) topic of the Quality Measure IG.

{: #gaps-in-care}Gaps In Care
  : Gaps in care are defined as discrepancies between recommended best practices and the services that are actually provided and documented. The terms gaps in care and care gaps may be used interchangeably.

{: #gaps-through-period}Gaps Through Period
  : The period of time defined by a Client for running the Gaps in Care Report. When the end period date of the gaps is specified as a date in the future, it indicates the Gaps in Care Report will be run prospectively, which provides opportunity for actions to be taken to close the identified gaps. When the end period date of the gaps is specified as a date in the past, it indicates the Gaps in Care Report will be run retrospectively.

{: #incremental-update}Incremental Update
  : In contrast to the Snapshot Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains only the new and updated DEQM and QI-Core Profiles since the last transaction. If the [Consumer](#consumer) supports incremental updates, the contents of the updated payload updates the previous payload data.

{: #inverse-measure}Inverse Measure
  : A lower calculated performance rate for this measure indicates better clinical care or control. The Diabetes: Hemoglobin A1c (HbA1c) Poor Control (>9%) measure is an example of inverse measure.

{: #measurement-period}Measurement Period
  : The period of time which a measure will be calculated.  It is defined by the measure (In FHIR represented by the element `Measure.effectivePeriod`).

{: #open-gap}Open Gap
  : A discrepancy exists between recommended best practices and the services that are actually provided and documented. For example, individuals missing colonoscopy or other screening tests as specified in the Colorectal Cancer Screening measure based on their age groups. For a positive measure, open gaps are identified if an individual is not in the numerator population as specified by the measure. For an inverse measure, open gaps are identified if an individual is in the numerator population as specified by the measure.

{: #positive-measure}Positive Measure
  : A higher calculated performance rate for this measure indicates better clinical care or control. The Colorectal Cancer Screening measure is an example of positive measure.

{: #producer}Producer
  : In the Exchange scenarios, the system that holds and provides the [data of interest](#data-of-interest) for a measure or set of measures. A Producer has access to information generated by or derived from the delivery of healthcare — for example an EHR, a clinical data repository, a laboratory or hospital information system, or a health information exchange. Depending on the exchange, the stakeholder acting as the Producer may be a provider, provider organization, or any other stakeholder holding the data of interest, including a payer supplying data to a provider. Corresponds to the Data Producers stakeholders in the [Quality Measurement Standards Landscape](background.html#quality-measurement-standards-landscape). See also [Consumer](#consumer).

{: #prospective-gap}Prospective Gap
  : A discrepancy will exist in the future between recommended best practices and the services that are actually provided and documented unless actions are taken to provide recommended best practices and document before it becomes an open gap.  A previously identified prospective gap may become closed if actions were taken to close the prospective gap, or it may become open if actions are not taken to close it.

{: #receiver}Receiver
  : In the Reporting scenarios, the system receiving the results of a quality measure calculation from a [Reporter](#reporter). Receivers are typically aggregate-level stakeholders such as quality reporting programs, healthcare agencies, payers, and quality improvement organizations. See also [Reporter](#reporter).

{: #reporter}Reporter
  : In the Reporting scenarios, the system submitting the results of a quality measure calculation. A Reporter has access to the [data of interest](#data-of-interest) — potentially gathered through an Exchange scenario — and is responsible for calculating the measure results. Conceptually, a Reporter is a *Reporting System*. Depending on the reporting requirements and the technical capabilities of the systems involved, the stakeholder acting as the Reporter may be a provider, provider organization, aggregator, or payer. Note that a system acting as a [Consumer](#consumer) in an Exchange scenario commonly acts as the Reporter in a subsequent Reporting scenario. See also [Receiver](#receiver).

{: #reporting-period}Reporting Period
  : The period of time defined by the reporting program for a set of data to be submitted.  This term is not used in this implementation guide to avoid confusion with program specific definitions. This can be equal to or a subset of the Measurement Period.

{: #server}Server
  : In the Gaps in Care Reporting scenarios, the system receiving the request for a Gaps in Care Report and producing it based on the information it holds. Depending on the reporting requirements and the technical capabilities of the systems involved, the stakeholder acting as the Server may be a healthcare agency, payer, quality improvement organization, or other aggregate-level stakeholder. For example, if a provider requests a report from a payer's system, the payer's system is the Server; if a payer requests a report from its own system, that system is the Server. See also [Client](#client).

{: #snapshot-update}Snapshot Update
  : In contrast to the Incremental Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains all the DEQM and QI-Core Profiles for each transaction.  If the [Consumer](#consumer) supports snapshot updates, the contents of the updated payload entirely replaces the previous payload.

{: #submission-period}Submission period
  : For this Implementation guide, submission period is the period of time in which data can exchanged when describing the FHIR transactions for data exchange, and measure reporting. The submission period typically overlaps with the measurement period and reporting period.

For additional definitions see the [eCQI Resource Center Glossary](https://ecqi.healthit.gov/glossary).

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
|dQM |Digital Quality Measure|
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

### Narrative Conformance

This table consolidates all conformance statements that are included in the narrative of the Implementation Guide.

§§§