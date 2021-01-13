
{% assign id = {{page.id}} %}

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A bundle type hardcoded to "document"
1. An entry references a composition using the [DEQM Gaps In Care Composition Profile] for a  measure

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. An entry references a MeasureReport using the [DEQM Gaps In Care Individual MeasureReport Profile] for each measure referenced in the composition.

<!--
### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present). -->

<!-- **Each {{site.data.structuredefinitions.[id].type}} must have:** -->

<!--1. -->

<!--

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary

-->

<!-- ### Examples-->


{% include link-list.md %}
