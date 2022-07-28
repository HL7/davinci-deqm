// https://www.hl7.org/fhir/guidanceresponse.html

Alias: ECT = http://hl7.org/fhir/extension-context-type

Profile: DetailedCareGapGuidanceResponse
Title: "Detailed Care Gap Guidance Response"
Id: detailedCareGapGuidanceResponse
Parent: GuidanceResponse
* dataRequirement.extension contains ValueFilter named valueFilter 0..
* dataRequirement.extension[valueFilter] ^short = "What values are expected"
* dataRequirement.extension[valueFilter] ^definition = "Value Set filters specify additional constraints on the data for non coded or temporal types. Each value filter defines an additional constraint on the data, i.e. code filters are AND'ed, not OR'ed."
* reasonCode from ReasonForCareGapVS (preferred)
* reasonCode.extension contains ReasonDetail named detail 0..1
* reasonCode.extension[detail] ^short = "Which data element attribute is the cause of the care gap"
* reasonCode.extension[detail] ^definition = "Refers back to the Resource and data element that cause the care gap defined by the reasonCode"

// Remove after QM IG published
Extension: ValueFilter
Id: valueFilter
Title: "Value Filter"
* ^context.type = ECT#element
* ^context.expression = "DataRequirement"
* extension contains path 0..1 and searchParam 0..1 and value 0..1
* extension[path].value[x] only string
* extension[path] ^short = "A value attribute to filter on"
* extension[path] ^definition = "The value attribute of the filter. The specified path SHALL be a FHIRPath resolveabl
e on the specified type of the DataRequirement, and SHALL consist only of identifiers, constant indexers, and .resolve
(). The path is allowed to contain qualifiers (.) to traverse sub-elements, as well as indexers ([x]) to traverse mult
iple-cardinality sub-elements (see the Simple FHIRPath Profile for full details). Note that the index must be an integ
er constant. The path must resolve to an element of type string, boolean, integer, Quantity, Range, Ratio or SampledDa
ta."
* extension[searchParam].value[x] only string
* extension[searchParam] ^short = "A value (token) parameter to search on"
* extension[searchParam] ^definition = "A token parameter that refers to a search parameter defined on the specified type of the DataRequirement, and which searches on elements of type string, boolean, integer, Quantity, Range, Ratio or SampledData."
* extension[value].value[x] only string or Quantity or boolean or integer or Range or Ratio
* extension[value] ^short = "A value (token) parameter to search on"
* extension[value] ^definition = "The value of the filter. This can be any value type supported by Observation apart from a code or temporal value"

Extension: ReasonDetail
Id: reasonDetail
Title: "Reason Detail"
* extension contains reference 1..1 and path 1..1
* extension[reference].value[x] only Reference
* extension[path].value[x] only string

ValueSet: ReasonForCareGapVS
Id: careGapReasonVS
Title: "Care Gap Reasons Value Set"
* include codes from system ReasonForCareGapCS

CodeSystem: ReasonForCareGapCS
Id: careGapReasonCS
Title: "Care Gap Reasons Code System"
* #NotFound "Data Element Not Found" "Data Element was not able to be located"
* #Missing "Missing Data Element" "Data Element is known to exist (e.g. claim exists for procedure), but was not found"
* #Present "Data Element is Present" "Data Element is was found matching the criteria"
* #InvalidAttribute "Attribute is Invalid" "Data element was found, but value was not equal to expected value"
* #DateInRange "Date is within specified range" "Data element was a temporal type (e.g. DateTime, Period, Duration) was within range of dateFilter constraint"
* #DateOutOfRange "Date is out of specified range" "Data element was a temporal type (e.g. DateTime, Period, Duration) was not in range of dateFilter constraint"
* #ValueInRange "Value is within specified range" "Data element was a numeric type (e.g. Quantity, Integer, Range, Ratio, SampledData) was within in range of valueFilter constraint"
* #ValueOutOfRange "Value is out of specified range" "Data element was a numeric type (e.g. Quantity, Integer, Range, Ratio, SampledData) was not in range of valueFilter constraint"
* #CountInRange "Count is within specified range" "The count of data elements found was within specified range"
* #CountOutOfRange "Count is out of specified range" "The count of data elements found was out of specified range"
