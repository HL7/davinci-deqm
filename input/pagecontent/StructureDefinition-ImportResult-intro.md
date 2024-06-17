### General Structure

The Import Results Profile is designed to communicate the results of an
[`$import`](OperationDefinition-import.html) operation invocation. Specifically,
it includes parameter entries for

1. `requestIdentity`: for the contents of the `requestIdentity` parameter from the
   [Import Manifest](StructureDefinition-ImportManifest.html) provided during invocation.
2. OperationOutcome instances representing issues encountered during processing.

Exchange partners may choose to add additional details relevant to their processing
and feedback needs.

### Linking to the Original Reqeust

The `requestIdentity` parameter entry is used to indicate which `$import` submission
the results are for. While not required since Producers can use the polling location
to link back to the original request, Consumers **SHOULD** include this detail in the
returned results. When present, the contents of this parameter **SHALL** be the same
as those provided by the Producer in the `requestIdentity` parameter entry of the
[Import Manifest](StructureDefinition-ImportManifest.html) used to invoke the `$import`
operation.

To see how this looks in practice, see the following three manifest-result pairs
that cover the different ways that the `requestIdentity` parameter can be structured:

| **`requestIdentity` pattern** | **Manifest** | **Result** |
| ----- | ----- | ----- |
| [Simple Identity](StructureDefinition-ImportManifestSimpleIdentity.html) | [example-import-manifest-simple-identity](Parameters-example-import-manifest-simple-identity.json.html) | [example-import-result-simple-identity-success](Parameters-example-import-result-simple-identity-success.json.html) |
| [Complex Identity](StructureDefinition-ImportManifestComplexIdentity.html) | [example-import-manifest-complex-identity](Parameters-example-import-manifest-complex-identity.json.html) | [example-import-result-complex-identity-error-file](Parameters-example-import-result-complex-identity-error-file.json.html) |
| [Resource Identity](StructureDefinition-ImportManifestResourceIdentity.html) | [example-import-manifest-resource-identity](Parameters-example-import-manifest-resource-identity.json.html) | [example-import-result-resource-identity-input-error-embedded](Parameters-example-import-result-resource-identity-input-error-embedded.json.html) |

### Communicating Issues

Issues during processing are communicated using FHIR OperationOutcome instances.
The results structure provides several ways to communicate the OperationOutcome
instances and associated context. Regardless of how they are communicated
Consumers should take care to not provide the same OperationOutcome multiple times,
e.g., an OperationOutcome present in a input-specific file would not also be
present as an embedded OperationOutcome instance or in another OperationOutcome file.

#### Embedded OperationOutcome instances vs separate files

OperationOutcome instances can either be included
- Directly within the Parameters instance: using an `operationOutcome` parameter entry under an `outcome` entry ([example result](Parameters-example-import-result-resource-identity-input-error-embedded.json.html)), or
- Within a separate `ndjson` file containing OperationOutcome instances: using a `url` parameter entry under an `outcome` entry ([example result](Parameters-example-import-result-complex-identity-error-file.json.html),
[example file](import-errors.ndjson)).

Consumers **SHOULD** use the file approach if embedding the OperationOutcome
instances within the Import Results would result in the size of the results
being greater than the [input size limit](bulk-import.html#input-size-limits).
The OperationOutcome files **SHOULD** themselves adhere to the agreed size limit.

When the file approach is used, requests that the Producer makes to retrieve
OperationOutcome files **SHOULD** be secured using the same process as the
original `$import` request.

#### Associating OperationOutcomes with specific inputs

OperationOutcome embedded instances or files can be associated with specific inputs using
an `associatedInputUrl` parameter entry under the corresponding `outcome` entry. To
associate multiple OperationOutcome instances or files with a particular input, 
Consumers **SHALL** include multiple `outcome` parameter entries with the same 
`associatedInputUrl` sub-parameter value ([example result](Parameters-example-import-result-resource-identity-input-error-embedded.json.html)).

#### No issues

If no issues are encountered Consumers **MAY** include an `OperationOutcome`
instance modeled on the ["all ok" 
example](https://hl7.org/fhir/R4/operationoutcome-example-allok.html) ([example result](Parameters-example-import-result-simple-identity-success.json.html)) or no
`OperationOutcome` at all.