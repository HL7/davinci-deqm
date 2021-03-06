
#### Examples
{:.no_toc}

**Scenario:**
After additional data was submitted to the payer system. The provider requested a gaps in care report again on 2020-07-07 for the same group of patients (group id 123) and for the same gaps through period from 2020-01-01 to 2020-12-31. The provider received the report. It showed that *gaps-patient01* now has a closed gap for Colorectal Cancer Screening and the *gaps-patient02* still has a closed gap.

**Get Gaps In Care Report**
```
GET [base]/Measure/$care-gaps?subject=Group/123&periodStart=2020-01-01&periodEnd=2020-12-31
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
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-composition03</p><p><b>meta</b>: </p><p><b>status</b>: final</p><p><b>type</b>: <span title=\"Codes: {http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-doc-type gaps-doc}\">Gaps in Care Report</span></p><p><b>date</b>: Jul 7, 2020, 7:08:53 AM</p><p><b>author</b>: <a href=\"Organization-gaps-organization-reportingvendor.html\">Generated Summary: id: gaps-organization-reportingvendor; Tax ID number = 123446789 (OFFICIAL); active; <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type pay}\">Payer</span>; name: GapsReportingVendor01; ph: (+1) 401-545-1212</a></p><p><b>title</b>: Care Gap Report for patient gaps-patient01</p></div>"
              },
              "status": "final",
              "type": {
                "coding": [
                  {
                    "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-doc-type",
                    "code": "gaps-doc",
                    "display": "Gaps in Care Report"
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
                  "text": {
                    "status": "generated",
                    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No detected issues.</p></div>"
                  }
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
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-indv-measurereport-deqm"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-indv-measurereport04</p><p><b>meta</b>: </p><p><b>status</b>: complete</p><p><b>type</b>: individual</p><p><b>measure</b>: <a href=\"http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example\">http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example</a></p><p><b>subject</b>: <a href=\"Patient-gaps-patient01.html\">Generated Summary: id: gaps-patient01; Medical Record Number = 999995992 (USUAL); Parker Susan ; gender: male; birthDate: 1965-01-01</a></p><p><b>date</b>: Jul 7, 2020, 7:08:52 AM</p><p><b>reporter</b>: <a href=\"Organization-organization01.html\">Generated Summary: id: organization01; Tax ID number = 123456789 (OFFICIAL); active; <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type prov}\">Healthcare Provider</span>; name: DaVinciHospital01; ph: (+1) 401-555-1212</a></p><p><b>period</b>: Dec 31, 2019, 5:00:00 PM --&gt; Dec 30, 2020, 5:00:00 PM</p><p><b>improvementNotation</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-improvement-notation increase}\">Increased score indicates improvement</span></p><blockquote><p><b>group</b></p><p><b>id</b>: group-exm130</p><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population initial-population}\">Initial Population</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population numerator}\">Numerator</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population denominator}\">Denominator</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population denominator-exclusion}\">Denominator Exclusion</span></p><p><b>count</b>: 0</p></blockquote><p><b>measureScore</b>: 1.0</p></blockquote><p><b>evaluatedResource</b>: </p><ul><li><a href=\"Encounter-gaps-encounter03.html\">Generated Summary: id: gaps-encounter03; status: finished; <span title=\"{http://terminology.hl7.org/CodeSystem/v3-ActCode AMB}\">ambulatory</span>; <span title=\"Codes: {http://www.ama-assn.org/go/cpt 99201}\">Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.</span>; period: Jul 6, 2020, 1:07:00 AM --&gt; Jul 6, 2020, 4:11:00 AM</a></li><li><a href=\"Patient-gaps-patient01.html\">Generated Summary: id: gaps-patient01; Medical Record Number = 999995992 (USUAL); Parker Susan ; gender: male; birthDate: 1965-01-01</a></li></ul></div>"
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
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-populationReference",
                      "valueCodeableConcept": {
                        "coding": [
                          {
                            "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                            "code": "initial-population"
                          }
                        ]
                      }
                    }
                  ],
                  "reference": "Encounter/gaps-encounter03"
                },
                {
                  "extension": [
                    {
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-populationReference",
                      "valueCodeableConcept": {
                        "coding": [
                          {
                            "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                            "code": "initial-population"
                          }
                        ]
                      }
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-encounter03</p><p><b>meta</b>: </p><p><b>status</b>: finished</p><p><b>class</b>: <span title=\"{http://terminology.hl7.org/CodeSystem/v3-ActCode AMB}\">ambulatory</span></p><p><b>type</b>: <span title=\"Codes: {http://www.ama-assn.org/go/cpt 99201}\">Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.</span></p><p><b>subject</b>: <a href=\"Patient-gaps-patient01.html\">Generated Summary: id: gaps-patient01; Medical Record Number = 999995992 (USUAL); Parker Susan ; gender: male; birthDate: 1965-01-01</a></p><p><b>period</b>: Jul 6, 2020, 1:07:00 AM --&gt; Jul 6, 2020, 4:11:00 AM</p></div>"
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-procedure02</p><p><b>meta</b>: </p><p><b>status</b>: completed</p><p><b>code</b>: <span title=\"Codes: {http://www.ama-assn.org/go/cpt 44393}\">Colonoscopy through stoma; with ablation of tumor(s), polyp(s), or other lesion(s) not amenable to removal by hot biopsy forceps, bipolar cautery or snare technique</span></p><p><b>subject</b>: <a href=\"Patient-gaps-patient01.html\">Generated Summary: id: gaps-patient01; Medical Record Number = 999995992 (USUAL); Parker Susan ; gender: male; birthDate: 1965-01-01</a></p><p><b>performed</b>: Jul 6, 2020, 2:00:00 AM --&gt; Jul 6, 2020, 3:00:00 AM</p></div>"
              },
              "status": "completed",
              "code": {
                "coding": [
                  {
                    "system": "http://www.ama-assn.org/go/cpt",
                    "code": "44393",
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-patient01</p><p><b>meta</b>: </p><p><b>identifier</b>: Medical Record Number = 999995992 (USUAL)</p><p><b>name</b>: Parker Susan </p><p><b>gender</b>: male</p><p><b>birthDate</b>: 1965-01-01</p></div>"
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
              "gender": "male",
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
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/organization-deqm"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-organization-reportingvendor</p><p><b>meta</b>: </p><p><b>identifier</b>: Tax ID number = 123446789 (OFFICIAL)</p><p><b>active</b>: true</p><p><b>type</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type pay}\">Payer</span></p><p><b>name</b>: GapsReportingVendor01</p><p><b>telecom</b>: ph: (+1) 401-545-1212</p><p><b>address</b>: 13 Drive Street Cityplace MA 01101 USA </p></div>"
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
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-composition02</p><p><b>meta</b>: </p><p><b>status</b>: final</p><p><b>type</b>: <span title=\"Codes: {http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-doc-type gaps-doc}\">Gaps in Care Report</span></p><p><b>date</b>: Jun 30, 2020, 7:08:53 AM</p><p><b>author</b>: <a href=\"Organization-gaps-organization-reportingvendor.html\">Generated Summary: id: gaps-organization-reportingvendor; Tax ID number = 123446789 (OFFICIAL); active; <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type pay}\">Payer</span>; name: GapsReportingVendor01; ph: (+1) 401-545-1212</a></p><p><b>title</b>: Care Gap Report for patient gaps-patient02</p></div>"
              },
              "status": "final",
              "type": {
                "coding": [
                  {
                    "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/gaps-doc-type",
                    "code": "gaps-doc",
                    "display": "Gaps in Care Report"
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
                  "text": {
                    "status": "generated",
                    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No detected issues.</p></div>"
                  }
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
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-indv-measurereport-deqm"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-indv-measurereport03</p><p><b>meta</b>: </p><p><b>status</b>: complete</p><p><b>type</b>: individual</p><p><b>measure</b>: <a href=\"http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example\">http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example</a></p><p><b>subject</b>: <a href=\"Patient-gaps-patient02.html\">Generated Summary: id: gaps-patient02; Medical Record Number = 999996992 (USUAL); Thomas Ludwich ; gender: male; birthDate: 1957-01-01</a></p><p><b>date</b>: Jun 30, 2020, 7:08:52 AM</p><p><b>reporter</b>: <a href=\"Organization-organization01.html\">Generated Summary: id: organization01; Tax ID number = 123456789 (OFFICIAL); active; <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type prov}\">Healthcare Provider</span>; name: DaVinciHospital01; ph: (+1) 401-555-1212</a></p><p><b>period</b>: Dec 31, 2019, 5:00:00 PM --&gt; Dec 30, 2020, 5:00:00 PM</p><p><b>improvementNotation</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-improvement-notation increase}\">Increased score indicates improvement</span></p><blockquote><p><b>group</b></p><p><b>id</b>: group-exm130</p><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population initial-population}\">Initial Population</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population numerator}\">Numerator</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population denominator}\">Denominator</span></p><p><b>count</b>: 1</p></blockquote><blockquote><p><b>population</b></p><p><b>code</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/measure-population denominator-exclusion}\">Denominator Exclusion</span></p><p><b>count</b>: 0</p></blockquote><p><b>measureScore</b>: 1.0</p></blockquote><p><b>evaluatedResource</b>: </p><ul><li><a href=\"Encounter-gaps-encounter02.html\">Generated Summary: id: gaps-encounter02; status: finished; <span title=\"{http://terminology.hl7.org/CodeSystem/v3-ActCode AMB}\">ambulatory</span>; <span title=\"Codes: {http://www.ama-assn.org/go/cpt 99201}\">Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.</span>; period: Sep 10, 2018, 1:00:00 AM --&gt; Sep 10, 2018, 4:00:00 AM</a></li><li><a href=\"Patient-gaps-patient02.html\">Generated Summary: id: gaps-patient02; Medical Record Number = 999996992 (USUAL); Thomas Ludwich ; gender: male; birthDate: 1957-01-01</a></li></ul></div>"
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
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-populationReference",
                      "valueCodeableConcept": {
                        "coding": [
                          {
                            "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                            "code": "initial-population"
                          }
                        ]
                      }
                    }
                  ],
                  "reference": "Encounter/gaps-encounter02"
                },
                {
                  "extension": [
                    {
                      "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-populationReference",
                      "valueCodeableConcept": {
                        "coding": [
                          {
                            "system": "http://terminology.hl7.org/CodeSystem/measure-population",
                            "code": "initial-population"
                          }
                        ]
                      }
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-encounter02</p><p><b>meta</b>: </p><p><b>status</b>: finished</p><p><b>class</b>: <span title=\"{http://terminology.hl7.org/CodeSystem/v3-ActCode AMB}\">ambulatory</span></p><p><b>type</b>: <span title=\"Codes: {http://www.ama-assn.org/go/cpt 99201}\">Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history; A problem focused examination; Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patient's and/or family's needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.</span></p><p><b>subject</b>: <a href=\"Patient-gaps-patient02.html\">Generated Summary: id: gaps-patient02; Medical Record Number = 999996992 (USUAL); Thomas Ludwich ; gender: male; birthDate: 1957-01-01</a></p><p><b>period</b>: Sep 10, 2018, 1:00:00 AM --&gt; Sep 10, 2018, 4:00:00 AM</p></div>"
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
                "start": "2018-09-10T07:00:00-00:00",
                "end": "2018-09-10T10:00:00-00:00"
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
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-procedure01</p><p><b>meta</b>: </p><p><b>status</b>: completed</p><p><b>code</b>: <span title=\"Codes: {http://www.ama-assn.org/go/cpt 44393}\">Colonoscopy through stoma; with ablation of tumor(s), polyp(s), or other lesion(s) not amenable to removal by hot biopsy forceps, bipolar cautery or snare technique</span></p><p><b>subject</b>: <a href=\"Patient-gaps-patient02.html\">Generated Summary: id: gaps-patient02; Medical Record Number = 999996992 (USUAL); Thomas Ludwich ; gender: male; birthDate: 1957-01-01</a></p><p><b>performed</b>: Sep 10, 2018, 2:00:00 AM --&gt; Sep 10, 2018, 3:00:00 AM</p></div>"
              },
              "status": "completed",
              "code": {
                "coding": [
                  {
                    "system": "http://www.ama-assn.org/go/cpt",
                    "code": "44393",
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
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-patient02</p><p><b>meta</b>: </p><p><b>identifier</b>: Medical Record Number = 999996992 (USUAL)</p><p><b>name</b>: Thomas Ludwich </p><p><b>gender</b>: male</p><p><b>birthDate</b>: 1957-01-01</p></div>"
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
                  "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/organization-deqm"
                ]
              },
              "text": {
                "status": "generated",
                "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>id</b>: gaps-organization-reportingvendor</p><p><b>meta</b>: </p><p><b>identifier</b>: Tax ID number = 123446789 (OFFICIAL)</p><p><b>active</b>: true</p><p><b>type</b>: <span title=\"Codes: {http://terminology.hl7.org/CodeSystem/organization-type pay}\">Payer</span></p><p><b>name</b>: GapsReportingVendor01</p><p><b>telecom</b>: ph: (+1) 401-545-1212</p><p><b>address</b>: 13 Drive Street Cityplace MA 01101 USA </p></div>"
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
