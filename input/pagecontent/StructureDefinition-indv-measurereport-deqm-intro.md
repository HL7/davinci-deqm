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
7. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
8. group.measureScore: What score this group achieved
9. group.population.count: Size of the population
10. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
11. group.stratifier.stratum.population.count: Size of the population
12. group: Measure results for each group
13. message: Evaluation messages
14. group.code: Meaning of the group
15. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
16. group.id: Unique id for inter-element referencing
17. group.stratifier.code: What stratifier of the group
18. description: Description of the stratifier
19. altscoretype: Possible additional measureScore value types
20. evaluatedResource: What data was used to calculate the measure score
21. measurereport-category: What category is this measure report
22. group: Group of practitioners responsible for a report
23. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
24. improvementNotation: increase \| decrease
25. calculatedDate: The date the score was calculated
26. groupImprovementNotation: increase \| decrease
27. description: Description of the group
28. group.stratifier.stratum.population: Population results in this stratum

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
