{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. status: complete \| pending \| error
2. type: individual \| subject-list \| summary \| data-collection
3. measure: What measure was calculated
4. period: What period the report covers
5. group.stratifier.stratum.component.code: What stratifier component of the group
6. group.stratifier.stratum.component.value: The stratum component value, e.g. male

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. reportingProgram: Reporting program
2. inputParameters: What parameters
3. supplementalData: Supplemental Data
4. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
5. vendor: Vendor information
6. cehrt: CMS EHR Certification ID
7. software: Extension
8. message: Evaluation messages
9. popref: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
