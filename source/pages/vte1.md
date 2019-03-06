---
title: Venous Thromboembolism Prophylaxis Use Case
layout: default
active: guidance
topofpage: true
---

### Introduction

The VTE measure assesses the number of patients who received VTE prophylaxis or have documentation why no VTE prophylaxis was given the day of or the day after hospital admission or surgery end date for surgeries that start the day of or the day after hospital admission.

The example presented is based on the QDM version of [CMS 108v7], which has been represented using profiles derived from [QI Core].  Additional information regarding the measure specification can be found in the [Quality Measure Implementation Guide]

### Summary VTE1 Technical Workflow

The technical Workflow is outlined in the following figure.

    ...todo  WF figure and text ...

**Summary of FHIR Artifacts used for Venous Thromboembolism Prophylaxis Use Case**


### FHIR Resource Overview

#### Resources supported for this use case:
{:.no_toc}

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Condition|QI Core Condition Profile|[QI Core Condition (STU3)]|[QI Core Condition (R4)]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage (STU3)]|[QI Core Coverage (R4)]|
|DiagnosticReport|QI Core DiagnosticReport Profile|[QI Core DiagnosticReport (STU3)]|[QI Core DiagnosticReport (R4)]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter (STU3)]|[QI Core Encounter (R4)]|
|Library|CFQM Library Profile|[CFQM Library (STU3)]|[CFQM Library (R4)]|
|Location|QI Core Location7 Profile|[QI Core Location (STU3)]|[QI Core Location (R4)]|
|Measure|CFQM Measure Profile|[CFQM Measure (STU3)]|[CFQM Measure (R4)]|
|Data Exchange MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile (STU3)]|[DEQM Individual MeasureReport Profile (R4)]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Observation|QI Core Observation Profile|[QI Core Observation (STU3)]|[QI Core Observation (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
|Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
|Practitioner|DEQM Practitioner Profile|[DEQM Practitioner (STU3)]|[DEQM Practitioner (R4)]|
|Procedure|QI Core Procedure Profile|[QI Core Procedure (STU3)]|[QI Core Procedure (R4)]|

### Graph of VTE Resources:

This measure assesses the number of patients who received VTE prophylaxis or have documentation of why no VTE prophylaxis was given the day of or the day after hospital admission, or surgery end date for surgeries that start the day of or the day after hospital admission

Below is listed a resource diagram that meets a situation in the VTE measure.

#### Option 1: Measure Report Using MedicationAdministration
{:.no_toc}

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and is administered either Heparin, a Factor Xa Inhibitor, or Warfarin on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The medications that qualify for the measure are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has been administered one of these medications to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE1.jpg" %}

#### Option 2:Measure Report Using DeviceUseStatement/Encounter
{:.no_toc}

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and has a device to prevent VTE on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The devices that qualify for the measure are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has had one of these Devices applied to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE2.jpg" %}

#### Option 3: Measure Report Using Observation

When a patient has an inpatient encounter, is not either pregnant or currently diagnosed with a Venous Thromboembolism, and has been observed to have a low risk for VTE on the calendar day of admission or the day after, the process for VTE Prophylaxis has been met. The result codes that qualify as “low risk for VTE” are listed in the value sets of codes in the measure documentation. Below is the data structure for what would be included with a DEQM Individual MeasureReport when the patient has had this Observation made to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE3.jpg" %}

### VTE-1 FHIR Transactions:

#### Data Exchange Interactions
{:.no_toc}

   Note to Balloters: We are actively seeking feedback on whether VTE-1 Data Exchange interactions are appropriate or useful for hospital systems.
   {:.note-to-balloters}

#### VTE-1 Measure Reporting Interactions:
{:.no_toc}

1. Individual MeasureReport

   Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

      {  % include examplebutton.html example=col-indv-report-example" b_title = "Post Bundle with VTE-1 Individual MeasureReport" % }

1. Summary MeasureReport

   Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

      {  % include examplebutton.html example=col-summary-report-example" b_title = "Post VTE-1 Summary MeasureReport" % }

{% include link-list.md %}
