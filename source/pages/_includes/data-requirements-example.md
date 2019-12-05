https://healthedata1.g### Example
{:.no_toc}

**Scenario**

Provider X acting in the role of the Producer requests data requirements for the MRP measure from Payer Z which is acting in the role of Consumer.  A Library resource containing the required resources for MRP attestation returned on successful evaluation.

**Request using `GET`**

`GET [base]/Measure/measure-mrp/$data-requirements?periodStart=2018&periodEnd=2018`

**Request using `POST`**

`POST [base]/Measure/measure-mrp/$data-requirements`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"periodStart",
         "valueDate":"2018"
      },
      {
         "name":"periodEnd",
         "valueDate":"2018"
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
   "resourceType":"Library",
   "id":"library-mrp-example",
   "url": "http://hl7.org/fhir/us/davinci-deqm/Library/library-mrp-example",
   "name": "DEQMLibraryMRPExample",
   "title": "DEQM Library MRP Example",
   "status":"active",
   "description": "Example Library resource to demonstrate the framework for MRP",
   "type":{
      "coding":[
         {
            "code":"module-definition"
         }
      ]
   },
   "dataRequirement":[
      {
         "type":"MeasureReport",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/datax-measurereport-deqm"]
      },
      {
         "type":"Patient",
         "profile":[
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
         ]
      },
      {
         "type":"Encounter",
         "profile":[
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter"
         ]
      },
      {
         "type":"Location",
         "profile":[
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location"
         ]
      },
      {
         "type":"Task",
         "profile":[
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-task"
         ]
      },
      {
         "type":"Organization",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/organization-deqm"
         ]
      },
      {
         "type":"Practitioner",
         "profile":[
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-practitioner"
         ]
      }
   ]
}
~~~
