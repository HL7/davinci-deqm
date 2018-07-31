**Subscribe**

`POST [base]/Subscription`

**Request body**

Option 1: using the Measure Subscription modifier extension to modify to the criteria element for event based triggers as shown below...

~~~
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../schema/subscription.xsd">
 <id value="med-rec-example"/>
  <text>
    <status value="generated" />
    <div xmlns="http://www.w3.org/1999/xhtml">[Put rendering here]</div>
  </text>
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

Option 2: using the Argonaut Scheduling extensions:

- Subscription Trigger event Extension

~~~
{
  "resourceType": "Subscription",
  "id": "example",
  "status": "active",
  "reason": "Notify subscriber of schedule changes to trigger the subscriber prefetch updated slots",
  "_criteria": {
    // this extension is text right now - could be a fhirpath or CQL or other language expression too.
    "extension": [
      {
        "url": "http://fhir.org/guides/argonaut-scheduling/StructureDefinition/extension-subscription-triggerevent",
        "valueString": "schedule where any slot that reference it has changed"
      },
      //don't know if we need the following extension for this use case
      {
        "url": "http://fhir.org/guides/argonaut-scheduling/StructureDefinition/extension-subscription-eventfocus",
        "valueCode": "Task"
      }
    ]
  },
  "channel": {
    "type": "rest-hook",
    "endpoint": "https://feed-handler.com/notification",
    "payload": "application/fhir+json"
  }
}
~~~


**Response**

~~~
HTTP/1.1 200 OK
[other headers]

~~~
