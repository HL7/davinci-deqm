
{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A status
1. A measure report type hardcoded to "summary"
1. The reference to the [Measure]
1. The date the report was generated
1. The organization that reported the data
1. The measurement period that the report covers
1. The results of the measure calculation for each group
1. The measure score calculated for each reported group

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):

1. Reference to the reporting program using the DEQM [Reporting Program Reference](StructureDefinition-extension-reportingProgramReference.html) Extension
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
1. Measure results for each group with separate subgroup calculations (stratifiers)
1. Ability to use other types for measure score using the DEQM [Alternate Score Type] Extension

**Additional Profile specific implementation guidance:**

{% include report-sd-imp-guidance.md %}

### Examples

{% include summary-measurereports.md %}

{% include link-list.md %}
