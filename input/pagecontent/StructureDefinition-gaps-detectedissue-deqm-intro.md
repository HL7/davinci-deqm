

{% assign id = {{page.id}} %}


This profile builds on [DetectedIssue](https://www.hl7.org/fhir/detectedissue.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A DEQMGapStatusModifierExtension with a code from the DEQM Gaps In Care Status Value Set.
1. A DetectedIssue.code with a fixed code care-gap.
1. The DetectedIssue.evidence.detail either references the measure to which the detected issue applies by referencing the DEQM Individual Measure Report or references the GuidanceResponse resource. The Measure Report contains a reference to the Measure resource.
1. Reference to patient for which the detected issue applies.


<!--
Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. References to
-->

<!-- ### Examples-->


{% include link-list.md %}
