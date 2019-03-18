#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a COL Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57904",
      "resource": {
        "resourceType": "MeasureReport",
        "status": "complete",
        "type": "individual",
        "measure": {
          "reference": "Measure/measure-col"
        },
        "patient": {
          "reference": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57906"
        },
        "date": "2019-03-14",
        "reportingOrganization": {
          "reference": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57905"
        },
        "period": {
          "end": "2018-01-01",
          "start": "2018-12-31"
        },
        "group": [
          {
            "population": [
              {
                "code": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/measure-population",
                      "code": "initial-population",
                      "display": "Initial Population"
                    }
                  ]
                }
              },
              {
                "code": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/measure-population",
                      "code": "numerator",
                      "display": "Numerator"
                    }
                  ]
                }
              },
              {
                "code": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/measure-population",
                      "code": "denominator",
                      "display": "Denominator"
                    }
                  ]
                }
              } 
            ],
            "measureScore": 100
          } 
        ]
      },
      "request": {
        "method": "POST",
        "url": "MeasureReport"
      }
    },
    {
      "fullUrl": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57905",
      "resource": {
        "resourceType": "Organization",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/organization-deqm"
          ]
        },
        "identifier": [
          {
            "use": "official",
            "type": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/v2/0203",
                  "code": "TAX",
                  "display": "Tax ID number"
                }
              ]
            },
            "system": "urn:oid:2.16.840.1.113883.4.4",
            "value": "123456789",
            "assigner": {
              "display": "www.irs.gov"
            }
          }
        ],
        "active": true,
        "type": [
          {
            "coding": [
              {
                "system": "http://hl7.org/fhir/organization-type",
                "code": "prov",
                "display": "Healthcare Provider"
              }
            ]
          }
        ],
        "name": "DaVinciHospital01",
        "telecom": [
          {
            "system": "phone",
            "value": "(+1) 401-555-1212"
          }
        ],
        "address": [
          {
            "line": [
              "73 Lakewood Street"
            ],
            "city": "Warwick",
            "state": "RI",
            "postalCode": "02886",
            "country": "USA"
          }
        ]
      },
      "request": {
        "method": "POST",
        "url": "Organization"
      }
    },
    {
      "fullUrl": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57906",
      "resource": {
        "resourceType": "Patient",
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
      },
      "request": {
        "method": "POST",
        "url": "Patient"
      }
    },
    {
      "fullUrl": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57907",
      "resource": {
        "resourceType": "Practitioner",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/practitioner-deqm"
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
      },
      "request": {
        "method": "POST",
        "url": "Practitioner"
      }
    },
    {
      "fullUrl": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57908",
      "resource": {
        "resourceType": "Observation",
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
          "reference": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57906"
        },
        "effectiveDateTime": "2018-06-22",
        "performer": [
          {
            "reference": "urn:uuid:47709cc7-b3ec-4abc-9d26-3df3d3d57907"
          }
        ]
      },
      "request": {
        "method": "POST",
        "url": "Observation"
      }
    }
  ]
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~