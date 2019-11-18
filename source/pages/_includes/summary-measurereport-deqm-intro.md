
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[id].description}}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A measure report type hardcoded to "summary"
1. The reference to the [Measure]({{site.data.fhir.path}}measure.html)
1. The date the report was generated
1. The organization that reported the data
1. The reporting period
1. The results of the calculation (the Measure Scores)

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. Separate subgroup calculations (stratifiers)
1. Reference to a reporting vendor using the DEQM [Reporting Vendor] Extension
1. A certification identifier using the DEQM [Certification Identifier] Extension
1. Ability to use other types for measure score using the DEQM [Alternate Score Type] Extension
1. Reference to a reporting group using the DEQM [Reporting Group] Extension

**Additional Profile specific implementation guidance:**

None

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
