---
title: Venous Thromboembolism Prophylaxis Use Case
layout: default
active: guidance
topofpage: true
---

## Introduction

The VTE measure assesses the number of patients who received VTE prophylaxis or have documentation why no VTE prophylaxis was given the day of or the day after hospital admission or surgery end date for surgeries that start the day of or the day after hospital admission.

The example presented is based on the QDM version of [CMS 108v7], which has been represented using profiles derived from [QI Core].  Additional information regarding the measure specification can be found in the [Quality Measure Implementation Guide]

## FHIR Resource Overview

### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition (STU3)]|[QI Core Condition (R4)]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|DeviceRequest|DEQM DeviceRequest Profile|[DEQM DeviceRequest (STU3)]|[DEQM DeviceRequest (R4)]|
|DeviceUseStatement|DEQM DeviceUseStatement Profile|[DEQM DeviceUseStatement (STU3)]|[DEQM DeviceUseStatement (R4)]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport (STU3)]|[QI Core DiagnosticReport (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Library|CFQM Library Profile|[CFQM Library (STU3)]|[CFQM Library (R4)]|
|Location|QI Core Location Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Measure|CFQM Measure Profile|[CFQM Measure (STU3)]|[CFQM Measure (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|MedicationAdministration|DEQM MedicationAdministration Profile|[DEQM MedicationAdministration (STU3)]|[DEQM MedicationAdministration (R4)]|
|MedicationRequest|DEQM MedicationRequest Profile|[DEQM MedicationRequest (STU3)]|[DEQM MedicationRequest (R4)]|
|Observation|QI Core Observation Profile|[QI Core Observation (STU3)]|[QI Core Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure (STU3)]|[QI Core Procedure (R4)]|
|ProcedureRequest|QI Core ProcedureRequest Profile|[QI Core ProcedureRequest (STU3)]|[QI Core ProcedureRequest (R4)]|


## Graph of VTE Resources:

This measure assesses the number of patients who received VTE prophylaxis or have documentation of why no VTE prophylaxis was given the day of or the day after hospital admission, or surgery end date for surgeries that start the day of or the day after hospital admission

Below is listed a resource diagram that meets a situation in the VTE measure.

### Option 1: Measure Report Using MedicationAdministration
{:.no_toc}

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and is administered either Heparin, a Factor Xa Inhibitor, or Warfarin on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The medications that qualify for the measure are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has been administered one of these medications to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE1.jpg" caption = "Figure 3-14" %}

### Option 2:Measure Report Using DeviceUseStatement/Encounter
{:.no_toc}

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and has a device to prevent VTE on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The devices that qualify for the measure are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has had one of these Devices applied to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE2.jpg" caption = "Figure 3-15" %}

### Option 3: Measure Report Using Observation
{:.no_toc}

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and has been observed to have a low risk for VTE on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The result codes that qualify as “low risk for VTE” are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has had this Observation made to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE3.jpg" caption = "Figure 3-16" %}

### Option 4: Measure Report Using Encounter
{:.no_toc}

When a patient has an inpatient encounter where the encounter is <2 days long, or when the encounter is includes an ICU stay of 1 or more days, the patient can be excluded from the measure for the qualifying encounter. Codes for the ICU facility location will come from the HL7 ServiceDeliveryLocationRoleType valueset.

{% include img.html img="DEQM Resource Diagram - VTE4.jpg" caption = "Figure 3-17" %}

### Option 5: Measure Report Using Encounter
{:.no_toc}

When a patient has an inpatient encounter and is principally diagnosed with either a mental health condition, or a stroke (either hemorrhagic or ischemic), they are excluded from the numerator of the measure. Codes for the diagnoses will come from the respective valuesets from the measure.

{% include img.html img="DEQM Resource Diagram - VTE5.jpg"  caption = "Figure 3-18" %}

### Option 6: Measure Report Using Procedure/Request and Encounter
{:.no_toc}

When a patient has an inpatient encounter, during which they are provided Comfort Measures within 1 day of being admitted or 1 day of a surgical procedure for which they were admitted, these Comfort Measures satisfy the numerator logic for the measure. The surgical procedure is defined by the presence of a code from the “general or neuraxial anesthesia” value set present in the measure. The Comfort measures are represented by either a Procedure or a ProcedureRequest with a code from the “Comfort Measures” value set present in the measure.

{% include img.html img="DEQM Resource Diagram - VTE6.jpg" caption = "Figure 3-19" %}

### Option 7: MeasureReport using MedicationRequest, DeviceRequest, MedicationStatement, or DeviceUseStatement
{:.no_toc}

When a patient has an inpatient encounter, during which they should be given VTE prophylaxis, but they are not given said prophylaxis, the patient’s record must document a reason the medication/device was not provided. This reason must be coded, and must come from either the “medical reason” or “patient refusal” value sets, as stated in the measure logic. If these criteria are met, the patient will have been found to satisfy the requirements of the measure.

{% include img.html img="DEQM Resource Diagram - VTE7.jpg" caption = "Figure 3-20" %}

## VTE-1 Data Exchange Interactions

   Note to Balloters: We are actively seeking feedback on whether VTE-1 Data Exchange interactions are appropriate or useful for hospital systems.
   {:.note-to-balloters}

## VTE-1 Measure Reporting Interactions:

### Individual MeasureReport
{:.no_toc}

Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

Note to Balloters: We are actively seeking input on whether a technical workflow diagram  would be of value for this use case
{:.note-to-balloters}

{% include examplebutton.html example="vte-indv-report-example" b_title = "Click Here To See Post Bundle with VTE-1 Individual MeasureReport" %}

### Summary MeasureReport
{:.no_toc}

Note to Balloters: The Summary MeasureReport is not currently used for program level reporting.  We are actively seeking input on potential uses for the summary report for VTE or other measures.
{:.note-to-balloters}

Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

Note to Balloters: We are actively seeking input on whether a technical workflow diagram would be of value for this use case
{:.note-to-balloters}


{% include examplebutton.html example="vte-summary-report-example" b_title = "Click Here To See Post VTE-1 Summary MeasureReport" %}

___

{% include link-list.md %}
