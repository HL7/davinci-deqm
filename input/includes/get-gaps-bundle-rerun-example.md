
#### Examples
{:.no_toc}

**Scenario:**
After additional data was submitted to the payer system. The provider requested a Gaps in Care Report again on 2020-07-07 for the same group of patients (group id 123) and for the same gaps through period from 2020-01-01 to 2020-12-31. The provider received the report. It showed that *gaps-patient01* and *gaps-patient03* now both have a closed gap for Colorectal Cancer Screening and *gaps-patient02* still has a closed gap.

**Get Gaps in Care Report**
```
GET [base]/Measure/$care-gaps?measureurl=http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example|2.0.0&subject=Group/123&periodStart=2020-01-01&periodEnd=2020-12-31&status=open-gap&status=closed-gap&status=prospective-gap
```

~~~
{
  "resourceType": "Parameters",
  "id": "multiple-gaps-indv-report02",
  "parameter": [
    {
      "name": "return",
      "resource": {
        "resourceType": "Bundle",
        "id": "single-gaps-closed-indv-report02",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-bundle-deqm"
          ]
        },
        "identifier": {
          "system": "urn:ietf:rfc:3986",
          "value": "urn:uuid:7396eb14-8f5c-4fe1-b023-1c6838152136"
        },
        "type": "document",
        "timestamp": "2020-07-07T13:08:53+00:00",
        "entry": [
          {
            "fullUrl": "http://example.org/fhir/gaps/Composition/gaps-composition03",
            "resource": {
              "resourceType": "Composition",
              "id": "gaps-composition03",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-composition-deqm"
                ]
              },
              "status": "final",
              "type": {
                "coding": [
                  {
                    "system": "http://loinc.org",
                    "code": "96315-7",
                    "display": "Gaps in care report"
                  }
                ]
              },
              "subject": {
                "reference": "Patient/gaps-patient01"
              },
              "date": "2020-07-07T13:08:53+00:00",
              "author": [
                {
                  "reference": "Organization/gaps-organization-reportingvendor"
                }
              ],
              "title": "Care Gap Report for patient gaps-patient01",
              "section": [
                {
                  "title": "Colorectal Cancer Screening",
                  "focus": {
                    "reference": "MeasureReport/gaps-indv-measurereport04"
                  },
                  "entry": [
                    {
                      "reference": "DetectedIssue/gaps-detectedissue05"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/DetectedIssue/gaps-detectedissue05",
            "resource": {
              "resourceType": "DetectedIssue",
              "id": "gaps-detectedissue05",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-detectedissue-deqm"
                ]
              },
              "modifierExtension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-gapStatus",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-status",
                        "code": "closed-gap"
                      }
                    ]
                  }
                }
              ],
              "status": "final",
              "code": {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                    "code": "CAREGAP",
                    "display": "Care Gaps"
                  }
                ]
              },
              "patient": {
                "reference": "Patient/gaps-patient01"
              },
              "evidence": [
                {
                  "detail": [
                    {
                      "reference": "MeasureReport/gaps-indv-measurereport04"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/MeasureReport/gaps-indv-measurereport04",
            "resource": {
              "resourceType": "MeasureReport",
              "id": "gaps-indv-measurereport04",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/indv-measurereport-deqm"
                ]
              },
              "extension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring",
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
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-certificationIdentifier",
                  "valueIdentifier": {
                    "system": "urn:oid:2.16.840.1.113883.3.2074.1",
                    "value": "0015HQN9BD3304E"
                  }
                },
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-reportingVendor",
                  "valueReference": {
                    "reference": "Organization/gaps-organization-reportingvendor"
                  }
                }
              ],
              "status": "complete",
              "type": "individual",
              "measure": "http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example",
              "subject": {
                "reference": "Patient/gaps-patient01"
              },
              "date": "2020-07-07T13:08:52+00:00",
              "reporter": {
                "reference": "Organization/organization01"
              },
              "period": {
                "start": "2020-01-01T00:00:00+00:00",
                "end": "2020-12-31T00:00:00+00:00"
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
                  "population": [
                    {
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
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Encounter/gaps-encounter03"
                },
                {
                  "extension": [
                    {
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Patient/gaps-patient01"
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/Encounter/gaps-encounter03",
            "resource": {
              "resourceType": "Encounter",
              "id": "gaps-encounter03",
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
                      "code": "99201",
                      "display": "Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family."
                    }
                  ]
                }
              ],
              "subject": {
                "reference": "Patient/gaps-patient01"
              },
              "period": {
                "start": "2020-07-06T07:07:00-00:00",
                "end": "2020-07-06T10:11:00-00:00"
              }
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/Procedure/gaps-procedure02",
            "resource": {
              "resourceType": "Procedure",
              "id": "gaps-procedure02",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-procedure"
                ]
              },
              "status": "completed",
              "code": {
                "coding": [
                  {
                    "system": "http://www.ama-assn.org/go/cpt",
                    "code": "45384",
                    "display": "Colonoscopy through stoma; with ablation of tumor(s), polyp(s), or other lesion(s) not amenable to removal by hot biopsy forceps, bipolar cautery or snare technique"
                  }
                ]
              },
              "subject": {
                "reference": "Patient/gaps-patient01"
              },
              "performedPeriod": {
                "start": "2020-07-06T08:00:00-00:00",
                "end": "2020-07-06T09:00:00-00:00"
              }
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/Patient/gaps-patient01",
            "resource": {
              "resourceType": "Patient",
              "id": "gaps-patient01",
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
                  "value": "999995992"
                }
              ],
              "name": [
                {
                  "family": "Susan",
                  "given": [
                    "Parker"
                  ]
                }
              ],
              "gender": "female",
              "birthDate": "1965-01-01"
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
    },
    {
      "name": "return",
      "resource": {
        "resourceType": "Bundle",
        "id": "single-gaps-closed-indv-report01",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-bundle-deqm"
          ]
        },
        "identifier": {
          "system": "urn:ietf:rfc:3986",
          "value": "urn:uuid:80c493d0-e3c7-4e63-81fe-81fb3b16b9ab"
        },
        "type": "document",
        "timestamp": "2020-07-07T13:08:53+00:00",
        "entry": [
          {
            "fullUrl": "http://example.org/fhir/gaps/Composition/gaps-composition02",
            "resource": {
              "resourceType": "Composition",
              "id": "gaps-composition02",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-composition-deqm"
                ]
              },
              "status": "final",
              "type": {
                "coding": [
                  {
                    "system": "http://loinc.org",
                    "code": "96315-7",
                    "display": "Gaps in care report"
                  }
                ]
              },
              "subject": {
                "reference": "Patient/gaps-patient02"
              },
              "date": "2020-07-07T13:08:53+00:00",
              "author": [
                {
                  "reference": "Organization/gaps-organization-reportingvendor"
                }
              ],
              "title": "Care Gap Report for patient gaps-patient02",
              "section": [
                {
                  "title": "Colorectal Cancer Screening",
                  "focus": {
                    "reference": "MeasureReport/gaps-indv-measurereport03"
                  },
                  "entry": [
                    {
                      "reference": "DetectedIssue/gaps-detectedissue03"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/DetectedIssue/gaps-detectedissue03",
            "resource": {
              "resourceType": "DetectedIssue",
              "id": "gaps-detectedissue03",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-detectedissue-deqm"
                ]
              },
              "modifierExtension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-gapStatus",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-status",
                        "code": "closed-gap"
                      }
                    ]
                  }
                }
              ],
              "status": "final",
              "code": {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                    "code": "CAREGAP",
                    "display": "Care Gaps"
                  }
                ]
              },
              "patient": {
                "reference": "Patient/gaps-patient02"
              },
              "evidence": [
                {
                  "detail": [
                    {
                      "reference": "MeasureReport/gaps-indv-measurereport03"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/MeasureReport/gaps-indv-measurereport03",
            "resource": {
              "resourceType": "MeasureReport",
              "id": "gaps-indv-measurereport03",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/indv-measurereport-deqm"
                ]
              },
              "extension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring",
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
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-certificationIdentifier",
                  "valueIdentifier": {
                    "system": "urn:oid:2.16.840.1.113883.3.2074.1",
                    "value": "0015HQN9BD3304E"
                  }
                },
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-reportingVendor",
                  "valueReference": {
                    "reference": "Organization/gaps-organization-reportingvendor"
                  }
                }
              ],
              "status": "complete",
              "type": "individual",
              "measure": "http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example",
              "subject": {
                "reference": "Patient/gaps-patient02"
              },
              "date": "2020-07-07T13:08:53+00:00",
              "reporter": {
                "reference": "Organization/organization01"
              },
              "period": {
                "start": "2020-01-01T00:00:00+00:00",
                "end": "2020-12-31T00:00:00+00:00"
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
                  "population": [
                    {
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
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Encounter/gaps-encounter02"
                },
                {
                  "extension": [
                    {
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Patient/gaps-patient02"
                }
              ]
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
                      "code": "99201",
                      "display": "Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family."
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
              "status": "completed",
              "code": {
                "coding": [
                  {
                    "system": "http://www.ama-assn.org/go/cpt",
                    "code": "45384",
                    "display": "Colonoscopy through stoma; with ablation of tumor(s), polyp(s), or other lesion(s) not amenable to removal by hot biopsy forceps, bipolar cautery or snare technique"
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
    },
    {
      "name": "return",
      "resource": {
        "resourceType": "Bundle",
        "id": "single-gaps-prospective-indv-report01",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-bundle-deqm"
          ]
        },
        "identifier": {
          "system": "urn:ietf:rfc:3986",
          "value": "urn:uuid:66556327-43dc-40fc-b20c-4e31a31e98e0"
        },
        "type": "document",
        "timestamp": "2020-06-30T13:08:53+00:00",
        "entry": [
          {
            "fullUrl": "http://example.org/fhir/gaps/Composition/gaps-composition03",
            "resource": {
              "resourceType": "Composition",
              "id": "gaps-composition03",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-composition-deqm"
                ]
              },
              "status": "final",
              "type": {
                "coding": [
                  {
                    "system": "http://loinc.org",
                    "code": "96315-7",
                    "display": "Gaps in care report"
                  }
                ]
              },
              "subject": {
                "reference": "Patient/gaps-patient03"
              },
              "date": "2020-06-30T13:08:53+00:00",
              "author": [
                {
                  "reference": "Organization/gaps-organization-reportingvendor"
                }
              ],
              "title": "Care Gap Report for patient gaps-patient03",
              "section": [
                {
                  "title": "Colorectal Cancer Screening",
                  "focus": {
                    "reference": "MeasureReport/gaps-indv-measurereport04"
                  },
                  "entry": [
                    {
                      "reference": "DetectedIssue/gaps-detectedissue04"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/DetectedIssue/gaps-detectedissue04",
            "resource": {
              "resourceType": "DetectedIssue",
              "id": "gaps-detectedissue04",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-detectedissue-deqm"
                ]
              },
              "modifierExtension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-gapStatus",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-status",
                        "code": "closed-gap"
                      }
                    ]
                  }
                }
              ],
              "status": "final",
              "code": {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                    "code": "CAREGAP",
                    "display": "Care Gaps"
                  }
                ]
              },
              "patient": {
                "reference": "Patient/gaps-patient03"
              },
              "evidence": [
                {
                  "detail": [
                    {
                      "reference": "MeasureReport/gaps-indv-measurereport04"
                    }
                  ]
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/MeasureReport/gaps-indv-measurereport04",
            "resource": {
              "resourceType": "MeasureReport",
              "id": "gaps-indv-measurereport04",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/indv-measurereport-deqm"
                ]
              },
              "extension": [
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring",
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
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-certificationIdentifier",
                  "valueIdentifier": {
                    "system": "urn:oid:2.16.840.1.113883.3.2074.1",
                    "value": "0015HQN9BD3304E"
                  }
                },
                {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-reportingVendor",
                  "valueReference": {
                    "reference": "Organization/gaps-organization-reportingvendor"
                  }
                }
              ],
              "status": "complete",
              "type": "individual",
              "measure": "http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example",
              "subject": {
                "reference": "Patient/gaps-patient03"
              },
              "date": "2020-06-30T13:08:52+00:00",
              "reporter": {
                "reference": "Organization/organization01"
              },
              "period": {
                "start": "2020-01-01T00:00:00+00:00",
                "end": "2020-12-31T00:00:00+00:00"
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
                  "population": [
                    {
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
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Encounter/gaps-encounter02"
                },
                {
                  "extension": [
                    {
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference",
                      "valueString": "initial-population"
                    }
                  ],
                  "reference": "Patient/gaps-patient03"
                }
              ]
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/Encounter/gaps-encounter02",
            "resource": {
              "resourceType": "Encounter",
              "id": "gaps-encounter02",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
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
                      "code": "99201",
                      "display": "Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family."
                    }
                  ]
                }
              ],
              "subject": {
                "reference": "Patient/gaps-patient03"
              },
              "period": {
                "start": "2020-05-30T07:00:00-00:00",
                "end": "2020-05-30T10:00:00-00:00"
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"
                ]
              },
              "status": "completed",
              "code": {
                "coding": [
                  {
                    "system": "http://www.ama-assn.org/go/cpt",
                    "code": "45384",
                    "display": "Colonoscopy through stoma; with ablation of tumor(s), polyp(s), or other lesion(s) not amenable to removal by hot biopsy forceps, bipolar cautery or snare technique"
                  }
                ]
              },
              "subject": {
                "reference": "Patient/gaps-patient03"
              },
              "performedPeriod": {
                "start": "2020-08-25T08:00:00-00:00",
                "end": "2020-08-25T09:00:00-00:00"
              }
            }
          },
          {
            "fullUrl": "http://example.org/fhir/gaps/Patient/gaps-patient03",
            "resource": {
              "resourceType": "Patient",
              "id": "gaps-patient03",
              "meta": {
                "profile": [
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
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
              "birthDate": "1950-01-01"
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
    }
  ]
}

~~~
