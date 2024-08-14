

## Introduction

The VTE-1 measure assesses the number of patients who received venous thromboembolism (VTE) prophylaxis or have documentation why no venous thromboembolism prophylaxis was given the day of or the day after hospital admission or surgery end date for surgeries that start the day of or the day after hospital admission. Note that the Individual Measure Reporting Interaction is the only interaction used for this measure.

The example presented is based on the QDM version of CMS108v7, which has been represented using profiles derived from [QI Core]. Measure specifications are available on the [ECQI Resource Center], [CMS0108v12]. Additional information regarding the measure specification can be found in the [Quality Measure Implementation Guide].

### FHIR Resource Overview

#### Resources supported for this Use Case
{:.no_toc}

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Condition|QI Core Condition Problems Health Concerns Profile|[QI Core Condition Problems Health Concerns]|
|Coverage|QI Core Coverage Profile|[QI Core Coverage]|
|DeviceRequest|QI Core DeviceRequest Profile|[QI Core DeviceRequest]|
|DeviceUseStatement|QI Core DeviceUseStatement Profile|[QI Core DeviceUseStatement]|
|Encounter|QI Core Encounter Profile|[QI Core Encounter]|
|Library|CRMI Sharable Library|[CRMI Sharable Library]|
|Location|QI Core Location Profile|[QI Core Location]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Individual MeasureReport Profile|[DEQM Individual MeasureReport Profile]|
|MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile]|
|MedicationRequest|Qi Core Medication Not Requested|[QICoreMedicationNotRequested]|
|Observation|QI Core Observation Profile|[QI Core Observation]|
|Organization|QI Core Organization Profile|[QI Core Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|
|Practitioner|QI Core Practitioner Profile|[QI Core Practitioner]|
|ServiceRequest|QI Core ServiceRequest Profile|[QI Core ServiceRequest]|

{: #practitioner-references}
### Graph of VTE-1 Resources

In this section we list resource graph diagrams for 7 clinical scenarios that meet the VTE-1 measure.  Note that overlapping boxes in the diagrams represents a choice of one the resources.

#### Option 1: Measure Report Using MedicationAdministration
{:.no_toc}

VTE-1 has been met when a patient:

1. has an inpatient encounter such as for a joint replacement procedure
2. is not pregnant or currently diagnosed with a venous thromboembolism
3. is administered either Heparin, a Factor Xa Inhibitor, or Warfarin on the calendar day of admission or the day after.

The medications that qualify for the measure are listed in the value sets of codes in the measure documentation. The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient has been administered one of these medications to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE1.jpg" caption = "Figure 3-14 MeasureReport Using MedicationAdministration and Condition" %}

#### Option 2: Measure Report Using DeviceUseStatement and Encounter
{:.no_toc}

VTE-1 has been met when a patient:

1. has an inpatient encounter such as for a joint replacement procedure
2. is not pregnant or currently diagnosed with a venous thromboembolism
3. has a device to prevent venous thromboembolism prophylaxis on the calendar day of admission or the day after.

The devices that qualify for the measure are listed in the value sets of codes in the measure documentation. The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient has had one of these Devices applied to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE2.jpg" caption = "Figure 3-15 MeasureReport Using DeviceUseStatement and Encounter" %}

#### Option 3: Measure Report Using Observation
{:.no_toc}

VTE-1 has been met when a patient:

1. has an inpatient encounter such as for a joint replacement procedure
2. is not pregnant or currently diagnosed with a venous thromboembolism
3. and has been assessed to have a low risk for venous thromboembolism prophylaxis typically through laboratory testing, on the calendar day of admission or the day after.

The result codes that qualify as “low risk for VTE” are listed in the value sets of codes in the measure documentation. The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient has had this Observation made to meet the measure.

{% include img.html img="DEQM Resource Diagram - VTE3.jpg" caption = "Figure 3-16 MeasureReport Using Observation" %}

#### Option 4: Measure Report Using Encounter
{:.no_toc}

When a patient has an inpatient encounter where the encounter is <2 days long, or when the encounter includes an ICU stay of 1 or more days, the patient can be can be *excluded* from the denominator of the measure. Codes for the ICU facility location will come from the HL7 ServiceDeliveryLocationRoleType valueset. The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient when the patient has these types of encounters.

{% include img.html img="DEQM Resource Diagram - VTE4.jpg" caption = "Figure 3-17 MeasureReport Using Encounter" %}

#### Option 5: Measure Report Using Encounter and Principal Diagnosis
{:.no_toc}

When a patient has an inpatient encounter and is principally diagnosed with either a mental health condition, or a stroke (either hemorrhagic or ischemic), they are *excluded* from the denominator of the measure. Codes for the diagnoses will come from the respective valuesets from the measure. The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient has had this Encounter with these principal diagnosis.

{% include img.html img="DEQM Resource Diagram - VTE5.jpg"  caption = "Figure 3-18 MeasureReport Using Encounter with Principal Diagnosis" %}

#### Option 6: Measure Report Using Procedure/ServiceRequest and Encounter
{:.no_toc}

When a patient has an inpatient encounter, during which they are provided Comfort Measures within 1 day of being admitted or 1 day of a surgical procedure for which they were admitted, these Comfort Measures are *excluded* from the denominator of the measure. for the measure. The surgical procedure is defined by the presence of a code from the “general or neuraxial anesthesia” value set present in the measure. The Comfort measures are represented by either a Procedure or a ServiceRequest with a code from the “Comfort Measures” value set present in the measure.  The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport when the patient has had intervention comfort measures.

{% include img.html img="DEQM Resource Diagram - VTE6.jpg" caption = "Figure 3-19 MeasureReport Using Procedure/ServiceRequest and Encounter" %}

#### Option 7: Measure Report Using MedicationRequest, DeviceRequest, MedicationStatement or DeviceUseStatement
{:.no_toc}

When a patient has an inpatient encounter, during which they should be given venous thromboembolism prophylaxis, but they are not given said prophylaxis, the patient’s record must document a reason the medication/device was not provided. This reason must be coded, and must come from either the “medical reason” or “patient refusal” value sets, as stated in the measure logic. If these criteria are met, the patient will have been found to satisfy the requirements of the measure.  The following resource graph diagram shows what would be included with a DEQM Individual MeasureReport to meet the measure when the venous thromboembolism prophylaxis was not done, for example because of patient refusal.

{% include img.html img="DEQM Resource Diagram - VTE7.jpg" caption = "Figure 3-20 MeasureReport Using MedicationRequest, DeviceRequest, MedicationStatement or DeviceUseStatement" %}

<!--
### VTE-1 Data Exchange Interactions

   Note to Balloters: We are actively seeking feedback on whether VTE-1 Data Exchange interactions are appropriate or useful for hospital systems.
   {:.note-to-balloters}
-->

### VTE-1 Measure Reporting Interactions

#### Individual MeasureReport
{:.no_toc}

Reporter pushes the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

{% include img-portrait.html img="vte_indv_report.jpg" caption = "Figure 3-21 Individual Reporting Technical Workflow" %}

{% include examplebutton.html example="vte-indv-report-example" b_title = "Click Here To See Post Bundle with VTE-1 Individual MeasureReport" %}

<!-- {%raw%}

#### Summary MeasureReport
{:.no_toc}

Note to Balloters: The Summary MeasureReport is not currently used for program level reporting.  We are actively seeking input on potential uses for the summary report for VTE-1 or other measures.
{:.note-to-balloters}

Reporter posts the VTE-1 Summary MeasureReport to the Receiver.

Note to Balloters: We are actively seeking input on whether a technical workflow diagram would be of value for this use case
{:.note-to-balloters}


{% include examplebutton.html example="vte-summary-report-example" b_title = "Click Here To See Post VTE-1 Summary MeasureReport" %}

{%endraw%} -->
___

{% include link-list.md %}
