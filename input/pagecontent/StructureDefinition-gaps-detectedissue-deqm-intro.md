{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. modifierExtension: Gap Status
2. vidence: Supporting evidence
3. code: Issue Category, e.g. drug-drug, duplicate therapy, etc.
4. status: registered \| preliminary \| final \| amended +
5. evidence.detail: This references either a DEQM Individual MeasureReport or a Detailed Care Gap Guidance Response resource.
6. patient: Associated patient

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. criteriaReference: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->



{% assign id = {{page.id}} %}


This profile builds on [DetectedIssue](https://www.hl7.org/fhir/detectedissue.html).

<!--
Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. References to
-->

<!-- ### Examples-->


{% include link-list.md %}
