~~~
{
    "resourceType": "Bundle",
    "id": "mrp-observation-bundle-example1",
    "meta": {
        "versionId": "71e9590f-ccd5-4e03-ba40-3c634db3b8b1",
        "lastUpdated": "2018-06-14T19:02:33.268+00:00"
    },
    "type": "batch",
    "entry": [
        {
            "fullUrl": "http://test.fhir.org/r3/Organization/acme-lab",
            "resource": {
                "resourceType": "Organization",
                "id": "acme-lab",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"
                    ]
                },
                "identifier": [
                    {
                        "system": "http://hl7.org.fhir/sid/us-npi",
                        "value": "1144221847"
                    },
                    {
                        "system": "http://www.acme.org/organization",
                        "value": "2523423456"
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
                "name": "Acme Labs",
                "telecom": [
                    {
                        "system": "phone",
                        "value": "(+1) 734-677-7777"
                    },
                    {
                        "system": "email",
                        "value": "hq@acme.org"
                    }
                ],
                "address": [
                    {
                        "line": [
                            "3300 Washtenaw Avenue, Suite 227"
                        ],
                        "city": "Amherst",
                        "state": "MA",
                        "postalCode": "01002",
                        "country": "USA"
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/Organization/acme-lab"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/Location/hl7east",
            "resource": {
                "resourceType": "Location",
                "id": "hl7east",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location"
                    ]
                },
                "identifier": [
                    {
                        "system": "http://www.acme.org/location",
                        "value": "29"
                    }
                ],
                "status": "active",
                "name": "Health Level Seven International - Amherst",
                "description": "HL7 Headquarters - East",
                "telecom": [
                    {
                        "system": "phone",
                        "value": "(+1) 734-677-7777"
                    }
                ],
                "address": {
                    "line": [
                        "3300 Washtenaw Avenue, Suite 227"
                    ],
                    "city": "Amherst",
                    "state": "MA",
                    "postalCode": "01002",
                    "country": "USA"
                },
                "position": {
                    "longitude": -72.519854,
                    "latitude": 42.373222
                },
                "managingOrganization": {
                    "display": "Health Level Seven International"
                }
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/Location/hl7east"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/MeasureReport/mrp-example2",
            "resource": {
                "resourceType": "MeasureReport",
                "id": "mrp-example2",
                "status": "complete",
                "type": "individual",
                "measure": {
                    "display": "MRP"
                },
                "patient": {
                    "reference": "https://vonk.furore.com/Patient/example"
                },
                "date": "2018-06-11",
                "reportingOrganization": {
                    "reference": "https://vonk.furore.com/Organization/acme-lab"
                },
                "period": {
                    "start": "2018-06-11",
                    "end": "2018-07-11"
                },
                "evaluatedResources": {
                    "extension": [
                        {
                            "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/ext-referenceAny",
                            "valueReference": {
                                "reference": "Obs/mrp-example1"
                            }
                        }
                    ]
                }
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/MeasureReport/mrp-example2"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/Patient/example",
            "resource": {
                "resourceType": "Patient",
                "id": "example",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
                    ]
                },
                "extension": [
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
                                "url": "ombCategory",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "1002-5",
                                    "display": "American Indian or Alaska Native"
                                }
                            },
                            {
                                "url": "ombCategory",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "2028-9",
                                    "display": "Asian"
                                }
                            },
                            {
                                "url": "detailed",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "1586-7",
                                    "display": "Shoshone"
                                }
                            },
                            {
                                "url": "detailed",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "2036-2",
                                    "display": "Filipino"
                                }
                            },
                            {
                                "url": "text",
                                "valueString": "Mixed"
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
                                    "code": "2135-2",
                                    "display": "Hispanic or Latino"
                                }
                            },
                            {
                                "url": "detailed",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "2184-0",
                                    "display": "Dominican"
                                }
                            },
                            {
                                "url": "detailed",
                                "valueCoding": {
                                    "system": "urn:oid:2.16.840.1.113883.6.238",
                                    "code": "2148-5",
                                    "display": "Mexican"
                                }
                            },
                            {
                                "url": "text",
                                "valueString": "Hispanic or Latino"
                            }
                        ]
                    },
                    {
                        "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
                        "valueCode": "F"
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
                                    "display": "Medical Record Number"
                                }
                            ],
                            "text": "Medical Record Number"
                        },
                        "system": "http://hospital.smarthealthit.org",
                        "value": "1032702"
                    }
                ],
                "active": true,
                "name": [
                    {
                        "family": "Shaw",
                        "given": [
                            "Amy",
                            "V."
                        ]
                    }
                ],
                "telecom": [
                    {
                        "system": "phone",
                        "value": "555-555-5555",
                        "use": "home"
                    },
                    {
                        "system": "email",
                        "value": "amy.shaw@example.com"
                    }
                ],
                "gender": "female",
                "birthDate": "2007-02-20",
                "address": [
                    {
                        "line": [
                            "49 Meadow St"
                        ],
                        "city": "Mounds",
                        "state": "OK",
                        "postalCode": "74047",
                        "country": "US"
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/Patient/example"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/Practitioner/practitioner-1",
            "resource": {
                "resourceType": "Practitioner",
                "id": "practitioner-1",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
                    ]
                },
                "identifier": [
                    {
                        "system": "http://hl7.org.fhir/sid/us-npi",
                        "value": "9941339108"
                    },
                    {
                        "system": "http://www.acme.org/practitioners",
                        "value": "25456"
                    }
                ],
                "name": [
                    {
                        "family": "Bone",
                        "given": [
                            "Ronald"
                        ],
                        "prefix": [
                            "Dr"
                        ]
                    }
                ],
                "address": [
                    {
                        "use": "home",
                        "line": [
                            "1003 Healthcare Drive"
                        ],
                        "city": "Amherst",
                        "state": "MA",
                        "postalCode": "01002"
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/Practitioner/practitioner-1"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/PractitionerRole/PractitionerRole-1",
            "resource": {
                "resourceType": "PractitionerRole",
                "id": "PractitionerRole-1",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole"
                    ]
                },
                "practitioner": {
                    "reference": "https://vonk.furore.com/Practitioner/Practitioner-1",
                    "display": "Dr Ronald Bone"
                },
                "organization": {
                    "reference": "https://vonk.furore.com/Organization/acme-lab",
                    "display": "Acme Lab"
                },
                "code": [
                    {
                        "coding": [
                            {
                                "system": "http://nucc.org/provider-taxonomy",
                                "code": "261QP2300X",
                                "display": "Doctor"
                            }
                        ]
                    }
                ],
                "specialty": [
                    {
                        "coding": [
                            {
                                "system": "http://nucc.org/provider-taxonomy",
                                "code": "208D00000X",
                                "display": "General Practice"
                            }
                        ]
                    }
                ],
                "location": [
                    {
                        "reference": "https://vonk.furore.com/Location/hl7east",
                        "display": "Health Level Seven International"
                    }
                ],
                "endpoint": [
                    {
                        "reference": "http://52.90.126.238:8080/fhir/baseDstu3/Endpoint/Endpoint-71",
                        "display": "Westwood Physicians Organization ADT"
                    },
                    {
                        "reference": "http://52.90.126.238:8080/fhir/baseDstu3/Endpoint/Endpoint-71",
                        "display": "Brenda.Jennings.Richard.MD@direct.example.org"
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/PractitionerRole/PractitionerRole-1"
            }
        },
        {
            "fullUrl": "http://test.fhir.org/r3/Observation/mrp-example1",
            "resource": {
                "resourceType": "Observation",
                "id": "mrp-example1",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/mrp-observation"
                    ]
                },
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/ext-location",
                        "valueReference": {
                            "reference": "https://vonk.furore.com/Location/hl7east"
                        }
                    }
                ],
                "status": "final",
                "category": [
                    {
                      "coding": [
                      {
                        "system": "http://hl7.org/fhir/us/davinci-deqm/CodeSystem/observation-category",
                        "code": "administrative",
                        "display": "Administrative"
                      }
                    ]
                  }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "http://www.ama-assn.org/go/cpt",
                            "code": "1111F",
                            "display": "Medication Reconciliation"
                        }
                    ],
                    "text": "Medication Reconciliation"
                },
                "subject": {
                    "reference": "https://vonk.furore.com/Patient/example",
                    "display": "Amy Shaw"
                },
                "effectiveDateTime": "2018-06-13",
                "performer": [
                    {
                        "extension": [
                            {
                                "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/ext-practiitionerRole",
                                "valueReference": {
                                    "reference": "PractitionerRole/example"
                                }
                            }
                        ]
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "http://hl7.org/fhir/event-status",
                            "code": "completed",
                            "display": "Completed"
                        }
                    ],
                    "text": "Completed"
                }
            },
            "request": {
                "method": "PUT",
                "url": "https://vonk.furore.com/Observation/mrp-example1"
            }
        }
    ]
}
~~~
