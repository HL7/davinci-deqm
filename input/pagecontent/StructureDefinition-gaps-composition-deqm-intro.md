{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. status: preliminary \| final \| amended \| entered-in-error
2. type: Kind of composition (LOINC if possible)
3. subject: What individual the gaps in care report is for. All individual MeasureReports referenced must be for this same individual.
4. date: The datetime the gaps in care report was created
5. author: Who and/or what authored the composition
6. title: The title of the gaps in care report
7. attester.mode: personal \| professional \| legal \| official
8. relatesTo.code: replaces \| transforms \| signs \| appends
9. relatesTo.target[x]: Target of the relationship
10. section: Must contain at least one section, each section corresponds to an individual MeasureReport for a specific measure
11. section.focus: This references a DEQM individual MeasureReport
12. section.entry: This references a gaps in care DetectedIssue

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. custodian: Identifies the organization who is responsible for ongoing maintenance of and accessing to this gaps in care report

<!--End Generated Intro (DO NOT REMOVE)-->


{% assign id = {{page.id}} %}

This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

Note:  The date range for the Gaps in Care Report is specified using the `period` element in the [DEQM Individual MeasureReport Profile].

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
