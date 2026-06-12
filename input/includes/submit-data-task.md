
#### Examples
{:.no_toc}

**Scenario:**

Provider X acting in the role of Producer submits MRP data for Patient Y to Payer Z who is acting in the role of Consumer.  The body of the request is a Bundle resource containing the required profiles for MRP attestation using Task as the resource used to evaluate the measure.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-mrp-submit-task.json %}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
