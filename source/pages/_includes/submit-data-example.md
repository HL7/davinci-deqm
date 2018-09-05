### Examples
{:.no_toc}

**Scenario:**

Provider X submits MRP data for Patient Y to Payer Z.  The body of the request is a Parameters resource containing the required profiles for MRP attestation using Task as the resource used to evaluate the measure.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-mrp/$submit-data`

**Request body**

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
        "resource":"{"resourceType": "Coverage",
        ...}
      },

    ]
 }
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
