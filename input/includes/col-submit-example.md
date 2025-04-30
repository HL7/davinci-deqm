
#### Examples
{:.no_toc}

**Scenario:**

Provider X acting in the role of Producer submits COL data for Patient Y to Payer Z who is acting in the role of Consumer.  The body of the request is a Parameters resource containing the required profiles for COL attestation.  An HTTP Status success code is returned on successful submission.

**Request using `POST`**

`POST [base]/Measure/measure-col/$submit-data`

**Request body**

~~~
{% include_relative Parameters-col-submit-obs.json %}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
