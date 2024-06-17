Instance: import
InstanceOf: OperationDefinition
Usage: #definition
* version = "0.1.0"
* name = "BulkDataImport"
* title = "FHIR Bulk Data System Level Import"
* status = #active
* kind = #operation
* date = "2024-02-12"
* description = "FHIR Operation to import data to a FHIR server. This operation SHALL be invoked using the [FHIR Asynchronous Request Interaction Pattern](http://hl7.org/fhir/R5/async-bundle.html)"
* code = #import
* system = true
* type = false
* instance = false
* inputProfile = Canonical(ImportManifest)
* outputProfile = Canonical(ImportResult)
* parameter[0].name = #manifest
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "[Import Manifest](StructureDefinition-ImportManifest.html) Parameters instance containing a list of inputs for the Consumer to retrieve and process with metadata for guidance."
* parameter[=].type = #Resource
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "[Import Result](StructureDefinition-ImportResult.html) Parameters instance containing the results of the `$import` processing."
* parameter[=].type = #Resource

Profile: ImportManifest
Parent: Parameters
Description: "Inputs for the $import operation"

* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "$this.name"
* parameter ^slicing.rules = #open
* parameter contains
    requestIdentity 0..1 and
    transferDetails 0..1 and
    inputDetails 0..1 and
    input 1..*

* parameter[requestIdentity] ^short = "Represents the identity of this specific request. Examples of possible approaches include the use of an identifier, a string, an entire resource instance like MeasureReport, or a combination using parts."
* parameter[requestIdentity].name = "requestIdentity" (exactly)

* parameter[transferDetails] ^short = "Represents details on how to retrieve the inputs. May be overriden or augmented at the input level."
* parameter[transferDetails].name = "transferDetails" (exactly)

* parameter[inputDetails] ^short = "Represents details on the input, such as the format and the scope of the contents. May be overriden or augmented at the input level."
* parameter[inputDetails].name = "inputDetails" (exactly)

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

* parameter[input].part[transferDetails] ^short = "Represents details on how to retrieve this input."
* parameter[input].part[transferDetails].name = "transferDetails" (exactly)

* parameter[input].part[inputDetails] ^short = "Represents details on this input, such as the format and the scope of the contents."
* parameter[input].part[inputDetails].name = "inputDetails" (exactly)

Profile: ImportResult
Parent: Parameters
Description: "$import operation result structure."

* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "$this.name"
* parameter ^slicing.rules = #open
* parameter contains
    requestIdentity 0..1 and
    outcome 0..*

* parameter[requestIdentity] ^short = "requestIdentity details from the original request."
* parameter[requestIdentity].name = "requestIdentity" (exactly)

* parameter[outcome] ^short = "Result of the retrieval and processing of the data set."
* parameter[outcome].name = "outcome" (exactly)
* parameter[outcome].part ^slicing.discriminator.type = #value
* parameter[outcome].part ^slicing.discriminator.path = "$this.name"
* parameter[outcome].part ^slicing.rules = #open
* parameter[outcome].part 1..3
* parameter[outcome].part contains
    url 0..1 and
    operationOutcome 0..1 and
    associatedInputUrl 0..1

* parameter[outcome].part[url] ^short = "Location of a file containing OperationOutcome instances that provide details on an issue encountered during retrieval and processing of the data set."
* parameter[outcome].part[url].name = "url" (exactly)
* parameter[outcome].part[url].value[x] 1..1
* parameter[outcome].part[url].value[x] only url   

* parameter[outcome].part[operationOutcome] ^short = "OperationOutcome instance potentially providing details on an issue encountered during retrieval and processing of the data set."
* parameter[outcome].part[operationOutcome].name = "operationOutcome" (exactly)
* parameter[outcome].part[operationOutcome].resource 1..1
* parameter[outcome].part[operationOutcome].resource only OperationOutcome

* parameter[outcome].part[associatedInputUrl] ^short = "URL of the input that these OperationOutcome instances are related to."
* parameter[outcome].part[associatedInputUrl].name = "associatedInputUrl" (exactly)
* parameter[outcome].part[associatedInputUrl].value[x] 1..1
* parameter[outcome].part[associatedInputUrl].value[x] only url

Profile: SubjectBlockHeader
Parent: Parameters
Description: "Header for subject block of instances when organizing `$import` inputs by subject."

* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "$this.name"
* parameter ^slicing.rules = #open
* parameter contains
    subject 1..1 and
    multiInputSubject 0..1 and
    firstInputOfMulti 0..1

* parameter[subject] ^short = "The subject of this block."
* parameter[subject].name = "subject" (exactly)
* parameter[subject].value[x] 1..1
* parameter[subject].value[x] only Reference(Resource)

* parameter[multiInputSubject] ^short = "true if the block for this subject is split across multiple inputs."
* parameter[multiInputSubject].name = "multiInputSubject" (exactly)
* parameter[multiInputSubject].value[x] 1..1
* parameter[multiInputSubject].value[x] only boolean

* parameter[firstInputOfMulti] ^short = "true if the input this header appears in is the first input for a multi-input subject and includes the subject instance."
* parameter[firstInputOfMulti].name = "firstInputOfMulti" (exactly)
* parameter[firstInputOfMulti].value[x] 1..1
* parameter[firstInputOfMulti].value[x] only boolean



