## Operation Request Body

> NOTE: As of the time of this publication, the [Bulk Data Access IG](https://hl7.org/fhir/uv/bulkdata/en/) is in the process of being updated based on implementer feedback as part of industry initiatives. Its specification for "Bulk Submit" is still under development and has been adopted by DEQM with the $bulk-submit operation before it has been balloted in the Bulk Data Access IG.
{:.stu-note}

The request body for this operation is a [FHIR Parameters Resource](https://www.hl7.org/fhir/parameters.html). The body SHALL include a FHIR MeasureReport Resource of type `data-collection` that references a measure by canonical URL. 

#### Relationship to Bulk Export

The [FHIR Bulk Export API](https://build.fhir.org/ig/HL7/bulk-data/en/export.html) represents a pull based approach. The client (Data Recipient) makes a kick-off request to a server (Data Provider), polls for the export status and, when files are ready, retrieves them from the data provider. This model is well suited for ad-hoc data requests, where a client is trusted by the server and is able to provide filters describing the data required for a particular use. In contrast, the Bulk Submit operation is a push based approach where the Data Provider sends one or more lists of files (manifests) to the Data Recipient that contain a pre-coordinated data set. This model is well suited for cases where the required data is not ad-hoc, and the Data Provider can determine the correct timing for sending data to the Data Recipient.

The Bulk Submit operation described in this document may be used together with Bulk Export through an intermediary application that first requests a bulk export to obtain the data set from a Bulk Export server, retrieves the data, optionally transforms it, and then submits the resulting data to the Data Recipient.

Note that a future update to the Bulk Export specification may incorporate the ability to specify a Bulk Submit endpoint in a Bulk Export [kickoff request](https://build.fhir.org/ig/HL7/bulk-data/en/export.html##bulk-data-kick-off-request) and have the export server directly initiate submission with the Bulk Submit operation when the export is complete.


### Roles

There are two primary roles involved in a Bulk Submit transaction:

  1. **Data Provider** - consists of the following components:

      a. **Submission Client** - provides details on one or more Bulk Submission manifests to the Data Recipient and optionally tracks job status.

      b. **Output File Server** - returns files and attachments in response to urls in the submission manifests. This may be built integrated with FHIR Server, or the files may be independently hosted.

	  c. **Authorization Server** - issues access tokens and authenticates file requests to the Output File Server. 

  2. **Data Recipient** - consists of the following components:

      a. **Submission Server** - accepts manifest details and provides job status.

      b. **Authorization Server** - issues access tokens and authenticates manifest submission and job status requests.

      c. **File Retrieval Client** - retrieves files listed in manifests from Data Provider.

      d. **File Processor** - processes submitted files with operation such as validation, quality metric calculation, and/or merging into an existing data set.
	  
	  
Constraints: 
- At least one of the `submissionStatus` and `manifestUrl` parameters SHALL be populated.
- When the `manifestUrl` parameter is populated the `fhirBaseUrl` SHALL be populated.

##### submissionStatus Parameter

The Data Provider uses the `submissionStatus` parameter to indicate the state of a submission to the Data Recipient:

* `in-progress` or omitted: Indicates that there will be additional requests to the `$bulk-submit` endpoint for the `submitter` and `submissionId` combination in that request.
* `complete`: Indicates there will be no additional requests to the `$bulk-submit` endpoint for the `submitter` and `submissionId` combination in that request.
* `aborted`: The submission is invalid. The Data Recipient must stop retrieving files and delete any data already processed from this submission. There will not be additional requests to the `$bulk-submit` endpoint for this `submitter` and `submissionId` combination.

###### Correcting Data (without aborting):
If a specific portion of the data is incorrect, the Data Provider should not cancel the entire submission. Instead, they should send a request that populates the `replacesManifestUrl` parameter. This tells the Data Recipient to discard the data from that specific previous manifest (and optionally replace it with a new `manifestUrl` when this element is populated) while keeping the other manifests in the submission valid.

##### Security

The Data Recipient SHOULD implement OAuth 2.0 access management in accordance with the [SMART Backend Services Authorization Profile](https://www.hl7.org/fhir/smart-app-launch/backend-services.html). When SMART Backend Services Authorization is used, the Data Provider SHALL use a token with a scope of `system/bulk-submit` when kicking off the bulk-submit operation, kicking off the bulk-submit-status operation, making a polling request to the endpoint provided from the kickoff, or navigating to a bulk manifest returned by the operation.

If the `oauthMetadataUrl` parameter in the request is populated with the path to an [OAuth 2.0 Protected Resource Metadata file](https://datatracker.ietf.org/doc/rfc9728/) such as a [FHIR Authorization Endpoint and Capabilities Discovery file](https://hl7.org/fhir/smart-app-launch/conformance.html#using-well-known) for [SMART Backend Services](https://www.hl7.org/fhir/smart-app-launch/backend-services.html), the Data Recipient SHALL obtain and use a valid token when retrieving the manifest at the manifestUrl in the request. If the `requiresAccessToken` parameter in the retrieved manifest is also set to `true`, the Data Recipient SHALL obtain and use a token scoped to read the resource types included in the manifest when retrieving the referenced files.

If the `fileEncryptionKey` parameter in the request is set to `jwe`, the Data Provider SHALL use the key in `fileEncryptionKey.value` to encrypt the manifest and each file listed in the `output` section of the manifest and the Data Recipient SHALL use this key to decrypt these files.

If the `fileRequestHeaders` parameter is included in the request, the Data Recipient SHALL provide the listed header name and value pairs when requesting a manifest or data file.

##### Manifest

When populated, the `manifestUrl` parameter of the request SHALL contain a url pointing to a valid [Bulk Data Manifest](https://build.fhir.org/ig/HL7/bulk-data/en/export.html#response---output-manifest) though when used in a submission the `request` field in the manifest MAY be omitted. This manifest MAY contain a `link` field, and when present, the Data Recipient SHALL follow this link to retrieve additional manifests. Alternatively, the Data Provider MAY call the Bulk Submit operation multiple times, each with a different manifestUrl, using the same `submitter` and `submissionId` parameters to indicate that the contents of these manifests are part of a single submission. All operation parameters other than `submitter`, `submissionId` and `submissionStatus` relate to the `manifestUrl` being sent and, when they're applicable, these parameters SHALL be included in the request even if they were populated in a previous request.

#### Request Headers

- `Accept` (string)
  Specifies the format of the optional FHIR `OperationOutcome` resource response to the request. Support for `application/fhir+json` is required. A client SHOULD provide this header. If omitted, the server MAY return an error or MAY process the request as if `application/fhir+json` was supplied.

#### Response - Success

- HTTP Status Code of `200 OK`
- Optionally, a FHIR `OperationOutcome` resource in the body

#### Response - Error (e.g., unsupported input parameter)

- HTTP Status Code of `4XX` or `5XX`
- The body SHALL be a FHIR `OperationOutcome` resource

If a server wants to prevent a client from beginning a new submission before an in-progress submission is completed, it SHOULD respond with a `429 Too Many Requests` status and a [`Retry-After`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After) header, following the rate-limiting advice desribed in [Bulk Data Status Request](https://build.fhir.org/ig/HL7/bulk-data/en/export.html#bulk-data-status-request) .