#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a MRP Summary Report for MRP for period P to Receiver Z.  The body of the request is MeasureReport resource containing the required  summary data for MRP attestation for the period.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]/MeasureReport`

**Request body**
~~~
{% include_relative MeasureReport-summ-measurereport01.json %}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
