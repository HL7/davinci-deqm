Profile: ImportManifestSimpleIdentity
Parent: ImportManifest
Description: "Example Import Manifest Profile where the request identity is a simple string."
* parameter[requestIdentity].value[x] 1..1 MS
* parameter[requestIdentity].value[x] only string
* parameter[requestIdentity].valueString ^short = "The submission identifier."

Instance: example-import-manifest-simple-identity
InstanceOf: ImportManifestSimpleIdentity
Usage: #example
* parameter[requestIdentity].valueString = "289873910"
* parameter[input][+].part[url].valueUrl = "https://example.com/blob/bigfile.ndjson"

/* separate file since SUSHI doesn't want to handle the stuff under resource
Instance: example-import-result-simple-identity-success
InstanceOf: ImportResult
Usage: #example
* parameter[requestIdentity].valueString = "289873910"
* parameter[outcome][+].part[operationOutcome].resource.issue.severity = #information
* parameter[outcome][=].part[operationOutcome].resource.issue.code = #informational
* parameter[outcome][=].part[operationOutcome].resource.issue.details.text = "All OK"
*/

Profile: ImportManifestResourceIdentity
Parent: ImportManifest
Description: "Example Import Manifest Profile where the request identity is a FHIR resource instance."
* parameter[requestIdentity].resource 1..1 MS
* parameter[requestIdentity].resource only MeasureReport
* parameter[requestIdentity].resource ^short = "MeasureReport instance containing details on this submission."

/* separate file since SUSHI doesn't want to handle the stuff under resource
Instance: example-import-manifest-resource-identity
InstanceOf: ImportManifestResourceIdentity
Usage: #example
* parameter[requestIdentity].resource.status = #complete
* parameter[requestIdentity].resource.type = #data-collection
* parameter[requestIdentity].resource.measure = "http://example.com/a-measure"
* parameter[requestIdentity].resource.period.start = 2023-01-01
* parameter[requestIdentity].resource.period.end = 2023-12-31
* parameter[input][+].part[url].valueUrl = "https://example.com/blob/bigfile.ndjson"
*/

/* separate file since SUSHI doesn't want to handle the stuff under resource
Instance: example-import-result-resource-identity-input-error-embedded
InstanceOf: ImportResult
Usage: #example
* parameter[requestIdentity].resource.status = #complete
* parameter[requestIdentity].resource.type = #data-collection
* parameter[requestIdentity].resource.measure = "http://example.com/a-measure"
* parameter[requestIdentity].resource.period.start = 2023-01-01
* parameter[requestIdentity].resource.period.end = 2023-12-31
* parameter[outcome][+].part[associatedInputUrl].valueUrl = "https://example.com/blob/bigfile.ndjson"
* parameter[outcome][=].part[operationOutcome].resource.issue.severity = #error
* parameter[outcome][=].part[operationOutcome].resource.issue.code = #processing
* parameter[outcome][=].part[operationOutcome].resource.issue.details.text = "Failed to process entry at row 472: invalid json."
* parameter[outcome][+].part[associatedInputUrl].valueUrl = "https://example.com/blob/bigfile.ndjson"
* parameter[outcome][=].part[operationOutcome].resource.issue.severity = #information
* parameter[outcome][=].part[operationOutcome].resource.issue.code = #informational
* parameter[outcome][=].part[operationOutcome].resource.issue.details.text = "Successfully processed 31823 rows."
*/

Profile: ImportManifestComplexIdentity
Parent: ImportManifest
Description: "Example Import Manifest Profile where the request identity includes multiple parts."
* parameter[requestIdentity].part ^short = "Sub-parameters that constitute the request identity."
* parameter[requestIdentity].part 3..* MS
* parameter[requestIdentity].part ^slicing.discriminator.type = #value
* parameter[requestIdentity].part ^slicing.discriminator.path = "$this.name"
* parameter[requestIdentity].part ^slicing.rules = #open
* parameter[requestIdentity].part contains
    submissionId 1..1 and
    submissionTime 1..1 and
    submittingOrganization 1..1

* parameter[requestIdentity].part[submissionId] ^short = "Part of the request identity."
* parameter[requestIdentity].part[submissionId].name = "submissionId" (exactly)
* parameter[requestIdentity].part[submissionId].value[x] 1..1 MS
* parameter[requestIdentity].part[submissionId].value[x] only string
* parameter[requestIdentity].part[submissionId].valueString ^short = "The submission identifier."

* parameter[requestIdentity].part[submissionTime] ^short = "Part of the request identity."
* parameter[requestIdentity].part[submissionTime].name = "submissionTime" (exactly)
* parameter[requestIdentity].part[submissionTime].value[x] 1..1 MS
* parameter[requestIdentity].part[submissionTime].value[x] only dateTime
* parameter[requestIdentity].part[submissionTime].valueDateTime ^short = "The submission time."

* parameter[requestIdentity].part[submittingOrganization] ^short = "Part of the request identity."
* parameter[requestIdentity].part[submittingOrganization].name = "submittingOrganization" (exactly)
* parameter[requestIdentity].part[submittingOrganization].value[x] 0..0
* parameter[requestIdentity].part[submittingOrganization].resource 1..1 MS
* parameter[requestIdentity].part[submittingOrganization].resource only SubmittingOrganization
* parameter[requestIdentity].part[submittingOrganization].valueString ^short = "The submitting organization."

Extension: SubmittingOrganizationRegion
Id:        submitting-org-region
Title:     "Region of the submitting organization." 
Description: "Example extension capturing the region in which the submitting organization is located" 
* value[x] only code

Profile: SubmittingOrganization
Parent: Organization
Description: "Example profile specifying required details for representing a submitting orgazniation."
* name 1..1 MS
* extension contains SubmittingOrganizationRegion named submittingOrgRegion 1..1 MS

/* separate file since SUSHI doesn't want to handle the stuff under resource
Instance: example-import-manifest-complex-identity
InstanceOf: ImportManifestComplexIdentity
Usage: #example
* parameter[requestIdentity].part[submissionId].valueString = "289873910"
* parameter[requestIdentity].part[submissionTime].valueDateTime = "2024-01-15"
* parameter[requestIdentity].part[submittingOrganization].resource.extension[submittingOrgRegion] = #Northeast
* parameter[requestIdentity].part[submittingOrganization].resource.name = "Example Org"
* parameter[input][+].part[url].valueUrl = "https://example.com/blob/bigfile.ndjson"
*/

/* separate file since SUSHI doesn't want to handle the stuff under resource
Instance: example-import-result-complex-identity-error-file
InstanceOf: ImportResult
Usage: #example
* parameter[requestIdentity].part[submissionId].valueString = "289873910"
* parameter[requestIdentity].part[submissionTime].valueDateTime = "2024-01-15"
* parameter[requestIdentity].part[submittingOrganization].resource.extension[submittingOrgRegion] = #Northeast
* parameter[requestIdentity].part[submittingOrganization].resource.name = "Example Org"
* parameter[outcome][+].part[url].valueUrl = "https://example.com/blob/import-errors.ndjson"
*/

