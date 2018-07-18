### Examples

**Scenario:** Provider X submits MRP data for Patient Z to Payer Z

**Assumptions:** ...TODO...

#### Request using POST Syntax

`POST [base]/MeasureReport/measure-mrp/$submit-data`

**Request body**

~~~text
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"measurereport",
         "valueUri":"{"resourceType": "MeasureReport",
         ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Task",
        ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Patient",
        ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Location",
          ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Practitioner",
        ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Organization",
        ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Encounter",
        ...}
      },
      {
        "name":"measurereport",
        "valueUri":"{"resourceType": "Coverage",
        ...}
      },

    ]
 }
~~~

#### Response is Bundle containing 8 required profiles:

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**  ( ...todo... edit this example )

~~~text
{
   "resourceType":"OperationOutcome",
   ....
}
~~~
