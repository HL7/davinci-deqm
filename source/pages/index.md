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
{% include publish-box.html %}


<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

##  Summary

The purpose of this implementation guide is to support value based care data exchange. The profiles in this implementation guide derive from and extend the [QI Core profiles] where available to provide a common foundation for building, sharing, and evaluating knowledge artifacts for value based care data exchange in the US Realm.

As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring [Clinical Quality Information (CQI)] and [Clinical Decision Support (CDS)] workgroups and are incorporated as part of the standard balloting process.

##  Background

This Implementation Guide derived from the [US Core], [QI Core], and [HEDIS] profiles with support from the [Da Vinci] initiative which is a private effort to accelerate the adoption of HL7 Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. The HL7 CQI Work Group maintains this Implementation Guide, co-sponsored by the Clinical Decision Support (CDS) HL7 Work Group, to inform electronic clinical quality improvement (i.e., measurement and decision support). This Implementation Guide can be usable for multiple use cases across domains, and much of the content is likely to be usable outside the U.S. Realm.

Interoperability challenges have limited many stakeholders in the healthcare community from achieving better care at lower cost. The dual challenges of data standardization and easy information access are compromising the ability of both payers and providers to create efficient care delivery solutions and effective care management models.

To promote interoperability across value-based care stakeholders and to guide the development and deployment of interoperable solutions on a national scale, the industry needs common:

- Standards (FHIR)
- Implementation guides
- Reference implementations

This Implementation Guide is the first step in creating these common artifacts.

## FHIR Profiles and Operations

This Guide (IG) defines a set of FHIR operations, profiles and extensions to create interoperable, quality-focused applications. Payers and providers need common transport tools to share the data required to reflect complete and accurate quality measures. Existing [QI-Core] and [HEDIS] profiles are used as well as DEQM profiles derived from them. These profiles provide a common foundation for building, sharing, and evaluating knowledge artifacts across quality improvement efforts in the US Realm. This IG will leverage STU3 in order to take advantage of FHIR currently in production and R4 to better utilize the additional Resources and elements available in R4.  For elements added in R4, extensions will be created for the STU3 version.  This  IG also utilizes standard FHIR Operations and Subscription transactions to exchange quality data.

<br />

{% include link-list.md %}
