---
title: Profiles defined as part of this Guide
layout: default
active: profiles
r4: http://build.fhir.org/
r3: http://hl7.org/fhir/STU3/
qi_r4: todo.html
qi_r3: http://build.fhir.org/ig/cqframework/qi-core/
deqm_r4: todo.html
deqm_r3: ''
hedis_r4: todo.html
hedis_r3: http://build.fhir.org/ig/cqframework/hedis-ig/
---
### Profiles

   Payers and providers need common transport tools to share the data required to reflect complete and accurate quality measures. Existing QI-Core and HEDIS profiles are used as well as DEQM profiles defined in this guide and which are derived from them. All of these profiles provide a common foundation for building, sharing, and evaluating knowledge artifacts across quality improvement efforts in the US Realm. This IG will leverage STU3 in order to take advantage of FHIR currently in production and R4 to better utilize the additional Resources and elements available in R4.  For elements added in R4, extensions have been created for the STU3 version.

      US Core and QI Core profiles and the DEQM Profiles derived from them have
       not yet been defined for FHIR Version R4.  We anticipate very few
       structural changes in R4.  A future release of this guide will include
       these profiles when available.

#### Profiles Listed By Use Case
{:.no_toc}

##### Common to All Quality Measures Implementation Use Cases
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|

##### MRP
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Observation|HEDIS MRP Observation Profile|[HEDIS MRP Observation (STU3)]|[HEDIS MRP Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Task|HEDIS MRP Task Profile|[HEDIS MRP Task (STU3)]|[HEDIS MRP Task (R4)]|

#### Profiles Defined in this Implementation Guide
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]||
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|

<br />

### Extensions

### *STU3* Extensions defined for this implementation guide:
{:.no_toc}

|Extension Name|Context|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Reference Any|DEQM Measure Report Profile|[Reference Any (STU3)]|N/A[^1]|
|Measure Subscription|DEQM Subscription Profile|[Measure Subscription (STU3)]|[Measure Subscription (R4)]|

<br />

[^1]: A Measure element in R4

{% include link-list.md %}
