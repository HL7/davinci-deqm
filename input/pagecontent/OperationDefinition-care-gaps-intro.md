
{% assign id = {{page.id}} %}

Conformance Requirement 1:
<br>
A caller of the $care-gaps operation SHALL provide at least periodStart, periodEnd, status, and subject|practitioner|organization, which could be one of the following:
  - A $care-gaps operation SHALL provide periodStart, periodEnd, status, and a subject; OR
  - A $care-gaps operation SHALL provide periodStart, periodEnd, status, and an organization; OR
  - A $care-gaps operation SHALL provide periodStart, periodEnd, status, and a practitioner and an organization

{% include link-list.md %}
