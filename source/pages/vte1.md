---
title: Venous Thromboembolism Prophylaxis Use Case
layout: default
active: guidance
topofpage: true
---

### Introduction

The VTE measure assesses the number of patients who received VTE prophylaxis or have documentation why no VTE prophylaxis was given the day of or the day after hospital admission or surgery end date for surgeries that start the day of or the day after hospital admission.

The example presented is based on the QDM version of [CMS 108v7], which has been represented using profiles derived from [QI Core].  Additional information regarding the measure specification can be found in the [Quality Measure Implementation Guide]

### FHIR Resource Overview

Resources supported for this use case: ...ToDo...

Graph of VTE Resources: …ToDo…

### VTE Measure Transactions: ToDo

In this optional step, the Provider queries the Payer(“Aggregator”) for which resources are needed for VTE measure reporting. Note that instead of using this API, the measure definition can be reviewed manually to determine what data needs to be submitted.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

The required data for COL is discovered by invoking the|[Data Requirements] operation on the payer's `Measure/measure-vte1` endpoint.

##### APIs
{:.no_toc}

These artifacts are used in this transaction:

1. Data Requirements: [$data-requirements (R4)] operation  (Note - the same operation is used for both version STU3 and R4 transaction)

##### Usage
{:.no_toc}

Using either the `GET` and `POST` Syntax the operation can be invoked as follows:

`GET|[base]/Measure/measure-vte1/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`
`POST|[base]/Measure/measure-vte1/$data-requirements`

{% include examplebutton.html example="measure-requirements-example" b_title = "Example Data Requirements operation" %}

---

#### OPTION 1: Submit Data to Payer
{:.no_toc}
    ....todo review if this is a step and update example....


{% include img-narrow.html img="submit-vte-data.jpg" caption="Submit data Operation" %}

##### Submit Data to a Payer's Measure endpoint
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources required by the payers as supporting evidence for VTE measure reporting to the payer.


{% include link-list.md %}
