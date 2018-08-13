{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[id].description}}

#### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A measure report type hardcoded to "individual"
1. The reference to the [Measure]({{site.data.fhir.path}}/measure.html)
1. A patient the report is for
1. The date the report was generated
1. The organization that reported the data
1. The reporting period

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. Reference to all the resources involved in producing the report

**Additional Profile specific implementation guidance:**

None

#### Examples

- [{{id}}-example-1](todo.html)
