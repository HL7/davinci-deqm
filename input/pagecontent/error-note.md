{% if  "Submit Data,Collect Data,Data Collection" contains include.transaction %}
{% assign op = true %}
{% else %}
{% assign op = false %}
{% endif %}


Standard error responses to the {{include.transaction}} {% if op %}operation{% else %}FHIR RESTful{% endif %} transactions including appropriate http response codes are documented in the {% if op %}[FHIR specification for operation behavior]{% else %}[FHIR specification for RESTful API]{% endif %}.



[FHIR specification for operation behavior]: {{site.data.fhir.path}}operations.html#response
[FHIR specification for RESTful API]: {{site.data.fhir.path}}http.html
