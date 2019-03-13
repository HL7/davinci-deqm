#### Examples
{:.no_toc}

**Scenario:**

Reporter X submits a MRP Summary Report for MRP for period P to Receiver Z.  The body of the request is MeasureReport resource containing the required  summary data for MRP attestation for the period.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]/MeasureReport`

**Request body**
~~~
{
   "resourceType":"MeasureReport",
   "meta":{
      "profile":[
         "http://hl7.org/fhir/ig/davinci/StructureDefinition/summary-measurereport-deqm"
      ]
   },
   "status":"complete",
   "type":"summary",
   "measure":{
      "reference":"https://ncqa.org/fhir/ig/Measure/measure-mrp"
   },
   "date":"2018-09-05T16:59:52.404Z",
   "period":{
      "start":"2018-08-01",
      "end":"2018-09-01"
   },
   "reportingOrganization":{
      "reference":"Organization/organization01"
   },
   "group":[
   {
      "identifier":{
         "system":"http://www.acme.org/groups",
         "value":"112"
      },

      {
         "population":[
            {
               "identifier":{
                  "system":"http://www.acme.org/populations",
                  "value":"11234"
               },
               "code":{
                  "coding":[
                     {
                        "system":"http://hl7.org/fhir/measure-population",
                        "code":"initial-population",
                        "display":"Initial Population"
                     }
                  ]
               },
               "count":100,
               "measureScore":100.00,
               "stratifier":[
                  {
                     "identifier":{
                        "system":"http://www.acme.org/stratifiers",
                        "value":"4456"
                     },
                     "stratum":[
                        {
                           "value":"male",
                           "population":[
                              {
                                 "identifier":{
                                    "system":"http://www.acme.org/stratifier-populations",
                                    "value":"8901"
                                 },
                                 "code":{
                                    "coding":[
                                       {
                                          "system":"http://hl7.org/fhir/measure-population",
                                          "code":"initial-population",
                                          "display":"Initial Population"
                                       }
                                    ]
                                 },
                                 "count":50
                              }
                           ],
                           "measureScore":100.0
                        }
                     ]
                  }
               ]
            }
         ]
      }
   ]
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
