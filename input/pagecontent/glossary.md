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
  : In contrast to the Snapshot Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains only the new and updated DEQM and QI-Core Profiles since the last transaction. If the Consumer supports incremental updates, the contents of the updated payload updates the previous payload data.

{: #inverse-measure}Inverse Measure
  : A lower calculated performance rate for this measure indicates better clinical care or control. The Diabetes: Hemoglobin A1c (HbA1c) Poor Control (>9%) measure is an example of inverse measure.

{: #measurement-period}Measurement Period
  : The period of time which a measure will be calculated.  It is defined by the measure (In FHIR represented by the element `Measure.effectivePeriod`).

{: #open-gap}Open Gap
  : A discrepancy exists between recommended best practices and the services that are actually provided and documented. For example, individuals missing colonoscopy or other screening tests as specified in the Colorectal Cancer Screening measure based on their age groups. For a positive measure, open gaps are identified if an individual is not in the numerator population as specified by the measure. For an inverse measure, open gaps are identified if an individual is in the numerator population as specified by the measure.

{: #positive-measure}Positive Measure
  : A higher calculated performance rate for this measure indicates better clinical care or control. The Colorectal Cancer Screening measure is an example of positive measure.

{: #prospective-gap}Prospective Gap
  : A discrepancy will exist in the future between recommended best practices and the services that are actually provided and documented unless actions are taken to provide recommended best practices and document before it becomes an open gap.  A previously identified prospective gap may become closed if actions were taken to close the prospective gap, or it may become open if actions are not taken to close it.

{: #reporting-period}Reporting Period
  : The period of time defined by the reporting program for a set of data to be submitted.  This term is not used in this implementation guide to avoid confusion with program specific definitions. This can be equal to or a subset of the Measurement Period.

{: #snapshot-update}Snapshot Update
  : In contrast to the Incremental Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains all the DEQM and QI-Core Profiles for each transaction.  If the Consumer supports snapshot updates, the contents of the updated payload entirely replaces the previous payload.

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
