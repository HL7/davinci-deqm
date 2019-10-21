#### Examples
{:.no_toc}

**Scenario:**

Payer X acting in the role of Consumer collect Patient Y's COL data from Provider Z, which is acting in the role of Producer.  The body of the request is a Parameters resource containing the desired input parameters.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-col/$collect-data`

**Request body**

~~~
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "periodStart",
      "valueDate": "2018-01-01"
    },
    {
      "name": "periodEnd",
      "valueDate": "2018-12-31"
    },
    {
      "name": "patient",
      "valueUri": "Patient/patient-col"
    }
  ]
}
~~~

**Response**

~~~
HTTP/1.1 200
Date: Wed, 14 Mar 2019 01:02:06 GMT
Content-Type: application/fhir+json;charset=UTF-8
...Other Headers...

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "measurereport",
      "resource": {
        "resourceType": "MeasureReport",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/datax-measurereport-deqm"
          ]
        },
        "status": "complete",
        "_type": {
          "extension": [
            {
              "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataCollectionType",
              "valueBoolean": true
            }
          ]
        },
        "measure": "Measure/measure-col",
        "patient": {
          "reference": Patient/patient-col
        },
        "date": "2019-03-14",
        "period": {
          "start": "2018-01-01,
          "end": "2018-12-31"
        },
        "evaluatedResources": [
          {"reference": "Patient/patient-col"},
          {"reference": "Practitioner/practitioner-col"},
          {"reference": "Observation/fit-dna-observation"}
    ],
    {
      "name": "resource",
      "resource": {
        "resourceType": "Patient",
        "id": "patient-col",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
          ]
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
            "valueCode": "F"
          },
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2106-3",
                  "display": "White"
                }
              },
              {
                "url": "text",
                "valueString": "White"
              }
            ]
          },
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2186-5",
                  "display": "Not Hispanic or Latino"
                }
              },
              {
                "url": "text",
                "valueString": "Not Hispanic or Latino"
              }
            ]
          }
        ],
        "identifier": [
          {
            "use": "usual",
            "type": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/v2/0203",
                  "code": "MR",
                  "display": "Medical record number"
                }
              ]
            },
            "system": "http://hospital.davinci.org",
            "value": "67890"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "Webster",
            "given": [
              "Thelma"
            ]
          }
        ],
        "gender": "female",
        "birthDate": "1948-04-28",
        "deceasedBoolean": false,
        "address": [
          {
            "use": "home",
            "line": [
              "7496 Beaver Ridge Ave"
            ],
            "city": "Thornton",
            "state": "NJ",
            "postalCode": "07003",
            "country": "USA"
          }
        ],
        "maritalStatus": {
          "coding": [
            {
              "system": "http://hl7.org/fhir/v3/MaritalStatus",
              "code": "M",
              "display": "Married"
            }
          ]
        },
        "communication": [
          {
            "language": {
              "coding": [
                {
                  "system": "urn:ietf:bcp:47",
                  "code": "en-US",
                  "display": "US English"
                }
              ]
            },
            "preferred": true
          }
        ]
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Practitioner",
        "id": "practitioner-col",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/practitioner-deqm"
          ]
        },
        "identifier": [
          {
            "use": "official",
            "type": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/v2/0203",
                  "code": "PRN",
                  "display": "Provider number"
                }
              ]
            },
            "system": "http://hl7.org/fhir/sid/us-npi",
            "value": "123456789"
          }
        ],
        "active": true,
        "name": [
          {
            "family": "Akers",
            "given": [
              "Nia"
            ],
            "suffix": [
              "MD"
            ]
          }
        ],
        "gender": "female"
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Observation",
        "id": "fit-dna-observation",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/hedis/StructureDefinition/hedis-observation"
          ]
        },
        "status": "final",
        "category": [
          {
            "system": "http://hl7.org/fhir/observation-category",
            "code": "laboratory",
            "display": "Laboratory"
          }
        ],
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "77353-1",
              "display": "Noninvasive colorectal cancer DNA and occult blood screening [Interpretation] in Stool Narrative"
            }
          ]
        },
        "subject": {
          "reference": "Patient/patient-col"
        },
        "effectiveDateTime": "2018-06-22",
        "performer": [
          {
            "reference": "Practitioner/practitioner-col"
          }
        ]
      }
    }
  ]
}
~~~
