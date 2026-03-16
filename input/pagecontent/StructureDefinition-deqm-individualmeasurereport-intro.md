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
1. description: Description of the population
2. careGapRemark: Condition Category remark
3. countQuantity: Count as a Quantity
4. category: What category is this measure report
5. group.population: The populations in the group
6. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
7. group.measureScore: What score this group achieved
8. group.population.count: Size of the population
9. group.stratifier.stratum.population.count: Size of the population
10. group: Measure results for each group
11. alternateScoreType: Possible additional measureScore value types
12. criteriaReference: Criteria reference
13. countQuantity: Size of the population as a quantity.
14. group.code: Meaning of the group
15. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
16. group.id: Unique id for inter-element referencing
17. group.stratifier.code: What stratifier of the group
18. description: Description of the stratifier
19. evaluatedResource: What data was used to calculate the measure score
20. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
21. improvementNotation: increase \| decrease
22. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite \| attestation
23. calculatedDate: The date the score was calculated
24. description: Description of the group
25. group.stratifier: Stratification results
26. supplementalData: Optional Extensions Element
27. group.stratifier.stratum.population: Population results in this stratum
28. group.stratifier.stratum.measureScore: What score this stratum achieved

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
