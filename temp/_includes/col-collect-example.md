
#### Examples
{:.no_toc}

**Scenario:**

Payer X acting in the role of Consumer collect Patient Y's COL data from Provider Z, which is acting in the role of Producer.  The body of the request is a Parameters resource containing the desired input parameters.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-col/$collect-data`

**Request body**

~~~
{
  "resourceType": "Parameters",
  "parameter": [
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
      "valueUri": "Patient/patient03"
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

{% include_relative Parameters-col-submit-collect-obs.json %}
~~~
