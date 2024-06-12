{% assign id = {{include.id}} %}

We seek comment on which of the two methods below is appropriate, and when, based on your experience.
For the evaluateMeasure operation, you can manage what data to evaluate the measure in one of two ways:
1) Define the CQL rules to only look at a resource that has certain elements or elements of a certain value. This scenario puts the burden on the measure developer to add the specific needs into the CQL statements
2) Specify that a specific profile of a Resource should be used to calculate the measure. This would require the generator of the FHIR data to insure that a Resource meets the conditions of the profile
Most of the examples and profiles in the DEQM assume the first (1) approach above. However DEQM MedicationAdministration profile is created here to represent how measure requirements could be handled by profiling a resource, (2) above.
{:.stu-note}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A medication code that identifies the medication that was administered
1. The period of time during which the administration took place
