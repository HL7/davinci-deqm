Profile: ImportManifestBearerDetails
Parent: ImportManifest
Description: "Example Import Manifest Profile where a bearer token for input access is provided."
* parameter[transferDetails].part ^short = "Sub-parameters that provide transfer details."
* parameter[transferDetails].part 2..* MS
* parameter[transferDetails].part ^slicing.discriminator.type = #value
* parameter[transferDetails].part ^slicing.discriminator.path = "$this.name"
* parameter[transferDetails].part ^slicing.rules = #open
* parameter[transferDetails].part contains
    protocol 1..1 and
    bearerToken 1..1

* parameter[transferDetails].part[protocol] ^short = "Part of the transfer details."
* parameter[transferDetails].part[protocol].name = "protocol" (exactly)
* parameter[transferDetails].part[protocol].value[x] 1..1
* parameter[transferDetails].part[protocol].value[x] only code
* parameter[transferDetails].part[protocol].valueCode ^short = "The transfer protocol used to retrieve the inputs."
* parameter[transferDetails].part[protocol].valueCode = #https (exactly)

* parameter[transferDetails].part[bearerToken] ^short = "Part of the transfer details."
* parameter[transferDetails].part[bearerToken].name = "bearerToken" (exactly)
* parameter[transferDetails].part[bearerToken].value[x] 1..1 MS
* parameter[transferDetails].part[bearerToken].value[x] only string
* parameter[transferDetails].part[bearerToken].valueString ^short = "Token to provide with prefix 'Bearer: ' in the Authorization header on input retrieval requests."

Instance: example-import-manifest-bearer-details
InstanceOf: ImportManifestBearerDetails
Usage: #example
* parameter[transferDetails].part[protocol].valueCode = #https
* parameter[transferDetails].part[bearerToken].valueString = "ZHVtbXkgdG9rZW4="
* parameter[input][+].part[url].valueUrl = "https://example.com/blob/bigfile.ndjson"

