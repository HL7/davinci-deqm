---
title: Summary Measure Reporting Interactions
layout: default
active: guidance
topofpage: true
---


{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction

Measure reporting scenarios include individual patient level quality
reporting scenario (referred to as individual reporting) and summary
level quality reporting scenario (referred to as summary reporting).
This section provides guidance to the summary reporting scenario.

A summary report contains calculated summary data for one or more
Clinical Quality Measures (CQMs) for a specified population of patients
within a particular health system over a specific period of time, which
would be the intent of "data-of-interest" in this scenario. For example,
for a colorectal cancer screening CQM, the data-of-interest is the
patient counts of initial population, denominator, denominator
exclusions, and numerator respectively for a specified population of
patients. A Summary report could also contain summary data for
stratifier criteria as defined in CQMs.

Summary reporting scenario is supported by the [DEQM Summary MeasureReport Profile]. The MeasureReport.type element in this profile is set to "summary". Transactions between Providers (organizations that deliver care to
patients, such as practices and hospitals) and Data "Aggregators"
(organizations that want to evaluate CQMs, such as quality reporting
programs) are triggered by specific administrative events such as the
submission of summary level quality reports for CQMs to various quality
reporting programs.

## Profiles

The following resources are used in the summary reporting scenario:

|Resource Type|Profile Name|Link to STU3 Profile|Link to R4 Profile|
|---|---|---|---|
|Measure|DEQM Measure Profile|[DEQM Measure (STU3)]|[DEQM Measure (R4)]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile (STU3)]|[DEQM Summary MeasureReport Profile (R4)]|
|Organization|DEQM Organization Profile|[DEQM Organization (STU3)]|[DEQM Organization (R4)]|

## POST Data Operation

<br />

{% include link-list.md %}
