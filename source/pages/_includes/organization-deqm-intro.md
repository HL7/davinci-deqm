
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[id].description}}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. Either an NPI or EIN (TIN) identifier

<!--

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary

-->

**Additional Profile specific implementation guidance:**

The "Full View" tab below displays all the identifier slices including the *TIN* slice defined in this guide and *NPI* slice which is inherited indirectly from the [US Core Organization Profile].

### Examples

{% include list-simple-organizations.xhtml %}

{% include link-list.md %}
