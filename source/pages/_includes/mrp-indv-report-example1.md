#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a MRP Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and Task resources all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code is returned on successful submission.

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

            "meta": {
               "lastUpdated": "2019-02-11T14:19:25.000+00:00",
               "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/coverage-deqm"
               ],
               "versionId": "2"
            },
            "beneficiary": {
               "reference": "Patient/patient01"
            },
            "payor": [
               {
                  "reference": "Organization/organization04"
               }
            ],
            "policyHolder": {
               "reference": "Patient/patient01"
            },
            "relationship": {
               "coding": [
                  {
                     "code": "self"
                  }
               ]
            },
            "subscriber": {
               "reference": "Patient/patient01"
            },
            "subscriberId": "A123456789",
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

            "meta": {
               "profile": [
                  "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter"
               ]
            },
            "class": {
               "code": "IMP",
               "display": "inpatient encounter",
               "system": "http://hl7.org/fhir/v3/ActCode"
            },
            "hospitalization": {
               "dischargeDisposition": {
                  "coding": [
                     {
                        "code": "home",
                        "display": "Home",
                        "system": "http://hl7.org/fhir/discharge-disposition"
                     }
                  ]
               }
            },
            "period": {
               "end": "2018-05-29T11:00:00-04:00",
               "start": "2018-05-29T11:00:00-04:00"
            },
            "status": "finished",
            "subject": {
               "display": "Natalie Huff Walter",
               "reference": "Patient/patient01"
            },
            "type": [
               {
                  "coding": [
                     {
                        "code": "56876005",
                        "display": "Drug rehabilitation and detoxification",
                        "system": "http://snomed.info/sct"
                     }
                  ]
               }
            ],
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

            "meta": {
               "profile": [
                  "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location"
               ]
            },
            "address": {
               "city": "Somerset",
               "country": "USA",
               "line": [
                  "102 Heritage Dr."
               ],
               "postalCode": "08873",
               "state": "NJ"
            },
            "name": "DaVinciClinic01",
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

            "meta": {
               "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/indv-measurereport-deqm"
               ]
            },
            "extension": [
               {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/extension-certificationIdentifier",
                  "valueIdentifier": {
                     "system": "urn:oid:2.16.840.1.113883.3.2074.1",
                     "value": "0015HQN9BD3304E"
                  }
               },
               {
                  "url": "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/extension-reportingVendor",
                  "valueReference": {
                     "reference": "Organization/organization01"
                  }
               }
            ],
            "date": "2018-09-05T16:59:52.404Z",
            "evaluatedResources": {
               "extension": [
                  {
                     "url": "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/extension-referenceAny",
                     "valueReference": {
                        "reference": "Task/Task01"
                     }
                  }
               ]
            },
            "group": [
               {
                  "identifier": {
                     "system": "http://www.acme.org/groups",
                     "value": "112"
                  },
                  "measureScore": 100,
                  "population": [
                     {
                        "code": {
                           "coding": [
                              {
                                 "code": "initial-population",
                                 "display": "Initial Population",
                                 "system": "http://hl7.org/fhir/measure-population"
                              }
                           ]
                        },
                        "identifier": {
                           "system": "http://www.acme.org/populations",
                           "value": "11234"
                        }
                     }
                  ]
               }
            ],
            "measure": {
               "reference": "Measure/measure-mrp"
            },
            "patient": {
               "reference": "Patient/patient01"
            },
            "period": {
               "end": "2018-09-01",
               "start": "2018-08-01"
            },
            "reportingOrganization": {
               "reference": "Organization/organization01"
            },
            "status": "complete",
            "type": "individual",
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

            "meta": {
               "lastUpdated": "2019-02-21T01:47:54.000+00:00",
               "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/organization-deqm"
               ],
               "versionId": "4"
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
                           "system": "http://hl7.org/fhir/v2/0203"
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
                        "system": "http://hl7.org/fhir/organization-type"
                     }
                  ]
               }
            ],
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

            "meta": {
               "lastUpdated": "2019-03-06T19:03:03.000+00:00",
               "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/organization-deqm"
               ],
               "versionId": "3"
            },
            "active": true,
            "address": [
               {
                  "city": "Englewood",
                  "country": "USA",
                  "line": [
                     "3 Sherwood St."
                  ],
                  "postalCode": "07631",
                  "state": "NJ"
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
                           "system": "http://hl7.org/fhir/v2/0203"
                        }
                     ]
                  },
                  "use": "official",
                  "value": "234567891"
               }
            ],
            "name": "DaVinciHospital02",
            "telecom": [
               {
                  "system": "phone",
                  "value": "(+1) 551-555-1212"
               }
            ],
            "type": [
               {
                  "coding": [
                     {
                        "code": "prov",
                        "display": "Healthcare Provider",
                        "system": "http://hl7.org/fhir/organization-type"
                     }
                  ]
               }
            ],
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

            "meta": {
               "lastUpdated": "2019-02-11T14:19:25.000+00:00",
               "profile": [
                  "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
               ],
               "versionId": "5"
            },
            "extension": [
               {
                  "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
                  "valueCode": "M"
               },
               {
                  "extension": [
                     {
                        "url": "ombCategory",
                        "valueCoding": {
                           "code": "2106-3",
                           "display": "White",
                           "system": "urn:oid:2.16.840.1.113883.6.238"
                        }
                     },
                     {
                        "url": "text",
                        "valueString": "White"
                     }
                  ],
                  "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
               },
               {
                  "extension": [
                     {
                        "url": "ombCategory",
                        "valueCoding": {
                           "code": "2186-5",
                           "display": "Not Hispanic or Latino",
                           "system": "urn:oid:2.16.840.1.113883.6.238"
                        }
                     },
                     {
                        "url": "text",
                        "valueString": "Not Hispanic or Latino"
                     }
                  ],
                  "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
               }
            ],
            "active": true,
            "address": [
               {
                  "city": "Thornton",
                  "country": "USA",
                  "line": [
                     "7496 Beaver Ridge Ave"
                  ],
                  "postalCode": "07003",
                  "state": "NJ",
                  "use": "home"
               }
            ],
            "birthDate": "1946-12-16",
            "communication": [
               {
                  "language": {
                     "coding": [
                        {
                           "code": "en-US",
                           "display": "US English",
                           "system": "urn:ietf:bcp:47"
                        }
                     ]
                  },
                  "preferred": true
               }
            ],
            "deceasedBoolean": false,
            "gender": "male",
            "identifier": [
               {
                  "system": "http://hospital.davinci.org",
                  "type": {
                     "coding": [
                        {
                           "code": "MR",
                           "display": "Medical record number",
                           "system": "http://hl7.org/fhir/v2/0203"
                        }
                     ]
                  },
                  "use": "usual",
                  "value": "12345"
               }
            ],
            "managingOrganization": {
               "reference": "Organization/organization01"
            },
            "maritalStatus": {
               "coding": [
                  {
                     "code": "M",
                     "display": "Married",
                     "system": "http://hl7.org/fhir/v3/MaritalStatus"
                  }
               ]
            },
            "name": [
               {
                  "family": "Webster",
                  "given": [
                     "Jairo"
                  ],
                  "use": "official"
               }
            ],
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

            "meta": {
               "lastUpdated": "2019-03-06T19:03:03.000+00:00",
               "profile": [
                  "http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/practitioner-deqm"
               ],
               "versionId": "4"
            },
            "active": true,
            "gender": "male",
            "identifier": [
               {
                  "system": "http://hl7.org/fhir/sid/us-npi",
                  "type": {
                     "coding": [
                        {
                           "code": "PRN",
                           "display": "Provider number",
                           "system": "http://hl7.org/fhir/v2/0203"
                        }
                     ]
                  },
                  "use": "official",
                  "value": "456789123"
               }
            ],
            "name": [
               {
                  "family": "Hale",
                  "given": [
                     "Cody"
                  ],
                  "suffix": [
                     "MD"
                  ]
               }
            ],
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

            "meta": {
               "profile": [
                  "http://hl7.org/fhir/us/hedis/StructureDefinition/hedis-task"
               ]
            },
            "authoredOn": "2018-09-25T14:24:23.584Z",
            "code": {
               "coding": [
                  {
                     "code": "1111F",
                     "display": "Medication Reconciliation",
                     "system": "http://www.ama-assn.org/go/cpt"
                  }
               ]
            },
            "context": {
               "reference": "Encounter/Encounter01"
            },
            "executionPeriod": {
               "end": "2017-06-11",
               "start": "2017-06-11"
            },
            "for": {
               "reference": "Patient/patient01"
            },
            "identifier": [
               {
                  "system": "http://www.acme.org/tasks",
                  "value": "19009"
               }
            ],
            "intent": "plan",
            "owner": {
               "reference": "Practitioner/practitioner01"
            },
            "priority": "routine",
            "status": "completed",
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
