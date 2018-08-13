
{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[id].description}}

#### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A canonical uri
1. A status
1. A [Library]({{site.data.fhir.path}}/library.html) reference that contains the formal logic used to calculate the measure

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. ...todo...


**Additional Profile specific implementation guidance:**

None

#### Examples

- [{{id}}-example-1](todo.html)
