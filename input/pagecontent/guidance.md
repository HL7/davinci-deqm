
### Introduction
Clinical Quality Measures are a common tool used throughout healthcare to help evaluate and understand the impact and quality of the care being provided to an individual or population.

The Data Exchange for Quality Measure (DEQM) Implementation Guide defines the interactions for two purposes in the Quality Measure Ecosystem.  

- The first interaction is when a Producer, such as a practitioner, or owner of data needs to exchange that data with a Consumer of that data, such as a payer, a registry or public health agency. We call this the [Data Exchange] Scenario. Examples of this interaction might be when a provider has patient information from a recent visit that he needs to share with a payer under a value based contract. There may also be use cases where the Producer in this scenario is a Payer and needs to exchange data with a Provider.

- The second interaction is when a Reporter needs to exchange a measure report with a Receiver. This guide addresses the Individual Measure Reporting and the Summary Reporting. As an example, Individual Measure Reports may be used by hospitals acting as the Reporter to report a specific measure to a payer acting as a Receiver. Similarly, Summary Measure Reports may be used to report yearly eCQM results on a specific measure.

- The third interaction is Gaps in Care Reporting. Gaps in Care Reporting is used to report the [open and/or closed gaps] for quality measures over a [gaps through period] specified by a Client. Optionally, it is also used to report details to the open gaps identified and mitigation steps for addressing them. It further provides capability of associating clinical data included in the report with the population criteria (i.e. denominator, numerator) of a measure that they apply to.

### Preconditions and Assumptions

-  Although the exact mechanisms for securing these exchanges are not specified as part of this implementation guide:

    -  Exchanges are limited to mutually agreed upon (i.e., between the Producer and Consumer) patients list or population.

    -  Systems should use standard authentication and authorization approaches.  The [SMART App Launch] and [SMART backend services] authentication/authorization approach are recommended models.

-   The Measure resource is used to provide both human- and
    machine-readable definitions of a quality measure

-   The MeasureReport provides an association to a specific quality
    measure and links the submitted data together to simplify processing
    for the receiver.

-   It is the responsibility of the Producer to ensure that measure data is present in a structured, retrievable form.

-   The required data is represented in the referenced resources defined
    by the MeasureReport.

    -  Multiple MeasureReport may reference the same instance of a resource.

-   Both Consumers and Producers *should* use a common clinical
    quality language (CQL) that would allow the same measures to be
    applied in healthcare and at the aggregator. This would also enable
    the application of the same measures across populations that span
    multiple Consumers (such as payers). Using common measures across payers reduces development burden for FHIR implementers.

    -  The MeasureReport profiles in this IG are used to report CQFM Measures. In the context of the FHIR Clinical Quality Framework, CQL is used to facilitate the definition and execution of measures, however the CQFM Measure profile does not require the use of CQL. DEQM MeasureReports can reference any CQFM Measure, including those not utilizing CQL.

### DEQM MeasureReport Profiles

The MeasureReport resource is used as an organizer for both the Data Exchange Scenario and for measure reporting scenario. To meet the different needs in these scenarios, DEQM has created 3 MeasureReport profiles.  Technically the type of profiles can be determined by inspecting the `meta.profile` element if present or the `type` element.

The MeasureReport resource is also used for the Gaps in Care Reporting Scenario. A DEQM MeasureReport profile defined in this guide is used to support the needs of Gaps in Care Reporting.

#### Data Exchange

The [DEQM Data Exchange MeasureReport Profile] is used to get the data from the producer to a consumer of the data.  The consumer might be a system that calculates the measure report but they could also be an aggregator who sends that data on to another system to do measure calculation and reporting.
Along with Data-Exchange MeasureReport Profile, the data producer sends the Organization, Patient and any relevant resources for the measure they have produced data on. When a data producer, such as a practitioner,  sends a MeasureReport bundle, they may not have all the data that is required to calculate the measure report. One example might be because the measure requires outcome data from at a later point in time during the measurement period. Another example where the data producer may not have all the data would be continuous coverage period as the producer of the data may not know the patient was covered on the day the patient was seen.  The Consumer (in this case the payer as aggregator) is the owner of all coverage information.  Therefore, only the consumer could determine if the continuous coverage period requirement is met.

