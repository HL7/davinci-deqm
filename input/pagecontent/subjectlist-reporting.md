
When using a MeasureReport resource to represent a subject-list, the MeasureReport SHALL have a type-code of "subject-list" and if a subject reference is present, it SHALL be a reference to a Group. In addition, the resource SHALL include for each population a reference to a List resource that references individual level MeasureReport resources for the same measure, one for each subject in the overall population.


{% include img.html img="clinicalreasoning-measure-report-patient-list.png" caption="Figure 2-19 DEQM MeasureReport Subject List" %}

In order to support real-world implementations (i.e. QPP) where:

-  External producers submit summary MeasureReport resources for multiple providers (TINs/NPIs) in a single bundle.

-  FHIR servers often act as facade layers over existing APIs (e.g., Measurement  /api/submissions/measurements) that perform individual POST/PUT operations atomically.

-  In scenarios where the FHIR layer interacts directly with the database, supporting true bundle-level atomicity (e.g., 500+ entries) often requires pessimistic locking of rows or tables, increasing the risk of contention and deadlocks.

All systems **SHALL** support one of "batch" or "transaction", and that the server **SHALL** declare its support in the capability statement for these Bundle transaction types.

For example, the initial population report, in addition to providing the count, provides a reference to a List resource that identifies each of the subjects that make up that population. For each of those subjects, the List will contain a reference to an individual-level report for that subject. Note that for very large populations, implementations MAY decide to limit the size of the result, either by returning an error indicating the request is too costly, or by returning a partial result, so long as there is an indication that the report is only a partial response. We are actively seeking feedback on how best to approach evaluation of quality measures on large populations, including the use of bulk data formats.

Implementations may return a MeasureReport with a status of pending, indicating that the evaluation is in progress. In this case, clients can request the MeasureReport resource until the status changes to complete.
