
{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[id].description}}

#### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A canonical url
1. An identifier
1. A content version
1. A valid, machine-friendly name
1. A human-friendly title
1. A date the library content was last changed
1. Publisher and contact information
1. Concise description of the library content
1. A date the library content was approved by the publisher
1. A date when the library content was last reviewed
1. Contents of the library in at least one media format

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. A clear description of the purpose of the library
1. Clinical usage notes for the library
1. An indication of the period during which the library content can be effectively applied
1. Clear indication of the expected contexts of use for the library content
1. Intended jurisdictions for the library content
1. Relevant topics for the library content
1. Information on contributors to the library content
1. Copyright information
1. Description of the data requirements for logic contained in the library
1. Description of any parameters defined by the library
1. Provide related information such as supporting evidence, citations, and documentation

**Additional Profile specific implementation guidance:**

None

#### Examples

- [{{id}}-example-1](todo.html)
