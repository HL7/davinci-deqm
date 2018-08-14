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

This Guide (IG) defines a set of [FHIR operations] for Exchange of Quality Measure Data between Data "Aggregator's" and Providers.  Three methods of exchanging of data quality information are detailed below:

1. Submit Data operation
1. Collect Data operation
1. Subscription service.  

These transactions are triggered by use case specific clinical or administrative events such as a completed 30 day MRP.

### General Preconditions and Assumptions

- The "Aggregator" may be a Payer or another organization that is monitoring clinical quality measure.
- When using MeasureReport, the Measure resources will define the actual Measure requested or posted
- CQL may or may not be used by the Aggregator.
- It assumed that CQL will *not* be used by the Provider.

### Profiles
- The following resources are used in all these transactions:

  |Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
  |---|---|---|---|
  |Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
  |Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
  |MeasureReport|DEQM MeasureReport Profile|[DEQM MeasureReport (STU3)]|[DEQM MeasureReport (R4)]|
  |Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
  |Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
  |Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|


- Depending on the specific Measure, various DEQM and QI Core Profiles are also used in addition to the profiles listed above

#### Graph of DEQM Resources:
{:.no_toc}

{% include img.html img="measure-resource-graph.jpg" caption="DEQM Resource Graph" %}

<br />

### Option 1: Submit Data operation


In this scenario, the Provider initiates a *Submit Data* operation to share all the quality reporting data with the Aggregator.  To discover what data ( e.g., resources) are needed in the *Submit Data* payload for a particular measure, a *Data Requirements* operation **MAY** be invoked on a Aggregator's measure instance endpoint.  The Measure will define the necessary data that needs to be submitted in order for the Aggregator to evaluate the measure.

{% include img.html img="mrp-wf-overview.jpg" %}

#### Gather Data Requirements From Aggregator
{:.no_toc}

In this *optional* step, the provider queries the aggregator for which resources/profiles are needed for reporting a given measure.  *These profiles are subsequently referenced in the `MeasureReport.evaluatedResources` element* when submitting the measure data to the Aggregator .

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

##### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. [Data Requirements] operation  (Note - the same operation is used for both version STU3 and R4 transaction)

##### Usage
{:.no_toc}

 The required data for each Measure is discovered by invoking the [Data Requirements] operation on the aggregator's `Measure/[measure-id]` endpoint.  Using either the `GET` and `POST` Syntax, the operation can be invoked as follows:

`GET|[base]/Measure/[measure-id]/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`

`POST|[base]/Measure/[measure-id]/$data-requirements`

{% include examplebutton.html example="measure-requirements" b_title = "Example Data Requirements operation" %}

### Submit Data Operation
{:.no_toc}

Provider will use the Submit Data operation to submit a MeasureReport and the referenced resources as discovered by the *Data Requirements* operation to to Aggregator  as supporting evidence and for evaluation of the measure.

{% include img-narrow.html img="submit-data.jpg" caption="Submit data Operation" %}

##### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. [Submit Data] operation  ( Note - the same operation is used for both version STU3 and R4 transaction)
1. Various DEQM and QI Core Profiles depending on the specific Measure

##### Usage
{:.no_toc}

Using the `POST` Syntax, the operation can be invoked by the Aggregator :

`POST|[base]/Measure/[measure-id]/$submit-data`

{% include examplebutton.html example="submit-data" b_title = "Example Submit Data operation" %}

### Option 2: Collect Data operation

In this scenario, the Aggregator initiates a *Collect Data* operation to gather all the quality reporting data for a particular measure from the Provider.  In response to the operation, the Provider will return the Measure data.  The Measure itself defines the necessary data needed to evaluate it. As in the case above, discovery of what data ( e.g., resources) are required is done through the *Data Requirements* operation on a Aggregator 's measure endpoint and the returned resources and profiles are referenced in the `MeasureReport.evaluatedResources` element.

{% include img.html img="collect-data-steps.jpg" %}

