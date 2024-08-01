
<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each MeasureReport Must Have:**
1. status: complete \| pending \| error
2. type: individual \| subject-list \| summary \| data-collection
3. measure: What measure was calculated
4. date: When the report was generated. Note: The language in R5 was changed to calculated.  We are clarifying that intent.
5. reporter: Organization that generated the MeasureReport
6. period: What period the report covers
7. period.start: Starting time with inclusive boundary
8. period.end: End time with inclusive boundary, if not ongoing
9. group: Measure results for each group
10. group.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
11. group.stratifier.code: What stratifier of the group
12. group.stratifier.stratum.population.code: initial-population \| numerator \| numerator-exclusion \| denominator \| denominator-exclusion \| denominator-exception \| measure-population \| measure-population-exclusion \| measure-observation
13. group.stratifier.stratum.population.count: Size of the population

**Each MeasureReport Must Support:**
1. reportingProgram: Reporting program
2. inputParameters: What parameters
3. supplementalData: Supplemental Data
4. criteriaReference: Criteria reference
5. description: Description of the supplemental data
6. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
7. vendor: Vendor information
8. cehrt: CMS EHR Certifciation ID
9. software: Extension
10. message: Evaluation messages
11. group: Group of practitioners responsible for a report
12. improvementNotation: increase \| decrease
13. group.id: Unique id for inter-element referencing
14. scoring: proportion \| ratio \| continuous-variable \| cohort \| composite
15. calculatedDate: The date the score was calculated
16. groupImprovementNotation: increase \| decrease
17. description: Description of the group
18. group.code: Meaning of the group
19. group.population: The populations in the group
20. countQuantity: Count as a Quantity
21. description: Description of the population
22. group.population.count: Size of the population
23. group.measureScore: What score this group achieved
24. altscoretype: Possible additional measureScore value types
25. group.stratifier: Stratification results
26. description: Description of the stratifier
27. group.stratifier.stratum: Stratum results, one for each unique value, or set of values, in the stratifier, or stratifier components
28. group.stratifier.stratum.value: The stratum value, e.g. male
29. group.stratifier.stratum.population: Population results in this stratum
30. group.stratifier.stratum.measureScore: What score this stratum achieved
31. strataltscoretype: Possible additional measureScore value types

<!--End Generated Intro (DO NOT REMOVE)-->
{% assign id = {{include.id}} %}

**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
