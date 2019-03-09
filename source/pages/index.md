---
title: DaVinci Data Exchange For Quality Measures Implementation Guide
layout: default
active: home
topofpage: true
---

<!-- add to  preprocesser to update the title to IG name -->


<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

##  Introduction

The purpose of this implementation guide is to support value based care data exchange in the US Realm.  However, this Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the U.S. Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards.  This Implementation Guide is the first step in creating them.

- Standards (FHIR)
- Implementation guides
- Reference implementations

This Implementation Guide is based upon the prior work from the [US Core], [QI Core], and [HEDIS] Implementation Guides and their artifacts with support from the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard balloting process.

## Background

Clinical quality measures (CQMs) are tools that help measure and track the quality of health care services that eligible clinicians (ECs), eligible hospitals (EHs), and critical access hospitals (CAHs) provide. Measuring and reporting CQMs helps to ensure that our health care system is delivering effective, safe, efficient, patient-centered, equitable, and timely care. CQMs measure many aspects of patient care, including:[^1]

- Patient and Family Engagement
- Patient Safety
- Care Coordination
- Public Health
- Population Health Management
- Efficient Use of Healthcare Resources
- Clinical Process/Effectiveness

Before Electronic Health Record (EHR) systems, chart-abstracted CQMs were predominant. Modern EHR systems enable electronic CQMs, or eCQMs.

### Who are all the players in the Quality space?[^2]
{:.no_toc}

- Policy Directors on Quality
     - National Priorities Partnership, National Quality Strategy, Centers for Medicare & Medicaid Services (CMS), Office of the National Coordinator for Health Information Technology (ONC)
- Measure Requesters
    - External demands of quality measures for accountability (CMS, National Committee for Quality Assurance [NCQA], PCPI, The Joint Commission)
    - Internal demands for quality measures for improvement (quality improvement programs)
- Measure Developers (organizations that define clinical quality measure)
    -  Measurement Development Partnership, NCQA, The Joint Commission, and others
- Standards Developers
    - HL7, Integrating the Healthcare Enterprise (IHE), International Health Terminology Standards Development Organisation (IHTSDO), and others
- Electronic Health Record (EHR)/Tool Developers
    - EHR vendors, quality reporting tool developers
- Measure Reporters and Users
    - Aggregators (organizations that collects measure data): Health Plans, Public Programs, and others
    - Providers: Healthcare organizations
- Public Health
    - Pan American Health Organization (PAHO), World Health Organization (WHO), National Institutes of Health (NIH), American Medical Association (AMA)

### Clinical Quality Measures Ecosystem and The Data Exchange For Quality Measures Implementation Guide
{:.no_toc}

The Data Exchange For Quality Measures Implementation Guide fits into the clinical quality measures ecosystem at the interface between the Measure Reporters and User as illustrated in the figure[^2] below with the red oval:

{% include img-portrait.html img="quality-improvement-ecosystem.png" %}

The Quality Improvement Ecosystem begins with information, preferably evidence-based from research public health surveillance, and data mining and other analyses performed by third parties such as payers. Such information indicates existing status and knowledge about a given clinical topic. Stakeholders such as professional societies, public health and governmental bodies and healthcare insurers have various methods for publishing such information to assure awareness among consumers, healthcare practitioners and healthcare organizations about what is known and suggested methods for managing the clinical topic. Ideally, suggested management efforts are captured and documented in guidelines based on collaboration among clinical subject matter experts, terminologists, informaticists, clinicians and consumers. Subsequent steps translate these clinical guidelines into clinical decision support (CDS) artifacts to incorporate valuable clinical recommendations and actions directly within clinical workflow. To adequately impact clinical care for clinicians and patients requires local implementation activities. Ideally, the clinical guidelines and CDS include methods for evaluating what successful implementation means, i.e., whether the clinical care ultimately provided included processes that addressed the intent of the guideline and if it achieved the desired outcomes.  To close the loop and enable continuous improvement the results of such measurement analytics must be reported for aggregate review. Reporting also serves the purpose of evaluating clinical performance and outcomes for healthcare organizations, for public health and for payers. For additional information about idealized processes for moving evidence and information from guidelines to CDS and measurement, refer to an effort by the Centers for Disease Control and Prevention (CDC) called Adapting Clinical Guidelines for the Digital Age.[^4]

