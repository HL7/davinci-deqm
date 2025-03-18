{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. entry.request.method: GET \| HEAD \| POST \| PUT \| DELETE \| PATCH
2. entry.request.url: URL for HTTP equivalent of this entry
3. type: document \| message \| transaction \| transaction-response \| batch \| batch-response \| history \| searchset \| collection
4. entry: Entry in the bundle - will have a resource or information
5. entry.response.status: Status response code (text optional)
6. identifier.system: The namespace for the identifier value
7. timestamp: When the bundle was assembled
8. identifier: Persistent identifier for the bundle
9. identifier.value: The value that is unique

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
