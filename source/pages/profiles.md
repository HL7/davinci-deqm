---
title: Profiles and Extension defined as part of this Guide
layout: default
active: profiles
---

   Payers and providers need common data specification, measure specification, report initiation, and transport to share the data required to reflect accurate quality measures. Existing QI-Core and HEDIS profiles are used as well as DEQM profiles derived from QI-Core and HEDIS profiles and defined in this guide. All of these profiles provide a common foundation for building, sharing, and evaluating knowledge artifacts across quality improvement efforts in the US Realm. This IG will leverage STU3 in order to take advantage of FHIR currently in production and R4 to better utilize the additional Resources and elements available in R4.  For elements added in R4, extensions have been created for the STU3 version.

Note to Balloters: US Core and QI Core profiles and the DEQM Profiles derived from them have
not yet been defined for FHIR Version R4.  We anticipate very few
structural changes in R4.  A future release of this guide will include
these profiles when available.
{: .note-to-balloters}

### Profiles

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Coverage|DEQM Coverage Profile|[DEQM Coverage (STU3)]|[DEQM Coverage (R4)]||
|DeviceRequest|DEQM DeviceRequest Profile|[DEQM DeviceRequest (STU3)]|[DEQM DeviceRequest (R4)]|
|DeviceUseStatement|DEQM DeviceUseStatement Profile|[DEQM DeviceUseStatement (STU3)]|[DEQM DeviceUseStatement (R4)]|
|Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Data Exchange MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|Individual MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|MedicationAdministration|DEQM MedicationAdministration Profile|[DEQM MedicationAdministration (STU3)]|[DEQM MedicationAdministration (R4)]|
|MedicationRequest|DEQM MedicationRequest Profile|[DEQM MedicationRequest (STU3)]|[DEQM MedicationRequest (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|

<br />

### Extensions

|Extension Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|
|DEQM Certification Identifier Extension|[Certification Identifier (STU3)]|[Certification Identifier (R4)]|
|DEQM Data Collection Type Extension|[Data Collection Type (STU3)]|N/A[^6]|
|DEQM Do Not Perform Extension|[Do Not Perform (STU3)]|[Do Not Perform (R4)]|
|DEQM Measure Report Extension|[Reference Any (STU3)]|N/A[^6]|
|DEQM Reporting Vendor Extension|[Reporting Vendor (STU3)]|[Reporting Vendor (R4)]|
|DEQM Subscription Extension|[Measure Subscription (STU3)]|[Measure Subscription (R4)]|

<br />

{% include link-list.md %}
