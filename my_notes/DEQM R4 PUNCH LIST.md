R4 publish punch list:

- [ ] fix publishing issues
  - [X] add heading to Notes in ig.base
  - [ ] default to diff View
  - [X] hide example tab
  - [ ] add copy button
  - [X] down load and external reference icons
  - [ ] ***fix Section  numbering ****
  - [X] create snapshot for current build
  - [X] update master with latest changes
- [ ] fix remaining QA Issues
- [X] update ig.json pages - add terminology
- [ ] update and fix dependency links (note deprecate using the definitions.csv)
- [X] update bundle examples to include new Extensions
- [X] update capstatements to include new extension Requirements and
extensions for capabilitystatement.
- [ ] remove text highlights
- [X] convert to templates
- [ ] update inline examples for required MR extension
- [X] and fix link in notes
- [ ] add page variables to template so they inherit in notes and intros
   - [ ] {% assign id = {{page.id}} %}
   - [X] remove redundant refs to description
- [X] pre-apply trackers FHIR-27862 and FHIR-27818
- [X] remove redundant code in profiles (use layouts)
- [X] remove redundant extension introductions
- [ ] update version
- [ ] create package-list.json


Issues:
1.  Capabilitystatement Errors due to context rules on extensions `http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation` - this causes dozens of errors here and 100s on US Core.  How to resolve this?

ZULIP LINK: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/new.20validation.20error.20on.20extensions

~~~
CapabilityStatement/reporter-client: CapabilityStatement.rest[0].resource[0]	error	The extension http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation is not allowed to be used at this point (allowed = e:CapabilityStatement.rest.resource.interaction, e:CapabilityStatement.rest.resource.searchParam, e:CapabilityStatement.rest.searchParam, e:CapabilityStatement.rest.operation, e:CapabilityStatement.document, e:CapabilityStatement.rest.interaction, e:CapabilityStatement.rest.resource.searchInclude, e:CapabilityStatement.rest.resource.searchRevInclude; this element is [[CapabilityStatement.rest.resource, BackboneElement.resource, BackboneElement])
~~~

1. the "|" syntax for canonicals is causing an error. within the text narrative.

ZULIP LINK:  https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/validation.20errors.20when.20using.20'.7Cn.2En.2En'.20for.20canonical.20url

~~~
CapabilityStatement/reporter-client: CapabilityStatement.rest[0].resource[0]	error	The extension http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation is not allowed to be used at this point (allowed = e:CapabilityStatement.rest.resource.interaction, e:CapabilityStatement.rest.resource.searchParam, e:CapabilityStatement.rest.searchParam, e:CapabilityStatement.rest.operation, e:CapabilityStatement.document, e:CapabilityStatement.rest.interaction, e:CapabilityStatement.rest.resource.searchInclude, e:CapabilityStatement.rest.resource.searchRevInclude; this element is [[CapabilityStatement.rest.resource, BackboneElement.resource, BackboneElement])
~~~

1.  The new undocumented validation rules for MR that failed to recognise the data exchange use case.

ZULIP LINK: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/spurious.20MR.20error

~~~
MeasureReport/datax-measurereport01: MeasureReport (l1/c2)	error	The MeasureReport does not include a group for the group MRP Group
~~~

1.  The new undocumented validation rules for MR that failed to recognise the possibility for and extension on the measure score.

ZULIP LINK: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/MR.20error.20for.20MeasureScore.20despite.20extension

~~~
Path	Severity	Message
MeasureReport/date-of-last-power-outage: MeasureReport (l1/c2)	Process Info	Validate resource against profile http://hl7.org/fhir/StructureDefinition/MeasureReport
MeasureReport/date-of-last-power-outage: MeasureReport.group[0].measureScore (l62/c31)	error	A value is required when the Measure.scoring={0}
~~~


1. StructureDefinition-medicationrequest-deqm.xml  can the VTE folks provide an example using it?

~~~
StructureDefinition.where(url = 'http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/medicationrequest-deqm')	warning	The Implementation Guide contains no examples for this profile
~~~

1. Cannot get the dependencies to QI Core v4.0.0 to work;

ZULIP CHAT: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/dependency.20issue.20to.20Quality.20IGs

1. CQFM url links are bad - assuming these will go away when it is published.


1. Jira Issue key Resolution Summary Reporter
1. FHIR-26303 Persuasive error	URL value 'http://hl7.org/fhir/us/core/ValueSet/us-core-problem' does not resolve ehaas
   follow up with publishing
1. FHIR-25719 Persuasive with Modification Need more example use cases patricia-craig
   resolved to be part of companion docs still open until that is complete
1. **FHIR-25617 Persuasive Update VTE example to use QI-Core 2019 version mnievera
   Through QA resolution should be fixed but need to review**
1. FHIR-25546  Several conformance-relevant links are broken javier_espina
   Outstanding QA issues
1. FHIR-22761 Persuasive Support PI and IA measure reporting bryn.rhodes
   resolved to be  part of companion docs and still open until that is complete.
   created FHIR-27930 for QM IG to create and example Measure
1. **FHIR-18720 Persuasive Add standard error repsonses to description of submit-data operation beyond standard FHIR operation behavior - DeQM #75 richard.ettema
   todo Need to document to use the standard error responses**
1. FHIR-18672 Persuasive with Modification Show CMS eCQM - DeQM #51 kpsethi
   resolved to be  part of companion docs and still open until that is complete.

Plus a QA Read through of the IG including fixing the section numbering.
