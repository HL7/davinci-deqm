
{% assign id = {{page.id}} %}

This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A composition type code hardcoded to gaps-doc (note: this is a temporary code, a LOINC code was requested)
1. A subject references [QI Core Patient] who is the subject of the gaps in care report
1. A date gaps in care report was created
1. A title of the gaps in care report
1. Reference to a measure report using the [DEQM Individual MeasureReport Profile]

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The organization that is responsible for ongoing maintenance of the gaps in care report
1. Reference to detected issue for a measure using the [DEQM Gaps In Care DetectedIssue Profile]

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
