~~~
{
    "resourceType": "Bundle",
    "id": "mrp-task-bundle-example1",
    "meta": {
        "versionId": "dad24dca-38bb-4f17-8635-2f8e01d7d95d",
        "lastUpdated": "2018-06-11T21:02:57.556+00:00"
    },
    "type": "collection",
    "entry": [
        {
            "fullUrl": "https://vonk.furore.com/",
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
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
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
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
            "resource": {
                "resourceType": "MeasureReport",
                "id": "mrp-example1",
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
                            "url": "http://hl7.org/fhir/ig/davinci/StructureDefinition/extension-referenceAny",
                            "valueReference": {
                                "reference": "Task/mrp-example1"
                            }
                        }
                    ]
                }
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
            "resource": {
                "resourceType": "Patient",
                "id": "example",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
                    ]
                },
                "text": {
                    "status": "generated",
                    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative with Details</b></p><p><b>id</b>: example</p><p><b>identifier</b>: Medical Record Number = 1032702 (USUAL)</p><p><b>active</b>: true</p><p><b>name</b>: Amy V. Shaw </p><p><b>telecom</b>: ph: 555-555-5555(HOME), amy.shaw@example.com</p><p><b>gender</b>: </p><p><b>birthsex</b>: Female</p><p><b>birthDate</b>: Feb 20, 2007</p><p><b>address</b>: 49 Meadow St Mounds OK 74047 US </p><p><b>race</b>: White, American Indian or Alaska Native, Asian, Shoshone, Filipino</p><p><b>ethnicity</b>: Hispanic or Latino, Dominican, Mexican</p></div>"
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
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
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
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
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
            }
        },
        {
            "fullUrl": "https://vonk.furore.com/",
            "resource": {
                "resourceType": "Task",
                "id": "mrp-example1",
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/ig/davinci/StructureDefinition/ext-location",
                        "valueReference": {
                            "reference": "https://vonk.furore.com/Location/hl7east"
                        }
                    }
                ],
                "status": "completed",
                "intent": "order",
                "code": {
                    "coding": [
                        {
                            "system": "http://www.ama-assn.org/go/cpt",
                            "code": "1111F",
                            "display": "Medication Reconciliation "
                        }
                    ],
                    "text": "Medication Reconciliation"
                },
                "for": {
                    "reference": "https://vonk.furore.com/Patient/example"
                },
                "authoredOn": "2018-06-11",
                "lastModified": "2018-06-11",
                "owner": {
                    "extension": [
                        {
                            "url": "http://hl7.org/fhir/ig/davinci/StructureDefinition/ext-practitionerrole",
                            "valueReference": {
                                "reference": "PractitionerRole/example"
                            }
                        }
                    ]
                }
            }
        }
    ]
}
~~~
