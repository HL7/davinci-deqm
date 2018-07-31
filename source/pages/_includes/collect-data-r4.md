### Examples
{:.no_toc}

**Scenario:**

 Payer Z fetches MRP data from Provider X for Patient Z

**Request using `POST`**

`POST [base]/MeasureReport/measure-mrp/$collect-data`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"patient",
         "valueReference":"{"reference" : "Patient/patient-z"}"
      },
      {
         "name":"practitioner",
         "valueReference":"{"reference" : "Practitioner/provider-x"}"
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
