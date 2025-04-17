{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. period.start: Starting time with inclusive boundary
2. subject: What individual(s) the report is for
3. status: complete \| pending \| error
4. type: individual \| subject-list \| summary \| data-collection
5. period.end: End time with inclusive boundary, if not ongoing
6. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
7. period: The period for which the report was calculated. For the gaps in care use case, this is referred to as the gaps through period.
8. measure: What measure was calculated
9. reporter: Organization that generated the MeasureReport

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. popref: Criteria reference
2. description: Description of the population
3. careGapRemark: Condition Category remark
4. countQuantity: Count as a Quantity
5. supplementalData: Supplemental Data
6. group.population: The populations in the group
7. numeratorMembership: Provides the number of subjects in the numerator population membership.
8. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
9. group.measureScore: What score this group achieved
10. group.population.count: Size of the population
11. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
12. group.stratifier.stratum.population.count: Size of the population
13. group: Measure results for each group
14. measurePopulationMembership: Provides the number of subjects in the measure population membership.
15. message: Evaluation messages
16. denominatorMembership: Provides the number of subjects in the denominator population membership.
17. group.code: Meaning of the group
18. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
19. group.id: Unique id for inter-element referencing
20. group.stratifier.code: What stratifier of the group
21. description: Description of the stratifier
22. altscoretype: Possible additional measureScore value types
23. evaluatedResource: What data was used to calculate the measure score
24. measurereport-category: What category is this measure report
25. group: Group of practitioners responsible for a report
26. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
27. improvementNotation: increase \| decrease
28. calculatedDate: The date the score was calculated
29. groupImprovementNotation: increase \| decrease
30. description: Description of the group
31. group.stratifier.stratum.population: Population results in this stratum

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
