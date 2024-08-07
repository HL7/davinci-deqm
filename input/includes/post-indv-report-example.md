
#### Examples
{:.no_toc}

**Scenario:**

Reporter X submits a MRP Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and Task resources all the related resources containing the relevant data used to compute the CQM criteria.  For a successful transaction, the server returns a Bundle with type set to `transaction-response` that contains one entry for each entry in the request, in the same order, with the outcome of processing the entry.

**POST Individual Report**

`POST [base]`

**Request body**
~~~
{
   "id": "bundle-indv-report01",
   "resourceType": "Bundle"
   "type": "transaction",
   "entry": [
      {
         "fullUrl": "urn:uuid:a548689e-45e7-11e9-9b0c-5cf3707b2e61",
         "request": {
            "method": "POST",
            "url": "MeasureReport"
         },
         "resource": {
          ...
            "resourceType": "MeasureReport",
            "evaluatedResource": [
              {
                  "reference": "Coverage/###ID"
              },
              {
                  "reference": "Encounter/###ID"
              },
              {
                  "reference": "Location/###ID"
              },
              {
                  "reference": "Organization/###ID"
              },
              {
                  "reference": "Patient/###ID"
              },
              {
                  "reference": "Practitioner/###ID"
              },
              {
                  "reference": "Task/###ID"
              }

           ]
         }
      },
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
   ]
}
~~~

**Response**

~~~
HTTP/1.1 200
Date: Wed, 13 Mar 2019 01:02:06 GMT
Content-Type: application/fhir+json;charset=UTF-8
...Other Headers...

{
  "resourceType": "Bundle",
  "type": "transaction-response",
  "entry": [
    {
      "response": {
        "status": "201 Created",
        "location": "MeasureReport/datax-measurereport01/_history/1",
        ...
      }
    },
    {
      "response": {
        "status": "201 Created",
        "location": "Task/task01/_history/1",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Patient/patient01/_history/4",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Location/location01/_history/2",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Practitioner/practitioner01/_history/4",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Organization/organization01/_history/4",
        ...
      }
    },
    {
      "response": {
        "status": "201 Created",
        "location": "Encounter/8592c13d-821a-bfef-74db-ae614e754d4f/_history/1",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Coverage/coverage01/_history/2",
        ...
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Organization/organization04/_history/4",
        ...
      }
    }
  ]
}

~~~
