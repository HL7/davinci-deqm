**Scenario:**

Provider X acting in the role of Producer submits Measure data multiple 
measures on multiple patients to Payer Z who is acting in the role of Consumer.
The body of the request is a Parameters resource containing a list of URLs
where Payer Z can access the contents of the submission, including the
MeasureReports. Payer Z returns a location that Provider X can poll for a
status of the request. During processing Payer Z will return an in-progress
message in response to polls. Once processing is complete, Payer Z will return
the full response to the operation with details on any issues encountered
during processing.

**Kick-off Request using `POST`**

`POST [consumer base]/$import`

with header 

`Prefer: respond-async`

**Request body**

~~~
{
   "resourceType":"Parameters",
   "parameter": [
      ...,
      {
         "name":"input",
         "part": [
            {
               "name": "url",
               "valueUrl": "http://path.to/producer/file/one.ndjson"
            },
            ...
         ]
      },...,
      {
         "name":"input",
         part": [
            {
               "name": "url",
               "valueUrl": "http://path.to/producer/file/n.ndjson"
            },
            ...
         ]
      }
    ]
 }
~~~

**Kick-off Response**

~~~
HTTP/1.1 202 Accepted
Content-Location: http://path.to/consumer/poll/location
[other headers]
~~~

**Poll Request to indicated `Content-Location` using `GET`**

`GET http://path.to/consumer/poll/location`

**Poll Response (In-progress)**

~~~
HTTP/1.1 202 Accepted
X-Progress: "50% Complete"
[other headers]
~~~

**Poll Response (Completed)**

~~~
HTTP/1.1 200 OK
X-Progress: "50% Complete"
[other headers]
~~~

**Poll Response (Completed) Body**

~~~
{
   "resourceType":"Parameters",
   "parameter": [
      ...,
      {
         "name":"outcome",
         "part": [
            {
               "name": "associatedInputUrl",
               "valueUrl": "http://path.to/producer/file/one.ndjson"
            },
            {
               "name": "operationOutcome",
               "resource": {
                  "resourceType": "OperationOutcome",
                  "issue": [
                     {
                        "severity": "error",
                        "code": "processing",
                        "details": {
                           "text": "Failed to process entry at row 472: invalid json."
                        }
                     }
                  ]
               }
            },
            ...
         ]
      },...
   ]
}
~~~