{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. extension.url: identifies the meaning of the extension
2. extension.url: identifies the meaning of the extension
3. extension.value[x]: Value of extension
4. extension.value[x]: Value of extension
5. status: complete \| pending \| error
6. type: individual \| subject-list \| summary \| data-collection
7. measure: What measure was calculated
8. period: What period the report covers
9. group.stratifier.stratum.component.code: What stratifier component of the group
10. group.stratifier.stratum.component.value: The stratum component value, e.g. male

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. reportingProgram: Reporting program
2. inputParameters: What parameters
3. supplementalData: Supplemental Data
4. criteriaReference: Criteria reference
5. description: Description of the supplemental data
6. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
7. vendor: Vendor information
8. cehrt: CMS EHR Certifciation ID
9. software: Extension
10. message: Evaluation messages
11. popref: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
