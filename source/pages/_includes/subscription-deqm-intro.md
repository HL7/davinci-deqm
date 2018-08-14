
{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[id].description}}

#### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. The Measure Subscription modifier extension

**Additional Profile specific implementation guidance:**

- This profile adds a modifier extension to modify the value of the `criteria` element to a *DEQM Measure instance id*.
-  By invoking the [$data-requirements operation](measure-operations.html#data-requirements) on a subscriber’s (Aggregator) endpoint for the Measure instance specified in `criteria` , the server can discover what data is needed to calculate that particular measure.
- The system sends a notification to the subscriber, if it has determined that it has the requisite measure data the subscriber needs for the measure, or if the information has been updated.
None

#### Examples

- [{{id}}-example-1](todo.html)
