
#### Examples
{:.no_toc}

**Scenario:**

A Client operating an analytics pipeline wants the underlying measure calculation for the patient *gaps-patient02* and the colorectal cancer screening measure, for the period from 2020-01-01 to 2020-12-31, but does not want the Gaps in Care document. The Client sets `isDocument` to `false`, so the Server returns the measure calculation and the data it evaluated, without wrapping them in a Composition. The Client determines gap status itself from the measure score.

**GET Gaps in Care Report with `isDocument=false`**


```
GET [base]/Measure/$care-gaps?measureUrl=http://hl7.org/fhir/uv/cqm/Measure/EXM130-FHIR|2.0.0&subject=Patient/gaps-patient02&periodStart=2020-01-01&periodEnd=2020-12-31&status=closed-gap&isDocument=false
```

**Request body**
~~~
(Note that request body is not applicable in this example)
~~~

**Response**

~~~
HTTP/1.1 200
Date: Tue, 30 June 2020 13:08:53 GMT
Content-Type: application/fhir+json;charset=UTF-8
...Other Headers...

{
  "resourceType": "Bundle",
  "id": "gaps-non-document-bundle01",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-gapsincarebundle"
    ]
  },
  "identifier": {
    "system": "urn:ietf:rfc:3986",
    "value": "urn:uuid:2f8c3a71-6b1e-4f0a-9c4d-0f2b7a5e1d93"
  },
  "type": "collection",
  "timestamp": "2020-06-30T13:08:53+00:00",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/gaps/MeasureReport/gaps-indv-measurereport03",
      "resource": {
        "resourceType": "MeasureReport",
        "id": "gaps-indv-measurereport03",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-individualmeasurereport"
          ]
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-measureScoring",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/measure-scoring",
                  "code": "proportion"
                }
              ]
            }
          },
          {
            "url": "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-certificationIdentifier",
            "valueIdentifier": {
              "system": "urn:oid:2.16.840.1.113883.3.2074.1",
              "value": "0015HQN9BD3304E"
            }
          },
          {
            "url": "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-reportingVendor",
            "valueReference": {
              "reference": "Organization/gaps-organization-reportingvendor"
            }
          }
        ],
        "status": "complete",
        "type": "individual",
        "measure": "http://hl7.org/fhir/uv/cqm/Measure/EXM130-FHIR|2.0.0",
        "subject": {
          "reference": "Patient/gaps-patient02"
        },
        "date": "2020-06-30T13:08:52+00:00",
        "reporter": {
          "reference": "Organization/organization01"
        },
        "period": {
          "start": "2020-01-01",
          "end": "2020-12-31"
        },
        "improvementNotation": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/measure-improvement-notation",
              "code": "increase"
            }
          ]
        },
        "group": [
          {
            "id": "group-exm130",
            "extension": [
              {
                "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.linkId",
                "valueString": "group-exm130"
              }
            ],
            "population": [
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId",
                    "valueString": "initial-population"
                  }
                ],
                "code": {
                  "coding": [
                    {
                      "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code": "initial-population",
                      "display": "Initial Population"
                    }
                  ]
                },
                "count": 1
              },
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId",
                    "valueString": "numerator"
                  }
                ],
                "code": {
                  "coding": [
                    {
                      "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code": "numerator",
                      "display": "Numerator"
                    }
                  ]
                },
                "count": 1
              },
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId",
                    "valueString": "denominator"
                  }
                ],
                "code": {
                  "coding": [
                    {
                      "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code": "denominator",
                      "display": "Denominator"
                    }
                  ]
                },
                "count": 1
              },
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId",
                    "valueString": "denominator-exclusion"
                  }
                ],
                "code": {
                  "coding": [
                    {
                      "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code": "denominator-exclusion",
                      "display": "Denominator Exclusion"
                    }
                  ]
                },
                "count": 0
              }
            ],
            "measureScore": {
              "value": 1.0
            }
          }
        ],
        "evaluatedResource": [
          {
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/cqf-criteriaReference",
                "valueString": "initial-population"
              },
              {
                "url": "http://hl7.org/fhir/StructureDefinition/cqf-criteriaReference",
                "valueString": "denominator"
              }
            ],
            "reference": "Encounter/gaps-encounter02"
          },
          {
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/cqf-criteriaReference",
                "valueString": "initial-population"
              },
              {
                "url": "http://hl7.org/fhir/StructureDefinition/cqf-criteriaReference",
                "valueString": "denominator"
              }
            ],
            "reference": "Patient/gaps-patient02"
          },
          {
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/cqf-criteriaReference",
                "valueString": "numerator"
              }
            ],
            "reference": "Procedure/gaps-procedure01"
          }
        ]
      }
    },
    {
      "fullUrl": "http://example.org/fhir/gaps/Patient/gaps-patient02",
      "resource": {
        "resourceType": "Patient",
        "id": "gaps-patient02",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
          ]
        },
        "extension": [
          {
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2028-9",
                  "display": "Asian"
                }
              },
              {
                "url": "text",
                "valueString": "Asian"
              }
            ],
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
          },
          {
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2135-2",
                  "display": "Hispanic or Latino"
                }
              },
              {
                "url": "text",
                "valueString": "Hispanic or Latino"
              }
            ],
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
          }
        ],
        "identifier": [
          {
            "use": "usual",
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "MR",
                  "display": "Medical Record Number"
                }
              ]
            },
            "system": "http://hospital.smarthealthit.org",
            "value": "999996992"
          }
        ],
        "name": [
          {
            "family": "Ludwich",
            "given": [
              "Thomas"
            ]
          }
        ],
        "gender": "male",
        "birthDate": "1957-01-01"
      }
    },
    {
      "fullUrl": "http://example.org/fhir/gaps/Encounter/gaps-encounter02",
      "resource": {
        "resourceType": "Encounter",
        "id": "gaps-encounter02",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter"
          ]
        },
        "status": "finished",
        "class": {
          "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code": "AMB",
          "display": "ambulatory"
        },
        "type": [
          {
            "coding": [
              {
                "system": "http://www.ama-assn.org/go/cpt",
                "code": "99202",
                "display": "Office or other outpatient visit for the evaluation and management of a new patient, which requires a medically appropriate history and/or examination and straightforward medical decision making. When using time for code selection, 15-29 minutes of total time is spent on the date of the encounter."
              }
            ]
          }
        ],
        "subject": {
          "reference": "Patient/gaps-patient02"
        },
        "period": {
          "start": "2020-03-05T07:00:00-00:00",
          "end": "2020-03-05T10:00:00-00:00"
        }
      }
    },
    {
      "fullUrl": "http://example.org/fhir/gaps/Procedure/gaps-procedure01",
      "resource": {
        "resourceType": "Procedure",
        "id": "gaps-procedure01",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-procedure"
          ]
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-Procedure.recorded",
            "valueDateTime": "2018-09-10T09:00:00-00:00"
          }
        ],
        "status": "completed",
        "code": {
          "coding": [
            {
              "system": "http://www.ama-assn.org/go/cpt",
              "code": "45384",
              "display": "Colonoscopy, flexible; with removal of tumor(s), polyp(s), or other lesion(s) by hot biopsy forceps"
            }
          ]
        },
        "subject": {
          "reference": "Patient/gaps-patient02"
        },
        "performedPeriod": {
          "start": "2018-09-10T08:00:00-00:00",
          "end": "2018-09-10T09:00:00-00:00"
        }
      }
    },
    {
      "fullUrl": "http://example.org/fhir/gaps/Organization/organization01",
      "resource": {
        "id": "organization01",
        "meta": {
          "lastUpdated": "2019-02-21T01:47:54.000+00:00",
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-organization"
          ],
          "versionId": "4",
          "source": "http://example.org/fhir/server"
        },
        "active": true,
        "address": [
          {
            "city": "Warwick",
            "country": "USA",
            "line": [
              "73 Lakewood Street"
            ],
            "postalCode": "02886",
            "state": "RI"
          }
        ],
        "identifier": [
          {
            "assigner": {
              "display": "www.irs.gov"
            },
            "system": "urn:oid:2.16.840.1.113883.4.4",
            "type": {
              "coding": [
                {
                  "code": "TAX",
                  "display": "Tax ID number",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "use": "official",
            "value": "123456789"
          }
        ],
        "name": "DaVinciHospital01",
        "telecom": [
          {
            "system": "phone",
            "value": "(+1) 401-555-1212"
          }
        ],
        "type": [
          {
            "coding": [
              {
                "code": "prov",
                "display": "Healthcare Provider",
                "system": "http://terminology.hl7.org/CodeSystem/organization-type"
              }
            ]
          }
        ],
        "resourceType": "Organization"
      }
    },
    {
      "fullUrl": "http://example.org/fhir/gaps/Organization/gaps-organization-reportingvendor",
      "resource": {
        "resourceType": "Organization",
        "id": "gaps-organization-reportingvendor",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-organization"
          ]
        },
        "identifier": [
          {
            "use": "official",
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "TAX",
                  "display": "Tax ID number"
                }
              ]
            },
            "system": "urn:oid:2.16.840.1.113883.4.4",
            "value": "123446789",
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
                "system": "http://terminology.hl7.org/CodeSystem/organization-type",
                "code": "pay",
                "display": "Payer"
              }
            ]
          }
        ],
        "name": "GapsReportingVendor01",
        "telecom": [
          {
            "system": "phone",
            "value": "(+1) 401-545-1212"
          }
        ],
        "address": [
          {
            "line": [
              "13 Drive Street"
            ],
            "city": "Cityplace",
            "state": "MA",
            "postalCode": "01101",
            "country": "USA"
          }
        ]
      }
    }
  ]
}

~~~

Note that the Bundle is of type `collection` and carries the MeasureReport together with every resource the MeasureReport references - the subject, the reporter, and each `evaluatedResource`. This example shows the minimal form, with no Composition and no DetectedIssue; a Server may also include gaps-in-care resources such as a DetectedIssue in a non-document bundle. The patient had a colonoscopy on 2018-09-10, which satisfies the numerator through 2020-12-31, so the measure score is 1.0. Because no DetectedIssue is present here, a Client infers a [closed gap] from that score rather than reading a `gapStatus`.
