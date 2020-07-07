
#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a VTE Summary Report for COL for period P to Receiver Z.  The body of the request is MeasureReport resource containing the required summary data for VTE attestation for the period.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]/MeasureReport`

**Request body**

~~~
{
  "resourceType": "MeasureReport",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/ig/davinci/StructureDefinition/summary-measurereport-deqm"
    ]
  },
  "status": "complete",
  "type": "summary",
  "measure": {
    "reference": "Measure/measure-vte"
  },
  "date": "2019-03-14",
  "period": {
    "start": "2018-01-01",
    "end": "2018-12-31"
  },
  "reportingOrganization": {
    "reference": "Organization/organization01"
  },
  "group": [
    {
      "identifier": {
        "system": "http://www.example.org/groups",
        "value": "123"
      },
      "population": [
        {
          "identifier": {
            "system": "http://www.example.org/populations",
            "value": "456"
          },
          "code": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/measure-population",
                "code": "initial-population",
                "display": "Initial Population"
              }
            ]
          },
          "count": 100
        },
        {
          "identifier": {
            "system": "http://www.example.org/populations",
            "value": "789"
          },
          "code": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/measure-population",
                "code": "numerator",
                "display": "Numerator"
              }
            ]
          },      
          "count": 50
        },
        {
          "identifier": {
            "system": "http://www.example.org/populations",
            "value": "987"
          },
          "code": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/measure-population",
                "code": "denominator",
                "display": "Denominator"
              }
            ]
          },
          "count": 100
        }
      ],
      "measureScore": 50
    }
  ]
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~