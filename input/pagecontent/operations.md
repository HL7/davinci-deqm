
The list of operations defined by this implementation guide.

### Operations

|Link to operations|
|---|
|[$care-gaps Operation](OperationDefinition-care-gaps.html)|

<div class="bg-success" markdown="1">
[$deqm.evaluate-measure](OperationDefinition-deqm.evaluate-measure.html)
</div><!-- new-content -->

<div class="note-to-balloters" markdown="1">
The [$submit-data](http://hl7.org/fhir/R4/measure-operation-submit-data.html) and [$collect-data](http://hl7.org/fhir/R4/measure-operation-collect-data.html) do not specify which MeasureReport profiles to use for the `measureReport` parameter. When used in this IG, $submit-data and $collect-data `measureReport` parameter shall conform to either [DEQM Individual MeasureReport](StructureDefinition-indv-measurereport-deqm.html) or [DEQM Summary MeasureReport](StructureDefinition-summary-measurereport-deqm.html).  
</div>

<br />

{% include link-list.md %}
