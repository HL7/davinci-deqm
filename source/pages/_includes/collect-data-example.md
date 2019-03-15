#### Examples

**Scenario:** Payer Z acting in the role of the Consumer collect Patient Z's MRP data from Provider X which is acting in role of the Producer

**Request using GET Syntax**

`GET [base]/MeasureReport/measure-mrp/$collect-data?patient=Patient/patient-z&provider=Practitioner/provider-x&periodStart=2018-06-19`



**Request using POST Syntax**

`POST [base]/MeasureReport/measure-mrp/$collect-data`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"patient",
         "valueUri":"Patient/patient-z"
      },
      {
         "name":"practitioner",
         "valueUri":"Practitioner/provider-x"
      },
      {
         "name":"periodStart",
         "valueDate":"Practitioner/2018-06-19"
       }
    ]
 }
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"measurereport",
         "resource":"{"resourceType": "MeasureReport",
         ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Task",
        ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Patient",
        ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Location",
          ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Practitioner",
        ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Organization",
        ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Encounter",
        ...}
      },
      {
        "name":"resource",
        "resource":"{"resourceType": "Coverage",
        ...}
      },

    ]
 }
~~~
