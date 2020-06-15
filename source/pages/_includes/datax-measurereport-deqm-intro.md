{% assign id = {{page.id}} %}
{{site.data.structuredefinitions.[id].description}}

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. Whether is a [snapshot] or [incremental] update*
1. A status
1. measure report type hardcoded to "data-collection"
1. The reference to the [Measure]({{site.data.fhir.path}}measure.html)
1. A link to patient the report is about
1. The date the report was generated
1. The organization that reported the data
1. The reporting period

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. References to other resources involved in producing the report
1. Specify the software systems used by the reporting system using the CQFM [Software System]({{site.data.fhir.cqfm}}StructureDefinition-cqfm-softwaresystem.html) Extension

**Additional Profile specific implementation guidance:**

- *For a detailed discussion of incremental and snapshot updates see these sections on [Submit Data](datx.html#submit_updates) and [Collect Data](datx.html#collect_updates)

- The Producer may not have all the data that is required to calculate the measure report at that time it is transmitted. It that case the MeasureReport may not have *any* evaluatedResources (in other words, no measure data).  The missing data may be transmitted in a subsequent update or the additional data used in the measure is owned by an aggregator (such as a continuous coverage period requirement).

- The `reporter` should be consistent with the [X-Provenance header data]({{site.data.fhir.path}}provenance.html#header) if present.

A data producer

### Examples

{% include datax-measurereports.md %}

{% include link-list.md %}
