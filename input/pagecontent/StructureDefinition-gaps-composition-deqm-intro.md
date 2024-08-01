
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each Composition Must Have:**
1. type: Kind of composition (LOINC if possible)
2. subject: What individual the gaps in care report is for. All individual MeasureReports referenced must be for this same individual.
3. date: The datetime the gaps in care report was created
4. title: The title of the gaps in care report
5. section.focus: This references a DEQM individual MeasureReport
6. section.entry: This references a gaps in care DetectedIssue

**Each Composition Must Support:**
1. custodian: Identifies the organization who is responsible for ongoing maintenance of and accessing to this gaps in care report

<!--End Generated Intro (DO NOT REMOVE)-->
{% assign id = {{page.id}} %}

This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

Note:  The date range for the Gaps in Care Report is specified using the `period` element in the [DEQM Individual MeasureReport Profile].

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
