## Operation Request Body

The request body for this operation is a [FHIR Parameters Resource](https://www.hl7.org/fhir/parameters.html). The body SHALL include a FHIR MeasureReport Resource of type `data-collection` that references a measure by canonical URL. Additionally, the FHIR Parameters resource SHALL include the URL of a Data Provider, as defined in the [Bulk Data Import Ping and Pull Approach](https://github.com/smart-on-fhir/bulk-import/blob/master/import-pnp.md#bulk-data-import-kick-off-request-ping-from-data-provider-to-data-consumer). The Data Provider SHALL support `$export`. It is assumed that the data-of-interest for the measure referenced in the MeasureReport lives on the Data Provider server.

### Request Flow

The Data Consumer server SHALL support invocation of the bulk submit-data operation using the [FHIR Asynchronous Request Pattern](http://hl7.org/fhir/async.html) via a POST request containing the FHIR Parameters Resource described above. To avoid overloading the [standard $submit-data operation](http://hl7.org/fhir/R4/operation-measure-submit-data.html), the bulk submit-data operation will send a POST request to the `$bulk-submit-data` endpoint.

When kicking off the request, if the `“prefer”: “respond-async”` header is provided, the bulk submit-data operation will calculate the data requirements for the measure-of-interest. The Data Consumer will kick off an `$export` request to the Data Provider. Then, the data exported from the Data Provider is uploaded to the system.

Required header(s):

```
"prefer": "respond-async"
```
Specifies whether the response is immediate or asynchronous.

### Examples

Request: Submit data of interest for FHIR Measure with "test-measure" identifier from the Data Provider http://example.com/

```
POST [base]/Measure/test-measure/$bulk-submit-data
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "exportUrl",
      "valueUrl": "http://example.com/$export"
    },
    {
      "name": "exportType",
      "valueCode": "dynamic"
    },
    {
      "name": "measureReport",
      "resource": {
        "resourceType": "MeasureReport",
        "type": "data-collection,
        "status": "pending",
        "measure": "http://example.com/Measure/test-measure",
        "period": {
          "start": "2022-01-01",
          "end": "2022-12-31"
        }
      }
    }
  ]
}
```

Response:

```
HTTP/1.1 202 Accepted
```

Request: Submit data of interest related to patients in the group "test-group" for FHIR Measure with id "test-measure" from the Data Provider http://example.com/. Group "test-group" must exist on the export server.

```
POST [base]/Measure/test-measure/$bulk-submit-data
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "exportUrl",
      "valueUrl": "http://example.com/Group/test-group/$export"
    },
    {
      "name": "measureReport",
      "resource": {
        "resourceType": "MeasureReport",
        "type": "data-collection,
        "status": "pending",
        "measure": "http://example.com/Measure/test-measure",
        "period": {
          "start": "2022-01-01",
          "end": "2022-12-31"
        }
      }
    }
  ]
}
```

Response:

```
HTTP/1.1 202 Accepted
```

Request: Submit all FHIR Observations and Procedures of interest for FHIR Measure with id "test-measure" from the Data Provider http://example.com/.

```
POST [base]/Measure/test-measure/$bulk-submit-data
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "exportUrl",
      "valueUrl": "http://example.com/$export"
    },
    {
      "name": "_type",
      "valueString": "Observation"
    },
    {
      "name": "_type",
      "valueString": "Procedure"
    },
    {
      "name": "measureReport",
      "resource": {
        "resourceType": "MeasureReport",
        "type": "data-collection,
        "status": "pending",
        "measure": "http://example.com/Measure/test-measure",
        "period": {
          "start": "2022-01-01",
          "end": "2022-12-31"
        }
      }
    }
  ]
}
```

Response:

```
HTTP/1.1 202 Accepted
```
