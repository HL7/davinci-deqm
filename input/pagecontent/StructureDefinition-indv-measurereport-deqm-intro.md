{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A measure report type hardcoded to "individual"
1. The reference to the [Measure]
1. A patient the report is for
1. The date the report was generated
1. The organization that reported the data
1. The period for which the report was generated. For the Gaps in Care use case, this is referred to as the gaps through period.


Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. Reference to the reporting program using the DEQM [Reporting Program](StructureDefinition-extension-reportingProgram.html) Extension
1. Reference to the supplemental data using the DEQM [Supplemental Data](StructureDefinition-extension-supplementalData.html) Extension
1. The scoring type defined by the referenced Measure using the DEQM [Measure Scoring] Extension
1. Reference to a reporting vendor using the DEQM [Reporting Vendor] Extension
1. A certification identifier using the DEQM [Certification Identifier] Extension
1. Specify the software systems used by the reporting system using the CQFM [Software System]({{site.data.fhir.cqfm}}StructureDefinition-cqfm-softwaresystem.html) Extension
1. Indicate whether improvement in the measure is noted by an increase or decrease in the measure score
1. The scoring type for the reported group using the DEQM [Measure Scoring] Extension
1. Indicate whether improvement in the reported group is noted by an increase or decrease in the measure score
1. A code that defines the meaning of the reported group
1. The populations in the reported group
1. References to the resources that were used to calculate the report

**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include indv-measurereports.md %}

{% include link-list.md %}
