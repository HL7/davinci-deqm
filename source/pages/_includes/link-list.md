[^1]: Clinical Quality Measures Basics. Retrieved from <https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures.html>
[^2]: Suarez, W., Sethi, K., Craig, P., (February 20, 2017). Health IT Enabled Quality Measurement and Improvement: The HL7 Clinical Quality Information Workgroup. Retrieved from <https://www.hl7.org/documentcenter/public_temp_6C1C8F48-1C23-BA17-0C77FDFC69A7B6F1/calendarofevents/himss/2017/Health%20IT%20Enabled%20Quality%20Measurement%20and%20Improvement_The%20HL7%20Clinical%20Quality%20Work%20Group.pdf>
[^3]: Health IT Enabled Quality Improvement - A Vision to Achieve Better Health and Health Care. Retrieved from <https://www.healthit.gov/sites/default/files/HITEnabledQualityImprovement-111214.pdf>
[^4]: Adapting Clinical Guidelines for the Digital Age. Retrieved from <https://www.cdc.gov/ddphss/clinical-guidelines/index.html>
[^5]: May includes DEQM defined code systems and externally defined code systems
[^6]: This extension not needed because the data element is an element in the R4 Measure Resource.
[^8]: Changes to the QI-Core Observation and Task profiles are being proposed based on the HEDIS Task and Observation profiles that may lead to these profiles being replaced by the QI Core profiles.
[^9]: Changes to QI Core and US Core Organization and Practitioner  profiles are being proposed based on the DEQM Organization and Practitioner profiles that may lead to this profiles being replaced by the QI Core profile.
[^10]: HEDIS measures referenced are *example content only* for the purposes of working through standards. Organizations should not be using the HEDIS specified measures for the actual measurement.
[$collect-data (R4)]: {{site.r4}}measure-operation-collect-data.html "The effect of invoking this operation on a Measure instance endpoint is to POST a collection of resources needed for reporting a measure"
[$collect-data (STU3)]: OperationDefinition-collect-data.html "The effect of invoking this operation is to gather the data required to perform an evaluation of the measure."
[$data-requirements (R4)]: {{site.r4}}measure-operation-data-requirements.html "The data-requirements operation aggregates and returns the parameters and data requirements for the measure and all its dependencies as a single module definition"
[$data-requirements (STU3)]: {{site.r3}}measure-operations.html#data-requirements "The data-requirements operation aggregates and returns the parameters and data requirements for the measure and all its dependencies as a single module definition"
[$submit-data (R4)]:{{site.r4}}measure-operation-submit-data.html "The effect of invoking this operation is to gather the data required to perform an evaluation of the measure."
[$submit-data (STU3)]:OperationDefinition-submit-data.html "The effect of invoking this operation is to gather the data required to perform an evaluation of the measure."
[Argonaut Clinical Data Subscriptions]: https://argonautwiki.hl7.org/Argonaut_2019_Projects#Clinical_Data_Subscriptions
[Capability statements]: capstatements.html
[CDS Hooks]: https://cds-hooks.org/
[Certification Identifier (R4)]: r4todo.html
[Certification Identifier (STU3)]: StructureDefinition-extension-certificationIdentifier.html
[Clinical Decision Support (CDS)]: http://www.hl7.org/Special/committees/dss/index.cfm
[Clinical Quality Framework]: http://wiki.hl7.org/index.php?title=Clinical_Quality_Framework&oldid=158051
[Clinical Quality Information (CQI)]: http://www.hl7.org/Special/committees/cqi/index.cfm
[CMS 108v7]: https://ecqi.healthit.gov/ecqm/measures/cms108v7
[COL Collect Data Operation]: col.html#data-exchange-using-the-collect-data-operation
[Colorectal Cancer Screening (COL)]: col.html
[Conformance Requirements for Client]: CapabilityStatement-client.html "Conformance Requirements for Client Page"
[Conformance Requirements for Server]: CapabilityStatement-server.html "Conformance Requirements for Server Page"
[CPG-on-FHIR]: http://www.hl7.org/fhir/uv/cpg/history.cfml
[CQFM Library (R4)]: r4todo.html
[CQFM Library (STU3)]: {{site.cqfm_r3}}StructureDefinition-library-cqfm.html
[CQFM Measure (R4)]: r4todo.html
[CQFM Measure (STU3)]: {{site.cqfm_r3}}StructureDefinition-measure-cqfm.html
[Da Vinci]: http://www.hl7.org/about/davinci/index.cfm?ref=common
[Data Collection Type (STU3)]: StructureDefinition-extension-dataCollectionType.html
[Data Exchange]: datax.html
[DEQM Coverage (R4)]: r4todo.html
[DEQM Coverage (STU3)]: StructureDefinition-coverage-deqm.html
[DEQM Data Collection Type Extension]: StructureDefinition-extension-dataCollectionType.html
[DEQM Data Exchange MeasureReport Profile (R4)]: r4todo.html
[DEQM Data Exchange MeasureReport Profile (STU3)]: StructureDefinition-datax-measurereport-deqm.html
[DEQM Data-Exchange MeasureReport Profile]: profiles.html#profiles
[DEQM DeviceRequest (R4)]: r4todo.html
[DEQM DeviceRequest (STU3)]: StructureDefinition-devicerequest-deqm.html
[DEQM DeviceUseStatement (R4)]: r4todo.html
[DEQM DeviceUseStatement (STU3)]: StructureDefinition-deviceusestatement-deqm.html
[DEQM Individual MeasureReport Profile (R4)]: r4todo.html
[DEQM Individual MeasureReport Profile (STU3)]: StructureDefinition-indv-measurereport-deqm.html
[DEQM Individual MeasureReport Profile]: profiles.html#profiles
[DEQM MedicationAdministration (R4)]: r4todo.html
[DEQM MedicationAdministration (STU3)]: StructureDefinition-medicationadministration-deqm.html
[DEQM MedicationRequest (R4)]: r4todo.html
[DEQM MedicationRequest (STU3)]: StructureDefinition-medicationrequest-deqm.html
[DEQM Organization (R4)]: r4todo.html
[DEQM Organization (STU3)]: StructureDefinition-organization-deqm.html
[DEQM Practitioner (R4)]: r4todo.html
[DEQM Practitioner (STU3)]: StructureDefinition-practitioner-deqm.html
[DEQM Summary MeasureReport Profile (R4)]: r4todo.html
[DEQM Summary MeasureReport Profile (STU3)]: StructureDefinition-summary-measurereport-deqm.html
[DEQM Summary MeasureReport Profile]: profiles.html#profiles
[Do Not Perform (R4)]: {{site.r4}}extension-request-doNotPerform.html
[Do Not Perform (STU3)]: StructureDefinition-extension-doNotPerform.html
[Downloads]: downloads.html "Downloads Page"
[eCR]: http://www.hl7.org/fhir/us/ecr/history.cfml
[Extensions]: profiles.html#extensions "Profiles and Extensions Page"
[FHIR operations]: {{site.r4}}operations.html "Extended Operations on the RESTful API"
[FHIR Version 3.0.1]: {{site.data.fhir.path}}index.html "FHIR Specification Home Page"
[Framework]: framework.html
[General Guidance]: guidance.html  "General Guidance Page"
[HEDIS Colorectal Cancer Screening/CMS130]: {{site.hedis_r3}}cql/stu3/col-logic.cql.html
[HEDIS Measure Description for Colorectal Cancer Screening]: {{site.hedis_r3}}cql/stu3/col-logic.cql.html
[HEDIS MRP Measure (R4)]: r4todo.html
[HEDIS MRP Measure (STU3)]: {{site.hedis_r3}}Measure-measure-mrp.html
[HEDIS MRP Observation (R4)]: r4todo.html
[HEDIS MRP Observation (STU3)]: {{site.hedis_r3}}hedis-observation.html
[HEDIS MRP Task (R4)]: r4todo.html
[HEDIS MRP Task (STU3)]: {{site.hedis_r3}}hedis-task.html
[HEDIS]: {{site.hedis_r3}}index.html
[Home]: index.html "Home Page"
[Individual Measure Reporting Interactions]: indv-reporting.html
[Individual Reporting]: indv-reporting.html
[Infobutton]: http://www.openinfobutton.org/
[Measure Observation]: StructureDefinition-observation-measure.html
[Measure Task]: StructureDefinition-task-measure.html
[Measure]: {{site.data.fhir.path}}measure.html
[MeasureReport]: {{site.data.fhir.path}}measurereport.html
[Medication Reconciliation (MRP)]: mrp.html
[Medication Reconciliation Post-Discharge (MRP)]: mrp.html
[MRP Individual MeasureReport]: mrp.html#individual-measurereport
[MRP Submit Data Operation]: mrp.html#data-exchange-using-the-submit-data-operation
[Must Support]: guidance.html#must-support "DEQM Core definition of *Must Support*"
[Not Done (R4)]: r4todo.html
[Not Done (STU3)]: {{site.data.fhir.path}}extension-event-notdone.html
[NQF Measure Description for Colorectal Cancer Screening]: http://www.qualityforum.org/QPS/MeasureDetails.aspx?standardID=394&print=0&entityTypeID=1
[Operations]: operations.html "Operations Page"
[Profiles and Extensions]: profiles.html#profiles "Profiles and Extensions Page"
[Profiles]: profiles.html#profiles "Profiles and Extensions Page"
[QI Core *Must Support*]: {{site.qi_r3}}index.html#mustsupport "QI Core definition of *Must Support*"
[QI Core Condition (R4)]: r4todo.html
[QI Core Condition (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-condition.html
[QI Core Coverage (R4)]: r4todo.html
[QI Core Coverage (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-coverage.html
[QI Core DiagnosticReport (R4)]: r4todo.html
[QI Core DiagnosticReport (STU3)]:{{site.qi_r3}}StructureDefinition-qicore-diagnosticreport.html
[QI Core Encounter (R4)]: r4todo.html
[QI Core Encounter (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-encounter.html
[QI Core Location (R4)]: r4todo.html
[QI Core Location (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-location.html
[QI Core Observation (R4)]: r4todo.html
[QI Core Observation (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-observation.html
[QI Core Patient (R4)]: r4todo.html
[QI Core Patient (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-patient.html
[QI Core Procedure (R4)]: r4todo.html
[QI Core Procedure (STU3)]: {{site.qi_r3}}StructureDefinition-qicore-procedure.html
[QI Core Profiles]: {{site.qi_r3}}index.html
[QI Core]: {{site.qi_r3}}index.html
[QRDA Category 1 report]: https://ecqi.healthit.gov/qrda-quality-reporting-document-architecture
[QRDA Category 2 report]: https://ecqi.healthit.gov/qrda-quality-reporting-document-architecture
[QRDA Category 3 report]: https://ecqi.healthit.gov/qrda-quality-reporting-document-architecture
[Quality Measure Implementation Guide]: {{site.cqfm_r3}}index.html
[Quality Reporting]: {{site.r4}}clinicalreasoning-quality-reporting.html
[Reference Any (STU3)]: StructureDefinition-extension-referenceAny.html
[Reporting Individual Data]: {{site.r4}}/clinicalreasoning-quality-reporting.html#reporting-individual-data
[Reporting Vendor (R4)]: r4todo.html
[Reporting Vendor (STU3)]: StructureDefinition-extension-reportingVendor.html
[SMART App Launch]: http://www.hl7.org/fhir/smart-app-launch/history.cfml
[SMART backend services]: http://www.hl7.org/fhir/uv/bulkdata/history.cfml
[Subscription]: {{site.data.fhir.path}}subscription.html
[Summary Measure Reporting Interactions]: summary-reporting.html
[Summary Reporting]: summary-reporting.html
[Terminology]: terminology.html "Terminology Page"
[transaction interaction]: {{site.data.fhir.path}}http.html#transaction
[US Core]: http://hl7.org/fhir/us/core/index.html
[Use cases]: usecases.html
[Venous Thromboembolism Prophylaxis (VTE-1)]: vte1.html
[Colorectal Cancer Screening (PDQ®)–Health Professional Version]: https://www.cancer.gov/types/colorectal/hp/colorectal-screening-pdq
[Colorectal Cancer Screening (PDQ®)-Patient Version]: https://www.cancer.gov/types/colorectal/patient/colorectal-screening-pdq
