### Examples

**Scenario:** Payer Z fetches MRP data from Provider X for Patient Z

**Assumptions:** ...TODO...

#### Request using  GET Syntax

`GET [base]/MeasureReport/measure-mrp/$collect-data?patient=Patient/patient-z&provider=Practitioner/provider-x&periodStart=2018-06-19`

#### Request using POST Syntax

`POST [base]/MeasureReport/measure-mrp/$collect-data`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter":[
      {
         "name":"patient",
         "valueUri":"Patient/patient-z"
      },
      {
         "name":"practitioner",
         "valueUri":"Practitioner/provider-x"
      },
      {
         "name":"periodStart",
         "valueDateTime":"Practitioner/2018-06-19"
       }
    ]
 }
~~~

#### Response is Bundle containing 8 required profiles:

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**  ( ...todo... edit this example )

{% include mrp-task-collection-bundle.md %}
