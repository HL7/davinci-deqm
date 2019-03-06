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

### VTE-1 FHIR Transactions:

#### Data Exchange Interactions
{:.no_toc}

1. Gather VTE-1 Data Requirements From Payer  (TODO link)

        {  % include examplebutton.html example=col-requirements-example" b_title = "Example VTE-1 Data Requirements" % }

1. Exchange of Quality Measure Data (TODO link)

   - OPTION 1: Submit Data to a Payer/Aggregator's Measure endpoint

       ....todo short Description

          {  % include examplebutton.html example=col-submit-example" b_title = "Example VTE-1 Submit Data" % }

   - OPTION 2: Payer/Aggregator Collects Data from Provider

    ....todo short Description

        {  % include examplebutton.html example=col-collect-example" b_title = "Example VTE-1 Collect Data" % }


   - OPTION 3: Payer/Aggregator Subscribes for Notification from Provider when data is available

    ....todo short Description

        {  % include examplebutton.html example=col-subscription-example" b_title = "Example VTE-1 Subscription" % }

   - Note to Balloters if there is a use case for using CDS Hooks to report the VTE-1 Measure

#### VTE-1 Measure Reporting Interactions:
{:.no_toc}

1. Individual MeasureReport

   Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

      {  % include examplebutton.html example=col-indv-report-example" b_title = "Post Bundle with VTE-1 Individual MeasureReport" % }

1. Summary MeasureReport

   Aggregator pushed the Bundle of supporting resource with VTE-1 Individual MeasureReport Bundle to the end user.

      {  % include examplebutton.html example=col-summary-report-example" b_title = "Post VTE-1 Summary MeasureReport" % }

{% include link-list.md %}
