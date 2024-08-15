{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. status: complete \| pending \| error
2. type: individual \| subject-list \| summary \| data-collection
3. measure: What measure was calculated
4. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
5. reporter: Organization that generated the MeasureReport
6. period: What period the report covers
7. period.start: Starting time with inclusive boundary
8. period.end: End time with inclusive boundary, if not ongoing
9. group: Measure results for each group
10. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
11. group.stratifier.stratum.component.code: What stratifier component of the group
12. group.stratifier.stratum.component.value: The stratum component value, e.g. male
13. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
14. group.stratifier.stratum.population.count: Size of the population

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. reportingProgram: Reporting program
2. inputParameters: What parameters
3. supplementalData: Supplemental Data
4. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
5. vendor: Vendor information
6. cehrt: CMS EHR Certifciation ID
7. software: Extension
8. message: Evaluation messages
9. group: Group of practitioners responsible for a report
10. improvementNotation: increase \| decrease
11. group.id: Unique id for inter-element referencing
12. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
13. calculatedDate: The date the score was calculated
14. groupImprovementNotation: increase \| decrease
15. description: Description of the group
16. numeratorMembership: Provides the number of subjects in the numerator population membership.
17. denominatorMembership: Provides the number of subjects in the denominator population membership.
18. measurePopulationMembership: Provides the number of subjects in the measure population membership.
19. group.code: Meaning of the group
20. group.population: The populations in the group
21. countQuantity: Count as a Quantity
22. description: Description of the population
23. group.population.count: Size of the population
24. group.measureScore: What score this group achieved
25. altscoretype: Possible additional measureScore value types
26. group.stratifier: Stratification results
27. description: Description of the stratifier
28. group.stratifier.code: What stratifier of the group
29. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
30. group.stratifier.stratum.value: The stratum value, e.g. male
31. group.stratifier.stratum.population: Population results in this stratum
32. group.stratifier.stratum.measureScore: What score this stratum achieved
33. strataltscoretype: Possible additional measureScore value types

<!--End Generated Intro (DO NOT REMOVE)-->




**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
