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
8. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
9. reporter: Organization that generated the MeasureReport
10. period: What period the report covers
11. period.start: Starting time with inclusive boundary
12. period.end: End time with inclusive boundary, if not ongoing
13. group: Measure results for each group
14. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
15. group.stratifier.code: What stratifier of the group
16. group.stratifier.stratum.component.code: What stratifier component of the group
17. group.stratifier.stratum.component.value: The stratum component value, e.g. male
18. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
19. group.stratifier.stratum.population.count: Size of the population

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
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
11. MeasureReport.reporter.group: Group of practitioners responsible for a report
12. improvementNotation: increase \| decrease
13. group.id: Unique id for inter-element referencing
14. MeasureReport.group.scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
15. MeasureReport.group.calculatedDate: The date the score was calculated
16. MeasureReport.group.groupImprovementNotation: increase \| decrease
17. MeasureReport.group.description: Description of the group
18. group.code: Meaning of the group
19. group.population: The populations in the group
20. MeasureReport.group.population.countQuantity: Count as a Quantity
21. MeasureReport.group.population.description: Description of the population
22. group.population.count: Size of the population
23. group.measureScore: What score this group achieved
24. MeasureReport.group.measureScore.altscoretype: Possible additional measureScore value types
25. group.stratifier: Stratification results
26. MeasureReport.group.stratifier.description: Description of the stratifier
27. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
28. group.stratifier.stratum.value: The stratum value, e.g. male
29. group.stratifier.stratum.population: Population results in this stratum
30. group.stratifier.stratum.measureScore: What score this stratum achieved
31. MeasureReport.group.stratifier.stratum.measureScore.strataltscoretype: Possible additional measureScore value types

<!--End Generated Intro (DO NOT REMOVE)-->




**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
