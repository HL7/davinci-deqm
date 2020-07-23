
#### Examples
{:.no_toc}
- [Scenario Option 1](#SO1)
- [Scenario Option 7](#SO7)

**Scenario Option 1:**
{:#SO1}

Payer X who is acting in the role of a Reporter submits a VTE Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria based on option 1 described above. An HTTP Status success code and a `transaction-response` Bundle is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-single-indv-vte-report-option1.json %}
~~~

**Response**

~~~
{% include vte-indv-report-example-transaction-response.txt %}
~~~

**Scenario Option 7:**
{:#SO7}

Payer X who is acting in the role of a Reporter submits a VTE Individual Report for Patient P to Receiver Z.  The body of the request is a transaction bundle including the Individual MeasureReport and all the related resources containing the relevant data used to compute the CQM criteria based on option 7 described above.  An HTTP Status success code and a `transaction-response` Bundle is returned on successful submission.

**POST Summary Report**

`POST [base]`

**Request body**

~~~
{% include_relative Bundle-single-indv-vte-report-option7.json %}
~~~

**Response**

~~~
{% include vte-indv-report-example-transaction-response.txt %}
~~~
