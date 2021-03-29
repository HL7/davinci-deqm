
Request: Request evaluation of the CMS130 measure (with measureId EXM130-7.3.000) for patient 124 over a measurement period of the first 3 months of 2014.
~~~
GET [base]/Measure/measure-EXM130-7.3.000/$care-gaps?subject=Patient/124&periodStart=2014-01&periodend=2014-03
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Patient/124&periodStart=2014-01&periodend=2014-03
~~~
Request: Request the initial evaluation with a topic of 57024-2.
Request the initial evaluation with the code treatment in the valueset definition-topic.
~~~
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Patient/124&periodStart=2014-01&periodend=2014-03&topic=57024-2
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Patient/124&periodStart=2014-01&periodend=2014-03&topic=http://hl7.org/fhir/ValueSet/definition-topic|treatment
~~~
Request: Request the initial evaluation with a subject of group 124.
~~~
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Group/124&periodStart=2014-01&periodend=2014-03
~~~
Request: Request the initial evaluation with a status of open gap.
Request the initial evaluation with a status of closed gap.
~~~
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Patient/124&periodStart=2014-01&periodend=2014-03&status=open-gap
GET [base]/Measure/$care-gaps?measureId=measure-EXM130-7.3.000&subject=Patient/124&periodStart=2014-01&periodend=2014-03&status=closed-gap
~~~
Request: Request the initial evaluation with a measureIdentifier.
Request the initial evaluation with a measureUrl.
~~~
GET [base]/Measure/$care-gaps?measureIdentifier=CMS130&subject=Patient/124&periodStart=2014-01&periodend=2014-03
GET [base]/Measure/$care-gaps?measureUrl=http://hl7.org/fhir/us/cqfmeasures/Measure/EXM130&subject=Patient/124&periodStart=2014-01&periodend=2014-03
~~~