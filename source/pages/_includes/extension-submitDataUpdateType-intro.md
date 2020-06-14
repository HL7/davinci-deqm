
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[page.id].description}}
This extension corresponds to the measureScore types in the R5 version of MeasureReport.

**Context of Use**
{% for context in site.data.structuredefinitions.[page.id].contexts %} {{context.type}}{% endfor %}
