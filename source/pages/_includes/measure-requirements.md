
**Scenario**

Provider X requests data requirements for the MRP measure from Payer Z. Library resource containing the required resources for MRP attestation returned on successful evaluation.

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
   "status":"active",
   "type":{
      "coding":[
         {
            "code":"module-definition"
         }
      ]
   },
   "relatedArtifact":[
      {
         "type":"depends-on",
         "resource":{
            "reference":"Library/library-mrp-model-definition"
         }
      }
   ],
   "dataRequirement":[
      {
         "type":"MeasureReport",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm-stu3/StructureDefinition/measurereport-mrp"
         ]
      },
      {
         "type":"Patient",
         "profile":[
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
         ]
      },
      {
         "type":"Encounter",
         "profile":[
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
         ]
      },
      {
         "type":"Location",
         "profile":[
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location"
         ]
      },
      {
         "type":"Task",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm-stu3/StructureDefinition/task-mrp"
         ]
      },
      {
         "type":"Organization",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm-stu3/StructureDefinition/organization-davinci"
         ]
      },
      {
         "type":"Practitioner",
         "profile":[
            "http://hl7.org/fhir/us/davinci-deqm-stu3/StructureDefinition/practitioner-davinci"
         ]
      }
   ]
}
~~~
