
**Scenario:**
{:.no_toc}

Payer X acting in the role of Consumer receives a $collect-data invited pull to collect data pertaining to multiple measures (COL & VTE) for all Patients within Group02 from Provider Z, which is acting in the role of Producer.  The body of the request is a Parameters resource containing the desired input parameters.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/$collect-data`

**Request body**

~~~
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "measureUrl",
      "valueCanonical": "http://hl7.org/fhir/uv/cqm/Measure/EXM130-FHIR|8.0.000"
    },
    {
      "name": "measureUrl",
      "valueCanonical": "http://hl7.org/fhir/uv/cqm/Measure/EXM108-FHIR|8.2.000"
    },
    {
      "name": "periodStart",
      "valueDate": "2018-01-01"
    },
    {
      "name": "periodEnd",
      "valueDate": "2018-12-31"
    },
    {
      "name": "subjectGroup",
      "resource": {
        "resourceType": "Group",
        "id": "group02",
        "type": "person",
        "actual": true,
        "member": [
          {
            "entity": {
              "reference": "Patient/patient01"
            }
          },
          {
            "entity": {
              "reference": "Patient/patient02"
            }
          },
          {
            "entity": {
              "reference": "Patient/patient03"
            }
          }
        ],
        "meta": {
          "source": "http://example.org/fhir/server"
        }
      }
    },
    {
      "name": "validateResources",
      "valueBoolean": true
    },
    {
      "name": "dataEndpoint",
      "resource": {
        "resourceType": "Endpoint",
        "id": "example-multi-measure-public-endpoint",
        "status": "active",
        "connectionType": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
                "code": "hl7-fhir-rest"
              }
            ]
          }
        ],
        "name": "DaVinci Hospital FHIR Endpoint",
        "payloadType": [
          {
            "coding": [
              {
                "system": "http://hl7.org/fhir/resource-types",
                "code": "MeasureReport"
              }
            ]
          }
        ],
        "payloadMimeType": [
          "application/fhir+xml",
          "application/fhir+json"
        ],
        "address": "https://example.org/fhir/open/MeasureReport"
      }
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

{% include_relative Parameters-multi-measure-invited-obs.json %}
~~~
