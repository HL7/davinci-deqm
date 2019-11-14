[^1]: Clinical Quality Measures Basics. Retrieved from <https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures.html>
[^2]: Suarez, W., Sethi, K., Craig, P., (February 20, 2017). Health IT Enabled Quality Measurement and Improvement: The HL7 Clinical Quality Information Workgroup. Retrieved from <https://www.hl7.org/documentcenter/public_temp_6C1C8F48-1C23-BA17-0C77FDFC69A7B6F1/calendarofevents/himss/2017/Health%20IT%20Enabled%20Quality%20Measurement%20and%20Improvement_The%20HL7%20Clinical%20Quality%20Work%20Group.pdf>
[^3]: Health IT Enabled Quality Improvement - A Vision to Achieve Better Health and Health Care. Retrieved from <https://www.healthit.gov/sites/default/files/HITEnabledQualityImprovement-111214.pdf>
[^4]: Adapting Clinical Guidelines for the Digital Age. Retrieved from <https://www.cdc.gov/ddphss/clinical-guidelines/index.html>
[^5]: May includes DEQM defined code systems and externally defined code systems
[^6]: This extension not needed because the data element is an element in the R4 Measure Resource.
[^8]: Changes to the QI-Core Observation and Task profiles are being proposed based on the HEDIS Task and Observation profiles that may lead to these profiles being replaced by the QI Core profiles.
[^9]: Changes to QI Core and US Core Organization and Practitioner  profiles are being proposed based on the DEQM Organization and Practitioner profiles that may lead to this profiles being replaced by the QI Core profile.
[^10]: HEDIS measures referenced are *example content only* for the purposes of working through standards. Organizations should not be using the HEDIS specified measures for the actual measurement.
[$collect-data]: OperationDefinition-collect-data.html "The effect of invoking this operation is to gather the data required to perform an evaluation of the measure."
[$data-requirements]: {{site.data.fhir.path}}measure-operations.html#data-requirements "The data-requirements operation aggregates and returns the parameters and data requirements for the measure and all its dependencies as a single module definition"
[$submit-data]:OperationDefinition-submit-data.html "The effect of invoking this operation is to gather the data required to perform an evaluation of the measure."
[Argonaut Clinical Data Subscriptions]: https://argonautwiki.hl7.org/Argonaut_2019_Projects#Clinical_Data_Subscriptions
[Capability statements]: capstatements.html
[CDS Hooks]: https://cds-hooks.org/
[Certification Identifier]: StructureDefinition-extension-certificationIdentifier.html
[Clinical Decision Support (CDS)]: http://www.hl7.org/Special/committees/dss/index.cfm
[Clinical Quality Framework]: http://wiki.hl7.org/index.php?title=Clinical_Quality_Framework&oldid=158051
[Clinical Quality Information (CQI)]: http://www.hl7.org/Special/committees/cqi/index.cfm
[CMS 108v7]: https://ecqi.healthit.gov/ecqm/measures/cms108v7
[COL Collect Data Operation]: col.html#data-exchange-using-the-collect-data-operation
[Colorectal Cancer Screening (COL)]: col.html
[Conformance Requirements for Client]: CapabilityStatement-client.html "Conformance Requirements for Client Page"
[Conformance Requirements for Server]: CapabilityStatement-server.html "Conformance Requirements for Server Page"
[CPG-on-FHIR]: http://www.hl7.org/fhir/uv/cpg/history.cfml
[CQFM Library]: {{site.cqfm_r3}}StructureDefinition-library-cqfm.html
[CQFM Measure]: {{site.cqfm_r3}}StructureDefinition-measure-cqfm.html
[Da Vinci]: http://www.hl7.org/about/davinci/index.cfm?ref=common
[Data Collection Type]: StructureDefinition-extension-dataCollectionType.html
[Alternate Score Type]: StructureDefinition-extension-alternateScoreType.html
[Data Exchange]: datax.html
[DEQM Coverage]: StructureDefinition-coverage-deqm.html
[DEQM Data Collection Type Extension]: StructureDefinition-extension-dataCollectionType.html
[DEQM Data Exchange MeasureReport Profile]: StructureDefinition-datax-measurereport-deqm.html
[DEQM DeviceRequest]: StructureDefinition-devicerequest-deqm.html
[DEQM DeviceUseStatement]: StructureDefinition-deviceusestatement-deqm.html
[DEQM Individual MeasureReport Profile]: StructureDefinition-indv-measurereport-deqm.html
[DEQM MedicationAdministration]: StructureDefinition-medicationadministration-deqm.html
[DEQM MedicationRequest]: StructureDefinition-medicationrequest-deqm.html
[DEQM Organization]: StructureDefinition-organization-deqm.html
[DEQM Practitioner]: StructureDefinition-practitioner-deqm.html
[DEQM Summary MeasureReport Profile]: StructureDefinition-summary-measurereport-deqm.html
[Do Not Perform]: StructureDefinition-extension-doNotPerform.html
[Downloads]: downloads.html "Downloads Page"
[eCR]: http://www.hl7.org/fhir/us/ecr/history.cfml
[Extensions]: profiles.html#extensions "Profiles and Extensions Page"
[FHIR operations]: {{site.r4}}operations.html "Extended Operations on the RESTful API"
[FHIR Version 3.0.2]: {{site.data.fhir.path}}index.html "FHIR Specification Home Page"
[Framework]: framework.html
[General Guidance]: guidance.html  "General Guidance Page"
[HEDIS Colorectal Cancer Screening/CMS130]: {{site.hedis_r3}}cql/stu3/col-logic.cql.html
[HEDIS Measure Description for Colorectal Cancer Screening]: {{site.hedis_r3}}cql/stu3/col-logic.cql.html
[HEDIS MRP Measure]: {{site.hedis_r3}}Measure-measure-mrp.html
[HEDIS MRP Observation]: {{site.hedis_r3}}hedis-observation.html
[HEDIS MRP Task]: {{site.hedis_r3}}hedis-task.html
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
[Not Done]: {{site.data.fhir.path}}extension-event-notdone.html
[NQF Measure Description for Colorectal Cancer Screening]: http://www.qualityforum.org/QPS/MeasureDetails.aspx?standardID=394&print=0&entityTypeID=1
[Operations]: operations.html "Operations Page"
[Profiles and Extensions]: profiles.html#profiles "Profiles and Extensions Page"
[Profiles]: profiles.html#profiles "Profiles and Extensions Page"
[QI Core *Must Support*]: {{site.qi_r3}}index.html#mustsupport "QI Core definition of *Must Support*"
[QI Core Condition]: {{site.qi_r3}}StructureDefinition-qicore-condition.html
[QI Core Coverage]: {{site.qi_r3}}StructureDefinition-qicore-coverage.html
[QI Core DiagnosticReport]:{{site.qi_r3}}StructureDefinition-qicore-diagnosticreport.html
[QI Core Encounter]: {{site.qi_r3}}StructureDefinition-qicore-encounter.html
[QI Core Location]: {{site.qi_r3}}StructureDefinition-qicore-location.html
[QI Core Observation]: {{site.qi_r3}}StructureDefinition-qicore-observation.html
[QI Core Patient]: {{site.qi_r3}}StructureDefinition-qicore-patient.html
[QI Core Procedure]: {{site.qi_r3}}StructureDefinition-qicore-procedure.html
[QI Core ProcedureRequest]: {{site.qi_r3}}StructureDefinition-qicore-procedurerequest.html
[QI Core Task]: {{site.qi_r3}}StructureDefinition-qicore-task.html
[QI Core Profiles]: {{site.qi_r3}}index.html
[QI Core]: {{site.qi_r3}}index.html
[QRDA]: https://ecqi.healthit.gov/qrda-quality-reporting-document-architecture
[Quality Measure Implementation Guide]: {{site.cqfm_r3}}index.html
[Quality Reporting]: {{site.r4}}clinicalreasoning-quality-reporting.html
[Reference Any]: StructureDefinition-extension-referenceAny.html
[Reporting Individual Data]: {{site.r4}}/clinicalreasoning-quality-reporting.html#reporting-individual-data
[Reporting Vendor]: StructureDefinition-extension-reportingVendor.html
[Reporting Group]: StructureDefinition-extension-reportingOrganizationGroup.html
[SMART App Launch]: http://www.hl7.org/fhir/smart-app-launch/history.cfml
[SMART backend services]: http://www.hl7.org/fhir/uv/bulkdata/history.cfml
[Subscription]: {{site.data.fhir.path}}subscription.html
[Summary Measure Reporting Interactions]: summary-reporting.html
[Summary Reporting]: summary-reporting.html
[Terminology]: terminology.html "Terminology Page"
[transaction]: {{site.data.fhir.path}}http.html#transaction
[US Core]: http://hl7.org/fhir/us/core/index.html
[Use cases]: usecases.html
[Venous Thromboembolism Prophylaxis (VTE-1)]: vte1.html
[Colorectal Cancer Screening Recommendation Statement]: https://ecqi.healthit.gov/sites/default/files/ecqm/measures/CMS130v6.html
[Bundles]: {{site.data.fhir.path}}bundle.html
[following rules]: {{site.data.fhir.path}}references.html#contained
[negation patterns in quality measurements]: {{cqfm_r3}}using-cql.html
[Valueset Reference]: {{site.data.fhir.path}}extension-valueset-reference.html
