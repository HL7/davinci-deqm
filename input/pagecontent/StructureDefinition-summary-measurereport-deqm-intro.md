{% assign id = {{include.id}} %}
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. status: complete \| pending \| error
2. type: individual \| subject-list \| summary \| data-collection
3. measure: What measure and version was calculated
4. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
5. reporter: Organization that generated the MeasureReport
6. period: What period the report covers
7. period.start: Starting time with inclusive boundary
8. period.end: End time with inclusive boundary, if not ongoing

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. improvementNotation: increase \| decrease
2. group: Measure results for each group
3. group.id: Unique id for inter-element referencing
4. group.code: Meaning of the group
5. group.population: The populations in the group
6. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
7. group.population.count: Size of the population
8. group.stratifier: Stratification results
9. group.stratifier.code: What stratifier of the group
10. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
11. group.stratifier.stratum.value: The stratum value, e.g. male
12. group.stratifier.stratum.population: Population results in this stratum
13. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
14. group.stratifier.stratum.population.count: Size of the population
15. group.stratifier.stratum.measureScore: What score this stratum achieved

<!--End Generated Intro (DO NOT REMOVE)-->




**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