### Quality Measurement Standards Landscape

This implementation guide is part of a larger FHIR-based quality improvement and quality measurement standards landscape, depicted in the following diagram:

{% include img-portrait.html img="quality-measurement-standards-landscape.png" %}

The left side of the quality measurement standards landscape diagram depicts the activities and standards associated with measure specification, while the right side depicts measure reporting.

<b>Measure specification</b> involves the end product of the measure development process, a precisely specified, valid, reliable, and clinically significant measure specification to support accurate data representation and capture of quality measures.

<b>Measure reporting</b> involves the data collection and aggregation, calculation and analytics, and ultimately reporting of quality measures.

<b>Producers</b> in the diagram represent the various stakeholders involved in the creation of healthcare data. Producers can include providers and provider systems; patients, care teams, caregivers, and patient engagement systems; and other related clinical systems such as laboratory, clinic, and hospital information systems that are primary producers of patient healthcare information.

<b>Consumers</b> in the diagram represent the various stakeholders involved in the consumption and use of healthcare data. Consumers can include data routers and aggregators, payers, health information exchanges and health integrated networks, as well as public health and other healthcare-related agencies.

<b>Specifiers</b> in the diagram represents the various stakeholders involved in the specification of quality measures for use in healthcare quality measurement and reporting. Specifiers can include quality agencies, public health, and other healthcare-related agencies, industry consortiums concerned with improving care quality, and clinical professional societies. Specifiers may also be institutions and clinics using the quality measurement standards to specify quality measures for use in their own environments and quality improvement initiatives.

The shaded areas underlying the stakeholders depict the various standards involved:

#### Fast Healthcare Interoperability Resources (FHIR)

Fast Healthcare Interoperability Resources, or FHIR, is an HL7 platform specification for healthcare that supports exchange of healthcare information between systems. FHIR is universally applicable, meaning that it can be used in a broad variety of implementation environments. The platform provides layers of implementation that support foundational protocols; base implementation functionality such as conformance and terminology; administrative functionality to represent patients, care teams, locations, and organizations; healthcare processes including clinical and diagnostic information, as well as medication, workflow, and financial; and finally, a clinical reasoning layer that provides support for the representation of knowledge and reasoning about healthcare.

The quality measurement standards landscape makes use of all these layers of FHIR: the foundational and implementation layers to define interactions and profiles; the administrative and process layers to represent the data of interest for quality measurement; and the clinical reasoning layer to specify and support evaluation and reporting of quality measures.

#### Clinical Quality Language (CQL)

Clinical Quality Language, or CQL, is an HL7 cross-paradigm specification that defines a high-level, domain-specific language focused on clinical quality and targeted for use by measure and decision support artifact authors. In addition, the specification describes a machine-readable canonical representation called Expression Logical Model (ELM) targeted at implementations and designed to facilitate sharing and evaluation of clinical knowledge.

This ability to render clinical knowledge in a high-level human-readable form as well as an intermediate-level, platform-independent machine-readable form makes CQL an ideal mechanism for specifying the criteria involved in quality measures.

#### FHIR Quality Measure Implementation Guide

The FHIR Quality Measure Implementation Guide defines conformance profiles and guidance focused on the specification of quality measures using the FHIR Measure and Library resources. The IG does not standardize the content of any particular measure, rather it defines the standard approach to the representation of that content so that quality measure specifiers can define and share standardized FHIR-based electronic Clinical Quality Measures (eCQMs).

#### Quality Improvement Core Implementation Guide (QI Core)

