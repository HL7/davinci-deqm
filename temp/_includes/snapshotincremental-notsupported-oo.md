~~~
HTTP/1.1 400 Not Found
[other headers]
{
  "resourceType": "OperationOutcome",
  "id": "no-status",
  "issue": [
    {
      "severity": "error",
      "code": "business-rule",
      "details": {
        "text": "Snapshot/Incremental update is not supported."
      },
      "diagnostics": "Resubmit the payload as a snapshot/incremental update and populate the extension http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataa-updateType" with the code 'snapshot'/'incremental'"
    }
  ]
}
~~~
