<!--Begin Generated Intro Tag (DO NOT REMOVE)-->
### Mandatory Data Elements and Terminology
The following data-elements are mandatory (i.e data MUST be present).

**Each MeasureReport Must Have:**
1. extension: Extension
2. MeasureReport.updatetype: Optional Extensions Element
3. status: complete \| pending \| error
4. type: individual \| subject-list \| summary \| data-collection
5. measure: What measure was calculated
6. subject: What individual(s) the report is for
7. date: When the report was generated
8. reporter: The organization where the measure was completed
9. period: What period the report covers
10. period.start: Starting time with inclusive boundary
11. period.end: End time with inclusive boundary, if not ongoing
12. group.stratifier.stratum.component.code: What stratifier component of the group
13. group.stratifier.stratum.component.value: The stratum component value, e.g. male

**Each MeasureReport Must Support:**
1. MeasureReport.software: Extension
2. MeasureReport.vendor: Vendor information
3. MeasureReport.message: Messages encountered while creating the report
4. MeasureReport.inputParameters: What parameters
5. MeasureReport.reporter.group: Group of practitioners responsible for a report
6. MeasureReport.group.population.description: Description of the population
7. evaluatedResource: What data was used to calculate the measure score

<!--End Generated Intro (DO NOT REMOVE)-->

{% assign id = {{include.id}} %}

**Additional Profile specific implementation guidance:**

- *For a detailed discussion of incremental and snapshot updates see these sections on [Submit Data](datax.html#submit-updates) and [Collect Data](datax.html#collect-updates)

- The Producer may not have all the data that is required to calculate the measure report at that time it is transmitted. It that case the MeasureReport may not have *any* evaluatedResources (in other words, no measure data).  The missing data may be transmitted in a subsequent update or the additional data used in the measure is owned by an aggregator (such as a continuous coverage period requirement).

- The `reporter` should be consistent with the [X-Provenance header data]({{site.data.fhir.path}}provenance.html#header) if present.

A data producer

### Examples

{% include datax-measurereports.md %}

{% include link-list.md %}
