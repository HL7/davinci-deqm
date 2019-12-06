#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a VTE Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-single-indv-vte-report.json %}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~
