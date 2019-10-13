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

A summary report contains calculated summary data for one or more Clinical
Quality Measures (CQMs) for a specified population of patients within a
particular health system over a specific period of time. For example, for a
colorectal cancer screening CQM, "the data-of-interest" is the patient counts of
initial population, denominator, denominator exclusions, and numerator
respectively for a specified population of patients. Summary reports may also
contain summary data for stratifier criteria (such as gender or age) as defined
in a CQM.

The Summary reporting scenario is supported by the [DEQM Summary MeasureReport
Profile]. Transactions between Reporters (for example, organizations that deliver care to patients, such as a practice or hospital) and Receivers (organizations that want to evaluate CQMs, such as quality reporting programs) are triggered by specific administrative events such as the submission of summary level quality reports for CQMs to various quality reporting programs.

## Profiles

The following resources are used in the summary reporting scenario:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Measure|CQFM Measure Profile|[CQFM Measure]|
|Summary MeasureReport|DEQM Summary MeasureReport Profile|[DEQM Summary MeasureReport Profile]|
|Organization|DEQM Organization Profile|[DEQM Organization]|

## Summary Measure Reporting

When the results of a quality measure are completed for a population at the end of a reporting period, they are POSTed to the quality measure Receiver's FHIR Server. The report may only consist of the Summary MeasureReport in which case it is POSTed to the MeasureReport endpoint.  If there are other referenced resources all the resources are bundled together as a set of `POST` interactions and sent as a single [transaction] interaction using the Standard FHIR API.

{% include img-narrow.html img="summ_report_post.jpg" caption="Figure 2-11 POST Summary Report" %}

### Usage
{:.no_toc}

for a single MeasureReport:

`POST|[base]/MeasureReport`

for a Bundle Transaction:

`POST|[base]`

{% include examplebutton.html example="mrp-summary-report-example" b_title = "Click Here To See POST summary Report Example" %}

<br />

{% include link-list.md %}
