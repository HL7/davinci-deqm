
{% assign id = {{page.id}} %}
source file: source/pages/\_includes/{{id}}-intro.md

{{site.data.structuredefinitions.[page.id].description}}

**Context of Use**
{% for context in site.data.structuredefinitions.[page.id].contexts %} {{context.type}}{% endfor %}
