---
title: Data Exchange Interactions
layout: default
active: guidance
topofpage: true
---


{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

Clinical Quality Measures (CQMs) are a common tool used throughout healthcare to help evaluate and understand the impact and quality of the care being provided to an individual or population. The intent of [data of interest] is the source data needed to calculate a quality measure, as specified by the data requirements of the measure. For example, for a colorectal cancer screening measure, the data of interest is the set of conditions, procedures, and observations related to determining whether a patient is in the initial population, denominator, and numerator of the quality measure. To effectively evaluate quality measures in such an environment requires timely exchange of the relevant data.  

Transactions between Consumers (organizations that want to evaluate quality measures) and Producers (organizations that deliver care to patients) are triggered by use case specific clinical or administrative events such as the completion of a Medication Reconciliation or a request from a Payer for the attestation information. Note that although triggering is implementation specific and out of scope for this IG,  there are a variety of potential triggering points for reporting events within clinical systems.  These include:

* [Infobutton] event listing
* [eCR] Event Types
* [CDS Hooks] Hook definitions
* [CPG-on-FHIR] common processes

and there will be a need to convey triggering information in a computable way to EHRs and other clinical systems.

This Implementation Guide (IG) describes three methods of exchanging data quality information using a set of [FHIR operations] that provide the framework to exchange CQM data:

1. CQM data may be submitted to the Consumer by the Producer using the [Submit Data scenario](#submit-data)
1. CQM data may be requested from the Producer by the Consumer using the [Collect Data scenario](#collect-data)

  This project recognizes the impact of the [Argonaut Clinical Data Subscriptions] project which is working on event based subscriptions and major revisions to the Subscription resource for FHIR R5. In a future version this guide, a subscription based exchange <!-- in which the Consumer may subscribe to a Producer's Subscription service to be notified when the CQM data is available --> is planned and will align with the outcomes of the Argonaut project.
  {:.stu-note}

FHIR operations allow the implementation to be viewed as a 'black box' free to decide how to satisfy the query - "give me the data of interest for a measure" - without requiring generic FHIR search functionality.

## Profiles

The following resources are used in all data exchange transactions:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Library|CQFM Library Profile|[CQFM Library]|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|MeasureReport|DEQM Data Exchange MeasureReport Profile|[DEQM Data Exchange MeasureReport Profile]|
|Organization|DEQM Organization Profile|[DEQM Organization]|
|Patient|QI Core Patient Profile|[QI Core Patient]|

Depending on the specific Measure, various DEQM and QI Core Profiles are also used in addition to the profiles listed above

### Graph of DEQM Resources
{:.no_toc}

The DEQM resources form a network through their relationships with each other - either through a direct reference to another resource or through a chain of intermediate references. These groups of resources are referred to as resources graphs.  The DEQM data exchange resource graph is shown in Figure 2-1:

{% include img.html img="measure-resource-graph.svg" caption="Figure 2-1 DEQM Resource Graph" %}

<br />

## Data Exchange

### Submit Data
{: #submit-data}

{:.highlight-note}
 The [$submit-data] operation allows a Producer to submit data of interest for a particular quality measure within the specified [submission period].  The operation MAY be repeated during the submission period as additional data relevant to the quality measure becomes available.  The Producer should **SHOULD** submit the data as [snapshot updates] for submitting data in unless Producer and Consumer agree to use [incremental updates].

{% include img.html img="submit-data-step.svg" caption = "Figure 2-2 Submit Data Steps (Updated figure to show repeated submissions) source: https://docs.google.com/presentation/d/12XOtyF33K_NM5on4mVewRvha9AnFArU8PkOH_x4m9JE/edit?usp=sharing" %}

<del>
The *Submit Data* operation allows a Producer to submit data-of-interest for a particular quality measure within the specified time window when the data is ready. There is no expectation that the data submitted represents all the data required to evaluate the quality measure, only that the data is known to be relevant to the quality measure, based on the data requirements for the measure.  Note that resources included in a *Submit-Data* bundle **SHOULD** be self-contained (in other words, should include all referenced resources in the data), unless the exchange is understood by both parties to be incremental. For example, if an Encounter references a Location, that Location is expected to be included in the bundle, unless the exchange is understood to be incremental and the sending system knows that it has already sent that particular Location as part of a previous submit.
</del>

{% include img.html img="mrp-wf-overview.jpg" caption = "Figure 2-2 Submit Data Steps" %}

#### Gather Data Requirements from Consumer
{:.no_toc}

To support the Submit Data operation, an implementation needs to know specifically what data are required to provide as the payload for the operation.  As described in the [Background] section of this guide, the profiles used in measuring and reporting CQMs are developed through a multi-stakeholder consensus-based process and are made available to the Producer.  The Producer is able to query for profiles needed for reporting a given measure and the criteria for the sending of the data.  This can be done manually by reviewing the measure definition or computationally by invoking the *Data Requirements* operation on a Consumer's measure instance endpoint as described below. These profiles are subsequently referenced in the `MeasureReport.evaluatedResources` element when submitting the measure data to the Consumer.

Note that because the data exchange scenarios described are intended to support exchange throughout a measurement period, the versions of measure specifications may change during the measurement period. Care should be taken to ensure the appropriate versioning of measure specifications and the impact of those changes on data exchanged using these methods

{% include img-narrow.html img="data-requirement.jpg" caption="Figure 2-3 Data Requirements Operation" %}

##### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Data Requirements: [$data-requirements] operation

##### Usage
{:.no_toc}

 The required data for each Measure is discovered by invoking the *Data Requirements* operation on the Consumer's `Measure/[measure-id]` endpoint.  Using either the `GET` or `POST` Syntax, the operation can be invoked as follows:

`GET|[base]/Measure/[measure-id]/$data-requirements?periodStart={periodStart}&periodEnd={periodEnd}`

`POST|[base]/Measure/[measure-id]/$data-requirements`

Note the use of the `periodStart` and `periodEnd` parameters supports description of data requirements that filter based on the reporting period. For example, a measure may require data for a certain procedure within the last three years, and the data requirements returned will reflect that period.

{% include examplebutton.html example="data-requirements-example" b_title = "Click Here To See Example Data Requirements operation" %}

For another example see the [COL Data Requirements Operation] example.

#### Submit Data Operation
{:.no_toc}


Once the Producer understands the data requirements, they will use the *Submit Data* operation to submit a MeasureReport and the referenced resources as discovered by the *Data Requirements* operation to the Consumer. There is no expectation that the submitted data represents all the data of interest, only that all the data submitted is relevant to the calculation of the measure for a particular subject or population. The Consumer simply accepts the submitted data and there is no expectation that the Consumer will actually evaluate the quality measure in response to every Submit Data. In addition, the Submit Data operation does not provide for analytics or feedback on the submitted data.


<div class="highlight-note" markdown="1">
##### Incremental and Snapshot Updates
When the Producer submits updates to the measure data within the submission period, the Producer **SHOULD** use [snapshot updates] for submitting data in unless Producer and Consumer agree to use [incremental updates].  In order to support updates:

- The Producer **SHALL** support stable unique identifiers in the `MeasureReport.id` and `MeasureReport.meta.source` across updates so that the Consumer system can track whether the payload is an update and process it appropriately.
- The Consumer **SHOULD** document in its CapabilityStatement whether it supports `snapshot`, `incremental` or ``??both??`` types of update with $submit-data operation.
  - `...add snippet here ...`
- If the Consumer supports snapshot updates, the contents of the updated submit-data payload entirely replaces the previous submit-data payload.
- If the Consumer supports incremental updates, the contents of the updated submit-data payload updates the previous submit-data payload data.

  (update the CapabitilityStatement and add snippet here)


</div>

{% include img-narrow.html img="submit-data.jpg" caption="Figure 2-4 Submit data Operation" %}

##### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Submit Data operation: [$submit-data]
1. Various DEQM and QI Core Profiles depending on the specific Measure

##### Usage
{:.no_toc}

Using the `POST` Syntax, the operation can be invoked by the Producer:

`POST|[base]/Measure/[measure-id]/$submit-data`

{% include examplebutton.html example="submit-data-example" b_title = "Click Here To See Example Submit Data Operation (edited for brevity)" %}

For a complete un-edited example see the [MRP Submit Data Operation] and [COL Submit Data Operation] examples.

### Collect Data
{: #collect-data}

{:.highlight-note}
In this scenario, the Consumer initiates a [$collect-data] operation to gather any available CQM data for a particular measure from the Producer.  In response to the operation, the Producer returns a MeasureReport containing data relevant to the Measure. Like the [Submit Data scenario](#submit-data) described above, this scenario requires that the Producer can gather the data requirements from the consumer for the measure, and that there is no expectation that the data returned represents all the data required to evaluate the quality measure.  Unlike the Submit Data interaction, the exchange is typically incremental as detailed below.

{% include img.html  img="collect-data-steps-new.jpg" caption = "Figure 2-5 Collect Data Steps - updated image to reflect incremental updates"%}

<del>
In this scenario, the Consumer initiates a *Collect Data* operation to gather any available CQM data for a particular measure from the Producer.  In response to the operation, the Producer returns a MeasureReport containing data relevant to the Measure. It is assumed that the Producer knows the data requirements for the measure. As with the Submit Data operation, there is no expectation that this MeasureReport contains all the data required to evaluate the quality measure, nor is the measure score expected to be provided.
</del>

{% include img.html  img="collect-data-steps.jpg" caption = "Figure 2-5 Collect Data Steps"%}

#### Collect Data Operation
{:.no_toc}


The Consumer uses a Collect Data operation to request any available relevant data for the evaluation of a particular measure from a Producer. This would typically be done on a periodic basis to support incremental collection of quality data. The `lastReceivedOn` parameter can be used to indicate when the last Collect Data operation was performed, allowing the Producer to limit the response to only data that has been entered or changed since the last received on date.

<del>
Note that implementing this scenario requires that the Producer system understand the data requirements for the measure in order to provide the data. As with the Submit Data operation, the implementation can either manually determine the relevant data using the measure definition, or the implementation can use the Data Requirements operation to determine relevant data.
</del>

{% include img-narrow.html img="collect-data.jpg" caption="Figure 2-6 Collect data Operation" %}

#### APIs
{:.no_toc}

In addition to the resources listed above, the following artifacts are used in this transaction:

1. Collect Data operation:[$collect-data]
1. Various DEQM and QI Core Profiles depending on the specific Measure


#### Usage
{:.no_toc}

**Collect Data:**

Using either the `GET` or `POST` Syntax, the operation can be invoked by the Consumer:

`GET|[base]/Measure/[measure-id]/$collect-data&[parameters]`

`POST|[base]/Measure/[measure-id]/$collect-data`


{% include examplebutton.html example="collect-data-example" b_title = "Click Here To See Example Collect Data operation" %}

For a complete un-edited example see the [COL Collect Data Operation] example.

### Submit Data and Collect Data for Multiple Patients

#### Submit Data Operation Request for Multiple Patients
{:.no_toc}

The [transaction] bundle processing as defined by FHIR specification is used for transacting the body of Submit Data operation request for *multiple* patients in a single interaction.  

- The transaction bundle contains an entry for each patient as illustrated in the examples below:
  - The fullUrl is a UUID (`urn:uuid:...`).
  - The resource is a Parameters resource as defined in the operation.
  - The request method is `POST`
  - The request url is the operation endpoint `Measure/$submit-data` or `Measure/[measure-id]/$submit-data`.
- When resolving references, references are never resolved outside the Parameters resource.  Specifically, resolution stops at the elements Parameters.parameter.resource."
- The matching [transaction response] is returned by the operation endpoint server.

~~~
POST|[base]

{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:79378cb8-8f58-48e8-a5e8-60ac2755b674",
      "resource": {
        "resourceType": "Parameters",
        "parameter": [
          {
            "name": "measurereport",
            "resource": {
              "resourceType": "MeasureReport",
              ...,
            "name": "resource",
            "resource": {
              "resourceType": "Patient",
              ...,
            [other "resource" parameters]
          ]
        },
        "request": {
          "method": "POST",
          "url": "Measure/[measure-id]/$submit-data"
            }
            ....
~~~

#### Collect Data Operation Response for Multiple Patients
{:.no_toc}

Because operations are typically executed synchronously, a collect data request to a server returns a Parameter resource for a *single* patient as defined by the `$collect-data` operation.  Execution of this operation and returning multiple patients in a single *asynchronous* transaction is outside the scope of this guide.

<br />


{% include link-list.md %}
