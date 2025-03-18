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
6. numeratorMembership: Provides the number of subjects in the numerator population membership.
7. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
8. group.population.count: Size of the population
9. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
10. group.stratifier.stratum.population.count: Size of the population
11. group: Measure results for each group
12. measurePopulationMembership: Provides the number of subjects in the measure population membership.
13. group.stratifier.stratum.value: The stratum value, e.g. male
14. denominatorMembership: Provides the number of subjects in the denominator population membership.
15. group.code: Meaning of the group
16. strataltscoretype: Possible additional measureScore value types
17. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
18. group.id: Unique id for inter-element referencing
19. group.stratifier.code: What stratifier of the group
20. description: Description of the stratifier
21. altscoretype: Possible additional measureScore value types
22. measurereport-category: What category is this measure report
23. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
24. group.stratifier.stratum.population.subjectResults: For subject-list reports, the subject results in this population
25. improvementNotation: increase \| decrease
26. subject: What individual(s) the report is for
27. calculatedDate: The date the score was calculated
28. groupImprovementNotation: increase \| decrease
29. description: Description of the group
30. group.stratifier: Stratification results
31. group.stratifier.stratum.population: Population results in this stratum
32. group.stratifier.stratum.measureScore: What score this stratum achieved

<!--End Generated Intro (DO NOT REMOVE)-->