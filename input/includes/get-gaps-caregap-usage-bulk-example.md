
#### Examples
{:.no_toc}

**Scenario:**

The Client would like to request gaps in care reports on many patients. They have created a FHIR Group Resource using the DEQM Gaps In Care Group Profile with the id of 123. Because they expect the creation of the reports to take a while and many FHIR bundles will be returned and be processed, they would like to make the request in an asynchronous manner returning NDJSON that will be easier for them to process.

The request below asks for Group id of 123 to be run asynchronously with FHIR+ndjson as the output format. The header portions should be entered in the API client header section. For example, in the [Postman](https://www.postman.com/) tool, enter “Prefer” in Key and “respond-async” in Value as an entry in the Headers tab.

**GET Gaps In Care Report Using Bulk Data**

Run $care-gaps operation in an asynchronous mode:
```
GET [base]/Measure/$care-gaps?subject=Group/123&periodStart=2020-01-01&periodEnd=2020-09-30&_outputFormat=application/fhir+ndjson
```
