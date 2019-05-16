
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[id].description}}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A subscriber ID

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary


**Additional Profile specific implementation guidance:**

None

### Examples

{% include list-simple-coverages.xhtml %}
