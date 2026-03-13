## Operation Request Body

> NOTE: As of the time of this publication, the [Bulk Data Access IG](https://hl7.org/fhir/uv/bulkdata/en/) is in the process of being updated based on implementer feedback as part of industry initiatives. Its specification for "Bulk Submit" is still under development and has been adopted by DEQM with the $bulk-submit operation before it has been balloted in the Bulk Data Access IG.
{:.stu-note}

### Bulk Submit Status Operation

After a Data Provider has kicked off a Bulk Submit operation, they may wish to receive updates on the status of the submission. For example, a Data Recipient may indicate files it was unable to retrieve, resources that failed validation or resources that weren't able to be merged into an existing data set. Additionally, the Data Recipeint may need to return processed data back to the Data Provider. For example, a set of computed quaity measures or a de-identified version of the submitted data. The Bulk Submit Status operation provides a way for a Data Providers to request FHIR resources related to a submission from the Data Recipient.

##### Headers

- `Accept` (string)
  Specifies the format of the optional FHIR `OperationOutcome` resource response to the kick-off request. Currently, only `application/fhir+json` is supported. A client SHOULD provide this header. If omitted, the server MAY return an error or MAY process the request as if `application/fhir+json` was supplied.

- `Prefer` (string)
  Specifies whether the response is immediate or asynchronous. Currently, only a value of <a href="https://datatracker.ietf.org/doc/html/rfc7240#section-4.1"><code>respond-async</code></a> is supported. A client SHOULD provide this header. If omitted, the server MAY return an error or MAY process the request as if respond-async was supplied.

#### Response - Success

- HTTP Status Code of `202 Accepted`
- `Content-Location` header with the absolute URL of an endpoint for subsequent status requests (polling location)
- Optionally, a FHIR `OperationOutcome` resource in the body in JSON format

#### Response - Error (e.g., unsupported input parameter)

- HTTP Status Code of `4XX` or `5XX`
- The body SHALL be a FHIR `OperationOutcome` resource in JSON format

If a server wants to prevent a client from beginning a new submission before an in-progress submission is completed, it SHOULD respond with a `429 Too Many Requests` status and a [`Retry-After`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After) header, following the rate-limiting advice for a [Bulk Data Status Request](https://build.fhir.org/ig/HL7/bulk-data/export.html#bulk-data-status-request).

### Bulk Data Status Polling Request

After a Bulk Status request has been started, the request and response flow will follow the [FHIR Asynchronous Request Pattern](https://www.hl7.org/fhir/R4/async.html). 

The Data Recipient MAY return a [partial export manifest](https://build.fhir.org/ig/HL7/bulk-data/export.html#response---in-progress-status) and a HTTP status of 202 while the submission is incomplete or is being processed. 

Once the submission is complete (a request was sent by the Data Provider with a submission status of `complete` and the Data Recipient has retrieved and processed the files from the Data Provider) the Data Recipient SHALL return an [export manifest](https://build.fhir.org/ig/HL7/bulk-data/export.html#response---output-manifest) and a HTTP status of 200. 

These manifests provide a mechanism for the Data Recipient to return resources related to the data submission. If there isn't relevant information to communicate and the submission is complete, the Data Recipient MAY return a manifest with empty output and error sections. Each manifest SHALL include an extension at the root level with a `submissionId` element listing the relevant submission.

If there is status information to communicate, the Data Recipient SHALL populate the `error` section of the manifest with one or more files that contain OperationOutcome resources. For example, the Data Recipient may want to indicate that there are filesfrom the Data Provider it was unable to retrieve, resources that failed validation or resources that weren't successfully merged into an existing data set. The number and granularity of the OperationOutcome resources retured by the Data Recipeint depend on the use case and implementation. A Data Recipient may wish to return a set of high level OperationOutcome resources indicating the status of each manifest submitted, more granular OperationOutcome resources indicating the status of each resource submitted, or both.

Each item in the `error` section of the manifest SHALL include an extension with an element named `manifestUrl` that links the OperationOutcome file to the manifestUrl submitted by the Data Provider where the issue occurred. A single manifestUrl may be referenced from multiple items in the error section. Each item in the manifest SHALL also include a url pointing to a bulk file of OperationOutcome resources. If an issue is related to individual resources submitted by the Data Provider, the OperationOutcome resource for the issue SHOULD use the [artifact-relatedArtifact](https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-artifact-relatedArtifact.html) extension at its root to reference those resources. If an issue is related to a large number of resources, the Data Recipient SHOULD provide multiple OperationOutcome resources, each of which reference a few of the resources submitted by the Data Provider, to avoid making the individual OperationOutcome resources extremely large. The Data Recipient MAY include an extension for each item in the `error` section named `countSeverity` containing an object with keys of the `OperationOutcome.severity` codes present in that file and values of the number of instances of each code. 

If there are resources to return, the Data Recipient SHALL populate the `output` section of the manifest with one or more files that contain FHIR resources. Each item in the `output` section of the manifest SHOULD include an extension with an element named `manifestUrl` that links the OperationOutcome file to the manifestUrl submitted by the Data Provider. A single manifestUrl may be referenced from multiple items in the output section.

Example status manifest:
```json
{
  "extension": {
    "submissionId": "a15eea1f-1605-4303-989f-542d3a7962d8"
  },
  "transactionTime": "2025-01-01T00:00:00Z",
  "request": "https://fhir-base/$bulk-submit-status",
  "requiresAccessToken": true,
  "error" : [{
    "extension": {
      "manifestUrl": "https://example.com/manifests/3556d214-c6e2-42e6-a7f7-89690f7a40bb_2",
      "countSeverity": {"success": 98, "error": 2}
    },
    "url": "https://example.com/output/validation_errors_2.ndjson"
  },{
    "extension": {
      "manifestUrl": "https://example.com/manifests/3556d214-c6e2-42e6-a7f7-89690f7a40bb_1",
      "countSeverity": {"success": 0, "error": 100}              
    },
    "url": "https://example.com/output/import_errors_1.ndjson"
  }]
}
```

Example OperationOutcome (resource level status):
```json
{
  "resourceType" : "OperationOutcome",
  "id" : "validationfailure-1",
  "extension": [{
    "url":"http://hl7.org/fhir/StructureDefinition/artifact-relatedArtifact",
    "valueRelatedArtifact": {
        "type": "comments-on",
        "resourceReference": "Patient/pt-1"
    }
  },{
    "url":"http://hl7.org/fhir/StructureDefinition/artifact-relatedArtifact",
    "valueRelatedArtifact": {
        "type": "comments-on",
        "resourceReference": "Patient/pt-2"
    }
  }],
  "issue" : [{
    "severity" : "error",
    "code" : "structure",
    "details" : {
      "text" : "Error parsing resource json (Unknown Content 'label')"
    },
    "location" : ["/f:Patient/f:identifier"],
    "expression" : ["Patient.identifier"]
  }]
}
```

Example OperationOutcome (manifest level status):
```json
{
  "resourceType" : "OperationOutcome",
  "id" : "manifest-oo-1",
  "issue" : [{
    "severity" : "success",
    "code" : "success",
    "details" : {
      "text" : "Manifest https://example.com/manifests/3556d214-c6e2-42e6-a7f7-89690f7a40bb_2 successfully imported."
    }
  }]
}
```