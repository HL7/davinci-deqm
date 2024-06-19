#### Patterns and Examples

The following sections provide a library of sub-parameter definitions that fit under each of the three categories for use in meeting specific use cases. Implementers are free to define their own sub-parameters to that fit into this structure to convey information necessary for their use case. However, when the patterns below can meet the needs of the use case, they **SHOULD** be used instead of a custom definition.

Note that these definitions provide standardization at two levels:

1. *Location*: they define **where** to find specific pieces of information, framed as an address of parameter names.
2. *Representation*: they define **how** that information is represented, including the type and, in some cases, allowable codes.

It is possible that a particuar use case will find that the patterns listed here contain a location for relevant information, but with a representation that does not meet the needs. When this situation arises, it is recommended to re-use the location and define an appropriate representation. Data recipients can update their implementations to use the new representation if they need to support the additional use case.

##### Request Identity Sub-Parameters

The following sub-parameters can be used underneath the `requestIdentity` parameter at the request (top) level:

| **Sub-Parameter Name** | **Use** | **Representation Options** | **Examples** |
| `sunbmissionId` | Represents an identifier for the request. | `string`, `uri`, `Identifier` | [profile](StructureDefinition-ImportManifestComplexIdentity.html), [instance](Parameters-example-import-manifest-complex-identity.json.html) |
| `submissionTime` | Represents the time the request was made. | `dateTime`, `instant` | [profile](StructureDefinition-ImportManifestComplexIdentity.html), [instance](Parameters-example-import-manifest-complex-identity.json.html) |
| `submittingOrganization` | Represents the organization making the request or submitting the inputs. | `Organization` resource | [profile](StructureDefinition-ImportManifestComplexIdentity.html), [instance](Parameters-example-import-manifest-complex-identity.json.html) |

Note that in cases where the request identity uses only a single thing to represent the request identity, whether a string or a complete FHIR resource instance, the `requestIdentity` parameter can be used directly rather than including a single sub-parameter. See [this profile](StructureDefinition-ImportManifestSimpleIdentity.html) and [instance](Parameters-example-import-manifest-simple-identity.json.html) for an example of `submissionId` used directly or [this profile](StructureDefinition-ImportManifestResourceIdentity.html) and [instance](Parameters-example-import-manifest-resource-identity.json.html) for an example of an entire FHIR resource.

##### Transfer Details Sub-Parameters

The following sub-parameters can be used underneath the `transferDetails` parameter at the request (top) level or the input level as indicated:

| **Sub-Parameter Name** | **Use** | **Level** | **Representation Options** | **Examples** |
| `protocol` | Represents the transfer protocol to use. | request or input | `code` (recommended value set binding TBD) | [profile](StructureDefinition-ImportManifestBearerDetails.html), [instance](Parameters-example-import-manifest-bearer-details.json.html) |
| `bearerToken` | Token to provide with prefix 'Bearer: ' in the Authorization header on input retrieval requests. | request or input | `string` | [profile](StructureDefinition-ImportManifestBearerDetails.html), [instance](Parameters-example-import-manifest-bearer-details.json.html) |
| `expirationTime` | Represents a temporal point at which these inputs will no longer be available for retrieval. | request or input | `dateTime`, `instant` | none |

##### Input Details Sub-Parameters

The following sub-parameters can be used underneath the `inputDetails` parameter at the request (top) level or the input level as indicated:

| **Sub-Parameter Name** | **Use** | **Level** | **Representation Options** | **Examples** |
| `format` | Represents the format use to represent the FHIR resource instances. | request or input | `code` (recommended value set binding TBD) | [profile](StructureDefinition-ImportManifestExportDetails.html), [instance](Parameters-example-import-manifest-export-details.html) |
| `query` | Represents a query that generated the data. | request or input | `string` | [profile](StructureDefinition-ImportManifestExportDetails.html), [instance](Parameters-example-import-manifest-export-details.json.html) |
| `queryBody` | Represents the body of a query or operation, e.g., if made using POST. | request or input | `Parameters` resource | none |
| `resourceType` | Represents the FHIR resource type of instances. | input only | `code` from [ResourceType](http://hl7.org/fhir/R4/valueset-resource-types.html) | [profile](StructureDefinition-ImportManifestLayout.html), [instance](Parameters-manifest-by-type-example.json.html) |
| `subjectType` | Represents the FHIR resource type of subjects for [inputs laid out *by subject*](bulk-import.html#by-subject). When set at the request level applies to all inputs that don't indicate a specific `resourceType`, which indicates that the input contains instances of a [split out resource type](bulk-import.html#by-subject-with-shared-instances-split-out). | request only | `code` from [ResourceType](http://hl7.org/fhir/R4/valueset-resource-types.html) | [profile](StructureDefinition-ImportManifestLayout.html), [instance](Parameters-manifest-by-subject-example.json.html) |
| `multiInputSubject` | Indicates that this input is part of a set associated with a subject with a block [larger than the input size limit](bulk-import.html#special-case-subjects-too-large-for-a-single-input). The value will be a relative reference to the multi-input subject. | input only | `Reference` | [profile](StructureDefinition-ImportManifestLayout.html), [instance](Parameters-manifest-by-subject-size-limit-example.json.html) |
