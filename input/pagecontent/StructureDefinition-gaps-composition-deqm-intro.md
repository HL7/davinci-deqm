
{% assign id = {{page.id}} %}

This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A` Composition.type`
1. A `Composition.subject` references [QI Core Patient] who is the subject of the Gaps in Care Report
1. A `Composition.date` that is the datetime of the Gaps in Care Report was created
1. A `Composition.title` that is the title of the Gaps in Care Report
1. A `Composition.section.focus` references a measure report using the [DEQM Individual MeasureReport Profile]
1. A `Composition.section.entry` references detected issue for a measure using the [DEQM Gaps In Care DetectedIssue Profile]

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. A `Composition.custodian` references the organization that is responsible for ongoing maintenance of the Gaps in Care Report

Note:  The date range for the Gaps in Care Report is specified using the `period` element in the [DEQM Individual MeasureReport Profile].

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
