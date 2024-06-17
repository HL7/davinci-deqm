### Usage

The `$import` operation provides a way for data sources to request that a data
receiver retrieve and process a set of inputs containing a large number of FHIR
resource instances.

#### Invocation

The `$import` operation **SHALL** be invoked using POST with a body consisting
of an instance of the Parameters resource conforming to the 
[Import Manifest](StructureDefinition-ImportManifest.html) Profile.

Because the completion of the operation will take a significant amount of
receiver-side processing, the 
[FHIR Asynchronous Interaction Request Pattern](https://hl7.org/fhir/R5/async-bundle.html) 
will be used for invocation. Specifically, the initial invoction is considered
to be a [kick-off request](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.2)
meaning that
- The `Prefer` HTTP header of the request **SHALL** have the value `respond-async`.
- The response will not be the defined output of the `$import` operation, 
  but will include, if successful, a polling location for status requests in the 
  `Content-Location` HTTP header.

If successful, the Consumer will return a URL in the `Content-Location` that the
Producer can use to [check the status](#status-checks) of the Consumer's 
processing of the request.

Note that while the 
[FHIR Asynchronous Interaction Request Pattern](https://hl7.org/fhir/R5/async-bundle.html)
is defined in FHIR R5 and this is FHIR R4 IG, most of the pattern involves
HTTP-level details and interactions. Where FHIR resources are referenced, the
R4 versions **SHALL** be used.

#### Processing

If the data recipient accepts the `$import` request, then it will perform the
necessary retreivals and ingestion as specified in the 
[Import Manifest](StructureDefinition-ImportManifest.html) provided with the
invocation. The details of that ingestion and how to track its progress for
providing responses to [status checks](#status-checks) are
outside the scope of this specification.

#### Status Checks

The data source that invoked the `$import` operation will use the polling
location provided in the `Content-Location` HTTP header to determine the status
of the processing and eventually get final results.

The following sections detail the requirements for status check responses
during nominal execution of the operation. For details on how these responses
are adjusted to communicate issues during processing, see
[this section](#errors-after-acceptance-of-the-asynchronous-import-request)
below.

##### In-progress response

While the data receiver is still processing the request, a request to the
polling location will provide a 
[response](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.4.0.1) with an
`X-Progress` HTTP header containing an indication of the progress made
so far.

##### Completed response

Once the processing is completed the Consumer will return in response to a
request to the polling location a
[complete response](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.4.0.3),
including a `Bundle` instance with 
- type set to `batch-response`
- a single `entry` that includes
  - HTTP status details in the `entry.response` element, and
  - the output of the operation in the `entry.resource` element.

For a successful completion of the `$import` operation, the HTTP status code in 
`entry.response` **SHALL** indicate success and the `entry.resource`
**SHALL** contain an instance of the 
[Import Results Profile](StructureDefinition-ImportResult.html) 
([example Bundle](Bundle-example-async-completed-status-bundle-ok.json.html)). 

#### Error Handling

Errors are handled by the data receiver and communicated differently depending
on the type of error and when they occur.

##### Errors prior to acceptance of the asynchronous `$import` request

Errors encountered prior to the `$import` invocation being accepted should be
handled in such a way that the data source has no expectation that the data
recipient will do any further processing. A HTTP error status **SHALL** be
returned, e.g., following 
[these suggestions](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.2.0.3),
and the data source will need to retry the request with any necessary 
corrections.

##### Errors after acceptance of the asynchronous `$import` request

Errors that are encountered after acceptance will be communicated within the
response to a status check request initiated by the Producer. They come in
three flavors:

- Errors that occur before `$import` processing can begin: The processing will be 
  immediately considered completed on the Consumer side. Subsequent status check
  polls from the Producer will return a HTTP code indicating success, but an error
  **SHALL** be reported within the response body Bundle instanceusing an HTTP error
  code within the `Bundle.entry.response.status` element. Additional details 
  **SHOULD** be included in an OperationOutcome instance in the 
  `Bundle.entry.response.outcome` element. See [this Bundle
  instance](Bundle-example-async-failed-status-bundle.json.html) for an example
  of this case.
- Errors while processing the `$import` request: These **SHALL** be collected and 
  included as appropriate in the [Import Results](StructureDefinition-ImportResult.html)
  returned in the `Bundle.entry.resource` element. The HTTP status returned both for
  the status check request and in the `Bundle.entry.response.status` element 
  **SHALL** indicate success in this case. See [this Bundle 
  instance](Bundle-example-async-completed-status-bundle-ok.json.html) for an example
  of this case.
- Transient access errors during status request: These **SHALL** be reported by returning
  a HTTP error code in response to a status check poll by the Producer so that
  the Producer knows to retry later, e.g., following [these 
  suggestions](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.4.0.2). In this case,
  no result Bundle is returned.

#### Privacy and Security

Details on how to ensure that the communication of the data involved in this
operation is secure is outside the scope of this specification. In general,
requests that the Producer makes to the polling location **SHOULD** be
secured using the same process as the original `$import` request.