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
1. subject: What individual(s) the report is for
2. improvementNotation: increase \| decrease
3. group: Measure results for each group
4. group.id: Unique id for inter-element referencing
5. group.code: Meaning of the group
6. group.population: The populations in the group
7. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
8. group.population.count: Size of the population
9. group.population.subjectResults: For subject-list reports, the subject results in this population
10. group.stratifier: Stratification results
11. group.stratifier.code: What stratifier of the group
12. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
13. group.stratifier.stratum.value: The stratum value, e.g. male
14. group.stratifier.stratum.population: Population results in this stratum
15. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
16. group.stratifier.stratum.population.count: Size of the population
17. group.stratifier.stratum.population.subjectResults: For subject-list reports, the subject results in this population
18. group.stratifier.stratum.measureScore: What score this stratum achieved

<!--End Generated Intro (DO NOT REMOVE)-->