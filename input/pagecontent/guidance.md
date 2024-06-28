
### Introduction

Quality Measures are a common tool used throughout healthcare to help evaluate and understand the impact and quality of the care being provided to an individual or population.

The Data Exchange for Quality Measure (DEQM) Implementation Guide defines the interactions for three purposes in the Quality Measure Ecosystem. The first purpose is when a Producer, such as a practitioner, or owner of data needs to exchange that data with a Consumer of that data, such as a payer, a registry or public health. We call this the [Data Exchange] Scenario. Examples of this are when a provider has patient information from a recent visit that he needs to share with a payer under a value based contract, or when a Producer acting as a Payer and needs to exchange data with a Provider.

The second purpose is when a Reporter needs to exchange a measure report with a Receiver, expressed as Individual Measure Reporting, Summary Reporting, and Subject List Reporting. As an example, Individual Measure Reports may be used by hospitals acting as the Reporter to report a specific measure to a payer acting as a Receiver. Similarly, Summary Measure Reports may be used to report yearly eCQM results on a specific measure. Finally, Subject List Reports are used to report lists of Individual Subject Reports.

The third purpose is Gaps in Care Reporting used to report the [open and/or closed gaps] for quality measures over a [gaps through period] specified by a Client. Optionally, it is also used to report details to the open gaps identified and mitigation steps for addressing them. It further provides capability of associating clinical data included in the report with the population criteria (i.e. denominator, numerator) of a measure that they apply to.

### Preconditions and Assumptions

- Although the exact mechanisms for securing these exchanges are not specified as part of this implementation guide:

  - Exchanges are limited to subjects or populations mutually agreed upon between the Producer and Consumer.

  - Systems should use standard authentication and authorization approaches. The [SMART App Launch] and [SMART backend services] authentication and authorization approach are recommended models.

- The Measure resource is used to provide both human- and machine-readable definitions of a quality measure.

- The MeasureReport profiles in this IG are used to report measures profiled as [CRMI Shareable Measure].

- The MeasureReport provides an association to a specific quality measure and links the submitted data together to simplify processing for the receiver.

- It is the responsibility of the Producer to ensure that measure data is present in a structured, retrievable form.

- The required data is represented in the referenced resources defined by the MeasureReport.

  - Multiple MeasureReport may reference the same instance of a resource.

- Both Consumers and Producers should share a common understanding that allows the same measures to be applied in healthcare and at the aggregator. This understanding can be based on a structured expression language (e.g. CQL) or any agreed upon method. This enables the application of the same measures across populations that span multiple Consumer, such as payers. Using common measures across payers reduces development burden for FHIR implementers.

### DEQM MeasureReport Profiles

The MeasureReport resource is used as an organizer for the Data Exchange, Measure Reporting, and Gaps in Care Reporting groups of scenarios. To meet the different needs in these scenarios, DEQM has created four MeasureReport profiles. The type of profile can be determined by inspecting the `meta.profile` element, if present, or the `type` element.

|Scenario Group|Scenario|MeasureReport Profile|Operation|
|----|----|----|----|
|Data Exchange|Submit Data|[DEQM Data Exchange MeasureReport Profile]|[$submit-data]|
|Data Exchange|Collect Data|[DEQM Data Exchange MeasureReport Profile]|[$collect-data]|
|Measure Reporting|Individual Reporting|[DEQM Individual MeasureReport Profile]|POST to Receiver|
|Measure Reporting|Summary Reporting|[DEQM Summary MeasureReport Profile]|POST to Receiver|
|Measure Reporting|Subject List Reporting|[DEQM Subject List MeasureReport Profile]|POST to Receiver|
|Gaps in Care|

#### Data Exchange

The [DEQM Data Exchange MeasureReport Profile] is used to move data from a Data Producer to a Data Consumer. The consumer might be a system that calculates the measure report, but they could also be an aggregator who sends that data on to another system to do measure calculation and reporting. Along with Data Exchange MeasureReport Profile, the Data Producer sends the Organization, Patient and any relevant resources for the measure they have produced data on. When a Data Producer, such as a practitioner, sends a MeasureReport bundle, they may not have all the data that is required to calculate the measure report. One example might be because the measure requires outcome data from at a later point in time during the measurement period. Another example where the Data Producer may not have all the data would be continuous coverage period as the producer of the data may not know the patient was covered on the day the patient was seen. The Consumer (in this case the payer as aggregator) is the owner of all coverage information. Therefore, only the consumer could determine if the continuous coverage period requirement is met.

#### Measure Reporting

Measure Reporting is done by a Reporter who has all of the data that is required to generate a report(s). Three profiles for measure reporting have been defined in this guide.

The [DEQM Individual MeasureReport Profile] is used when a measure is reported for an individual subject. It contains all of the data that is relevant to generate the report including the measure outcome. MeasureReports are packaged in FHIR Bundles with the [data of interest].

The [DEQM Summary MeasureReport Profile] is used when a measure is reported for a population at the conclusion of a measure measurement period. It includes the measure outcome data, and, unlike the DEQM Individual MeasureReport Profile, the report is typically transacted as a single MeasureReport, although several summary reports may be transacted together as Bundle.

