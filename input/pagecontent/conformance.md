### Conformance Index

This table provides an index of all conformance statements that are included in the narrative of the Implementation Guide.

Each statement carries an identifier of the form `<area>-<nn>`, where `<area>` groups the requirement by the part of the framework it governs. The areas correspond to the framework topics described in [How to read this Guide](index.html#how-to-read-this-guide):

|Area|Identifier|Scope|Primary actors|
|---|---|---|---|
|General|`gen-nn`|Cross-cutting requirements that apply to more than one scenario: measure report structure, bundle organization, duplicate data, contained resources, Must Support, and bundle transaction support. See [General Guidance](guidance.html).|All|
|Data Exchange|`dx-nn`|Requirements for exchanging the [data of interest](#data-of-interest) through the Submit Data and Collect Data scenarios, including snapshot and incremental update behavior. See [Data Exchange](datax.html).|[Producer](#producer), [Consumer](#consumer)|
|Reporting|`rpt-nn`|Requirements for communicating measure results through the Individual, Summary, and Subject List reporting scenarios. See [Individual Reporting](indv-reporting.html), [Summary Reporting](summary-reporting.html), and [Subject List Reporting](subjectlist-reporting.html).|[Reporter](#reporter), [Receiver](#receiver)|
|Gaps in Care|`gic-nn`|Requirements for the `$care-gaps` operation and the structure of the Gaps in Care Report. See [Gaps in Care Reporting](gaps-in-care-reporting.html).|[Client](#client), [Server](#server)|
{: .grid}

Identifiers are stable within an area and are not reused. A requirement that applies to more than one scenario is stated once in the General area and referenced from the scenario topics rather than being restated.

§§§