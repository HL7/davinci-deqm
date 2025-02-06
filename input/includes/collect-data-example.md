
### Examples

**Scenario:**

Payer Z acting in the role of the Consumer collect Patient Z's MRP data from Provider X which is acting in role of the Producer

**Request using GET Syntax**

`GET [base]/MeasureReport/measure-mrp/$collect-data?subject=Patient/patient-z&provider=Practitioner/provider-x&periodStart=2018-06-19`

**Request using POST Syntax**

`POST [base]/MeasureReport/measure-mrp/$collect-data`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"subject",
         "valueUri":"Patient/patient-z"
      },
      {
         "name":"practitioner",
         "valueUri":"Practitioner/provider-x"
      },
      {
         "name":"periodStart",
         "valueDate":"Practitioner/2018-06-19"
       },
	   {
         "name":"periodEnd",
         "valueDate":"Practitioner/2018-12-31"
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
                 "resource":"{"resourceType": "Encounter",
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
