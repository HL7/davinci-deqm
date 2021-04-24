
The Data Exchange For Quality Measures Implementation Guide was developed under the  [Davinci Project](#)


### Changes and Updates for version 0.2.0

1. Applied all resolutions from STU1 Ballot
1. Updated and Expanded the Background Section on the Clinical Quality Measures Ecosystem and how this guide fits into that Ecosystem.
1. Added Guidance on Measure Reporting
1. Added Use Cases for Colorectal Screening and Venous Thromboembolism Prophylaxis Measure Reporting

### Changes and Updates for version 1.0.0

The current official published version of the DEQM IG for FHIR STU3.

1. Applied all resolutions from May STU1 Ballot

### Changes and Updates for version 1.1.0

STU2 Ballot for FHIR R4 Version of the DEQM IG.

1. Creation of FHIR R4 version.
1. Additional examples

### Changes and Updates for version 2.0.0

The first official published version of the DEQM IG for FHIR R4.

1. Applied all resolutions from STU2 Ballot

    - Various Technical Corrections and Corrections to Typographical Errors
    - updated examples
    - Remove DEQM MedicationRequest ([FHIR-28137](https://jira.hl7.org/browse/FHIR-28137))
    - Add [example](Bundle-single-indv-vte-report-option7.html) for negation pattern ([FHIR-28137](https://jira.hl7.org/browse/FHIR-28137))
    - Add DEQM [Measure Scoring] Extension to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile ([FHIR-27044](https://jira.hl7.org/browse/FHIR-27044))
    - Add [`MeasureReport.improvementNotation`](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport.improvementNotation) to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile ([FHIR-27044](https://jira.hl7.org/browse/FHIR-27044))
    - Add Invariant [deqm-2](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport) to the DEQM Individual MeasureReport Profile and DEQM Summary MeasureReport Profile ([FHIR-27044](https://jira.hl7.org/browse/FHIR-27044))
    - Add Sections describing snapshot and incremental updates for data exchange for both [Submit Data](datax.html#submit-updates) and [Collect Data](datax.html#collect-updates) transactions ([FHIR-26076](https://jira.hl7.org/browse/FHIR-26076), [FHIR-26092](https://jira.hl7.org/browse/FHIR-26092), [FHIR-26079](https://jira.hl7.org/browse/FHIR-26079))
    - Add [Glossary](index.html#glossary) defining terms used in this implementation guide. ([FHIR-26087](https://jira.hl7.org/browse/FHIR-26087),[FHIR-26076](https://jira.hl7.org/browse/FHIR-26076),[FHIR-25523](https://jira.hl7.org/browse/FHIR-25523))
    - [Guidance](guidance.html#using-contained-resources-in-the-response-transaction) on using contained resources when transacting data ([FHIR-26304](https://jira.hl7.org/browse/FHIR-26304))
    - Additional [Preconditions and Assumptions](guidance.html#preconditions-and-assumptions) ([FHIR-26088](https://jira.hl7.org/browse/FHIR-26088), [FHIR-26086](https://jira.hl7.org/browse/FHIR-26086), [FHIR-26075](https://jira.hl7.org/browse/FHIR-26075))
    - Change [Practitioner Identifier OID](StructureDefinition-organization-deqm-definitions.html#Organization.identifier:ein) for Tax ID from ITIN to EIN ([FHIR-26613](https://jira.hl7.org/browse/FHIR-26613), [FHIR-26086](https://jira.hl7.org/browse/FHIR-26086))
    - Clarify how [much data is needed](indv-reporting.html#how-much-data-should-be-sent) for individual reporting ([FHIR-26090](https://jira.hl7.org/browse/FHIR-26090))
    - Clarify how [much data is needed](datax.html) for data exchange ([FHIR-26083](https://jira.hl7.org/browse/FHIR-26083))
    -  Clarify how data consumers [communicate data requirements](datax.html#collect-data ). ([FHIR-26084](https://jira.hl7.org/browse/FHIR-26084))
    - Clarify [negation pattern](guidance.html#negation-patterns-for-quality-measures) ([FHIR-26077](https://jira.hl7.org/browse/FHIR-26077))
    - Clarify [usage of correct measure version](datax.html) . ([FHIR-26081](https://jira.hl7.org/browse/FHIR-26081))
    - Clarify [discovery of data requirements](datax.html#gather-data-requirements-from-consumer)). ([FHIR-26085](https://jira.hl7.org/browse/FHIR-26085))
    - Clarify [stakeholders](datax.html) ([FHIR-26082](https://jira.hl7.org/browse/FHIR-26082))
    - Add [reference](index.html#introduction) to Da Vinci Guiding Principles ([FHIR-26078](https://jira.hl7.org/browse/FHIR-26078))
    - Add [implementer notes](StructureDefinition-indv-measurereport-deqm.html#mandatory-data-elements-and-terminology) to  DEQM Data-Exchange MeasureReport Profile  ([FHIR-26073](https://jira.hl7.org/browse/FHIR-26073))
    - Add [Practitioner Profile](StructureDefinition-practitioner-deqm.html) to accommodate CMS Certification Number identifier(CCN) and add CCN to [Organization Profile](StructureDefinition-organization-deqm.html) ([FHIR-25739](https://jira.hl7.org/browse/FHIR-25739))
    - Add [software name/version extension](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport.extension:vendor) to MeasureReport Profiles ([FHIR-25721](https://jira.hl7.org/browse/FHIR-25721))
    - Add required [`id`](StructureDefinition-summary-measurereport-deqm-definitions.html#MeasureReport.group.population.code) element to the MeasureReport profiles ([FHIR-25716](https://jira.hl7.org/browse/FHIR-25716))
    - [Document](datax.html#provenance) that $submit-data and $collect-data should support the use of the X-Provenance header ([FHIR-25624](https://jira.hl7.org/browse/FHIR-25624))
    - A extensions for [software and version](StructureDefinition-datax-measurereport-deqm-definitions.html#MeasureReport.extension:software) ([FHIR-25721](https://jira.hl7.org/browse/FHIR-25721))
    - Define [default profiles](guidance.html#default-profiles-used-in-the-evaluation-of-a-measure) for this implementation guide ([FHIR-27818](https://jira.hl7.org/browse/FHIR-27818))
    - Add [`MeasureReport.group.population.count` as 0..1 Must Support](StructureDefinition-indv-measurereport-deqm.html#profile) for individual report profile. ([FHIR-27862](https://jira.hl7.org/browse/FHIR-27862))
    - Add [guidance on standard error response](datax.html#usage-1) to the various transactions described in the framework. ([FHIR-18720](https://jira.hl7.org/browse/FHIR-18720))
    - Clarified retrospective reporting definition ([FHIR-28993](https://jira.hl7.org/browse/FHIR-28993))

### Changes and Updates for version 2.1.0

STU3 Ballot for FHIR R4 Version of the DEQM IG.

1. Added content for Gaps in Care Reporting
    - Updated Home Page about Gaps in Care Reporting and added new glossary and acronym
    - Updated General Guidance about Gaps in Care Reporting
    - Added Gaps In Care Reporting page under Framework
    - Added Gaps In Care page under Example Use Cases
    - Updated Profiles/Extensions page under FHIR Artifacts adding new profiles and extension defined for Gaps in Care
    - Added Operations page under FHIR Artifacts listing care-gaps operation defined for Gaps in Care
    - Updated Terminology page under FHIR Artifacts adding new code system and value sets defined for Gaps in Care
    - Updated capability statements under FHIR Artifacts adding new capability statements defined for Gaps in Care
    - Updated Examples page with new examples created for Gaps in Care
    - Updated Downloads page with new schematrons for Gaps in Care

### Changes and Updates for version 3.0.0

The second official published version of the DEQM IG for FHIR R4.

1. Applied all resolutions from STU3 Ballot
    - Various Technical Corrections and Corrections to Typographical Errors
    - Updated the Introduction section in Gaps In Care Reporting. ([FHIR-28956](https://jira.hl7.org/browse/FHIR-28956)),([FHIR-28958](https://jira.hl7.org/browse/FHIR-28958)),([FHIR-28959](https://jira.hl7.org/browse/FHIR-28959)) ,([FHIR-28960](https://jira.hl7.org/browse/FHIR-28960)),([FHIR-28961](https://jira.hl7.org/browse/FHIR-28961)),([FHIR-28962](https://jira.hl7.org/browse/FHIR-28962)),([FHIR-28963](https://jira.hl7.org/browse/FHIR-28963)),([FHIR-28974](https://jira.hl7.org/browse/FHIR-28974)),([FHIR-28981](https://jira.hl7.org/browse/FHIR-28981)),([FHIR-28982](https://jira.hl7.org/browse/FHIR-28982)),([FHIR-28983](https://jira.hl7.org/browse/FHIR-28983)),([FHIR-28984](https://jira.hl7.org/browse/FHIR-28984)),([FHIR-28985](https://jira.hl7.org/browse/FHIR-28985)),([FHIR-28986](https://jira.hl7.org/browse/FHIR-28986)),([FHIR-28987](https://jira.hl7.org/browse/FHIR-28987)),([FHIR-28988](https://jira.hl7.org/browse/FHIR-28988)),([FHIR-28989](https://jira.hl7.org/browse/FHIR-28989)),([FHIR-28990](https://jira.hl7.org/browse/FHIR-28990)),([FHIR-28991](https://jira.hl7.org/browse/FHIR-28991)),([FHIR-29009](https://jira.hl7.org/browse/FHIR-29009)),([FHIR-29010](https://jira.hl7.org/browse/FHIR-29010)),([FHIR-29011](https://jira.hl7.org/browse/FHIR-29011)),([FHIR-29020](https://jira.hl7.org/browse/FHIR-29020)),([FHIR-29021](https://jira.hl7.org/browse/FHIR-29021)),([FHIR-29022](https://jira.hl7.org/browse/FHIR-29022)),([FHIR-28964](https://jira.hl7.org/browse/FHIR-28964)),([FHIR-28992](https://jira.hl7.org/browse/FHIR-28992), ([FHIR-28960](https://jira.hl7.org/browse/FHIR-28960))
    - Created links for Gaps in Care terminology to Glossary. ([FHIR-28955](https://jira.hl7.org/browse/FHIR-28955))
    - Clarified the description in Figure 1-5. ([FHIR-29005](https://jira.hl7.org/browse/FHIR-29005)), ([FHIR-29006](https://jira.hl7.org/browse/FHIR-29006)), ([FHIR-29007](https://jira.hl7.org/browse/FHIR-29007))
    - Specified that workflow to get the data for the report is not specified by this implementation guide. ([FHIR-28487](https://jira.hl7.org/browse/FHIR-28487))
    - Clarified Gaps through period in the figures and glossary. ([FHIR-28972](https://jira.hl7.org/browse/FHIR-28972))
    - Defined "smoking gun" (historical term) and revised with similar clarification text. ([FHIR-28980](https://jira.hl7.org/browse/FHIR-28980))
    - Added link to CMS Measure used in care gap reporting documentation. ([FHIR-28995](https://jira.hl7.org/browse/FHIR-28995))
    - Clarified why the payer did not have the colonoscopy in their files. ([FHIR-28996](https://jira.hl7.org/browse/FHIR-28996))
    - Explained that a claim would close the gap but the provider could chose to send the colonscopy report to close the gap as well. ([FHIR-28997](https://jira.hl7.org/browse/FHIR-28997))
    - Fixed link to usecases.html page. ([FHIR-29000](https://jira.hl7.org/browse/FHIR-29000))
    - Added Figure 2-15 to represent Retrospectice and Prospective reporting periods. ([FHIR-29008](https://jira.hl7.org/browse/FHIR-29008))
    - Clarified Payer and Measure Analytic Systems in diagrams 2-13 and 2-14. ([FHIR-29013](https://jira.hl7.org/browse/FHIR-29013))
    - Clarified that any of the Serialized Formats for bulk can be used.  Also corrected FHIR JSON to FHIR+NDJSON. ([FHIR-29016](https://jira.hl7.org/browse/FHIR-29016))
    - Clarified the MeasureReport.date to be the date the report was calculated. ([FHIR-29018](https://jira.hl7.org/browse/FHIR-29018))
    - Updated examples.


    **Profile Changes:**
    - Changed the DEQM Gaps In Care Composition Profile to reference 1..* DEQM Gaps In Care DetectedIssue instead of 0..* ([FHIR-29017](https://jira.hl7.org/browse/FHIR-29017)),  ([FHIR-29012](https://jira.hl7.org/browse/FHIR-29012))
    - Noted in DEQM Gaps in Care Composition Profile that the date range for the Gaps in Care report is specified using the period element in the DEQM Individual MeasureReport Profile. ([FHIR-28971](https://jira.hl7.org/browse/FHIR-28971))
    - Added a modifier extension gapStatus to the DEQM Gaps In Care DetectedIssue profile. ([FHIR-29017](https://jira.hl7.org/browse/FHIR-29017)),  ([FHIR-29012](https://jira.hl7.org/browse/FHIR-29012))
    - Updated code in Composition.type to the Gaps in Care Report code now assigned by LOINC.([FHIR-29828](https://jira.hl7.org/browse/FHIR-29828))
    - Changed patient to 1..1 in DEQM Gaps in Care DetectedIssue profile. ([FHIR-28439](https://jira.hl7.org/browse/FHIR-28439))
    - Claried that the reference to the MeasureReport allows linkage to the FHIR Measure resource in DEQM Gaps in Care DetectedIssue profile . ([FHIR-28973](https://jira.hl7.org/browse/FHIR-28973))
    - DetectedIssue.evidence.detail changed to allow MeasureReport or Guidance resource to be Referenced. ([FHIR-28486](https://jira.hl7.org/browse/FHIR-28486))
    - Updated the DetectedIssue resource to say it may also be used to report details on the open gaps identified and mitigation steps for addressing them. ([FHIR-28978](https://jira.hl7.org/browse/FHIR-28978))
    - Added a new CAREGAP code to  http://terminology.hl7.org/CodeSystem/v3-ActCode. ([FHIR-31067](https://jira.hl7.org/browse/FHIR-31067))
    - Removed DEQM Gaps in Care Individual MeasureReport profile that was in the STU3 Ballot version. Added the extension-populationReference to the DEQM Individual MeasureReport profile instead.  This extension-populationReference SHOULD reference population criteria id specified in a Measure resource. ([FHIR-28497](https://jira.hl7.org/browse/FHIR-28497))
    - Updated the DEQM Individual and Summary MeasureReport.reporter to be "Organization that generated the report". ([FHIR-28484](https://jira.hl7.org/browse/FHIR-28484))
    - Added documentation to reference populationReference extension and explaining how to use. ([FHIR-28497](https://jira.hl7.org/browse/FHIR-28497))
    - Added description on improvementNotation ([FHIR-28969](https://jira.hl7.org/browse/FHIR-28969))


   **care-gap operation updates**
    - Changed care-gaps operation to allow 3 parameters to specify measure -  id, url, identifier. ([FHIR-28483](https://jira.hl7.org/browse/FHIR-28483))
    - Updated care-gaps operation practitioner and organization input parameters to be a string(reference). ([FHIR-28966](https://jira.hl7.org/browse/FHIR-28966))
    - On care-gaps operation, noted that the type of this parameter is a string with a search type of token so that the coding value can be provided as part of a URL and the operation can be invoked using GET.". ([FHIR-28967](https://jira.hl7.org/browse/FHIR-28967))
    - Added examples to care-gaps operation page. ([FHIR-28968](https://jira.hl7.org/browse/FHIR-28968))
    - Clarified that because more than 1 bundle may be returned, the parameters are always required. ([FHIR-28496](https://jira.hl7.org/browse/FHIR-28496))
    - Clarified that the caller of the care-gaps operations SHALL use specified parameters. ([FHIR-28965](https://jira.hl7.org/browse/FHIR-28965))
    - Changed to the Da Vinci ATR Implementation Guide is one way to represent groups to be used for input. ([FHIR-28374](https://jira.hl7.org/browse/FHIR-28374)), ([FHIR-31065](https://jira.hl7.org/browse/FHIR-31065))



1. Applied resolutions for non-STU3 ballot DEQM trackers
    - Corrected typo. ([FHIR-29637](https://jira.hl7.org/browse/FHIR-29637))
    - Clarified that the data included in a report will be based on the date the report is run. ([FHIR-28953](https://jira.hl7.org/browse/FHIR-28953))
    - Updated MedicationAdministration Profile to explain this is an example of how you can use a profile instead of a Measure's CQL to constrain data used in a Measure.  Discussed the pro's and cons of each method. ([FHIR-29560](https://jira.hl7.org/browse/FHIR-29560))
    - Changed MeasurePopulationType binding to extensible. ([FHIR-30407](https://jira.hl7.org/browse/FHIR-30407))
    - Added extension-reporterGroup to DEQM Individual MeasureReport and DEQM Data Exchange MeasureReport. ([FHIR-29411](https://jira.hl7.org/browse/FHIR-29411))
    - Changed Colorectal Screening example page to use DEQM Data Exchange MeasureReport profile. ([FHIR-29561](https://jira.hl7.org/browse/FHIR-29561))
    - Updated parameter name in MRP example to "measureReport". ([FHIR-30075](https://jira.hl7.org/browse/FHIR-30075))
    - Explained Relationship of Measure and MeasureReport Resources. ([FHIR-28373](https://jira.hl7.org/browse/FHIR-28373))
    - Updated outdated Figures 3-1 and 3-2. ([FHIR-31881](https://jira.hl7.org/browse/FHIR-31881))
    - Updated outdated Figures 3-5, 3-6, 3-7, and 3-8. ([FHIR-31882](https://jira.hl7.org/browse/FHIR-31882))
    - Simplified the Conformance Requirement 1 language for $care-gaps. ([FHIR-31902](https://jira.hl7.org/browse/FHIR-31902))
    - Updated 2.1.7 Must Support. ([FHIR-31961](https://jira.hl7.org/browse/FHIR-31961))

{% include link-list.md %}