The [DEQM Subject List MeasureReport Profile] is used when a measure is reported for a FHIR Group, and it also allows individual MeasureReports be provided for each of the patients in the population.

#### Gaps in Care Reporting

Gaps in Care Reporting can be requested by a Client to a Server system that has all of the data that is known about the patient(s) at a point in time during a [gaps through period]. The [$care-gaps] operation is used to request and receive Gaps in Care Report for measures.

When the [$care-gaps] operation is run on the Server, it returns a FHIR Bundle for each patient. The bundle conforms to the [DEQM Gaps In Care Bundle Profile], which must contain a Composition that uses the [DEQM Gaps In Care Composition Profile]. The DEQM Gaps In Care Composition references one to many MeasureReport resource; each MeasureReport is for a single measure and conforms to the [DEQM Individual MeasureReport Profile]. Optionally, the actual individual MeasureReport resources referenced are also packaged in the same DEQM Gaps In Care Bundle, along with Patient, Organization, and other resources that were used to calculate this measure. A DetectedIssue resource defined using the [DEQM Gaps In Care DetectedIssue Profile] must be included to indicate gap status of that measure via the [DEQM Gap Status Extension], a modifier extension.

The DEQM Individual MeasureReport contains all of the data that is relevant to calculate the report including the measure outcome and indication of [open gaps]. The [$care-gaps] operation determines the gaps status for the patient for a specific measure based on the measureScore data contained in the MeasureReport. Depending on what input parameters are provided to the [$care-gaps] operation for generating a Gaps in Care Report, a DEQM Gaps In Care Composition may contain reports for measures with only [open gaps], only [closed gaps], or both [open and closed gaps]. The [DEQM Population Reference Extension] to the `evaluatedResource` is added to the [DEQM Individual MeasureReport Profile] to support associating an evaluated resource with a specific measure population or populations that it applies to. For example, a colonoscopy procedure done for an individual 5 years ago is used to meet the numerator population criteria when evaluating the colorectal cancer screening measure for the individual. Through the use of this [DEQM Population Reference Extension], the Server can indicate this colonoscopy procedure data was used for evaluating the numerator population, identified by the population group id for numerator specified in the Colorectal Cancer Screening Measure resource.

### Data Quality

Measure specifications define logic and data requirements necessary to perform evaluation of a given measure, often through the use of CQL definitions. The use of CQL definitions/queries supports the retrieval of applicable data elements and associated metadata. Measure specifications will typically make use of a set of defined profiles suitable for use in the target environment, such as US Core or QI Core, to ensure that data exchanged is standardized, consumable, and suitable for evaluation.

### Negation Patterns for Quality Measures

​Refer to the Quality Measure Implementation Guide for guidance on [negation patterns in quality measurements]. Note that implementations processing negated data may not be returned with a single code, but rather a value set identifier represented by the [Not Done Value Set] which are part of the QI Core profiles, and should consider data with the appropriate value set identifier as satisfying the criteria for value set membership. The negation pattern for the MedicationRequest (MedicationNotRequested) resource is demonstrated in the [Single Indv Vte Report Option 7] example.

The negation patterns described here are about approaches for identifying when events are not present or when events are documented as not occurring for a reason. These patterns may appear throughout a measure in any of the various population criteria, depending on measure intent. For example, the absence of a particular medication may be grounds for membership in the initial population, denominator, numerator, or an exclusion or exception criteria, depending on how the measure is constructed. An example of this is the [VTE-1 USE Case Option 7].

### Using Contained Resources in the Response Transaction

[Contained resources] **SHOULD NOT** be used when responding to the [$submit-data] or [$collect-data] operation or to the individual reporting transactions. The data exchange transaction payloads are Parameters resources containing resource parameters. The response to the individual reporting transactions are Bundles. The only time contained resource can be used is when the source data exists only within the context of the transaction. For example, if the only information about the patient's coverage is the payor name, the Coverage resource could be contained by the Patient resource:

~~~
{
  "resourceType": "Patient",
  "id": "patient01",
  "contained": [
    {
      "resourceType": "Coverage",
      "status": "active",
      "beneficiary": {
        "reference": "#"
      },
      "payor": [
        {
          "reference": "Organization/organization04"
        }
      ]
    }
  ]
  ...<rest of patient resource>
}
~~~

[Contained resources] **SHOULD NOT** be used when responding to the [care-gaps](OperationDefinition-care-gaps.html) operation.

### Must Support

Certain elements in the profiles defined in this implementation guide are marked as Must Support. This flag is used to indicate that the element plays a critical role in defining and sharing quality measures, and implementations SHALL understand and process the element.

Data exchange and reporting with DEQM can use any data model defined in other FHIR IGs based on the nature of what is being reported. Any Must Support flags in the supporting data model should be respected when exchanging data with DEQM profiles. The use of DEQM profiles alone does not imply that evaluated resources are valid to base FHIR or any other FHIR profiles.

For more information, see the definition of [Must Support](http://hl7.org/fhir/R4/conformance-rules.html#mustSupport) in the base FHIR specification.

Must Support guidance here requires additional clarifications, we are seeking implementer feedback on what type of guidance would be most useful.
{:.stu-note}

<br />

{% include link-list.md %}