#### Collect Data Operation
{:.no_toc}

Aggregator will use the Collect Data operation to request a MeasureReport and the  supporting evidence and for evaluation of a measure from a Provider.

{% include img-narrow.html img="collect-data.jpg" caption="Collect data Operation" %}

#### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Collect Data operation: [Collect Data (STU3)] or [Collect Data (R4)]
1. Various DEQM and QI Core Profiles depending on the specific Measure


#### Usage
{:.no_toc}

**Collect Data (STU3 and R4):**

Using either the `GET` or `POST` Syntax, the operation can be invoked by the Aggregator :

`GET|[base]/Measure/[measure-id]/$collect-data&[parameters]`

`POST|[base]/Measure/[measure-id]/$collect-data`


{% include examplebutton.html example="collect-data" b_title = "Example Collect Data operation" %}

#### Data Requirements Operation
{:.no_toc}

In order to complete the transaction the Provider may need to discover the required data for each Measure by invoking the [Data Requirements] operation on the aggregator 's `Measure/[measure-id]` endpoint. This operation is discussed in the [section above](#gather-data-requirements-from-aggregator )

<br />

### Option 3: Subscription service combined with the  Collect Data operation

Subscriptions allow for a Provider to notify the Aggregator when Measure data can be collected.  The notification triggers are based on whether the Provider's system has determined that it has the requisite measure data the subscriber needs for the measure, or if the information has been updated.  Once a Aggregator is notified, the measure data can be collected using the the [*Collect Data*](#collect-data-operation) operation described above.

{% include img.html img="subscribe-data-steps.jpg" %}

#### Subscribe for Measure Data
{:.no_toc}

The Aggregator must first subscribe to the Provider for a notification for a particular measure. An Aggregator may also unsubscribe to a measure subscription.

{% include img-narrow.html img="subscribe-data.jpg" caption="Subscription Service" %}

##### APIs
{:.no_toc}

The following artifacts are used in the subscription transaction:

1. DEQM Subscription Profile [DEQM Subscription (STU3)] [DEQM Subscription (R4)]
1. DEQM Measure Subscription Extension [Measure Subscription (STU3)] [Measure Subscription (R4)]

##### Usage
{:.no_toc}

To subscribe for measure notifications , The Aggregator  SHALL use the standard FHIR [Subscription] API as follows:

`POST [base]/Subscription`

To unsubscribe:

`Delete [base]/Subscription/[id]`

{% include examplebutton.html example="subscribe-measure" b_title = "Example Subscription Transaction" %}

#### Get Data Requirements
{:.no_toc}

The DEQM Subscription Profile allows the subscriber to send a *DEQM Measure instance id*.  By invoking the $data-requirements operation (see [above](#gather-data-requirements-from-aggregator)) on a subscriber’s Measure instance endpoint, the server can discover what data is needed to calculate by a subscriber for particular measure.  This information is necessary to correctly trigger a notification when the requisite data is available.

#### Measure Notifications
{:.no_toc}

The Provider notifies the Aggregator when measure data is available. Exactly, how this notification is triggered is out of scope for this guide.  Note that  several architectures to implement the subscription notifications such as "point to point" notification or using a “feed handler” as an intermediary system, are available.

{% include img-narrow.html img="measure-notifications.jpg" caption="Measure Notifications" %}

##### Usage
{:.no_toc}

 The standard FHIR Subscription API describes the REST Hook channel as follows:

`POST [app notification endpoint]`

{% include examplebutton.html example="measure-notification" b_title = "Example Subscription Notification" %}

#### Collect Data Operation
{:.no_toc}

Upon notification, the Aggregator uses the Collect Data operation to request a MeasureReport and the supporting evidence from a Provider.  This operations is discussed in the section above.


## Must Support

- This guide adopts the [QI Core *Must Support*] definition with the following additional expectations:

1.  The receiver of data may not be able to complete processing and may "error out" if a Must Support element is unavailable.

{% include link-list.md %}
