<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} Must Have:**
1. measure: What measure and version was calculated
2. reporter: Organization that generated the MeasureReport
3. period.start: Starting time with inclusive boundary
4. status: complete \| pending \| error
5. type: individual \| subject-list \| summary \| data-collection
6. period.end: End time with inclusive boundary, if not ongoing
7. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
8. group: Measure results for each group
9. period: What period the report covers

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
12. subject: What individual(s) the report is for
13. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite \| attestation
14. calculatedDate: The date the score was calculated
15. alternateScoreType: Possible additional measureScore value types
16. description: Description of the group
17. countQuantity: Size of the population as a quantity.
18. group.stratifier: Stratification results
19. supplementalData: Optional Extensions Element
20. group.stratifier.stratum.value: The stratum value, e.g. male
21. group.stratifier.stratum.population: Population results in this stratum
22. group.stratifier.stratum.measureScore: What score this stratum achieved
23. group.code: Meaning of the group

<!--End Generated Intro (DO NOT REMOVE)-->
