<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. period.start: Starting time with inclusive boundary
2. group.stratifier.stratum.component.code: What stratifier component of the group
3. status: complete \| pending \| error
4. type: individual \| subject-list \| summary \| data-collection
5. period.end: End time with inclusive boundary, if not ongoing
6. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
7. group: Measure results for each group
8. group.stratifier.stratum.component.value: The stratum component value, e.g. male
9. period: What period the report covers
10. measure: What measure and version was calculated
11. reporter: Organization that generated the MeasureReport

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. description: Description of the population
2. group.population.subjectResults: For subject-list reports, the subject results in this population
3. countQuantity: Count as a Quantity
4. supplementalData: Supplemental Data
5. group.population: The populations in the group
6. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
7. group.population.count: Size of the population
8. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
9. group.stratifier.stratum.population.count: Size of the population
11. group: Measure results for each group
12. group.stratifier.stratum.value: The stratum value, e.g. male
13. group.code: Meaning of the group
14. strataltscoretype: Possible additional measureScore value types
15. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
16. group.id: Unique id for inter-element referencing
17. group.stratifier.code: What stratifier of the group
18. description: Description of the stratifier
19. altscoretype: Possible additional measureScore value types
20. measurereport-category: What category is this measure report
21. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
22. group.stratifier.stratum.population.subjectResults: For subject-list reports, the subject results in this population
23. improvementNotation: increase \| decrease
24. subject: What individual(s) the report is for
25. calculatedDate: The date the score was calculated
26. groupImprovementNotation: increase \| decrease
27. description: Description of the group
28. group.stratifier: Stratification results
29. group.stratifier.stratum.population: Population results in this stratum
30. group.stratifier.stratum.measureScore: What score this stratum achieved

<!--End Generated Intro (DO NOT REMOVE)-->
