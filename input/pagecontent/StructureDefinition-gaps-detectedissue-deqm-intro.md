{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. modifierExtension: Gap Status
2. modifierExtension: Extension
3. evidence: Supporting evidence
4. code: Issue Category, e.g. drug-drug, duplicate therapy, etc.
5. evidence.detail: This references either a DEQM Individual MeasureReport or a GuidanceResponse resource. Note that referencing the GuidanceResponse resource allows potential profiling on GuidanceResponse in the future without breaking backward compatibility.
6. status: registered \| preliminary \| final \| amended +
7. patient: Associated patient

<!--End Generated Intro (DO NOT REMOVE)-->



{% assign id = {{page.id}} %}


This profile builds on [DetectedIssue](https://www.hl7.org/fhir/detectedissue.html).

<!--
Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. References to
-->

<!-- ### Examples-->


{% include link-list.md %}
