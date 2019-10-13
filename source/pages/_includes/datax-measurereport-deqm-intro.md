{% assign id = {{page.id}} %}
{{site.data.structuredefinitions.[id].description}}

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A [DEQM Data Collection Type Extension] flag set to `true`
1. The reference to the [Measure]
1. A link to patient the report is about
1. The date the report was generated
1. The organization that reported the data
1. The reporting period

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. References to other resources involved in producing the report

**Additional Profile specific implementation guidance:**

None

### Examples

{% include datax-measurereports.md %}

{% include link-list.md %}
