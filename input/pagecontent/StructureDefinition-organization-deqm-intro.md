
{% assign id = {{include.id}} %}




### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. Either a National Provider Identifier (NPI), Employer Identification Number (EIN), or CMS Certification Number(CCN) identifier

<!--

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary

-->

**Additional Profile specific implementation guidance:**

<div class="bg-info" markdown="1">

The "Full View" tab below displays all the identifier slices including the *EIN*  and *CCN* slices defined in the [QI Core Organization] profile and *NPI* slice which is inherited indirectly from the [US Core Organization Profile].
</div>

### Examples

{% include list-simple-organizations.xhtml %}

{% include link-list.md %}
