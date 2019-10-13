#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a MRP Summary Report for MRP for period P to Receiver Z.  The body of the request is MeasureReport resource containing the required  summary data for MRP attestation for the period. (Note that this a simplified example and just populates the count for initial population. However, counts for all populations specified in an eCQM *should* be reported in a summary report)  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]/MeasureReport`

**Request body**
~~~
{
  "resourceType": "MeasureReport",
  "id": "summ-measurereport01",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/ig/davinci/StructureDefinition/summary-measurereport-deqm"
    ]
  },
  "status": "complete",
  "type": "summary",
  "measure": {
    "reference": "Measure/measure-mrp"
  },
  "date": "2018-09-05T16:59:52.404Z",
  "period": {
    "start": "2018-08-01",
    "end": "2018-09-01"
  },
  "reportingOrganization": {
    "reference": "Organization/organization01"
  },
  "group": [
    {
      "identifier": {
        "system": "http://www.acme.org/groups",
        "value": "112"
      },
      "population": [
        {
          "identifier": {
            "system": "http://www.acme.org/populations",
            "value": "11234"
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
        }
      ],
      "measureScore": 100,
      "stratifier": [
        {
          "identifier": {
            "system": "http://www.acme.org/stratifiers",
            "value": "4456"
          },
          "stratum": [
            {
              "value": "male",
              "population": [
                {
                  "identifier": {
                    "system": "http://www.acme.org/stratifier-populations",
                    "value": "8901"
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
                  "count": 50
                }
              ],
              "measureScore": 100
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
