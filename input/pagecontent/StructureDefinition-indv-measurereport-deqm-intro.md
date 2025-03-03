{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. status: complete \| pending \| error
2. type: individual \| subject-list \| summary \| data-collection
3. measure: What measure was calculated
4. subject: What individual(s) the report is for
5. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
6. reporter: Organization that generated the MeasureReport
7. period: The period for which the report was calculated. For the gaps in care use case, this is referred to as the gaps through period.
8. period.start: Starting time with inclusive boundary
9. period.end: End time with inclusive boundary, if not ongoing

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. improvementNotation: increase \| decrease
2. group: Measure results for each group
3. evaluatedResource: What data was used to calculate the measure score
4. careGapRemark: Condition Category remark
5. message: Evaluation messages
6. measurereport-category: What category is this measure report
7. supplementalData: Supplemental Data
8. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
9. group: Group of practitioners responsible for a report
10. group.id: Unique id for inter-element referencing
11. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
12. calculatedDate: The date the score was calculated
13. groupImprovementNotation: increase \| decrease
14. description: Description of the group
15. numeratorMembership: Provides the number of subjects in the numerator population membership.
16. denominatorMembership: Provides the number of subjects in the denominator population membership.
17. measurePopulationMembership: Provides the number of subjects in the measure population membership.
18. group.code: Meaning of the group
19. group.population: The populations in the group
20. countQuantity: Count as a Quantity
21. description: Description of the population
22. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
23. group.population.count: Size of the population
24. group.measureScore: What score this group achieved
25. altscoretype: Possible additional measureScore value types
26. description: Description of the stratifier
27. group.stratifier.code: What stratifier of the group
28. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
29. group.stratifier.stratum.population: Population results in this stratum
30. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
31. group.stratifier.stratum.population.count: Size of the population
32. popref: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
