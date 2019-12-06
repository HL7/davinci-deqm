### Example
{:.no_toc}

**Scenario**

Provider X acting in the role of the Producer requests data requirements for the MRP measure from Payer Z which is acting in the role of Consumer.  A Library resource containing the required resources for MRP attestation returned on successful evaluation.

**Request using `GET`**

`GET [base]/Measure/measure-mrp/$data-requirements?periodStart=2018&periodEnd=2018`

**Request using `POST`**

`POST [base]/Measure/measure-mrp/$data-requirements`

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
{% include_relative Library-library-mrp-example.json %}
~~~
