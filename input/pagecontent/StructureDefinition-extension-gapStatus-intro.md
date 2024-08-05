{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. url: identifies the meaning of the extension

<!--End Generated Intro (DO NOT REMOVE)-->

<!-- StructureDefinition-extension-gapStatus-intro.md
gapStatus  -->

The DEQM Gap Status is a modifier extension and is used by the DEQM Gaps In Care DetectedIssue. The gap status allows the `not-applicable` code, which indicates the patient does not meet the initial population criteria for the measure. The gap status also allows the `open-gap` code, which indicates the patient has an open care gap as opposed to a `closed-gap` status. These different gap statuses will likely affect whether a DEQM Individual MeasureReport or a Detailed Care Gap Guidance Response is referenced in the DetectedIssue as evidence and the nature of the Guidance Response
