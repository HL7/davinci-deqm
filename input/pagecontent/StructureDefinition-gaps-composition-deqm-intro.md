{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. title: The title of the gaps in care report
2. status: preliminary \| final \| amended \| entered-in-error
3. section.focus: This references a DEQM individual MeasureReport
4. date: The datetime the gaps in care report was created
5. section.entry: This references a gaps in care DetectedIssue
6. type: Kind of composition (LOINC if possible)
7. author: Who and/or what authored the composition
8. subject: What individual the gaps in care report is for. All individual MeasureReports referenced must be for this same individual.
9. section: Must contain at least one section, each section corresponds to an individual MeasureReport for a specific measure

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. custodian: Identifies the organization who is responsible for ongoing maintenance of and accessing to this gaps in care report

<!--End Generated Intro (DO NOT REMOVE)-->


{% assign id = {{page.id}} %}

This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

Note:  The date range for the Gaps in Care Report is specified using the `period` element in the [DEQM Individual MeasureReport Profile].

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
