
{% assign id = {{page.id}} %}


{{site.data.structuredefinitions.[page.id].description}}

**Context of Use**
{% for context in site.data.structuredefinitions.[page.id].contexts %} {{context.type}}{% endfor %}
