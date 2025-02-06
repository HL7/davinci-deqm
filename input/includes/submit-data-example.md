
### Examples
{:.no_toc}

**Scenario:**

Provider X acting in the role of Producer submits MRP data for Patient Y to Payer Z who is acting in the role of Consumer.  The body of the request is a Parameters resource containing a Bundle with the required profiles for MRP attestation using Task as the resource used to evaluate the measure.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-mrp/$submit-data`

**Request body**

~~~
{
   "resourceType":"Parameters",
    "parameter":[
		{
          "name":"bundle",
          "resource":
             {"resourceType": "Bundle",
              "entry":[
               {
                 "resource":"{"resourceType": "MeasureReport",
                 ...}
               },
               {
                 "resource":"{"resourceType": "Patient",
                 ...}
               },
               {
                 "resource":"{"resourceType": "Location",
                   ...}
               },
               {
                 "resource":"{"resourceType": "Practitioner",
                 ...}
               },
               {
                 "resource":"{"resourceType": "Organization",
                 ...}
               },
               {
                 "resource":"{"resourceType": "Coverage",
                 ...}
               }
              ]
             }
       }
	] 
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
