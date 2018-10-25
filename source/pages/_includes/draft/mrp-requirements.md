#### Examples

**Scenario:** Provider X needs to discover the requirements from Payer Z in order to Post Attestation of MRP for Patient Z

**Assumptions:** ...TODO...

##### Request using either GET or POST Syntax

`GET [base]/Measure/measure-mrp/$mrp-requirements`

`POST [base]/Measure/measure-mrp/$mrp-requirements`

##### Response Parameters containing 8 required profiles represented by codes appointments:

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
         "name":"mrp-profile",
         "valueCode":"measurereport-mrp"
      },
      {
         "name":"mrp-profile",
         "valueCode":"task-mrp"
      },
      {
         "name":"mrp-profile",
         "valueCode":"location-davinci"
      },
      {
         "name":"mrp-profile",
         "valueCode":"coverage-davinci"
      },
      {
         "name":"mrp-profile",
         "valueCode":"organization-davinci"
      },
      {
         "name":"mrp-profile",
         "valueCode":"patient-davinci"
      },
      {
         "name":"mrp-profile",
         "valueCode":"practitioner-davinci"
      },
      {
         "name":"mrp-profile",
         "valueCode":"practitionerrole-davinci"
      }
   ]
}
~~~
