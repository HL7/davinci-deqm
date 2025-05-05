{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. group.stratifier.stratum.component.code: What stratifier component of the group
2. group.stratifier.stratum.component.value: The stratum component value, e.g. male
3. measure: What measure and version was calculated
4. reporter: Organization that generated the MeasureReport
5. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
6. period.start: Starting time with inclusive boundary
7. status: complete \| pending \| error
8. type: individual \| subject-list \| summary \| data-collection
9. period.end: End time with inclusive boundary, if not ongoing
10. group.stratifier.stratum.population.count: Size of the population
11. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
12. group: Measure results for each group
13. period: What period the report covers
14. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. group.id: Unique id for inter-element referencing
2. group.stratifier.code: What stratifier of the group
3. description: Description of the stratifier
4. description: Description of the population
5. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
6. countQuantity: Count as a Quantity
7. category: What category is this measure report
8. group.population: The populations in the group
9. improvementNotation: increase \| decrease
10. group.measureScore: What score this group achieved
11. group.population.count: Size of the population
12. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite \| attestation
13. calculatedDate: The date the score was calculated
14. alternateScoreType: Possible additional measureScore value types
15. description: Description of the group
16. countQuantity: Size of the population as a quantity.
17. group.stratifier: Stratification results
18. supplementalData: Optional Extensions Element
19. group.stratifier.stratum.value: The stratum value, e.g. male
20. group.stratifier.stratum.population: Population results in this stratum
21. group.stratifier.stratum.measureScore: What score this stratum achieved
22. group.code: Meaning of the group

<!--End Generated Intro (DO NOT REMOVE)-->




**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
