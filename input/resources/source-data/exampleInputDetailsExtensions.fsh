Profile: ImportManifestExportDetails
Parent: Parameters //NOTE: intention is to extend ImportManifest, but there is a IG publisher or FHIR resource bug preventing it from working
Description: "Example Import Manifest Profile where the input details represent the output of an $export operation (will extend [Import Manifest](StructureDefinition-ImportManifest.html) once publisher issues resolved)"

* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "$this.name"
* parameter ^slicing.rules = #open
* parameter contains
    requestIdentity 0..1 and
    inputDetails 0..1 and
    transferDetails 0..1 and
    input 1..*

* parameter[requestIdentity] ^short = "Represents the identity of this specific request. Examples of possible approaches include the use of an identifier, a string, an entire resource instance like MeasureReport, or a combination using parts."
* parameter[requestIdentity].name = "requestIdentity" (exactly)

* parameter[inputDetails] ^short = "Represents details on the input, such as the format and the scope of the contents. May be overriden or augmented at the input level."
* parameter[inputDetails].name = "inputDetails" (exactly)

* parameter[inputDetails].part ^short = "Sub-parameters that constitute global input details."
* parameter[inputDetails].part 2..* MS
* parameter[inputDetails].part ^slicing.discriminator.type = #value
* parameter[inputDetails].part ^slicing.discriminator.path = "$this.name"
* parameter[inputDetails].part ^slicing.rules = #open
* parameter[inputDetails].part contains
    query 1..1 and
    format 1..1

* parameter[inputDetails].part[query] ^short = "Global input detail sub-parameter."
* parameter[inputDetails].part[query].name = "query" (exactly)
* parameter[inputDetails].part[query].value[x] 1..1 MS
* parameter[inputDetails].part[query].value[x] only string
* parameter[inputDetails].part[query].valueString ^short = "Query that generated the input data."

* parameter[inputDetails].part[format] ^short = "Input detail sub-parameter."
* parameter[inputDetails].part[format].name = "format" (exactly)
* parameter[inputDetails].part[format].value[x] 1..1
* parameter[inputDetails].part[format].value[x] only code
* parameter[inputDetails].part[format].valueCode ^short = "The format of each input."
* parameter[inputDetails].part[format].valueCode = #fhir+ndjson (exactly)

* parameter[transferDetails] ^short = "Represents details on how to retrieve the inputs. May be overriden or augmented at the input level."
* parameter[transferDetails].name = "transferDetails" (exactly)

* parameter[input] ^short = "List of inputs to be retrieved."
* parameter[input].name = "input" (exactly)
* parameter[input].part ^slicing.discriminator.type = #value
* parameter[input].part ^slicing.discriminator.path = "$this.name"
* parameter[input].part ^slicing.rules = #open
* parameter[input].part contains
    url 1..1 and
    inputDetails 0..1 and
    transferDetails 0..1

* parameter[input].part[url] ^short = "Location of this input."
* parameter[input].part[url].name = "url" (exactly)
* parameter[input].part[url].value[x] 1..1
* parameter[input].part[url].value[x] only url   

* parameter[input].part[inputDetails] ^short = "Sub-parameters that constitute specific input details." 
* parameter[input].part[inputDetails].name = "inputDetails" (exactly)
* parameter[input].part[inputDetails].part 1..* MS
* parameter[input].part[inputDetails].part ^slicing.discriminator.type = #value
* parameter[input].part[inputDetails].part ^slicing.discriminator.path = "$this.name"
* parameter[input].part[inputDetails].part ^slicing.rules = #open
* parameter[input].part[inputDetails].part contains
    resourceType 1..1

* parameter[input].part[inputDetails].part[resourceType] ^short = "Specific input detail sub-parameter."
* parameter[input].part[inputDetails].part[resourceType].name = "resourceType"
* parameter[input].part[inputDetails].part[resourceType].value[x] 1..1 MS
* parameter[input].part[inputDetails].part[resourceType].value[x] only code
* parameter[input].part[inputDetails].part[resourceType].valueCode from http://hl7.org/fhir/ValueSet/resource-types (required)
* parameter[input].part[inputDetails].part[resourceType].valueCode ^short = "fhir resouce type of instances in this input" 

* parameter[input].part[transferDetails] ^short = "Represents details on how to retrieve this input."
* parameter[input].part[transferDetails].name = "transferDetails" (exactly)

Instance: example-import-manifest-export-details
InstanceOf: ImportManifestExportDetails
Usage: #example
* parameter[inputDetails].part[query].valueString = "http://example.com/fhir/$export?_type=Patient"
* parameter[inputDetails].part[format].valueCode = #fhir+ndjson
* parameter[input][+].part[url].valueUrl = "https://example.com/blob/patientFile.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Patient
