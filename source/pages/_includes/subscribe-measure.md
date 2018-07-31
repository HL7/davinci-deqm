**Subscribe**

`POST [base]/Subscription`

**Request body**

~~~
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../schema/subscription.xsd">
 <id value="med-rec-example"/>
  <text>
    <status value="generated" />
    <div xmlns="http://www.w3.org/1999/xhtml">[Put rendering here]</div>
  </text>
  <modifierExtension>
    <url value="http://example.org/measure-subscription"/>
    <valueCode value="active"/>
  </modifierExtension>
  <status value="active"/>
  <contact>
    <system value="phone"/>
    <value value="ext 4123"/>
  </contact>
  <reason value="Monitor medication reconciliation attestation"/>
  <criteria value="Measure/measure-mrp"/>
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
