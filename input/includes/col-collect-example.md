

**Scenario:**
{:.no_toc}

Payer X acting in the role of Consumer collect Patient Y's COL data from Provider Z, which is acting in the role of Producer.  The body of the request is a Parameters resource containing the desired input parameters.  An HTTP Status success code is returned on successful submission.

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
      "name": "periodStart",
      "valueDate": "2018-01-01"
    },
    {
      "name": "periodEnd",
      "valueDate": "2018-12-31"
    },
    {
      "name": "subject",
      "valueReference": "Patient/patient03"
    },
    {
      "name": "validateResources",
      "valueBoolean": true
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

{% include_relative Parameters-col-collect-obs.json %}
~~~
