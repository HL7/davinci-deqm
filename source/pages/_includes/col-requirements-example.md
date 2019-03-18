
**Scenario**

Provider X acting in the role of the Producer requests data requirements for the COL measure from Payer Z which is acting in the role of Consumer.  A Library resource containing the required resources for COL attestation returned on successful evaluation.

**Request using `GET`**

`GET [base]/Measure/measure-col/$data-requirements?periodStart=2018-01-01&periodEnd=2018-12-31`

**Request using `POST`**

`POST [base]/Measure/measure-col/$data-requirements`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"periodStart",
         "valueDate":"2018-01-01"
      },
      {
         "name":"periodEnd",
         "valueDate":"2018-12-31"
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
            "reference":"http://hl7.org/fhir/us/hedis/Library/library-col-logic"
         }
      }
   ],
   "dataRequirement": [
     {
       "type": "Observation",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-observation"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1093"
         },
         {
           "path": "status",
           "valueCode": [
             "final",
             "amended"
           ]
         }
       ]
     },
     {
       "type": "DiagnosticReport",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1102"
         },
         {
           "path": "status",
           "valueCode": [
             "preliminary",
             "final",
             "amended",
             "corrected",
             "appended"
           ]
         }
       ]
     },
     {
       "type": "DiagnosticReport",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1064"
         },
         {
           "path": "status",
           "valueCode": [
             "preliminary",
             "final",
             "amended",
             "corrected",
             "appended"
           ]
         }
       ]
     },
     {
       "type": "DiagnosticReport",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1421"
         },
         {
           "path": "status",
           "valueCode": [
             "preliminary",
             "final",
             "amended",
             "corrected",
             "appended"
           ]
         }
       ]
     },
     {
       "type": "Observation",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-observation"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1420"
         },
         {
           "path": "status",
           "valueCode": [
             "final",
             "amended"
           ]
         }
       ]
     },
     {
       "type": "Condition",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-condition"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1065"
         },
         {
           "path": "verificationStatus",
           "valueCode": [
             "confirmed"
           ]
         }
       ]
     },
     {
       "type": "Procedure",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-procedure"
       ],
       "codeFilter": [
         {
           "path": "code",
           "valueSetString": "urn:oid:2.16.840.1.113883.3.464.1004.1250"
         },
         {
           "path": "status",
           "valueCode": [
             "completed"
           ]
         }
       ]
     },
     {
       "type": "Patient",
       "profile":[
          "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
       ]
     }
   ]
}
~~~