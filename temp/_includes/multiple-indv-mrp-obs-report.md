
#### Examples
{:.no_toc}

**Scenario:**

Payer X who is acting in the role of a Reporter submits a MRP Individual Reports for Patients P, Q and R to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and Observation resources all the related resources containing the relevant data used to compute the CQM criteria.  An HTTP Status success code and a `transaction-response` Bundle is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-multiple-indv-mrp-obs-report.json %}
~~~


**Response**

~~~
{% include multiple-indv-mrp-obs-report-transaction-response.txt %}
~~~
