---
title: Data Exchange Interactions
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

### Introduction

Clinical Quality Measures are a common tool used throughout healthcare to help evaluate and understand the impact and quality of the care being provided to an individual or population. The intent of "data-of-interest" is the source data needed to calculate a quality measure, as specified by the data requirements of the measure. For example, for a colorectal cancer screening measure, the data-of-interest is the set of conditions, procedures, and observations related to determining whether a patient is in the initial population, denominator, and numerator of the quality measure. To effectively evaluate quality measures in such an environment requires timely exchange of the relevant data.  

Transactions between Data "Aggregators" (organizations that want to evaluate quality measures) and Providers (organizations that deliver care to patients) are triggered by use case specific clinical or administrative events such as the completion of a Medication Reconciliation or a request from a Payer for the attestation information. Note that triggering is implementation specific and out of scope for this IG. This Implementation Guide (IG) describes three methods of exchanging data quality information using a set of [FHIR operations] that provide a framework to enable the Exchange of Quality Measure Data:

1. Measurement data may be submitted to the Aggregator by the Provider using the [Submit Data operation](#submit-data)
1. Measurement data may be requested from the Provider by the Aggregator using the [Collect Data operation](#collect-data)
1. The Aggregator may subscribe to a Provider's [Subscription service](#pub-sub) to be notified when the measurement data is available.

FHIR operations allows the implementation to be viewed as a 'black box' free to decide how to satisfy the query - "give me the data of interest for a measure" - without requiring generic FHIR search functionality.

### Profiles

The following resources are used in all data exchange transactions:

  |Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
     |---|---|---|---|
  |Library|DEQM Library Profile|[DEQM Library (STU3)]|[DEQM Library (R4)]|
  |Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
  |MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile (STU3)]|[DEQM Data Exchange MeasureReport Profile (R4)]|
  |Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|
  |Patient|QI Core Patient Profile|[QI Core Patient (STU3)]|[QI Core Patient (R4)]|
  |Subscription|DEQM Subscription Profile|[DEQM Subscription (STU3)]|[DEQM Subscription (R4)]|

Depending on the specific Measure, various DEQM and QI Core Profiles are also used in addition to the profiles listed above

#### Graph of DEQM Resources:
{:.no_toc}

{% include img.html img="measure-resource-graph.svg" caption="DEQM Resource Graph" %}

<br />

### Data Exchange

#### Submit Data operation
{: #submit-data}

The *Submit Data* operation allows a Provider to submit data-of-interest for a particular quality measure. There is no expectation that the data submitted represents all the data required to evaluate the quality measure, only that the data is known to be relevant to the quality measure, based on the data requirements for the measure.

To discover what data (i.e. resources) are relevant in the *Submit Data* payload for a particular measure, a *Data Requirements* operation **MAY** be invoked on a Aggregator's measure instance endpoint.  The response to this operation provides a list of Data Requirements which detail what data needs to be submitted in order for the Aggregator to evaluate the measure.

{% include img.html img="mrp-wf-overview.jpg" %}

##### Gather Data Requirements From Aggregator
{:.no_toc}

In this step, the provider queries a common knowledge store for profiles needed for reporting a given measure and how the sending of those data should be initiated. Common data profiles have been developed through a multi-stakeholder consensus-based development process and will be made available from the common site. To support the *Submit Data* operation, an implementation needs to know specifically what data are required to provide as the payload for the operation. This can be done manually by reviewing the measure definition to determine what data needs to be submitted and it is automated by using the *Data Requirements* operation. *These profiles are subsequently referenced in the `MeasureReport.evaluatedResources` element* when submitting the measure data to the Aggregator.

{% include img-narrow.html img="data-requirement.jpg" caption="Data Requirements Operation" %}

###### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Data Requirements: [$data-requirements (R4)] operation  (Note - the same operation is used for both version STU3 and R4 transaction)

###### Usage
{:.no_toc}

 The required data for each Measure is discovered by invoking the *Data Requirements* operation on the aggregator's `Measure/[measure-id]` endpoint.  Using either the `GET` or `POST` Syntax, the operation can be invoked as follows:

`GET|[base]/Measure/[measure-id]/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`

`POST|[base]/Measure/[measure-id]/$data-requirements`

Note the use of the `periodStart` and `periodEnd` parameters supports description of data requirements that filter based on the reporting period. For example, a measure may require data for a certain procedure within the last three years, and the data requirements returned will reflect that period.

{% include examplebutton.html example="measure-requirements-example" b_title = "Example Data Requirements operation" %}

##### Submit Data Operation
{:.no_toc}

Once the Provider understands the data requirements, they will use the Submit Data operation to submit a MeasureReport and the referenced resources as discovered by the *Data Requirements* operation to the Aggregator. There is no exception that the submitted data represents all the data-of-interest, only that all the data submitted is relevant to the calculation of the measure for a particular subject or population. The Aggregator simply accepts the submitted data; there is no expectation that the Aggregator will actually evaluate the quality measure in response to every Submit Data. In addition, the Submit Data operation does not provide for analytics or feedback on the submitted data.

{% include img-narrow.html img="submit-data.jpg" caption="Submit data Operation" %}

###### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Submit Data operation: [$submit-data (R4)]  ( Note - the same operation is used for both version STU3 and R4 transaction)
1. Various DEQM and QI Core Profiles depending on the specific Measure

###### Usage
{:.no_toc}

Using the `POST` Syntax, the operation can be invoked by the Provider:

`POST|[base]/Measure/[measure-id]/$submit-data`

{% include examplebutton.html example="submit-data-example" b_title = "Example Submit Data operation" %}


#### Collect Data operation
{: #collect-data}

In this scenario, the Aggregator initiates a *Collect Data* operation to gather any available quality reporting data for a particular measure from the Provider.  In response to the operation, the Provider returns a MeasureReport containing data relevant to the Measure. As with the Submit Data operation, there is no expectation that this MeasureReport contains all the data required to evaluate the quality measure, nor is the measure score expected to be provided.

As with the Submit Data case above, discovery of what data (i.e. resources) are required is done through the *Data Requirements* operation on a Aggregator's measure endpoint and the returned resources and profiles are referenced in the `MeasureReport.evaluatedResources` element.

{% include img.html img="collect-data-steps.jpg" %}

##### Collect Data Operation
{:.no_toc}

The Aggregator uses a Collect Data operation to request any available relevant data for the evaluation of a particular measure from a Provider. This would typically be done on a periodic basis to support incremental collection of quality data. The `lastReceivedOn` parameter can be used to indicate when the last Collect Data operation was performed, allowing the Provider to limit the response to only data that has been entered or changed since the last received on date.

Note that implementing this scenario requires that the Provider system understand the data requirements for the measure in order to provide the data. As with the Submit Data operation, the implementation can either manually determine the relevant data using the measure definition, or the implementation can use the *Data Requirements* operation to determine relevant data.

{% include img-narrow.html img="collect-data.jpg" caption="Collect data Operation" %}

##### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Collect Data operation:[$collect-data (STU3)] or [$collect-data (R4)]
1. Various DEQM and QI Core Profiles depending on the specific Measure


##### Usage
{:.no_toc}

**Collect Data (STU3 and R4):**

Using either the `GET` or `POST` Syntax, the operation can be invoked by the Aggregator :

`GET|[base]/Measure/[measure-id]/$collect-data&[parameters]`

`POST|[base]/Measure/[measure-id]/$collect-data`


{% include examplebutton.html example="collect-data-example" b_title = "Example Collect Data operation" %}

##### Data Requirements Operation
{:.no_toc}

In order to complete the transaction the Provider may need to discover the required data for each Measure by invoking the *Data Requirements* operation on the aggregator 's `Measure/[measure-id]` endpoint. This operation is discussed in the [section above](#gather-data-requirements-from-aggregator )

<br />

#### Subscriptions
{: #pub-sub}

Subscriptions allow for a Provider to notify the Aggregator whenever new Measure data is available.  Effectively, the Aggregator subscribes to the Provider's system using the Measure as the criteria. It is a short-hand for subscribing to all the data-of-interest (as defined by the data requirements) for the measure, but using the Measure as the subscription point allows the implementation to determine the most efficient approach to notification. For example, notifications can be batched on a periodic basis, or they can be performed along transactional boundaries within the implementing system.

Once an Aggregator is notified, the Aggregator then uses the *Collect Data* operation described above to request the relevant data.

{% include img.html img="subscribe-data-steps.jpg" %}

##### Subscribe for Measure Data
{:.no_toc}

The Aggregator must first subscribe to the Provider for a notification for a particular measure.  An Aggregator may also unsubscribe to a measure subscription.

{% include img-narrow.html img="subscribe-data.jpg" caption="Subscription Service" %}

###### APIs
{:.no_toc}

The following artifacts are used in the subscription transaction:

1. DEQM Subscription Profile [DEQM Subscription (STU3)] or [DEQM Subscription (R4)]
1. DEQM Measure Subscription Extension [Measure Subscription (STU3)] or [Measure Subscription (R4)]

###### Usage
{:.no_toc}

To subscribe for measure notifications , The Aggregator SHALL use the standard FHIR [Subscription] API as follows:

`POST [base]/Subscription`

To unsubscribe:

`Delete [base]/Subscription/[id]`

{% include examplebutton.html example="subscribe-measure-example" b_title = "Example Subscription Transaction" %}

##### Get Data Requirements
{:.no_toc}

The DEQM Subscription Profile allows the subscriber to send a *DEQM Measure instance id*.  By invoking the $data-requirements operation (see [above](#gather-data-requirements-from-aggregator)) on a subscriber’s Measure instance endpoint, the server can discover what data is needed to calculate by a subscriber for particular measure.  This information is necessary to correctly trigger a notification when the requisite data is available.

##### Measure Notifications
{:.no_toc}

The Provider notifies the Aggregator when measure data is available. Exactly, how this notification is triggered is out of scope for this guide.  Note that  several architectures to implement the subscription notifications such as "point to point" notification or using a “feed handler” as an intermediary system, are available.

{% include img-narrow.html img="measure-notifications.jpg" caption="Measure Notifications" %}

###### Usage
{:.no_toc}

 The standard FHIR Subscription API describes the REST Hook channel as follows:

`POST [app notification endpoint]`

{% include examplebutton.html example="measure-notification-example" b_title = "Example Subscription Notification" %}

##### Collect Data Operation
{:.no_toc}

Upon notification, the Aggregator uses the Collect Data operation to request a MeasureReport and any relevant data from the notifying Provider.  This operation is discussed in the section above.


{% include link-list.md %}
