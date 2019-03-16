Consumer subscribes to a Producer for notification when Colorectal Cancer Screening measure data is available.  An HTTP Status success code is returned if subscription is accepted.

**Subscribe**

`POST [base]/Subscription`

**Request body**

Using the Measure Subscription modifier extension to modify to the criteria element to define the measure instance id as the triggering criteria.

~~~
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://hl7.org/fhir">
 <id value="col-example"/>
  <!--  this is a proposed extension to make criteria not just a search string -->
  <modifierExtension>
    <url value="http://example.org/measure-subscription"/>
    <valueCode value="active"/>
  </modifierExtension>
  <status value="active"/>
  <contact>
    <system value="phone"/>
    <value value="ext 4123"/>
  </contact>
  <reason value="HEDIS Colorectal Cancer Screening Data"/>
  <criteria value="Measure/measure-col"/>
  <channel>
    <type value="rest-hook"/>
    <!-- TODO: Need a discussion on whether we can pass something here instead of having to expose different endpoints per measure -->
    <endpoint value="https://payersystem.com/fhirserver/on-measure-subscription-mrp"/>
    <payload value="application/fhir+json"/>
    <!--header value="Authorization: Bearer secret-token-abc-123"/-->
  </channel>  
</Subscription>
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]

~~~
