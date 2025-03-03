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
4. group.id: Unique id for inter-element referencing
5. group.code: Meaning of the group
6. group.population: The populations in the group
7. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
8. group.population.count: Size of the population
9. group.measureScore: What score this group achieved
10. group.stratifier.code: What stratifier of the group
11. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
12. group.stratifier.stratum.population: Population results in this stratum
13. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
14. group.stratifier.stratum.population.count: Size of the population

<!--End Generated Intro (DO NOT REMOVE)-->



**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
