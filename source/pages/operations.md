---
title: OperationDefinitions defined for this Guide
layout: default
active: operations
---

These OperatioDefinitions have been defined for this implementation guide.

<!--
~~~
Bryn Rhodes: Measure/measure-mrp/$submit-data on the processing system, and passing a Bundle, yes, and it would be the same Bundle that you would get if you invoked Measure/measure-mrp/$collect-data on the provider system.

Lloyd McKenzie: @Bryn Rhodes, the question is "how does a payor expose through its conformance statement its expectations on data included in the Bundle - because my preseumption is that there will be a degree of variation between payers - at least for some measures.

Bryn Rhodes: The way that happens with Measures now is through the $data-requirements operation for a Measure.

Bryn Rhodes: So you'd have a profile for each resource, and then the data requirements would specify that profile. Those resource-specific profiles are derived from US-Core, though, right?

Lloyd McKenzie: You're referring to a number of operations in the present tense that I don't actually see in the spec...

Bryn Rhodes: $collect-data isn't defined yet (there's an approved tracker I need to apply) but it looks the same as $evaluate-measure. And $data-requirements is there, it's just on Measure, not MeasureReport.

Bryn Rhodes: $submit-data is then just the other direction of $collect-data
~~~
-->

{% include list-simple-operationdefinitions.xhtml %}
---
