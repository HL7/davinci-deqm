added bryn's deqm library and measure profiles. cleaned up terminology topofpage
{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[id].description}}

#### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A canonical url
1. At least one identifier
1. A  content version
1. A valid, machine-friendly name
1. A human-friendly title
1. The measure type
1. At least one population group with at least one population within it
1. The type of population criteria
1. A date the measure content was last changed
1. Publisher and contact information
1. Concise description of the measure content
1. A date the measure content was approved by the publisher
1. A date when the measure content was last reviewed
1. At least one library containing population criteria definitions for the measure
1. The scoring method used for the measure
1. The meaning of a higher score

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. A clear description of the purpose of the measure
1. Clinical usage notes for the measure
1. The period during which the measure content can be effectively applied
1. Clear indication of the expected contexts of use for the measure content
1. Intended jurisdictions for the measure content
1. Contributors to the measure content
1. Relevant topics for the measure content
1. Information on contributors to the measure content
1. Copyright information
1. Provide related information such as supporting evidence, citations, and documentation
1. A legal disclaimer relating to the use of the measure content
1. Stratification information if appropriate
1. Supplemental data where appropriate


**Additional Profile specific implementation guidance:**

None

#### Examples

- [{{id}}-example-1](todo.html)
