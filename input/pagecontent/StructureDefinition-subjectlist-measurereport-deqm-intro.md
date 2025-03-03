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
7. group: Measure results for each group
8. period.start: Starting time with inclusive boundary
9. period.end: End time with inclusive boundary, if not ongoing
10. group.stratifier.stratum.component.code: What stratifier component of the group
11. group.stratifier.stratum.component.value: The stratum component value, e.g. male

**Each {{site.data.structuredefinitions.[id].type}} Must Support:**
1. measurereport-category: What category is this measure report
2. supplementalData: Supplemental Data
3. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
4. subject: What individual(s) the report is for
5. improvementNotation: increase \| decrease
6. group: Measure results for each group
7. group.id: Unique id for inter-element referencing
8. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
9. calculatedDate: The date the score was calculated
10. groupImprovementNotation: increase \| decrease
11. description: Description of the group
12. numeratorMembership: Provides the number of subjects in the numerator population membership.
13. denominatorMembership: Provides the number of subjects in the denominator population membership.
14. measurePopulationMembership: Provides the number of subjects in the measure population membership.
15. group.code: Meaning of the group
16. group.population: The populations in the group
17. countQuantity: Count as a Quantity
18. description: Description of the population
19. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
20. group.population.count: Size of the population
21. group.population.subjectResults: For subject-list reports, the subject results in this population
22. altscoretype: Possible additional measureScore value types
23. group.stratifier: Stratification results
24. description: Description of the stratifier
25. group.stratifier.code: What stratifier of the group
26. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
27. group.stratifier.stratum.value: The stratum value, e.g. male
28. group.stratifier.stratum.population: Population results in this stratum
29. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
30. group.stratifier.stratum.population.count: Size of the population
31. group.stratifier.stratum.population.subjectResults: For subject-list reports, the subject results in this population
32. group.stratifier.stratum.measureScore: What score this stratum achieved
33. strataltscoretype: Possible additional measureScore value types

<!--End Generated Intro (DO NOT REMOVE)-->