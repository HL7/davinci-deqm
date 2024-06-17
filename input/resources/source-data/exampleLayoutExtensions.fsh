Instance: subject-block-header-Pat-123
InstanceOf: SubjectBlockHeader
Usage: #example
* parameter[subject].valueReference = Reference(Pat-123)

Instance: Pat-123
InstanceOf: Patient
Usage: #example
* name.given[+] = "example"
* name.given[+] = "patient"
* name.family = "subject"

Instance: Pat-123-Obs-Jan
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-123)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 90 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-01-01T16:30:00Z"

Instance: Pat-123-Obs-Feb
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-123)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 88 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-02-01T16:30:00Z"

Instance: Pat-123-Obs-Mar
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-123)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 70 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-03-01T16:30:00Z"

Instance: subject-block-header-Pat-456
InstanceOf: SubjectBlockHeader
Usage: #example
* parameter[subject].valueReference = Reference(Pat-456)

Instance: subject-block-header-Pat-456-multi-input-first
InstanceOf: SubjectBlockHeader
Usage: #example
* parameter[subject].valueReference = Reference(Pat-456)
* parameter[multiInputSubject].valueBoolean = true
* parameter[firstInputOfMulti].valueBoolean = true

Instance: subject-block-header-Pat-456-multi-input-subsequent
InstanceOf: SubjectBlockHeader
Usage: #example
* parameter[subject].valueReference = Reference(Pat-456)
* parameter[multiInputSubject].valueBoolean = true
* parameter[firstInputOfMulti].valueBoolean = false

Instance: Pat-456
InstanceOf: Patient
Usage: #example
* name.given[+] = "another"
* name.given[+] = "patient"
* name.family = "subject"

Instance: Pat-456-Obs-Jan
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-456)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 75 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-01-01T16:30:00Z"

Instance: Pat-456-Obs-Feb
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-456)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 100 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-02-01T16:30:00Z"

Instance: Pat-456-Obs-Hospital-High
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-456)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 110 'mg/dL'
* performer[+] = Reference(doctor-at-hospital)
* effectiveDateTime = "2023-02-01T17:00:00Z"

Instance: Pat-456-Obs-Hospital-Normal
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-456)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 85 'mg/dL'
* performer[+] = Reference(doctor-at-hospital)
* effectiveDateTime = "2023-02-01T20:00:00Z"

Instance: Pat-456-Obs-Mar
InstanceOf: Observation
Usage: #example
* subject = Reference(Pat-456)
* status = #final
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* valueQuantity = 82 'mg/dL'
* performer[+] = Reference(nurse-at-office)
* effectiveDateTime = "2023-03-01T16:30:00Z"

Instance: hospital
InstanceOf: Organization
Usage: #example
* name = "example hospital"

Instance: office
InstanceOf: Organization
Usage: #example
* name = "example primary care office"

Instance: doctor
InstanceOf: Practitioner
Usage: #example
* name.given[+] = "example"
* name.family = "doctor"

Instance: nurse
InstanceOf: Practitioner
Usage: #example
* name.given[+] = "example"
* name.family = "nurse"

Instance: doctor-at-hospital
InstanceOf: PractitionerRole
Usage: #example
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#doctor
* practitioner = Reference(doctor)
* organization = Reference(hospital)

Instance: nurse-at-office
InstanceOf: PractitionerRole
Usage: #example
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#nurse
* practitioner = Reference(nurse)
* organization = Reference(office)

Profile: ImportManifestLayout
Parent: Parameters //NOTE: intention is to extend ImportManifest, but there is a IG publisher or FHIR resource bug preventing it from working
Description: "ImportManifest with the parameters relevant to input layout highlighted (will extend [Import Manifest](StructureDefinition-ImportManifest.html) once publisher issues resolved)"

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
* parameter[inputDetails].part 0..*
* parameter[inputDetails].part ^slicing.discriminator.type = #value
* parameter[inputDetails].part ^slicing.discriminator.path = "$this.name"
* parameter[inputDetails].part ^slicing.rules = #open
* parameter[inputDetails].part contains
    subjectType 0..1

