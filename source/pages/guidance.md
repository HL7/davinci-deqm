---
title: General Guidance and Definitions
layout: default
active: guidance
topofpage: true
r4: http://build.fhir.org/
r3: http://hl7.org/fhir/STU3/
qi_r4: todo.html
qi_r3: http://build.fhir.org/ig/cqframework/qi-core/
deqm_r4: todo.html
deqm_r3: ''
hedis_r4: todo.html
hedis_r3: http://build.fhir.org/ig/cqframework/hedis-ig/
---


{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

...todo...

## Operations for Exchange of Data for Quality Measures between Payer and Provider EHR

Three methods of exchanging of data quality information are detailed below.  They include a 1) Submit Data operation, 2)  Collect Data operation, and 3) a Subscription service combined with the  Collect Data operation.  These transactions are triggered by use case specific clinical or adminisrative events such as a completed 30 day MRP.

For all of these methods:

 - The Payer is assumed to be the “Aggregator” of the individual events in the measure
 - When using MeasureReport, the Measure resources will define the actual Measure requested or posted
 - It not assumed that CQL will be used by the Provider.
 - CQL may or may not be used by the Payer (Aggregator).
 - The following resources are used in these transactions:

     |Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
     |---|---|---|---|
     |Measure|HEDIS Measure Profiles|[HEDIS Measure Profiles(STU3)]|[HEDIS Measure Profiles (R4)]|
     |MeasureReport|DEQM MeasureReport Profile|[DEQM MeasureReport (STU3)]|[DEQM MeasureReport (R4)]|
     |Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
     |Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|

<br/ >
<br />

### Option 1: Submit Data operation

{% include img-narrow.html img="submit-data.jpg" caption="Submit data Operation" %}

In this scenario, the Provider initiates a *Submit Data* operation to share all the quality reporting data with the Payer (Aggregator).  The Measure will define the necessary data needed to evaluate it. In some case, it will be possible to discover what data ( e.g., resources) are required by performing the Data Requirements operation on a Payer's measure endpoint.  The submitted data is used to evaluate the measure operation.

#### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. [Submit Data] operation  ( Note - the same operation is used for both version STU3 and R4 transaction)
1. Various DEQM and QI Core Profiles depending on the specific Measure


#### Usage
{:.no_toc}

Using the `POST` Syntax, the operation can be invoked by the Provider:

`POST|[base]/Measure/[measure-id]/$submit-data`

{% include examplebutton.html example="submit-data" b_title = "Example Submit Data operation" %}

### Option 2: Collect Data operation

{% include img-narrow.html img="collect-data.jpg" caption="Collect data Operation" %}

In this scenario, the Payer (Aggregator) initiates a *Collect Data* operation to gather all the quality reporting data for a particular measure from the Provider.  In response to the operation, the Provider will return the Measure data.  The Measure itself defines the necessary data needed to evaluate it. In some case, it will be possible to discover what data ( e.g., resources) are required by performing the Data Requirements operation on a Payer's measure endpoint.  The returned data is used to evaluate the measure operation.

#### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Collect Data operation: [Collect Data (STU3)] or [Collect Data (R4)]
1. Various DEQM and QI Core Profiles depending on the specific Measure


#### Usage
{:.no_toc}

**Collect Data (STU3):**

Using either the `GET` or `POST` Syntax, the operation can be invoked by the Payer:

`GET|[base]/Measure/[measure-id]/$collect-data&[parameters]`

`POST|[base]/Measure/[measure-id]/$collect-data`

**Collect Data (R4):**

Using only the `POST` Syntax, the operation can be invoked by the Payer:

`POST|[base]/Measure/[measure-id]/$collect-data`

{% include examplebutton.html example="collect-data" b_title = "Example Collect Data (STU3) operation" %}

{% include examplebutton.html example="collect-data-r4" b_title = "Example Collect Data (R4) operation" %}

### Option 3: Subscription service combined with the  Collect Data operation

{% include img-narrow.html img="subscribe-data.jpg" caption="Subscription Service" %}

Subscriptions allow for a Provider to notify the Payer when Measure data can be collected. The Payer must first subscribe to the Provider for a notification for a particular measure. The notification triggers are based upon the clinical and/or administrative event in the Payer system.  Once a Payer is notified, the measure data can be collected using the the *Collect Data* operation described above.  A Payer may also unsubscribe to a measure subscription.

#### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in the subscription transactions:

1. DEQM Subscription Profile [DEQM Subscription (STU3)] [DEQM Subscription (R4)]
1. QI Core Trigger event Extension.. and others
1. Collect Data operation: [Collect Data (STU3)] or [Collect Data (R4)]
1. Various DEQM and QI Core Profiles depending on the specific Measure

#### Usage - Subscribe/Unsubscribe
{:.no_toc}

To subscribe for measure notifications , The Payer SHALL use the standard FHIR [Subscription] API as follows:

`POST [base]/Subscription`

To unsubscribe:

`Delete [base]/Subscription/[id]`

{% include examplebutton.html example="subscribe-measure" b_title = "Example Subscription Transaction" %}

#### Usage - Notifications
{:.no_toc}

The standard FHIR Subscription API describe the REST Hook channel as follows:

`POST [app notification endpoint]`

{% include examplebutton.html example="measure-notification" b_title = "Example Subscription Notification" %}

## Must Support

- This guide adopts the QI Core definition for *[Must Support]* and add the following expectations:

- The receiver of data may not be able to complete processing and may "error out" if a Must Support element is unavailable.

{% include link-list.md %}
