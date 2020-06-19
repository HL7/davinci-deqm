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
        "text": "The `lastReceivedOn` parameter is not supported "
      },
      "diagnostics": "Resubmit all the information in the payload as a snapshot update"
    }
  ]
}
~~~
