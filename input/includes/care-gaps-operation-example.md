
Request: 
     
     Request evaluation of the CMS130 measure (with measureId EXM130-7.3.000) over a gaps through period of the first 3 months of 2014, with open gaps, for patient 124.
~~~
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Patient/124
~~~
Request: 
     
     Request the first example with a topic of 57024-2.
     
     Request the first example with a topic of the code "treatment" in the valueset "definition-topic".
~~~
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Patient/124&topic=57024-2

GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Patient/124&topic=http://hl7.org/fhir/ValueSet/definition-topic|treatment
~~~
Request: 
     
     Request the first example with a subject of group 124.
~~~
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Group/124
~~~
Request: 
     
     Request evaluation with a status of open gap.
     
     Request evaluation with a status of closed gap.
     
     Request evaluation with a status of open or closed gap.
~~~
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&subject=Patient/124&status=open-gap
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&subject=Patient/124&status=closed-gap
GET [base]/Measure/$care-gaps?measureId=EXM130-7.3.000&periodStart=2014-01&periodEnd=2014-03&subject=Patient/124&status=open-gap&status=closed-gap
~~~
Request: 
     
     Request the first example with a measureIdentifier.
     
     Request the first example with a measureUrl.
~~~
GET [base]/Measure/$care-gaps?measureIdentifier=http://hl7.org/fhir/cqi/ecqm/Measure/Identifier/cms|130&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Patient/124
GET [base]/Measure/$care-gaps?measureUrl=http://hl7.org/fhir/us/cqfmeasures/Measure/EXM130|7.3.000&periodStart=2014-01&periodEnd=2014-03&status=open-gap&subject=Patient/124
~~~