The Quality Improvement Core Implementation Guide, or QI-Core, defines a set of FHIR profiles with extensions and bindings needed to create interoperable, quality-focused applications. Importantly, the scope of QI Core includes both quality measurement and decision support to ensure that knowledge expressed can be shared across both domains. QI Core is derived from US Core, meaning that where possible, QI Core profiles are based on US Core to ensure alignment with and support for quality improvement data within healthcare systems in the US Realm.

#### Data Exchange for Quality Measures (DEQM)

The Data Exchange for Quality Measures Implementation Guide, or DEQM, provides a framework that defines conformance profiles and guidance to enable the exchange of quality information and quality measure reporting. The DEQM expects to use quality measures specified in accordance with the Quality Measure IG and QI Core.

### Data Model Standards Landscape

The quality improvement ecosystem covers every aspect of the healthcare delivery system, and needs to be able to represent information across that entire spectrum. FHIR provides a foundation for representation of this information in a universally applicable way. In particular cases, more specificity is required to capture the intended meaning of healthcare information. As FHIR is more and more broadly adopted, consensus among participating stakeholders on the use of particular profiles and patterns enables semantic interoperability for more use cases.

Within the US Realm, US Core profiles comprise this base consensus, and although it enables a variety of interoperability use cases, the profiles do not represent all of the requirements for quality improvement. The QI Core profiles are derived from US Core and provide this additional functionality.

There are occassional instances where additional specificity or functionality is required explicitly for quality measurement, or a particular component within a quality measure. In these cases, additional profiles are defined within the DEQM, or by stakeholders such as measure developers or implementers. For example, the Medication Reconciliation Post Discharge measure example included in this implementation guide references the HEDIS Implementation Guide, which defines profiles specific to that particular HEDIS measure.

The following diagram depicts this data model standards landscape:

{% include img-portrait.html img="data-model-standards-landscape.png" %}

As illustrated, FHIR provides the foundation, and sets of profiles are built on top of FHIR that provide more and more focused use cases by constraining profiles and extending functionality to cover gaps. While the additional layers are necessary to represent specific operations and provide space for agreement among relevant stakeholders, the consensus-based standards development process is used to suggest changes to the layers below, resulting in an ever-broadening umbrella of interoperability.

This layering of profiles balances the relative adoption and implementation maturity of FHIR and the data representation requirements of the use cases involved, guided by the following principles:

* <b>Avoid proliferation of profiles.</b> To the extent possible, make use of existing profiles at the lowest level of the stack, only defining a new profile if absolutely necessary to express a requirement for a particular use case that cannot be represented by an existing one.
* <b>Share profiles across measures.</b> There should not be profiles specific to any particular measure. Instead, QI Core provides a layer for the expression of quality improvement requirements across measures and decision support artifacts.
* <b>No terminology-narrowing-only profiles.</b> Profiles should not be used to specify only terminology narrowing constraints. The FHIR Clinical Reasoning module and CQL enable the representation of data requirements for quality measures and decision support artifacts.
* <b>Promote data-related profiles.</b> When it becomes necessary to define a data-related profile at the measurement-specific level (in DEQM or HEDIS for example), steps should be taken to promote that profile to the broadest consensus group possible.

#### FHIR Version Support

* <b>FHIR DSTU2</b> - This version has broad support among US-based vendors as it is the basis for the Argonaut profiles. Most major vendors today support some subset of this version of FHIR.
* <b>FHIR STU3</b> - This is the version that US Core, QI Core, and many other implementation guides are based on. There is broad vendor support for this version.
* <b>FHIR R4</b> - This is the first normative release of FHIR, including several of the foundational, conformance, and administrative resources going normative.

The implementation guides in this landscape are currently focused on FHIR STU3, with the plan to produce R4 versions once the US Core and QI Core profiles have been updated to R4.

## Quality Reporting Scenarios

