---
title: General Guidance and Definitions
layout: default
active: guidance
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## Operations for Exchange of Data for Quality Measures between Payer and Provider EHR**

 - assumes Payer is the “Aggregator” of the individual events in the measure
 - When using MeasureReport, the Measure resources will define the actual Measure requested or posted
 - No CQL is involved on the Provider EHR side in this example
 - CQL may or may not be used on the Payer (Aggregator) side

### Option 1: POST by Provider

{% include img.html img="postoption.png" %}

### Option 2: GET by Payer

{% include img.html img="getoption.png" %}

### Option 3: PUB/SUB model where Payer is the subscriber

{% include img.html img="pubsuboption.png" %}

### Workflow Overview

{% include img.html img="postwf.png" caption="POST (push) Based Workflow" %}

`API doc (POST operation) ...todo...`

{% include img.html img="getwf.png" caption="GET (pull) Based Workflow" %}

`API doc (POST operation) ...todo...`

{% include img.html img="pubsubwf.png" caption="Subscription Based Workflow" %}

`API doc (Create Sub, POST notification, POST operation) ...todo...`

## Must Support

- This guide adopts the US Core definition for *[Must Support]* and add the following expectations:

- The receiver of data may not be able to complete processing and may "error out" if a Must Support element is unavailable.

## Usage

example how to use a button to expand an inline example....

{% include examplebutton.html example="foo" %}

{% include link-list.md %}
