
{% for p in site.data.ig.definition.resource %}
  {% if p.exampleBoolean %}
      {% if types %}
        {% assign types =  types | append: "," | append: p.reference.reference | split: '/' | first %}
      {% else %}
       {% assign types = p.reference.reference | split: '/' | first %}
      {% endif %}
  {% endif %}
{% endfor %}

{% assign my_array = types | split: "," %}
{% assign my_array = my_array | sort | uniq %}

{% for i in my_array %}
<h3>{{ i }}</h3>
  <ul>
  {% for p in site.data.ig.definition.resource %}
      {% if p.exampleBoolean %}
        {% assign type =  p.reference.reference | split: '/' | first %}
            {% if type == i %}
            <li><a href="{{p.reference.reference | replace: '/','-'}}.html">{{p.name}}</a></li>
            {% endif %}
       {% endif %}
   {% endfor %}
  </ul>
{% endfor %}
