---
title: DaVinci Data Exchange For Quality Measures HomePage
layout: default
active: home
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

<!-- add to  preprocesser to update the title to IG name -->


<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

##  Summary

The purpose of this implementation guide is to support value based care data exchange in the US Realm.  However, this Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the U.S. Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models. To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common information models and data exchange standards.  This Implementation Guide is the first step in creating them.

- Standards (FHIR)
- Implementation guides
- Reference implementations

This Implementation Guide is based upon the prior work from the [US Core], [QI Core], and [HEDIS] Implementation Guides and their artifacts with support from the [Da Vinci] initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard balloting process.

### Background

Clinical quality measures (CQMs) are tools that help measure and track the quality of health care services that eligible professionals (EPs), eligible hospitals, and critical access hospitals (CAHs) provide. Measuring and reporting CQMs helps to ensure that our health care system is delivering effective, safe, efficient, patient-centered, equitable, and timely care. CQMs measure many aspects of patient care, including:[^1]

- Patient and Family Engagement
- Patient Safety
- Care Coordination
- Population/Public Health
- Efficient Use of Healthcare Resources
- Clinical Process/Effectiveness

#### Who are all the players in the Quality space?[^2]
{:.no_toc}

- Policy Directions on Quality
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

#### Clinical Quality Measures Ecosystem and The Data Exchange For Quality Measures Implementation Guide
{:.no_toc}

The Data Exchange For Quality Measures Implementation Guide fits into the clinical quality measures ecosystem at the interface between the Measure Reporters and User as illustrated in the figure[^2] below with the red oval:

{% include img-portrait.html img="DEQM_ecosystem.jpg" %}

For further information about the [Clinical Quality Framework].

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for the Data Exchange For Quality Measures Implementation Guide.

- [Guidance and Overview]\: This page provides general guidance on a set of FHIR transactions that provide a general framework to enable the Exchange of Quality Measure Data between Data “Aggregators” (organizations that want to evaluate quality measures) and Providers (organizations that deliver care to patients).

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

[^1]: https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures.html
[^2]: https://www.hl7.org/documentcenter/public_temp_6C1C8F48-1C23-BA17-0C77FDFC69A7B6F1/calendarofevents/himss/2017/Health%20IT%20Enabled%20Quality%20Measurement%20and%20Improvement_The%20HL7%20Clinical%20Quality%20Work%20Group.pdf

{% include link-list.md %}
