
The Data Exchange For Quality Measures Implementation Guide was developed under the  [Davinci Project](#)

### Changes and Updates for Version 4.0.0 (STU4)

1. Applied the following trackers: 
    - The provider should be notified when data is missing. ([FHIR-26091](https://jira.hl7.org/browse/FHIR-26091))
    - Add a value to GIC Status to represent when Patient is not in the Initial Population for a Measure ([FHIR-32980](https://jira.hl7.org/browse/FHIR-32980))
    -  Add GET examples to cover entire $care-gaps api ([FHIR-33005](https://jira.hl7.org/browse/FHIR-33005))
    -  In Data Exchange MeasureReport profile, the .measureScore should not be allowed ([FHIR-33084](https://jira.hl7.org/browse/FHIR-33084))
    -  Individual MeasureReport profile does not support performance rate (measureScore) of undefined ([FHIR-33086](https://jira.hl7.org/browse/FHIR-33086))
    -  Measure elements cardinality required, but base element is optional ([FHIR-33174](https://jira.hl7.org/browse/FHIR-33174))
    -  DEQM Gaps in Care Bundle slicing is inconsistent ([FHIR-33175](https://jira.hl7.org/browse/FHIR-33175))
    -  evaluatedResources in Summary MeasureReport should not be 0..0 ([FHIR-34352](https://jira.hl7.org/browse/FHIR-34352))
    -  reportingVendor extension should be allowed on exchange profiles ([FHIR-34363](https://jira.hl7.org/browse/FHIR-34363))
    -  Need a way to send a "soft close" when a Gap is addressed or dismissed ([FHIR-35038](https://jira.hl7.org/browse/FHIR-35038))
    -  Cut and paste error in diagram ([FHIR-35776](https://jira.hl7.org/browse/FHIR-35776))
    -  Create profile of GuidanceResponse for DEQM DetectedIssue ([FHIR-35807](https://jira.hl7.org/browse/FHIR-35807))
    -  Update the discussion of negation patterns ([FHIR-35919](https://jira.hl7.org/browse/FHIR-35919))
    -  Add a section to general guidance discussing data quality, integrity, and validation prior to measure evaluation and reporting ([FHIR-35920](https://jira.hl7.org/browse/FHIR-35920))
    -  Correct MeasureReport.group.stratifier.code cardinality due to error in base resource ([FHIR-36054](https://jira.hl7.org/browse/FHIR-36054))
    -  Support multiple-rate scoring type measures ([FHIR-36209](https://jira.hl7.org/browse/FHIR-36209))
    -  Define a supplementalData extension to support explicitly identifying supplementalData results ([FHIR-37558](https://jira.hl7.org/browse/FHIR-37558))
    -  Remove DEQM Coverage profile ([FHIR-37670](https://jira.hl7.org/browse/FHIR-37670))
    -  Remove DEQM Practitioner Profile as the only change was for CCN identifier which is not used for a practitioner ([FHIR-37752](https://jira.hl7.org/browse/FHIR-37752))
    -  Expand population reference extension to allow any criteria reference ([FHIR-37775](https://jira.hl7.org/browse/FHIR-37775))
    -  Remove DEQM MedicationAdministration ([FHIR-37899](https://jira.hl7.org/browse/FHIR-37899))
    -  Need a way to specify when you are using DEQM and base FHIR Operations, you still use DEQM specific profiles ([FHIR-37969](https://jira.hl7.org/browse/FHIR-37969))
    -  Add asynchronous capability for $submit-data operation ([FHIR-38036](https://jira.hl7.org/browse/FHIR-38036))
    -  Add example MeasureReport for a ratio measure ([FHIR-38073](https://jira.hl7.org/browse/FHIR-38073))
    -  Measure reports should support quality program ([FHIR-39348](https://jira.hl7.org/browse/FHIR-39348))
    -  Add example PI Measure report ([FHIR-22761](https://jira.hl7.org/browse/FHIR-22761))
    -  Need a way to send a "soft close" when a Gap is addressed or dismissed ([FHIR-35038](https://jira.hl7.org/browse/FHIR-35038))
    -  Cut and paste error in diagram ([FHIR-35776](https://jira.hl7.org/browse/FHIR-35776))
    -  Update the discussion of negation patterns ([FHIR-35919](https://jira.hl7.org/browse/FHIR-35919))
    -  Add a section to general guidance discussing data quality, integrity, and validation prior to measure evaluation and reporting ([FHIR-35920](https://jira.hl7.org/browse/FHIR-35920))
    -  Measure reports should support quality program ([FHIR-39348](https://jira.hl7.org/browse/FHIR-39348))
    -  Update CapabilityStatements ([FHIR-39428](https://jira.hl7.org/browse/FHIR-39428))
    -  Clarification on Example Given for qicore-notDoneValueSet Example ([FHIR-39818](https://jira.hl7.org/browse/FHIR-39818))
    -  Rewording of Section 2.2.3.3 Description ([FHIR-39819](https://jira.hl7.org/browse/FHIR-39819))
    -  Measure Report Resource ([FHIR-39875](https://jira.hl7.org/browse/FHIR-39875))
    -  Align with US Core Coverage ([FHIR-39877](https://jira.hl7.org/browse/FHIR-39877))
    -  Add Bulk Submit Data Operation to Data Exchange Narrative ([FHIR-39901](https://jira.hl7.org/browse/FHIR-39901))
    -  Add information on Summary Report page that this is similar to QRDA Category 3 ([FHIR-39979](https://jira.hl7.org/browse/FHIR-39979))
    -  When do you use the Group Improvement Notation over the MeasureReport Improvement Notation ([FHIR-39980](https://jira.hl7.org/browse/FHIR-39980))
    -  Support reporting multiple facilities ([FHIR-40031](https://jira.hl7.org/browse/FHIR-40031))
    -  Need to reference Detailed Care Gap Response in DEQM Gaps In Care Detected Issue ([FHIR-40108](https://jira.hl7.org/browse/FHIR-40108))
    -  Issues with invariant deqm-4 ([FHIR-40109](https://jira.hl7.org/browse/FHIR-40109))
    -  Issues with invariant deqm-5 ([FHIR-40110](https://jira.hl7.org/browse/FHIR-40110))
    -  Individual and Summary MeasureReport profile intro notes ([FHIR-40111](https://jira.hl7.org/browse/FHIR-40111))
    -  Data Exchange MeasureReport profile intro notes ([FHIR-40112](https://jira.hl7.org/browse/FHIR-40112))
    -  short description of Criteria Reference Extension ([FHIR-40113](https://jira.hl7.org/browse/FHIR-40113))
    -  Remove Population Reference Extension ([FHIR-40114](https://jira.hl7.org/browse/FHIR-40114))
    -  The Reporting Program Reference extension needs explanation ([FHIR-40115](https://jira.hl7.org/browse/FHIR-40115))
    -  change SHOULD to SHALL ([FHIR-40132](https://jira.hl7.org/browse/FHIR-40132))
    -  change SHOULD to SHALL ([FHIR-40133](https://jira.hl7.org/browse/FHIR-40133))
    -  Clarity on whether this IG should be used for payers to communicate care gaps to providers/HC orgs ([FHIR-40190](https://jira.hl7.org/browse/FHIR-40190))
    -  More explanation and examples need to be added to represent the GuidanceResponse profile that was added ([FHIR-40252](https://jira.hl7.org/browse/FHIR-40252))
    -  Individual Measure Reports and Bundles containing them are missing .evaluatedResources ([FHIR-40407](https://jira.hl7.org/browse/FHIR-40407))
    -  add new URL to $deqm.evaluate-measure ([FHIR-40666](https://jira.hl7.org/browse/FHIR-40666))
    -  Wrong groupImprovementNotation extension description ([FHIR-40789](https://jira.hl7.org/browse/FHIR-40789))
    -  MeasureReport.date could be misleading ([FHIR-40797](https://jira.hl7.org/browse/FHIR-40797))
    -  Correct example using Reason Detail extension ([FHIR-40803](https://jira.hl7.org/browse/FHIR-40803))
    -  Remove Coverage from Resource Diagram ([FHIR-41299](https://jira.hl7.org/browse/FHIR-41299))
    -  Add GuidanceResponse example to Examples page ([FHIR-41315](https://jira.hl7.org/browse/FHIR-41315))
    -  Summary profile requires a measureScore ([FHIR-41656](https://jira.hl7.org/browse/FHIR-41656))
    -  Remove QUICK reference (STU4 QA) ([FHIR-41521](https://jira.hl7.org/browse/FHIR-41521))([Applied here](index.html#quality-improvement-core-implementation-guide-(qi-core)))
    -  Numerator-xxx codes are distracting in MeasureReport example ([FHIR-42954](https://jira.hl7.org/browse/FHIR-42954))([Applied here](Bundle-multiple-summ-report.html)) and ([here](MeasureReport-summ-medicare-stratification-example.html))
    -  Add link to referenced section of IG ([FHIR-43011](https://jira.hl7.org/browse/FHIR-43011))([Applied here](indv-reporting.html#qualityMeasurementStandardsLandscapeIndv)) and ([here](summary-reporting.html#qualityMeasurementStandardsLandscapeSummary)
       

### Changes and Updates for Version 3.1.0

1. Updated the IG dependencies 
    - Update Dependencies. ([FHIR-37621](https://jira.hl7.org/browse/FHIR-37621))
        - Updated from US Core 3.1.0 to US Core 3.1.1 
        - Updated from QI Core 3.1.0 to QI-Core 4.1.1 
        - Updated from Quality Measure IG 2.0.0 to Quality Measure IG 3.0.0
        - Updated examples and profiles where applicable due to dependency updates
    - Remove DEQM Organization Profile. ([FHIR-37898](https://jira.hl7.org/browse/FHIR-37898))
    - Correct ActCode "CAREGAP" display name to match what's in THO. ([FHIR-39302](https://jira.hl7.org/browse/FHIR-39302))
    - The specified gapStatus code display does not match the actual code display. ([FHIR-36170](https://jira.hl7.org/browse/FHIR-36170))

### Changes and Updates for version 3.0.0

The second official published version of the DEQM IG for FHIR R4.

1. Applied all resolutions from STU3 Ballot
    - Various Technical Corrections and Corrections to Typographical Errors
    - Updated the Introduction section in Gaps In Care Reporting. ([FHIR-28956](https://jira.hl7.org/browse/FHIR-28956)),([FHIR-28958](https://jira.hl7.org/browse/FHIR-28958)),([FHIR-28959](https://jira.hl7.org/browse/FHIR-28959)) ,([FHIR-28960](https://jira.hl7.org/browse/FHIR-28960)),([FHIR-28961](https://jira.hl7.org/browse/FHIR-28961)),([FHIR-28962](https://jira.hl7.org/browse/FHIR-28962)),([FHIR-28963](https://jira.hl7.org/browse/FHIR-28963)),([FHIR-28974](https://jira.hl7.org/browse/FHIR-28974)),([FHIR-28981](https://jira.hl7.org/browse/FHIR-28981)),([FHIR-28982](https://jira.hl7.org/browse/FHIR-28982)),([FHIR-28983](https://jira.hl7.org/browse/FHIR-28983)),([FHIR-28984](https://jira.hl7.org/browse/FHIR-28984)),([FHIR-28985](https://jira.hl7.org/browse/FHIR-28985)),([FHIR-28986](https://jira.hl7.org/browse/FHIR-28986)),([FHIR-28987](https://jira.hl7.org/browse/FHIR-28987)),([FHIR-28988](https://jira.hl7.org/browse/FHIR-28988)),([FHIR-28989](https://jira.hl7.org/browse/FHIR-28989)),([FHIR-28990](https://jira.hl7.org/browse/FHIR-28990)),([FHIR-28991](https://jira.hl7.org/browse/FHIR-28991)),([FHIR-29009](https://jira.hl7.org/browse/FHIR-29009)),([FHIR-29010](https://jira.hl7.org/browse/FHIR-29010)),([FHIR-29011](https://jira.hl7.org/browse/FHIR-29011)),([FHIR-29020](https://jira.hl7.org/browse/FHIR-29020)),([FHIR-29021](https://jira.hl7.org/browse/FHIR-29021)),([FHIR-29022](https://jira.hl7.org/browse/FHIR-29022)),([FHIR-28964](https://jira.hl7.org/browse/FHIR-28964)),([FHIR-28992](https://jira.hl7.org/browse/FHIR-28992), ([FHIR-28960](https://jira.hl7.org/browse/FHIR-28960))
    - Created links for Gaps in Care terminology to Glossary. ([FHIR-28955](https://jira.hl7.org/browse/FHIR-28955))
    - Clarified the description in Figure 1-5. ([FHIR-29005](https://jira.hl7.org/browse/FHIR-29005)), ([FHIR-29006](https://jira.hl7.org/browse/FHIR-29006)), ([FHIR-29007](https://jira.hl7.org/browse/FHIR-29007))
    - Specified that workflow to get the data for the report is not specified by this implementation guide. ([FHIR-28487](https://jira.hl7.org/browse/FHIR-28487))
    - Clarified Gaps through period in the figures and glossary. ([FHIR-28972](https://jira.hl7.org/browse/FHIR-28972))
    - Clarified the text to say Gaps in Care Reporting may also be used to report details on the open gaps identified and mitigation steps for addressing them. ([FHIR-28978](https://jira.hl7.org/browse/FHIR-28978))
    - Defined "smoking gun" (historical term) and revised with similar clarification text. ([FHIR-28980](https://jira.hl7.org/browse/FHIR-28980))
    - Added link to CMS Measure used in Gaps in Care Reporting documentation. ([FHIR-28995](https://jira.hl7.org/browse/FHIR-28995))
    - Clarified why the payer did not have the colonoscopy in their files. ([FHIR-28996](https://jira.hl7.org/browse/FHIR-28996))
    - Explained that a claim would close the gap but the provider could choose to send the colonscopy report to close the gap as well. ([FHIR-28997](https://jira.hl7.org/browse/FHIR-28997))
    - Fixed a broken hyperlink on the usecases.html page. ([FHIR-29000](https://jira.hl7.org/browse/FHIR-29000))
    - Added Figure 2-15 to represent Retrospectice and Prospective reporting periods. ([FHIR-29008](https://jira.hl7.org/browse/FHIR-29008))
    - Clarified Payer and Measure Analytic Systems in Figures 2-13 and 2-14. ([FHIR-29013](https://jira.hl7.org/browse/FHIR-29013))
    - Clarified that any of the Serialized Formats for bulk can be used.  Also corrected FHIR JSON to FHIR+NDJSON. ([FHIR-29016](https://jira.hl7.org/browse/FHIR-29016))
    - Clarified the `MeasureReport.date` to be the date the report was calculated. ([FHIR-29018](https://jira.hl7.org/browse/FHIR-29018))
    - Updated the text in 2.5.3.4 Attribution to indicate that the Da Vinci ATR Implementation Guide is one possible way of exchanging Member Attribution Lists. ([FHIR-28374](https://jira.hl7.org/browse/FHIR-28374)), ([FHIR-31065](https://jira.hl7.org/browse/FHIR-31065))
    - Updated examples.


    **Profile Changes:**
    - Changed the DEQM Gaps In Care Composition Profile to reference 1..* DEQM Gaps In Care DetectedIssue instead of 0..* ([FHIR-29017](https://jira.hl7.org/browse/FHIR-29017)),  ([FHIR-29012](https://jira.hl7.org/browse/FHIR-29012))
    - Noted in DEQM Gaps in Care Composition Profile that the date range for the Gaps in Care Report is specified using the `period` element in the DEQM Individual MeasureReport Profile. ([FHIR-28971](https://jira.hl7.org/browse/FHIR-28971))
    - Added a modifier extension gapStatus to the DEQM Gaps In Care DetectedIssue profile. ([FHIR-29017](https://jira.hl7.org/browse/FHIR-29017)),  ([FHIR-29012](https://jira.hl7.org/browse/FHIR-29012))
    - Updated code in `Composition.type` to the LOINC code for Gaps in Care Report.([FHIR-29828](https://jira.hl7.org/browse/FHIR-29828))
    - Changed `patient` to 1..1 in DEQM Gaps in Care DetectedIssue profile. ([FHIR-28439](https://jira.hl7.org/browse/FHIR-28439))
    - Clarified that the reference to the MeasureReport allows linkage to the FHIR Measure resource in DEQM Gaps in Care DetectedIssue profile . ([FHIR-28973](https://jira.hl7.org/browse/FHIR-28973))
    - Changed `DetectedIssue.evidence.detail` to reference either DEQM Individual MeasureReport Profile or GuidanceResponse. ([FHIR-28486](https://jira.hl7.org/browse/FHIR-28486))
    - Updated the `DetectedIssue.code` to use the new CAREGAP code that was added to the ([ActCode](http://terminology.hl7.org/CodeSystem/v3-ActCode) code system. ([FHIR-31067](https://jira.hl7.org/browse/FHIR-31067))
    - Removed DEQM Gaps in Care Individual MeasureReport profile that was in the STU3 Ballot version. Added the extension-populationReference to the DEQM Individual MeasureReport profile instead.  Updated the extension-populationReference to reference population criteria id specified in a Measure resource. ([FHIR-28497](https://jira.hl7.org/browse/FHIR-28497)), ([FHIR-30407](https://jira.hl7.org/browse/FHIR-30407))
    - Updated the DEQM Individual and Summary `MeasureReport.reporter` to be "Organization that generated the report". ([FHIR-28484](https://jira.hl7.org/browse/FHIR-28484))
    - Added documentation to reference populationReference extension and explanation on how to use. ([FHIR-28497](https://jira.hl7.org/browse/FHIR-28497))
    - Added description on `improvementNotation` ([FHIR-28969](https://jira.hl7.org/browse/FHIR-28969))


   **care-gap operation updates**
    - Changed care-gaps operation to allow 3 parameters to specify measure -  id, url, identifier. ([FHIR-28483](https://jira.hl7.org/browse/FHIR-28483))
    - Updated care-gaps operation practitioner and organization input parameters to be a string(reference). ([FHIR-28966](https://jira.hl7.org/browse/FHIR-28966))
    - Added a note to the topic parameter to indicate that the type of this parameter is a string with a search type of token so that the coding value can be provided as part of a URL and the operation can be invoked using GET. ([FHIR-28967](https://jira.hl7.org/browse/FHIR-28967))
    - Added care-gaps operation API call examples. ([FHIR-28968](https://jira.hl7.org/browse/FHIR-28968))
    - Clarified that the result of the care-gaps operation must be using the Parameters resource. ([FHIR-28496](https://jira.hl7.org/browse/FHIR-28496))
    - Clarified that the caller of the care-gaps operations SHALL use specified parameters by adding text "a caller". ([FHIR-28965](https://jira.hl7.org/browse/FHIR-28965))


1. Applied resolutions for non-STU3 ballot DEQM trackers
    - Corrected typo. ([FHIR-29637](https://jira.hl7.org/browse/FHIR-29637))
    - Clarified that the data included in a report will be based on the date the report is run. ([FHIR-28953](https://jira.hl7.org/browse/FHIR-28953))
    - Updated MedicationAdministration Profile to explain this is an example of how you can use a profile instead of a Measure's CQL to constrain data used in a Measure.  Discussed the pros and cons of each method. ([FHIR-29560](https://jira.hl7.org/browse/FHIR-29560))
    - Added extension-reporterGroup to DEQM Individual MeasureReport and DEQM Data Exchange MeasureReport. ([FHIR-29411](https://jira.hl7.org/browse/FHIR-29411))
    - Changed Colorectal Screening example page to use DEQM Data Exchange MeasureReport profile. ([FHIR-29561](https://jira.hl7.org/browse/FHIR-29561))
    - Updated parameter name in MRP example to "measureReport". ([FHIR-30075](https://jira.hl7.org/browse/FHIR-30075))
    - Explained Relationship of Measure and MeasureReport Resources. ([FHIR-28373](https://jira.hl7.org/browse/FHIR-28373))
    - Updated outdated Figures 3-1 and 3-2. ([FHIR-31881](https://jira.hl7.org/browse/FHIR-31881))
    - Updated outdated Figures 3-5, 3-6, 3-7, and 3-8. ([FHIR-31882](https://jira.hl7.org/browse/FHIR-31882))
    - Simplified the Conformance Requirement 1 language for $care-gaps. ([FHIR-31902](https://jira.hl7.org/browse/FHIR-31902))
    - Updated 2.1.7 Must Support. ([FHIR-31961](https://jira.hl7.org/browse/FHIR-31961))
    - Updated Figure 1-1 and Figure 2-12 to use the new Quality Improvement Ecosystem diagram.


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
    - Change Practitioner Identifier OID for Tax ID from ITIN to EIN ([FHIR-26613](https://jira.hl7.org/browse/FHIR-26613), [FHIR-26086](https://jira.hl7.org/browse/FHIR-26086)). Note that DEQM Organization Profile was removed in STU3.1.1, so the link to DEQM Organization Profile is no longer available from STU3.1.1.
    - Clarify how [much data is needed](indv-reporting.html#how-much-data-should-be-sent) for individual reporting ([FHIR-26090](https://jira.hl7.org/browse/FHIR-26090))
    - Clarify how [much data is needed](datax.html) for data exchange ([FHIR-26083](https://jira.hl7.org/browse/FHIR-26083))
    -  Clarify how data consumers [communicate data requirements](datax.html#collect-data ). ([FHIR-26084](https://jira.hl7.org/browse/FHIR-26084))
    - Clarify [negation pattern](guidance.html#negation-patterns-for-quality-measures) ([FHIR-26077](https://jira.hl7.org/browse/FHIR-26077))
    - Clarify [usage of correct measure version](datax.html) . ([FHIR-26081](https://jira.hl7.org/browse/FHIR-26081))
    - Clarify [discovery of data requirements](datax.html#gather-data-requirements-from-consumer)). ([FHIR-26085](https://jira.hl7.org/browse/FHIR-26085))
    - Clarify [stakeholders](datax.html) ([FHIR-26082](https://jira.hl7.org/browse/FHIR-26082))
    - Add [reference](index.html#introduction) to Da Vinci Guiding Principles ([FHIR-26078](https://jira.hl7.org/browse/FHIR-26078))
    - Add [implementer notes](StructureDefinition-indv-measurereport-deqm.html#mandatory-data-elements-and-terminology) to  DEQM Data-Exchange MeasureReport Profile  ([FHIR-26073](https://jira.hl7.org/browse/FHIR-26073))
    - Add [Practitioner Profile](http://hl7.org/fhir/us/davinci-deqm/STU2/StructureDefinition-practitioner-deqm.html) to accommodate CMS Certification Number identifier(CCN) and add CCN to DEQM Organization Profile ([FHIR-25739](https://jira.hl7.org/browse/FHIR-25739)). Note that DEQM Organization Profile was removed in STU3.1.1, so the link to DEQM Organization Profile is no longer available from STU3.1.1.
    - Add [software name/version extension](StructureDefinition-indv-measurereport-deqm-definitions.html#MeasureReport.extension:vendor) to MeasureReport Profiles ([FHIR-25721](https://jira.hl7.org/browse/FHIR-25721))
    - Add required [`id`](StructureDefinition-summary-measurereport-deqm-definitions.html#MeasureReport.group.population.code) element to the MeasureReport profiles ([FHIR-25716](https://jira.hl7.org/browse/FHIR-25716))
    - [Document](datax.html#provenance) that $submit-data and $collect-data should support the use of the X-Provenance header ([FHIR-25624](https://jira.hl7.org/browse/FHIR-25624))
    - A extensions for [software and version](StructureDefinition-datax-measurereport-deqm-definitions.html#MeasureReport.extension:software) ([FHIR-25721](https://jira.hl7.org/browse/FHIR-25721))
    - Define [default profiles](guidance.html#default-profiles-used-in-the-evaluation-of-a-measure) for this implementation guide ([FHIR-27818](https://jira.hl7.org/browse/FHIR-27818))
    - Add [`MeasureReport.group.population.count` as 0..1 Must Support](StructureDefinition-indv-measurereport-deqm.html#profile) for individual report profile. ([FHIR-27862](https://jira.hl7.org/browse/FHIR-27862))
    - Add [guidance on standard error response](datax.html#usage-1) to the various transactions described in the framework. ([FHIR-18720](https://jira.hl7.org/browse/FHIR-18720))
    - Clarified retrospective reporting definition ([FHIR-28993](https://jira.hl7.org/browse/FHIR-28993))

### Changes and Updates for version 1.1.0

STU2 Ballot for FHIR R4 Version of the DEQM IG.

1. Creation of FHIR R4 version.
1. Additional examples

### Changes and Updates for version 1.0.0

The current official published version of the DEQM IG for FHIR STU3.

1. Applied all resolutions from May STU1 Ballot

### Changes and Updates for version 0.2.0

1. Applied all resolutions from STU1 Ballot
1. Updated and Expanded the Background Section on the Clinical Quality Measures Ecosystem and how this guide fits into that Ecosystem.
1. Added Guidance on Measure Reporting
1. Added Use Cases for Colorectal Screening and Venous Thromboembolism Prophylaxis Measure Reporting

{% include link-list.md %}
