#### Examples
{:.no_toc}

**Scenario:**

Reporter X submits a MRP Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and Observation resources all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code and a `transaction-response` Bundle is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-single-indv-mrp-obs-report.json %}
~~~


**Response**

~~~
{% include single-indv-col-obs-report-transaction-response.txt %}
~~~
