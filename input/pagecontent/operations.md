
The list of operations defined by this implementation guide.

### Operations

|Link to operations|
|---|
|$care-gaps operation|[$care-gaps](OperationDefinition-care-gaps.html)|
|$deqm.collect-data operation|[$deqm.collect-data](OperationDefinition-deqm.collect-data.html)|
|$bulk-submit-data operation|[$bulk-submit-data](OperationDefinition-bulk-submit-data.html)|
|$evaluate operation|[$evaluate](OperationDefinition-evaluate.html)

The [$submit-data](http://hl7.org/fhir/R4/measure-operation-submit-data.html) and [$collect-data](http://hl7.org/fhir/R4/measure-operation-collect-data.html) do not specify which MeasureReport profiles to use for the `measureReport` parameter. When used in this IG, $submit-data and $collect-data `measureReport` parameter shall conform to [DEQM Data Exchange MeasureReport](StructureDefinition-datax-measurereport-deqm.html).

<br />

{% include link-list.md %}
