{% assign id = {{page.id}} %}
{{site.data.structuredefinitions.[id].description}}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A measure report type hardcoded to "individual"
1. The reference to the [Measure]
1. A patient the report is for
1. The date the report was generated
1. The organization that reported the data
1. The reporting period
1. The results of the calculation (the Measure Score)


Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. Reference to a reporting vendor using the DEQM [Reporting Vendor] Extension
1. A certification identifier using the DEQM [Certification Identifier] Extension
1. Ability to use other types for measure score using the DEQM [Alternate Score Type] Extension
1. Reference to *all* the resources involved in producing the report using the DEQM [Reference Any] Extension

**Additional Profile specific implementation guidance:**

None

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
