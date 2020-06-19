### Example
{:.no_toc}

**Scenario**

Provider X acting in the role of the Producer requests data requirements for the Colorectal Cancer Screening measure from Payer Z which is acting in the role of Consumer.  A Library resource containing the required resources for Colorectal Cancer Screening reporting are returned on successful evaluation.

**Request using `GET`**

`GET [base]/Measure/measure-exm130-FHIR/$data-requirements?periodStart=2018&periodEnd=2018`

**Request using `POST`**

`POST [base]/Measure/measure-exm130-FHIR/$data-requirements`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"periodStart",
         "valueDate":"2018"
      },
      {
         "name":"periodEnd",
         "valueDate":"2018"
      }
    ]
 }
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**

~~~
{% include_relative Library-exm130-fhir-r4.json %}
~~~
