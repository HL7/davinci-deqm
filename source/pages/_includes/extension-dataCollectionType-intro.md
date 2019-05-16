
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[page.id].description}}
This extension corresponds to the [MeasureReportType](http://hl7.org/fhir/ValueSet/measure-report-type) code `data-collection` in the R4 version of MeasureReport.

**Context of Use**
{% for context in site.data.structuredefinitions.[page.id].contexts %} {{context.type}}{% endfor %}
