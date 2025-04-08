# DaVinci Data Exchange For Quality Measures


## [STU4 Published Version](http://hl7.org/fhir/us/davinci-deqm/STU4)

## [Current build (FHIR Version R4)](https://build.fhir.org/ig/HL7/davinci-deqm/)

Primary Author:  Eric Haas

This Implementation Guide was made possible by the thoughtful contributions of the following people and organizations:

The twenty-two founding Da Vinci Project member organizations.

Bryn Rhodes, Dynamic Content Group
Floyd Eisenberg, iParsimony LLC
Jocelyn Keegan, Point of Care Partners
Linda Michaelsen, Optum
Lloyd Mckenzie, Gevity
Robert Dieterle, EnableCare
Robert Samples, ESAC
Viet Nguyen, Stratametrics
Yan Heras, Optimum eHealth LLC

-----

GitHub will automatically trigger a new build whenever you commit changes.
(To manually trigger a build, just `POST` to the Webhook URL yourself, for example via:
`curl -X POST "https://2rxzc1u4ji.execute-api.us-east-1.amazonaws.com/prod/publish?HL7/deqm"`)

*Note: a build takes 2-3 minutes to complete. Then you can...*

### Find your rendered IG automatically available at

http://build.fhir.org/ig/HL7/davinci-deqm

### For a build log see

http://build.fhir.org/ig/HL7/davinci-deqm/build.log

---


## Local Build

To initially build locally, clone the repository and run the following commands in order below in the root command:

  1. **_updatePublisher[.bat | .sh]** - <i>Process retrieves the current version of the IG publisher and stores it within the input-cache folder. The IG publisher is updated on a regular basis but this process does not have to be executed for every instance of the publication process.</i>

  2. **_genonce[.bat | .sh]** - <i>This initiates the publication process. Launching the .bat file (Windows) or .sh file (Unix/Mac) will launch HL7's IGPublisher program and build/publish the IG one time.</i>

For more information on using the FHIR Implementation Guide publisher, see:

https://confluence.hl7.org/spaces/FHIR/pages/35718627/IG+Publisher+Documentation

