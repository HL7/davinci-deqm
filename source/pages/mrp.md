---
title: Medication Reconciliation Process
layout: default
active: guidance
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

##  Introduction

- Provider will `POST` a MeasureReport with associated resources to provide the MRP attestation and the supporting evidence required by the payers.


**Summary of FHIR Artifacts used for Medication Reconciliation**


Resources supported for this use case:

1. Coverage [Davinci Coverage]
1. Encounter [US Core Encounter]
1. Location [US Core Location]
1. Measure [MRP Measure]
1. MeasureReport [MRP MeasureReport]
1. Observation [MRP Observation]
1. Organization [Davinci Organization]
1. Patient: [US Core Patient]
1. Practitioner [Davinci Practitioner]
1. Task [MRP Task]

<!--
|Resource|Argo DSTU2|US Core STU3|Argonaut/USCore R4|
|---|---|---|---|
|Patient|Y|Y|Pending  publication of R4|
|Practitioner|Y|Y|Pending  publication of R4|
|Organization|Y|Y|Pending  publication of R4|
|Location|N|Y|Pending  publication of R4|
|PractionerRole|N|Y|Pending  publication of R4|
|Procedure|Y|Y|Pending  publication of R4|
|Coverage|N|N|No Plans|
|Observation|Y ( as vitals, lab results, smoking|Y ( as vitals, lab results, smoking|Pending  publication of R4|
|Task|N|N|No Plans|

-->

### FHIR Resource Overview

#### Option 1: MRP using Task (TODO: remove PractitionerRole add Encounter)

{% include img.html img="MRP-Task.png" caption="Option 1: MRP using Task" %}

Option 1 Example:  A provider `POST`s the following MRP resources to the payer:

- Location
- Measure
- MeasureReport
- Organization
- Patient
- Practitioner
- PractitionerRole
- Task

{% include examplebutton.html example="mrp-task-collection-bundle" %}

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)

---

#### Option 2: MRP using Observation (TODO: remove PractitionerRole add Encounter)

{% include img.html img="MRP-Observation.png" caption="Option 2: MRP using Observation" %}

{% include examplebutton.html example="mrp-obs-collection-bundle" %}

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/22fbcdcc6df16bace3b0)

---

### Usage

example how to use a button to expand an inline example....

{% include examplebutton.html example="foo" %}

{% include link-list.md %}
