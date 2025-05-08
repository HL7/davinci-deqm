{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. type: document \| message \| transaction \| transaction-response \| batch \| batch-response \| history \| searchset \| collection
2. identifier.system: The namespace for the identifier value
3. timestamp: When the bundle was assembled
4. identifier: Persistent identifier for the bundle
5. identifier.value: The value that is unique

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. entry: Contains a composition of gaps in care report for an individual for one or more measures

<!--End Generated Intro (DO NOT REMOVE)-->


{% assign id = {{page.id}} %}

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

**Additional Profile specific implementation guidance:**

Conformance Requirement 1:

The DEQM Gaps In Care Bundle SHALL include entries for all patient specific resources including evaluated resources referenced by the included [DEQM Gaps In Care MeasureReport](StructureDefinition-indv-measurereport-deqm.html) and for resources referenced by the [DEQM Gaps In Care DetectedIssue](StructureDefinition-gaps-detectedissue-deqm.html) including GuidanceResponse. 


<!-- ### Examples-->


{% include link-list.md %}
