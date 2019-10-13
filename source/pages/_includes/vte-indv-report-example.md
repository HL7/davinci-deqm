#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a VTE Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc4",
      "resource": {
        "resourceType": "MeasureReport",
        "status": "complete",
        "type": "individual",
        "measure": {
          "reference": "Measure/measure-vte"
        },
        "patient": {
          "reference": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc6"
        },
        "date": "2019-03-14",
        "reportingOrganization": {
          "reference": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc5"
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
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc5",
      "resource": {
        "resourceType": "Organization",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/organization-deqm"
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
            "system": "urn:oid:2.16.840.1.113883.4.2",
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
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc6",
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
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc7",
      "resource": {
        "resourceType": "Encounter",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter"
          ]
        },
        "status": "finished",
        "class": {
          "system": "http://hl7.org/fhir/encounter-class",
          "code": "inpatient",
          "display": "inpatient"
        },
        "type": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "32485007",
                "display": "Hospital admission"
              }
            ]
          }
        ],
        "subject": {
          "reference": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc6"
        },
        "period": {
          "start": "2018-07-19T11:00",
          "end": "2018-07-19T:14:30"
        },
        "location": [
          {
            "location": {
              "reference": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc8",
              "display": "Mother Charity Hospital"
            }
          }
        ],
      },
      "request": {
        "method": "POST",
        "url": "Encounter"
      }
    },
    {
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc8",
      "resource": {
        "resourceType": "Location",
        "identifier": [
          {
            "use": "official",
            "system": "http://www.hl7.org/oid/",
            "value": "1.2.3.4.181"
          }
        ],
        "status": "active",
        "name": "Mother Charity Hospital",
        "mode": "instance",
        "telecom": [
          {
            "system": "phone",
            "value": "(313) 555-5671",
            "use": "work"
          }
        ],
        "address": {
          "use": "work",
          "type": "physical",
          "line": [
            "869 W Oak Street"
          ],
          "city": "Royal Oak",
          "district": "Oakland County",
          "state": "MI",
          "postalCode": "48073"
        },
        "physicalType": {
          "coding": [
            {
              "system": "http://hl7.org/fhir/location-physical-type",
              "code": "bu",
              "display": "Building"
            }
          ]
        }
      },
      "request": {
        "method": "POST",
        "url": "Location"
      }
    },
    {
      "fullUrl": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc9",
      "resource": {
        "resourceType": "MedicationAdministration",
        "status": "completed",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "1658634",
              "display": "0.5 ML heparin sodium, porcine 10000 UNT/ML Injection"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:b5cf5a8c-63f0-437f-84fd-dc8a3cf43cc6"
        },
        "effectivePeriod": {
          "start": "2018-07-19T12:00",
          "end": "2018-07-19T12:00"
        },
        "dosage": {
          "route": {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "34206005",
                "display": "Subcutaneous route"
              }
            ]
          }
        }
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