This implementation guide describes two groups of quality reporting scenarios. Exchange scenarios, focused on exchanging subsets of the data-of-interest for a particular measure or set of measures throughout the reporting period, and Reporting scenarios, focused on communicating the results of a quality measure at the end of a reporting period as part of a quality improvement initiative.

{% include img-portrait.html img="quality-reporting-scenarios.png" %}

### Exchange Scenarios

Exchange scenarios are used to exchange subsets of the data-of-interest for a measure or set of measures throughout the measurement period. These scenarios enable providers and quality stakeholders such as payers, accountable care organizations, and other secondary use partners to keep better track of how patients are performing with respect to a particular quality measure during the measurement cycle.

<p>The three exchange scenarios are:</p>

1. <b>Submit Data</b> - Used by a producing system to submit a subset of the data-of-interest for a measure to a consuming system
1. <b>Collect Data</b> - Used by a consuming system to collect a subset of the data-of-interest for a measure from a producing system
1. <b>Subscription</b> - Used to allow the producing system to notify the consuming system when new or updated data-of-interest for a measure is available

### Reporting Scenarios

Reporting scenarios are used to report the results of quality measures on patients or populations at the end of a reporting period. Measure reports are provided to attest the standard of care given to patients in a population as measured by specific quality measures. The measures are typically identified as part of a quality improvement program or initiative by a payer or other quality improvement stakeholder.

The reporting scenarios are:

1. <b>Individual</b> - Used to report the results of a quality measure for a particular patient along with the complete set of data-of-interest to a quality reporting receiver
1. <b>Summary</b> - Used to report the results of a quality measure for the applicable population to a quality reporting receiver

## How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for the Data Exchange For Quality Measures Implementation Guide.

- [Framework]\: This page provides general guidance on a set of FHIR transactions that provide a general framework to enable the Exchange of Quality Measure Data between Data “Aggregators” (organizations that want to evaluate quality measures) and Providers (organizations that deliver care to patients).

- Use cases:
    - [Medication Reconciliation (MRP)]\: This page provides specific guidance on the FHIR API surrounding the process by which a message can be sent from a provider EHR to a Payer attesting that a medication reconciliation post-discharge was performed on a covered member.

    - [Colorectal Cancer Screening (COL)]\: The colonoscopy measure (HEDIS Colorectal Cancer Screening/CMS130) is an example of a process measure evaluating screenings for preventive health services.  Screening measures assess the number of eligible persons receiving clinical guideline recommended screening services during the measurement period.

    - [Venous Thromboembolism Prophylaxis (VTE-1)]\: VTE-1 is an example based on an existing CMS Eligible Hospital program measure (CMS108v7).  It is an example of a process measure, using proportion scoring and is within the Preventative Care Meaningful Measure Area.

- [Profiles and Extensions]\: This page lists the set of Profile and Extension that are used in the Data Exchange For Quality Measures (DEQM) transactions to exchange quality data.

- [Operations]\: This page lists the standard FHIR and DEQM defined Operations that are used in the DEQM transactions to exchange quality data.

- [Terminology]\: This page lists the value sets and code system defined in the DEQM guide and used in the DEQM transactions to exchange quality data.

- [Capability statements]\: This set of pages describes the expected FHIR capabilities of the various DEQM actors.

- [Downloads]\: This page provides links to downloadable artifacts for implementations.

<br />

---

**This Implementation Guide was made possible by the thoughtful contributions of the following people and organizations:**

- *The twenty-two founding [Da Vinci Project](http://www.hl7.org/about/davinci/index.cfm?ref=common) member organizations.*

- *Linda Michaelsen, Optum*
- *Eric Haas, Health eData Inc*
- *Bryn Rhodes*
- *Viet Nguyen, Stratametrics*
- *Jocelyn Keegan, Point of Care Partners*
- *Robert Dieterle, EnableCare*
- *Lloyd Mckenzie, Gevity*
- *Grahame Grieve*

---

{% include link-list.md %}
