#### Examples
{:.no_toc}

**Scenario:**

Reporter X submits a MRP Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and Task resources all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**
~~~
{
   "id": "indv-report01",
   "entry": [
      {
         "fullUrl": "urn:uuid:a5481b62-45e7-11e9-b20c-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Coverage"
         },
         "resource": {
            ...
            "resourceType": "Coverage"
         }
      },
      {
         "fullUrl": "urn:uuid:a548418c-45e7-11e9-b2e8-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Encounter"
         },
         "resource": {
            ...
            "resourceType": "Encounter"
         }
      },
      {
         "fullUrl": "urn:uuid:a548418d-45e7-11e9-a7b9-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Location"
         },
         "resource": {
          ...
            "resourceType": "Location"
         }
      },
      {
         "fullUrl": "urn:uuid:a548689e-45e7-11e9-9b0c-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "MeasureReport"
         },
         "resource": {
          ...
            "resourceType": "MeasureReport"
         }
      },
      {
         "fullUrl": "urn:uuid:a548689f-45e7-11e9-8e8f-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Organization"
         },
         "resource": {
          ...
            "resourceType": "Organization"
         }
      },
      {
         "fullUrl": "urn:uuid:a54890a2-45e7-11e9-bdf7-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Organization"
         },
         "resource": {
          ...
            "resourceType": "Organization"
         }
      },
      {
         "fullUrl": "urn:uuid:a54890a3-45e7-11e9-8814-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Patient"
         },
         "resource": {
           ...
            "resourceType": "Patient"
         }
      },
      {
         "fullUrl": "urn:uuid:a548b76e-45e7-11e9-aed5-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Practitioner"
         },
         "resource": {
           ...
            "resourceType": "Practitioner"
         }
      },
      {
         "fullUrl": "urn:uuid:a548de80-45e7-11e9-83b6-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "Task"
         },
         "resource": {
           ...
            "resourceType": "Task"
         }
      }
   ],
   "type": "transaction",
   "resourceType": "Bundle"
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
