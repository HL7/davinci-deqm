{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. member: Who is in group
2. type: person \| animal \| practitioner \| device \| medication \| substance
3. member.entity: Reference to the patient that is in group
4. actual: Descriptive or actual

<!--End Generated Intro (DO NOT REMOVE)-->


{% assign id = {{page.id}} %}

This profile builds on [Group](https://www.hl7.org/fhir/group.html).

<!--

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary

-->

<!-- ### Examples-->

<!--{% include list-simple-organizations.xhtml %} -->

{% include link-list.md %}
