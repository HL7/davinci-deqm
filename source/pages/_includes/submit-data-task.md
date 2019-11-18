#### Examples
{:.no_toc}

**Scenario:**

Provider X acting in the role of Producer submits MRP data for Patient Y to Payer Z who is acting in the role of Consumer.  The body of the request is a Parameters resource containing the required profiles for MRP attestation using Task as the resource used to evaluate the measure.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-mrp/$submit-data`

**Request body**

~~~
{
  "resourceType": "Parameters",
  "id": "025ed5bb-a2e7-bf6f-0559-f37c14a0c79e",
  "parameter": [
    {
      "name": "measure-report",
      "resource": {
        "resourceType": "MeasureReport",
        "id": "datax-measurereport01",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2018-09-05T16:59:53.000+00:00",
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
        "measure": {
          "reference": "Measure/measure-mrp"
        },
        "patient": {
          "reference": "Patient/patient01"
        },
        "date": "2018-09-05T16:59:52.404Z",
        "period": {
          "start": "2018-08-01",
          "end": "2018-09-01"
        },
        "evaluatedResource": [{
          "reference": "Task/Task01"
      }],
    {
      "name": "resource",
      "resource": {
        "resourceType": "Task",
        "meta": {
          "profile": [
            "http://ncqa.org/fhir/us/hedis/StructureDefinition/hedis-task"
          ]
        },
        "id": "Task01",
        "identifier": [
          {
            "system": "http://www.acme.org/tasks",
            "value": "12345"
          }
        ],
        "status": "completed",
        "intent": "plan",
        "priority": "routine",
        "code": {
          "coding": [
            {
              "system": "http://www.ama-assn.org/go/cpt",
              "code": "1111F",
              "display": "Medication Reconciliation"
            }
          ]
        },
        "for": {
          "reference": "Patient/patient01"
        },
        "context": {
          "reference": "Encounter/8592c13d-821a-bfef-74db-ae614e754d4f"
        },
        "authoredOn": "2018-12-12T17:54:03.934Z",
        "executionPeriod": {
          "start": "2018-12-12T17:54:03.934Z",
          "end": "2018-12-12T17:54:03.934Z"
        },
        "owner": {
          "reference": "Practitioner/practitioner01"
        }
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Patient",
        "id": "patient01",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2018-12-12T17:05:43.000+00:00",
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"
          ]
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div class=\"hapiHeaderText\">Jairo <b>WEBSTER </b></div><table class=\"hapiPropertyTable\"><tbody><tr><td>Identifier</td><td>12345</td></tr><tr><td>Address</td><td><span>7496 Beaver Ridge Ave </span><br/><span>Thornton </span><span>NJ </span><span>USA </span></td></tr><tr><td>Date of birth</td><td><span>16 December 1946</span></td></tr></tbody></table></div>"
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
            "valueCode": "M"
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
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "MR",
                  "display": "Medical record number"
                }
              ]
            },
            "system": "http://hospital.davinci.org",
            "value": "12345"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "Webster",
            "given": [
              "Jairo"
            ]
          }
        ],
        "gender": "male",
        "birthDate": "1946-12-16",
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
              "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
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
        ],
        "managingOrganization": {
          "reference": "Organization/organization01"
        }
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Location",
        "id": "location01",
        "meta": {
          "versionId": "2",
          "lastUpdated": "2018-12-12T17:05:44.000+00:00",
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location"
          ]
        },
        "name": "DaVinciClinic01",
        "address": {
          "line": [
            "102 Heritage Dr."
          ],
          "city": "Somerset",
          "state": "NJ",
          "postalCode": "08873",
          "country": "USA"
        }
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Practitioner",
        "id": "practitioner01",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2018-12-12T17:05:43.000+00:00",
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-practitioner"
          ]
        },
        "identifier": [
          {
            "use": "official",
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "PRN",
                  "display": "Provider number"
                }
              ]
            },
            "system": "http://hl7.org/fhir/sid/us-npi",
            "value": "456789123"
          }
        ],
        "active": true,
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
        "gender": "male"
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Organization",
        "id": "organization01",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2018-12-12T17:05:43.000+00:00",
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
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
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
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Encounter",
        "id": "8592c13d-821a-bfef-74db-ae614e754d4f",
        "meta": {
          "profile": [
            "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter"
          ]
        },
        "status": "finished",
        "class": {
          "system": "http://hl7.org/fhir/v3/ActCode",
          "code": "AMB",
          "display": "ambulatory"
        },
        "type": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "390906007",
                "display": "Follow-up encounter (procedure)"
              }
            ]
          }
        ],
        "period": {
          "start": "2018-12-12T17:54:03.934Z",
          "end": "2018-12-12T17:54:03.934Z"
        },
        "subject": {
          "reference": "Patient/patient01"
        },
        "location": [{
          "location": {
             "reference": "Location/location01"
          }
        }],
        "participant": [
          {
            "individual": {
              "reference": "Practitioner/practitioner01"
            }
          }
        ],
        "serviceProvider": {
          "reference": "Organization/organization01"
        }
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Coverage",
        "id": "coverage01",
        "meta": {
          "versionId": "2",
          "lastUpdated": "2018-12-12T17:05:44.000+00:00",
          "profile": [
            "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/coverage-deqm"
          ]
        },
        "policyHolder": {
          "reference": "Patient/patient01"
        },
        "subscriber": {
          "reference": "Patient/patient01"
        },
        "subscriberId": "A123456789",
        "beneficiary": {
          "reference": "Patient/patient01"
        },
        "relationship": {
          "coding": [
            {
              "code": "self"
            }
          ]
        },
        "payor": [
          {
            "reference": "Organization/organization04"
          }
        ]
      }
    },
    {
      "name": "resource",
      "resource": {
        "resourceType": "Organization",
        "id": "organization04",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2018-12-12T17:05:44.000+00:00",
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
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "TAX",
                  "display": "Tax ID number"
                }
              ]
            },
            "system": "urn:oid:2.16.840.1.113883.4.2",
            "value": "456789123",
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
                "code": "ins",
                "display": "Insurance Company"
              }
            ]
          }
        ],
        "name": "DVPayer04-
        ",
        "telecom": [
          {
            "system": "phone",
            "value": "(+1) 616-555-1212"
          }
        ],
        "address": [
          {
            "line": [
              "160 Glen Eagles Road"
            ],
            "city": "Grand Rapids",
            "state": "MI",
            "postalCode": "49503",
            "country": "USA"
          }
        ]
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
        "etag": "1",
        "lastModified": "2019-03-13T01:02:05.901+00:00"
      }
    },
    {
      "response": {
        "status": "201 Created",
        "location": "Task/Task01/_history/1",
        "etag": "1",
        "lastModified": "2019-03-13T01:02:05.932+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Patient/patient01/_history/4",
        "etag": "4",
        "lastModified": "2018-12-12T17:05:43.000+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Location/location01/_history/2",
        "etag": "2",
        "lastModified": "2018-12-12T17:05:44.000+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Practitioner/practitioner01/_history/4",
        "etag": "4",
        "lastModified": "2018-12-12T17:05:43.000+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Organization/organization01/_history/4",
        "etag": "4",
        "lastModified": "2018-12-12T17:05:43.000+00:00"
      }
    },
    {
      "response": {
        "status": "201 Created",
        "location": "Encounter/8592c13d-821a-bfef-74db-ae614e754d4f/_history/1",
        "etag": "1",
        "lastModified": "2019-03-13T01:02:05.965+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Coverage/coverage01/_history/2",
        "etag": "2",
        "lastModified": "2018-12-12T17:05:44.000+00:00"
      }
    },
    {
      "response": {
        "status": "200 OK",
        "location": "Organization/organization04/_history/4",
        "etag": "4",
        "lastModified": "2018-12-12T17:05:44.000+00:00"
      }
    }
  ]
}

~~~
