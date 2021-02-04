

{% assign id = {{page.id}} %}


This profile builds on [DetectedIssue](https://www.hl7.org/fhir/detectedissue.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A DetectedIssue code from the DEQM Gaps In Care DetectedIssue Type Value Set
1. References either a DEQM Individual Measure Report or a GuidanceResponse
1. Reference to patient for which the detected issue applies


<!--
Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. References to
-->

<!-- ### Examples-->


{% include link-list.md %}
