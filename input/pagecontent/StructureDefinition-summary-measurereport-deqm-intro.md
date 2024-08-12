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
15. group.stratifier.stratum.component.code: What stratifier component of the group
16. group.stratifier.stratum.component.value: The stratum component value, e.g. male
17. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
18. group.stratifier.stratum.population.count: Size of the population

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
11. group: Group of practitioners responsible for a report
12. improvementNotation: increase \| decrease
13. group.id: Unique id for inter-element referencing
14. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
15. calculatedDate: The date the score was calculated
16. groupImprovementNotation: increase \| decrease
17. description: Description of the group
18. numeratorMembership: Provides the number of subjects in the numerator population membership.
19. denominatorMembership: Provides the number of subjects in the denominator population membership.
20. measurePopulationMembership: Provides the number of subjects in the measure population membership.
21. group.code: Meaning of the group
22. group.population: The populations in the group
23. countQuantity: Count as a Quantity
24. description: Description of the population
25. group.population.count: Size of the population
26. group.measureScore: What score this group achieved
27. altscoretype: Possible additional measureScore value types
28. group.stratifier: Stratification results
29. description: Description of the stratifier
30. group.stratifier.code: What stratifier of the group
31. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
32. group.stratifier.stratum.value: The stratum value, e.g. male
33. group.stratifier.stratum.population: Population results in this stratum
34. group.stratifier.stratum.measureScore: What score this stratum achieved
35. strataltscoretype: Possible additional measureScore value types

<!--End Generated Intro (DO NOT REMOVE)-->




**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
