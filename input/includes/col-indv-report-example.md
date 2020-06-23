
#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a COL Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria.   An HTTP Status success code and a `transaction-response` Bundle is returned on successful submission.

**POST Individual Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-single-indv-col-obs-report.json %}
~~~

**Response**

~~~
{% include single-indv-col-obs-report-transaction-response.txt %}
~~~
