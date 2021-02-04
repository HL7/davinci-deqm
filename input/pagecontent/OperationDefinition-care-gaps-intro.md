
{% assign id = {{page.id}} %}

Conformance Requirement 1:
<br>
A caller of the $care-gaps operation SHALL provide at least periodStart, periodEnd, and subject|practitioner|organization, which could be one of the following:
  - A $care-gaps operation SHALL provide periodStart, periodEnd, and a subject; OR
  - A $care-gaps operation SHALL provide periodStart, periodEnd, and an organization; OR
  - A $care-gaps operation SHALL provide periodStart, periodEnd, and a practitioner and an organization

{% include link-list.md %}
