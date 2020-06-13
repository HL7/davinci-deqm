---
## jekyll header
name: change-notes
title: Change notes
layout: default
---

The Data Exchange For Quality Measures Implementation Guide was developed under the  [Davinci Project](#)


Changes and Updates for version 0.2.0

1. Applied all resolutions from STU1 Ballot
1. Updated and Expanded the Background Section on the Clinical Quality Measures Ecosystem and how this guide fits into that Ecosystem.
1. Added Guidance on Measure Reporting
1. Added Use Cases for Colorectal Screening and Venous Thromboembolism Prophylaxis Measure Reporting

Changes and Updates for version 1.0.0

1. Applied all resolutions from May STU1 Ballot

Changes and Updates for version 1.1.0

1. Creation of FHIR R4 version.
1. Additional examples

Changes and Updates for version 1.1.1

1. Applied all resolutions from STU2 Ballot

   - Various Technical Corrections and Corrections to Typographical Errors
   - Add DEQM [Measure Scoring] Extension to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile (FHIR-27044)
   - Add [`MeasureReport.improvementNotation`](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport.improvementNotation) to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile (FHIR-27044)
   - Add Invariant [deqm-2](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport) to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile (FHIR-27044)
   - Add Sections describing snapshot and incremental updates for data exchange for both [Submit Data](datax.html#submit_updates) and [Collect Data](datax.html#colect_updates) transactions (FHIR-26076, FHIR-26092, FHIR-26079)
   - Add [Glossary](index.html#glossary) defining terms used in this implementation guide. (FHIR-26087,FHIR-26076,FHIR-25523)
  - [Guidance](guidance.html#using-contained-resources-in-the-response-transaction) on using contained resources when transacting data (FHIR-26304)
  - Additional [Preconditions and Assumptions](guidance.html#preconditions-and-assumptions) (FHIR-26088, FHIR-26086)
  - Change [Practitioner Identifier OID](StructureDefinition-organization-deqm-definitions.html#Organization.identifier:ein) for Tax ID from ITIN to EIN (FHIR-26613, FHIR-26086)
  - Clarify how [much data is needed](indv-reporting.html#how-much-data-should-be-sent) for individual reporting (FHIR-26090)
  - Clarify how [much data is needed](datax.html#data-exchange) for data exchange (FHIR-26083)
  -  Clarify how data consumers [communicate data requirements](datax.html#collect-data ). (FHIR-26084)
  - Clarify [negation pattern](guidance.html#negation-patterns-for-quality-measures) (FHIR-26077)
  - Clarify [usage of correct measure version](datax.html#data-exchange) . (FHIR-26081)
  - Clarify discovery of data requirements(datax.html#(#gather-data-requirements-from-consumer)). (FHIR-26085)
  - Clarify [stakeholders](datax.html#data-exchange) (FHIR-26082)