#### Duplicate Data

Implementations SHOULD avoid sending duplicate data (identical FHIR resources) in data exchanges (collect-data or submit-data) or as resolvable references in MeasureReport.evaluatedResources.

Duplicate data is a concern in DEQM because the operations support multiple measures per subject. The same resource instance could be referenced by multiple MeasureReports, or multiple measures may use different elements within the same resource. Another situation to consider when evaluating a measure is when multiple value sets have overlapping codes, then two different CQL retrieve operations can return the same resource instance because it matches a code twice from the overlap.

Note that the $data-requirements operation is currently defined for a single Measure or Library, so it is a responsibility of the data producer to check for, and address, duplicate data.

The Bundles utilized in DEQM operations SHOULD be organized by subject – meaning that a Bundle contains all of the MeasureReport(s) and associated data of interest or evaluated resources for a subject. This reduces the potential for proliferation of duplicate data because resources common to the subject, such as Encounters, would not be repeated across Bundles. A resource instance SHALL occur only once for the data of interest and evaluated resources for with the Bundle. See ([Resource URL & Uniqueness rules in a bundle](https://hl7.org/fhir/R4/bundle.html#bundle-unique)).

Receiving systems need to consider the possibility that some duplicate data may be present across Bundles, such as an Organization resource that is relevant to more than one subject.

#### Measure Reporting

Measure Reporting is done by a Reporter who has all of the data that is required to generate a report(s). Two profiles for measure reporting have been defined in this guide.

The [DEQM Individual MeasureReport Profile] is used when a measure is reported for a specific patient. It contains all of the data that is relevant to generate the report including the measure outcome and is similar to a QRDA Category 1 report.  The MeasureReport(s) are packaged in a FHIR Bundle with Organization, Patient and any other resources that were used to calculate this measure.

The [DEQM Summary MeasureReport Profile] is used when a measure is reported   for a group of patients at the conclusion of a measure measurement period. It  includes the measure outcome data and is similar to a QRDA Category 3 report.  Unlike the [DEQM Individual MeasureReport Profile], the report is typically transacted as a single MeasureReport report.  Although several Summary reports may be transacted together as Bundle.

#### Data Quality

Measure specifications define logic and data requirements necessary to perform evaluation of a given measure, often through the use of CQL definitions. The use of CQL definitions/queries supports the retrieval of applicable data elements and associated metadata. Measure specifications will typically make use of a set of defined profiles suitable for use in the target environment, such as US Core or QI Core, to ensure that data exchanged is standardized, consumable, and suitable for evaluation.

#### Gaps in Care Reporting

Gaps in Care Reporting can be requested by a Client to a Server system that has all of the data that is known about the patient(s) at a point in time during a [gaps through period]. The [care-gaps](OperationDefinition-care-gaps.html) operation is used to request and receive Gaps in Care Report for measures.

When the [care-gaps](OperationDefinition-care-gaps.html) operation is run on the Server, it returns a FHIR Bundle for each patient. The bundle conforms to the [DEQM Gaps In Care Bundle Profile], which must contain a Composition that uses the [DEQM Gaps In Care Composition Profile]. The DEQM Gaps In Care Composition references one to many MeasureReport resource; each MeasureReport is for a single measure and conforms to the [DEQM Individual MeasureReport Profile]. Optionally, the actual individual MeasureReport resources referenced are also packaged in the same DEQM Gaps In Care Bundle, along with Patient, Organization, and other resources that were used to calculate this measure. A DetectedIssue resource defined using the [DEQM Gaps In Care DetectedIssue Profile] must be included to indicate gap status of that measure via the [DEQM Gap Status Extension], a modifier extension.

The DEQM Individual MeasureReport contains all of the data that is relevant to calculate the report including the measure outcome and indication of [open gaps]. The [care-gaps](OperationDefinition-care-gaps.html) operation determines the gaps status for the patient for a specific measure based on the measureScore data contained in the MeasureReport. Depending on what input parameters are provided to the [care-gaps](OperationDefinition-care-gaps.html) operation for generating a Gaps in Care Report, a DEQM Gaps In Care Composition may contain reports for measures with only [open gaps], only [closed gaps], or both [open and closed gaps]. The [DEQM Population Reference Extension] to the `evaluatedResource` is added to the [DEQM Individual MeasureReport Profile] to support associating an evaluated resource with a specific measure population or populations that it applies to. For example, a colonoscopy procedure done for an individual 5 years ago is used to meet the numerator population criteria when evaluating the colorectal cancer screening measure for the individual. Through the use of this [DEQM Population Reference Extension], the Server can indicate this colonoscopy procedure data was used for evaluating the numerator population, identified by the population group id for numerator specified in the Colorectal Cancer Screening Measure resource.

### DEQM Operation Bundles Organized by Subject

The Bundles used in the DEQM operations enable the evaluation and exchange of data for multiple measures, while also constraining duplicate data. Each Bundle SHOULD contain the resources, including MeasureReports and data of interest (MeasureReport.evaluatedResources), for all of the measures that apply to a single subject. Organizing the Bundles by subject means that resources are less likely to be duplicated when used by multiple measures. Resources that are not unique to the subject, such as Pracitioner or Organization, may still be duplicated across Bundles. 

### Default Profiles Used in the Evaluation of a Measure

 Depending on the specific Measure and Interaction, *[Default Profiles]* from DEQM, QI Core, and CQFM are used in the evaluation of a measure and referenced by a MeasureReport. These profiles apply to *any resource* that does not otherwise have an explicit profile assigned by the  implementation guide.  Note that several DEQM [Profiles] are  derived from QI Core profiles and are used as the default instead of the corresponding QI Core profile.  Refer to the [QI Core] implementation guide for examples of how to represent data involved in calculation of quality measures.

<div class="new-content" markdown="1">
[QI Core Practitioner], [QI Core Organization], and [QI Core Coverage] profiles have replaced respective DEQM specific profiles and are used to model reporters and participating practitioners and organizations.


### Negation Patterns for Quality Measures

When DEQM is used to report CQFM Measures that use CQL and the QI-Core data model, negation patterns allow identifying when events are not present or when events are documented as not occurring for a reason.  They may appear throughout a measure in any of the population criteria. For example, the absence of a particular medication may be grounds for membership in the initial population, denominator, numerator, or an exclusion or exception criteria, depending on how the measure is constructed. The negation pattern for the MedicationRequest (MedicationNotRequested) resource is demonstrated in the [Single Indv Vte Report Option 7] example. For more information refer to the [Using CQL IG section on negation] and the [QI Core Negation] page.


### Using Contained Resources in the Response Transaction

[Contained resources] **SHOULD NOT** be used when responding to the submit-data or collect-data operation or to the Individual reporting transactions.  The data exchange transaction payloads are Parameters resources containing resource parameters. The response to the individual reporting transactions are Bundles. The only time contained resource can be used is when the source data exists only within the context of the transaction. For example, if the only information about the patient's coverage is the payor name, the Coverage resource could be contained by the Patient resource:

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

When exchanging data and reporting with DEQM, any Must Support flags in the supporting data model should be respected when exchanging data with DEQM profiles. The use of DEQM profiles alone does not imply that evaluated resources are valid to base FHIR or any other FHIR profiles.

For more information, see the definition of [Must Support](http://hl7.org/fhir/R4/conformance-rules.html#mustSupport) in the base FHIR specification.

Must Support guidance here requires additional clarifications, we are seeking implementer feedback on what type of guidance would be most useful.
{:.stu-note}

<br />

{% include link-list.md %}
