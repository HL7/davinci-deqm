<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each MeasureReport Must Have:**
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

**Each MeasureReport Must Support:**
1. MeasureReport.reportingProgram: Reporting program
2. MeasureReport.inputParameters: What parameters
3. MeasureReport.supplementalData: Supplemental Data
4. MeasureReport.criteriaReference.criteriaReference: Criteria reference
5. MeasureReport.description.description: Description of the supplemental data
6. MeasureReport.scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
7. MeasureReport.vendor: Vendor information
8. MeasureReport.cehrt: CMS EHR Certifciation ID
9. MeasureReport.software: Extension
10. MeasureReport.message: Evaluation messages
11. MeasureReport.evaluatedResource.popref: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->

{% assign id = {{include.id}} %}

**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
