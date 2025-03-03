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
1. careGapRemark: Condition Category remark
2. message: Evaluation messages
3. measurereport-category: What category is this measure report
4. supplementalData: Supplemental Data
5. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
6. improvementNotation: increase \| decrease
7. group: Measure results for each group
8. evaluatedResource: What data was used to calculate the measure score
9. group.id: Unique id for inter-element referencing
10. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
11. calculatedDate: The date the score was calculated
12. groupImprovementNotation: increase \| decrease
13. description: Description of the group
14. numeratorMembership: Provides the number of subjects in the numerator population membership.
15. denominatorMembership: Provides the number of subjects in the denominator population membership.
16. measurePopulationMembership: Provides the number of subjects in the measure population membership.
17. group.code: Meaning of the group
18. group.population: The populations in the group
19. countQuantity: Count as a Quantity
20. description: Description of the population
21. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
22. group.population.count: Size of the population
23. group.measureScore: What score this group achieved
24. altscoretype: Possible additional measureScore value types
25. description: Description of the stratifier
26. group.stratifier.code: What stratifier of the group
27. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
28. group.stratifier.stratum.population: Population results in this stratum
29. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
30. group.stratifier.stratum.population.count: Size of the population
31. popref: Criteria reference

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