* parameter[inputDetails].part[subjectType] ^short = "If present, then all inputs without an subjectType are organized by subject with subjects of the indicated FHIR resource type."
* parameter[inputDetails].part[subjectType].name = "subjectType" (exactly)
* parameter[inputDetails].part[subjectType].value[x] 1..1
* parameter[inputDetails].part[subjectType].value[x] only code
* parameter[inputDetails].part[subjectType].valueCode from http://hl7.org/fhir/ValueSet/resource-types (required)

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
* parameter[input].part[inputDetails].part 0..*
* parameter[input].part[inputDetails].part ^slicing.discriminator.type = #value
* parameter[input].part[inputDetails].part ^slicing.discriminator.path = "$this.name"
* parameter[input].part[inputDetails].part ^slicing.rules = #open
* parameter[input].part[inputDetails].part contains
    resourceType 0..1 and
    multiInputSubject 0..1 and
    firstInputOfMulti 0..1

* parameter[input].part[inputDetails].part[resourceType] ^short = "If present, indicates that this input is organized by type and contains only instance of the indicated FHIR resource type."
* parameter[input].part[inputDetails].part[resourceType].name = "resourceType"
* parameter[input].part[inputDetails].part[resourceType].value[x] 1..1
* parameter[input].part[inputDetails].part[resourceType].value[x] only code
* parameter[input].part[inputDetails].part[resourceType].valueCode from http://hl7.org/fhir/ValueSet/resource-types (required)

* parameter[input].part[inputDetails].part[multiInputSubject] ^short = "If present, indicates that this input is one of multiple for the indicated subject."
* parameter[input].part[inputDetails].part[multiInputSubject].name = "multiInputSubject"
* parameter[input].part[inputDetails].part[multiInputSubject].value[x] 1..1
* parameter[input].part[inputDetails].part[multiInputSubject].value[x] only Reference

* parameter[input].part[inputDetails].part[firstInputOfMulti] ^short = "For mutli-input subjects, indicates whether this is the first input for that subject that contains the subject instance."
* parameter[input].part[inputDetails].part[firstInputOfMulti].name = "firstInputOfMulti"
* parameter[input].part[inputDetails].part[firstInputOfMulti].value[x] 1..1
* parameter[input].part[inputDetails].part[firstInputOfMulti].value[x] only boolean

* parameter[input].part[transferDetails] ^short = "Represents details on how to retrieve this input."
* parameter[input].part[transferDetails].name = "transferDetails" (exactly)

Instance: manifest-by-type-example
InstanceOf: ImportManifestLayout
Usage: #example
* parameter[requestIdentity].valueString = "manifest-by-type-example"
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Observation.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Observation
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Organization.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Organization
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Patient.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Patient
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Practitioner.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Practitioner
* parameter[input][+].part[url].valueUrl = "http://example.org/type-PractitionerRole.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #PractitionerRole

Instance: manifest-by-subject-example
InstanceOf: ImportManifestLayout
Usage: #example
* parameter[requestIdentity].valueString = "manifest-by-subject-example"
* parameter[inputDetails].part[subjectType].valueCode = #Patient
* parameter[input][+].part[url].valueUrl = "http://example.org/subject-input-Pat-123-and-456.ndjson"

Instance: manifest-by-subject-size-limit-example
InstanceOf: ImportManifestLayout
Usage: #example
* parameter[requestIdentity].valueString = "manifest-by-subject-size-limit-example"
* parameter[inputDetails].part[subjectType].valueCode = #Patient
* parameter[input][+].part[url].valueUrl = "http://example.org/subject-block-Pat-123.ndjson"
* parameter[input][+].part[url].valueUrl = "http://example.org/multi-input-subject-Pat-456-1.ndjson"
* parameter[input][=].part[inputDetails].part[multiInputSubject].valueReference = Reference(Pat-123)
* parameter[input][=].part[inputDetails].part[firstInputOfMulti].valueBoolean = true
* parameter[input][+].part[url].valueUrl = "http://example.org/multi-input-subject-Pat-456-2.ndjson"
* parameter[input][=].part[inputDetails].part[multiInputSubject].valueReference = Reference(Pat-123)
* parameter[input][=].part[inputDetails].part[firstInputOfMulti].valueBoolean = false

Instance: manifest-by-subject-split-out-example
InstanceOf: ImportManifestLayout
Usage: #example
* parameter[requestIdentity].valueString = "manifest-by-subject-split-out-example"
* parameter[inputDetails].part[subjectType].valueCode = #Patient
* parameter[input][+].part[url].valueUrl = "http://example.org/subject-split-out-input-Pat-123-and-456.ndjson"
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Organization.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Organization
* parameter[input][+].part[url].valueUrl = "http://example.org/type-Practitioner.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #Practitioner
* parameter[input][+].part[url].valueUrl = "http://example.org/type-PractitionerRole.ndjson"
* parameter[input][=].part[inputDetails].part[resourceType].valueCode = #PractitionerRole

