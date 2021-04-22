
{% assign id = {{page.id}} %}

Conformance Requirement 1:
<br>
In addition to the required parameters, a caller of the $care-gaps operation SHALL provide subject|practitioner|organization, which could be one of the following:
  - A $care-gaps operation SHALL provide a subject; OR
  - A $care-gaps operation SHALL provide an organization; OR
  - A $care-gaps operation SHALL provide a practitioner and an organization

{% include link-list.md %}
