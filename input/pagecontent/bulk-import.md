{:toc}

### Bulk $import Overview

The bulk $import operation provides a mechanism for performing measure data
exchange at scale, allowing a single operation invocation to 
[submit data](datax.html#submit-data) for
multiple subjects on multiple measures across those subjects. Due to the
potential for a significant amount of data to be transferred, the operation
leverages the [asynchronous interaction request 
pattern](https://hl7.org/fhir/R5/async-bundle.html), allowing the transfer of
the data to be spread out over a longer period of time without compromising the
ability of the Producer to receive results including any errors that may have
occurred.

### Basic Flow

The basic flow of the `$import` operation uses the [Asynchronous Interaction
Request Pattern](https://hl7.org/fhir/R5/async-bundle.html) applied to the
measure data exchange workflow as follows:
1. **Gather**: The Producer gathers the data for submission (e.g., [by gathering
   data requirements](datax.html#gather-data-requirements-from-consumer))
   and organizes them into a set of [inputs](#inputs)
   that the Consumer will retrieve.
2. **Initiate**: The Producer invokes the [`$import` operation] on the Consumer's system,
   providing a list of URLs the Consumer can use to retrieve the gathered
   inputs, along with metadata needed for the Consumer to understand the
   request and retrieve and process the inputs in the form of an [Import
   Manifest](StructureDefinition-ImportManifest.html). If the request is
   accepted, the Consumer 
   [responds](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.2.0.2) 
   with a location the Producer can use to ask the Consumer for the status of
   the request.
3. **Process**: During the processing phase of the operation the following
   actions will be performed repeatedly without a specific order:
    1. The Consumer will *retrieve* the specified inputs from the Producer.
    2. The Consumer will *ingest* the retrieved inputs, performing whatever steps 
       it needs to effect the data exchange.
    3. The Producer will *poll* the Consumer to get the status of the processing,
       which during this period will always return 
       [`in-progress`](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.4.0.1).
4. **Finish**: Once the Consumer has completed the retreival and processing of all inputs, 
   subsequent polls by the Producer will return a 
   [complete](https://hl7.org/fhir/R5/async-bundle.html#3.2.6.2.4.0.3) response
   that includes a Bundle with the [result](StructureDefinition-ImportResult.html)
   of the `$import` operation.

<br clear="all" />
<figure style="text-align:center"><img src="./import_basic_flow.png" alt="$import interaction diagram" width="70%" /></figure>
<br clear="all" />

### Technical Details

This specification provides detailed requirements around the transfer of data
using the `$import` operation. The following sections provide an overview of these
requirements with links to technical artifacts, including
- [Input Layout](#input-layout)
- [Manifest](#manifest)
- [Results](#results)
- [$import Operation](#import-operation)

In contrast, details of what happens before and after the transfer are left
up to the implementations and the supported use cases, specifically
- how data to transfer is selected and gathered by the Producer, and
- how the received data is processed by the Consumer.

#### Input Layout

Once the Producer has selected the data to be sent to the Consumer, the
`$import` operation supports several options for how instances are orgnized
within the inputs to be transferred. Trading partners using `$import` can
choose to 
- Prioritize transfer of each instance exactly once by using the [by 
type](#by-type) layout, or
- Priotize self-contained subject data packets (e.g., Patients) using the [by
subject instances](#by-subject) layout, or
- a hybrid approach where [some resource types are split-out](#by-subject-with-shared-instances-split-out) into their own inputs.

These options allow trading partners to choose how to best optimze the data
transfer for their use case and implementations.

Complete technical details and requirements can be found in [this
section](#inputs). Most of the requirements are not specific
to the DEQM use case, with the exception being [these requirements](#measurereport-instances) around 
MeasureReport instances.

#### Manifest

The Producer uses the [import manifest](StructureDefinition-ImportManifest.html) 
it provides as the input to the Consumer's `$import` operation to tell the
Consumer what data should be transferred, how to retrieve it, how the inputs
are organized, and any other necessary details.

The definition of the [Import Manifest](StructureDefinition-ImportManifest.html)
in this implementation guide provides both
1. A [general structure](StructureDefinition-ImportManifest.html#general-structure)
   for organizing the information within the manifest, and
2. Specific [patterns](StructureDefinition-ImportManifest.html#patterns-and-examples)
   for specifying common options for data transfer and input content and layout. 
   
Trading partners exchanging data using the `$import` operation are expected to
select from and re-use the available pattern where possible and also extend them
within the provided structure when the patterns don't meet their needs.

#### Results

The [Import Results Profile](StructureDefinition-ImportResult.html) provides a structure
for returning feedback to the Producer on any problems encountered during processing
of the import request.

#### $import operation

The technical definition of the [`$import`](OperationDefinition-import.html)
operation defines how the Producer will invoke the operation, providing the
[manifest](#manifest), and how the Consumer will return the [results](#results)
within the framework of the [asynchronous interaction request 
pattern](https://hl7.org/fhir/R5/async-bundle.html).

### Inputs

The inputs of a bulk `$import` operation are the data files that the data 
source requests the data recipient retrieve and process. The determination
of which instances to include in the transferred inputs is left up to the data
source and its trading partner, however the data set and its representation
must meet the technical requirements detailed in this section.

#### Input Format

**Conformance Requirement 2.1 (Input Format):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-1)
{: #conformance-requirement-2-1}
    1. Inputs SHALL be formatted as ndjson (see https://github.com/ndjson/ndjson-spec) 
       with each individual line containing a single FHIR resource instance.

#### Input Layout Options

Non-bulk approaches to measure data submission include packages of data that
are specific to a subject (typically a patient) and a measure. This means that
instances shared between measures and across patients (e.g., organizations,
locations, and medications) must be transferred multiple times. The benefit
of this duplication is that each packet of data is self-contained and can be
processed independently.

The $import operation can be used to transfer data for multiple measures and
patients meaning that instances used in multiple calculations can potentially
be transferred only once. However, re-using instances complicates processing as
referenced instances may be spread across multiple inputs instead of localized
to a self-contained package. The trade-offs between optimizing for space or
self-contained packets will depend on the use case and trading partners.
Therefore, this operation supports a range of options that can be chosen based
on the needs of the particular use. 

**Example Data Set**{: #example-data-set}

To help explain the layouts pictorally, each section below contains a diagram
of how the following data set might be split into files using that layout
and where references would be found:
1. Patient instances with no outbound references
2. Practitioner instances with no outbound references
3. Observation instances that reference Patient and Practitioner instances
4. MeasureReport instances that reference Patient and Observation instances

##### *By type*

To optimize for de-duplication of instances, inputs can be organized *by type*
where inputs contains only instances of a single resource type. This approach
follows the approach of outputs returned by the bulk $export operation (see the
Description of the `output` field 
[here](https://hl7.org/fhir/uv/bulkdata/STU2/export.html#response---complete-status)).

When laying out a set of instances using the *by type* approach, the following
requirements apply:

**Conformance Requirement 2.2 (*By Type* Inputs):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-2)
{: #conformance-requirement-2-2}
    1. Each instance in the set SHALL appear in exactly one input.
    2. Each input SHALL contain resources of only one resource type.
    3. The set of inputs MAY contain more than one input for each resource type.

See [Input size limits](#input-size-limits) below for considerations around
when to split files and specific requirements. Note that contained instances
are not considered to be in the set of instances as their are considered to be
part of their enclosing instance.

Examples of this layout can be found within [this section below](#layout-by-type)
and the following diagram shows how files would be organized for the 
[example data set](#example-data-set):

<br clear="all" />
<figure style="text-align:center"><img src="./by_type.png" alt="by type layout example" width="65%" /></figure>
<br clear="all" />

##### *By subject*

To optimize for self-contained packages, inputs can be organized *by subject*.
Most commonly, the subjects will be Patient instances, but this approach allows
for other resource types to be subjects as well, 
[including MeasureReport](#measurereport-instances). In this approach, submitted
instances are grouped by the subject into blocks which are then grouped into
inputs.

Inputs that are laid out *by subject* use the same `ndjson` format as *by type*
inputs with the following differences
- They contain instances of multiple resource types.
- In addition to instances within the transferred data set, they include
  additional [Subject Block Header Parameters](StructureDefinition-SubjectBlockHeader.html) instances as described in this
  section.

###### Subejct Blocks

Subject blocks are the self-contained set of data for a single subject. They
contain the following components:
- A block header: an instance of the [Subject Block Header Parameters
  profile](StructureDefinition-SubjectBlockHeader.html) 
  which signals the start of the block. As defined in the profile, 
  it must contain a relative reference to the instance in its `subject` 
  parameter.
- The subject of the block is the instance referenced by the `subject`
  parameter in the [header](StructureDefinition-SubjectBlockHeader.html), 
  which is a relative reference (`[resource type]/[id]`) that defines the 
  resource type of the subject and its `id`.
- The set of instances contained in the block are all the instances starting 
  with the instance immediately following the [Subject Block Header 
  Parameters](StructureDefinition-SubjectBlockHeader.html) instance up to the next 
  [Subject Block Header Parameter](StructureDefinition-SubjectBlockHeader.html)
  instance or the end of the input.

Each block will meet the following requirements:

**Conformance Requirement 2.3 (*By Subject* Blocks):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-3)
{: #conformance-requirement-2-3}
    1. The first instance in a block SHALL be the instance representing the subject.
    2. The resource type and id of the first instance SHALL be the same as those for
       the subject of the block.
    3. Each block SHALL have a unique subject instance.
    4. All instances in a block’s set of instances SHALL be either the subject
       instance or linked to the subject directly through a reference element 
       (inbound to, or outbound from the subject instance) or
       indirectly through a chain of such references.
    5. All instances referenced by instances in a block’s set of instances SHALL
       be present in the block.
    6. The subjects of all blocks in the inputs SHALL have the same resource type.

This snippet shows a block for subject `Patient/Pat-123` laid out in `ndjson`. Note how Practitioner 
instances (e.g., snippet line 6) linked from Observations linked to the subject (e.g., snippet line 5)
are included in the subject's block:
```
{"resourceType":"Parameters","parameter":[{"name":"subject","valueReference":{"reference":"Patient/Pat-123"}}]}
{"resourceType":"Patient","id":"Pat-123",...}
{"resourceType":"MeasureReport","subject":{"reference":"Patient/Pat-123"},"evaluatedResource":[{"reference":"Observation/Obs-1"},...],...}
...
{"resourceType":"Observation","id":"Obs-1","subject":{"reference":"Patient/Pat-123"},"performer":[{"reference":"Practitioner/nurse"}],...}
{"resourceType":"Practitioner","id":"nurse",...}
...
```

For a complete example of a subject block see [this section below](#layout-by-subject-patient).

###### Grouping blocks into inputs

An input laid out by subject will contain one or more subject blocks and will meet the following requirements:

**Conformance Requirement 2.4 (*By Subject* Inputs):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-4)
{: #conformance-requirement-2-4}
    1. A subject-based input SHALL contain at least one block and MAY contain more
       than one block.
    2. Subject-based inputs SHALL contain only entire blocks (blocks SHALL NOT be
       split across multiple inputs) unless the block is larger than the file size
       limit.
    3. The header and the set of instances in each block SHALL each appear a single
       ndjson lines in the input.

For information on how to handle blocks that are larger than the input size limit, see
[this section](#special-case-subjects-too-large-for-a-single-input) below.

This snippet shows an input with two subject blocks `Patient/Pat-123` and `Patient/Pat-456` 
laid out in `ndjson`. Note how Practitioner instances included in multiple subject
blocks are included in each block (e.g., snippet lines 6 and 15):
```
{"resourceType":"Parameters","parameter":[{"name":"subject","valueReference":{"reference":"Patient/Pat-123"}}]}
{"resourceType":"Patient","id":"Pat-123",...}
{"resourceType":"MeasureReport","subject":{"reference":"Patient/Pat-123"},"evaluatedResource":[{"reference":"Observation/Obs-1"},...],...}
...
{"resourceType":"Observation","id":"Obs-1","subject":{"reference":"Patient/Pat-123"},"performer":[{"reference":"Practitioner/nurse"}],...}
{"resourceType":"Practitioner","id":"nurse",...}
...
{"resourceType":"Parameters","parameter":[{"name":"subject","valueReference":{"reference":"Patient/Pat-456"}}]}
{"resourceType":"Patient","id":"Pat-456",...}
{"resourceType":"MeasureReport","subject":{"reference":"Patient/Pat-456"},"evaluatedResource":[{"reference":"Observation/Obs-2"},...],...}
...
{"resourceType":"Observation","id":"Obs-2","subject":{"reference":"Patient/Pat-456"},"performer":[{"reference":"Practitioner/nurse"}],...}
{"resourceType":"Observation","subject":{"reference":"Patient/Pat-456"},"performer":[{"reference":"Practitioner/doctor"}],...}
{"resourceType":"Practitioner","id":"doctor",...}
{"resourceType":"Practitioner","id":"nurse",...}
...
```

For a complete version of an input with multiple subject blocks see 
[this section below](#layout-by-subject-patient)
and the following diagram shows how files would be organized for the 
[example data set](#example-data-set):

<br clear="all" />
<figure style="text-align:center"><img src="./by_subject.png" alt="by subject layout example" width="50%" /></figure>
<br clear="all" />

##### By subject with shared instances split-out

Some resource types are not linked directly to the subject resource type and
often get shared between subjects, such as instances of the Organization,
Location, and Medication resource types. Splitting these out from the patient
blocks prevents duplicative effort of transferring these instances multiple
times for each subject. However, receivers will need to know where to find the
split-out instances.

This approach combines the *by type* and *by subject* approaches by 
- Defining a set of resource types for which the *by type* approach is used.
  All instances of these types are placed into *by type* inputs containing only
  instances of that type.
- Placing all other instances into *by subject* inputs. Subject blocks will no
  longer be fully self-contained because references to *by type* resource types
  will need to be resolved by looking at the resource type-specific inputs.

This approach allows for the elimination of duplicative instances for resource
types that contain a lot of duplication while maintaining a clear place for
receivers to look to resolve those references. On the data source side, good
candidates are resource types with a relatively small number of instances that
are referenced from the blocks of many subjects, e.g., Organization. For the
recipient, processing for the *by type* inputs and reference resolution for
instances of those types can be handled as a clear special case without the
need to go searching through arbitrary inputs to find the reference or keep
track of what processed instances might be re-used.

Formally, when using the *by subject* layout for inputs, data sources **MAY**
choose one or more resource types to split-out. The resource types chosen 
**SHALL** meet the following requirements:

**Conformance Requirement 2.5 (split-out Resource Types):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-5)
{: #conformance-requirement-2-5}
    1. The subject resource type SHALL NOT be split-out.
    2. Each instance of the split-out resource type in the submitted data SHALL NOT
       contain a reference to an instance of the subject resource type. In other
       words, resource types linked directly to the subject cannot be split-out.
    3. The set of split-out resource types SHALL contain all types that instances of
       the chosen types references. For example, if PractitionerRole is chosen to be
       split-out and there is at least one PractitionerRole instance that links to a
       Practitioner instance, then the Practitioner resource type must be split-out
       as well. This requirement ensures that references in *by type* inputs never
       need to be resolved by looking in by subject inputs.

Instances of the split-out resource types are subject to the following requirements:

**Conformance Requirement 2.6 (split-out Instances):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-6)
{: #conformance-requirement-2-6}
    1. All instances of split-out resource types SHALL be laid out in inputs
       following the requirements in the by type section.
    2. Instances of split-out resource type SHALL NOT appear in by subject inputs.
    3. The set of instances for a split-out resource type SHOULD contain only
       instances linked to subject instances within *by subject* inputs, either
       though a direct reference or a chain of references.

When split-out resource types are in used, conformance requirement [2.3.4](#conformance-requirement-2-3) no longer applies and is replaced with the
following requirements:

**Conformance Requirement 2.7 (Blocks With split-out Instances):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-7)
{: #conformance-requirement-2-7}
    1. Instances of resource types that are not split-out that are referenced by
       instances in a block’s set of instances SHALL be present in the block.
    2. Instances of resource types that are split-out that are referenced by
       instances in a block’s set of instances SHALL NOT be present in the block.

This snippet shows an input with two subject blocks `Patient/Pat-123` and `Patient/Pat-456` laid out in `ndjson`
where the Practitioner instances have been split-out. Note that the 
`nurse` Practitioner instance is no longer duplicated:

**By Subject Input**
```
{"resourceType":"Parameters","parameter":[{"name":"subject","valueReference":{"reference":"Patient/Pat-123"}}]}
{"resourceType":"Patient","id":"Pat-123",...}
{"resourceType":"MeasureReport","subject":{"reference":"Patient/Pat-123"},"evaluatedResource":[{"reference":"Observation/Obs-1"},...],...}
...
{"resourceType":"Observation","id":"Obs-1","subject":{"reference":"Patient/Pat-123"},"performer":[{"reference":"Practitioner/nurse"}],...}
...
{"resourceType":"Parameters","parameter":[{"name":"subject","valueReference":{"reference":"Patient/Pat-456"}}]}
{"resourceType":"Patient","id":"Pat-456",...}
{"resourceType":"MeasureReport","subject":{"reference":"Patient/Pat-456"},"evaluatedResource":[{"reference":"Observation/Obs-2"},...],...}
...
{"resourceType":"Observation","id":"Obs-2","subject":{"reference":"Patient/Pat-456"},"performer":[{"reference":"Practitioner/nurse"}],...}
{"resourceType":"Observation","subject":{"reference":"Patient/Pat-456"},"performer":[{"reference":"Practitioner/doctor"}],...}
...
```

**By Type Practitioner Input**
```
{"resourceType":"Practitioner","id":"nurse",...}
{"resourceType":"Practitioner","id":"doctor",...}
```

For a complete example of a set of hybrid inputs see 
[this section below](#hybrid-layout-by-subject-patient-with-shared-resource-types-split-out)
and the following diagram shows how files would be organized for the 
[example data set](#example-data-set):

<br clear="all" />
<figure style="text-align:center"><img src="./by_subject_split-out_practitioner.png" alt="by subject with practitioner split out layout example" width="50%" /></figure>
<br clear="all" />

#### Input size limits

Processing of inputs of significantly large size often requires significant
engineering effort and may not be practical for all data recipients. Therefore,
trading partners may agree on limits on input sizes.

Data producers **SHOULD** fill inputs up to the limit to the degree possible and
within reason so as to reduce the number of individual inputs. Because *by
subject* inputs must contain complete subject blocks, some of these inputs may
not be easily filled. A simple rule of thumb is that across all *by subject*
inputs, no more than one **SHOULD** be less than half of the size limit (excluding
inputs multi-input subjects - see below) because any pairs of these could be
combined and still be under the input size limit.

##### Special case: subjects too large for a single input

When input sizes are used in combination with *by subject* input layout,
subject blocks can end up larger than the maximum input size if they are
associated with an extremely large number of instances (or extremely large
instances). This is an edge case known to occur consistently when grouping by
patient, but tends to impact at most a handful of patients. Thus it is handled
as an important special case that implementers will need to consider.

Subject blocks that exceed the input size limit will be placed into a related
group of inputs, each below the size limit and each only containing data
related to the subject. These subjects are called multi-input subjects and
their inputs will meet the following requirements:

**Conformance Requirement 2.8 (Multi-input Subjects):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-8)
{: #conformance-requirement-2-8}
    1. Each input for a multi-input subject SHALL contain only instances from that
       subject’s block (inputs for multi-input subjects SHALL NOT contain blocks for
       other subjects).
    2. Each input for a multi-input subject SHALL start with a [Subject Block Header
       Parameters](StructureDefinition-SubjectBlockHeader.html) instance that includes
       the `multiInputSubject` parameter set to `true` in addition to the subject
       parameter.

Note the following typical assumptions about *by subject* inputs that no longer hold for the inputs of multi-input subjects:
- There is no guarantee that a reference to a (non-split-out) instance within a given input will resolve to an instance within that same input. However, it will resolve to an instance within one of the inputs for the multi-input subject.
- Only one of the inputs for the multi-input subject will start with the subject instance.

See examples of what these inputs look like in [this section below](#with-size-limit).

#### MeasureReport instances

When provided as a part of the data submission for measure calculation, the
data set will contain MeasureReport instances, which will meet the following
requirements:

**Conformance Requirement 2.9 (Measure Reports):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-9)
{: #conformance-requirement-2-9}
    1. All MeasureReport instances SHALL conform to the DEQM Data Exchange
       MeasureReport Profile.
    2. The data set SHALL contain a MeasureReport instance for each measure and
       subject combination covered by the submission.
    3. MeasureReport instances SHOULD include the explicit list of instances
       relevant to calculation of the indicated measure for the indicated subject
       in their `evaluatedResource` element.
    4. When inputs are laid out by subject, either MeasureReport SHALL be the
       subject, or MeasureReport instances for the subject SHALL appear at the
       top of the subject’s block immediately following the subject instance and
       before any other instances.
    5. When inputs are laid out by subject, either MeasureReport SHALL be the
       subject, or the `subject` of each MeasureReport instance within a subject's
       block SHALL be the same as the reference to the subject instance found in
       the block's header.
    6. Measures and their supporting information referenced by the MeasureReport
       via a canonical reference SHALL NOT be included. The assumption is that
       the Consumer has access to the measure details separately.

Receivers may need these MeasureReport instances to drive processing of the
submitted data. Depending on the layout of submitted inputs, they will be found
in the following locations:
- When inputs are laid out *by type*: all MeasureReport instances will be found
  in MeasureReport-specific files.
- When inputs are laid out *by subject*: MeasureReport instances for the subject
  will appear at the top of the subject’s block, as either the subject or directly
  after the subject instance.

Note that because the MeasureReport instances must either be the subject or contain
a reference to the subject MeasureReport cannot be a split-out reousrce type when
the *by subject* input layout is used.

#### Reference resolution

A critical need for receivers processing the inputs will be where to find
referenced instances. The layout of the inputs provides the structure for where
instances will be found and this section details the specific rules that data
sources must follow and data recipients can rely on when resolving references
within the structure.

##### Instance `id`s

To allow instances to be referenced, each instance submitted SHALL contain a
populated `id` element. Each unique instance within a resource type SHALL
contain a unique `id` value (see [Instance de-duplication](#instance-de-duplication)
below for details on instance uniqueness). 

##### Reference format

All elements of the Reference data type that refer to an explicit instance
using the reference sub-element SHALL use relative references of the form
`[resource type]/[id]`. These relative references SHALL NOT refer to a specific
version of the instance.

##### Instance location within inputs

When looking for the instance referenced by `[resource type]/[id]`, the place
within the inputs to look depends on the how instances of the referenced
resource type are laid out:
- *By type*: within one of the resource-specific inputs for that resource type.
- *By subject*: within the same block as the referencing instance was found.

Note that this means that there can be multiple copies of a unique instance for
those resource types laid out by type. This allows subject blocks to be 
self-contained except for instance of types laid out by type at the cost of
some duplication. Users of this specification have the ability to tune the
level of potential duplication up or down to meet the needs of their specific
use case.

#### Instance de-duplication

High-quality deduplication is tough to define and implement and even more
difficult to verify. Data sources SHOULD do their best to eliminate instances
of the same resource type but with different `id` values that refer to the
same entity. Recipients SHALL be robust to the possibility of some duplicate
entries with different `id` values existing within the transferred data set.

#### Manifest representation

Data sources need to communicate the layout of the provided inputs to the data
receipient so that they can be processed appropriately. This is done within the
[Manifest Parmaters](StructureDefinition-ImportManifest.html) instance provided
as a part of the [`$import`](OperationDefinition-import.html) invocation. The
[ImportManifestLayout](StructureDefinition-ImportManifestLayout.html) profile
highlights the parameter keys used below to communicate the structure chosen
by the data source to the data recipient.

##### *By type* inputs

The following requirements apply to the specification of inputs laid out *by
type* within the manifest:

**Conformance Requirement 2.10 (*By Type* Manifest):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-10)
{: #conformance-requirement-2-10}
    1. Each input laid out *by type* SHALL have the `resourceType` parameter
       set at the input level to the type of resources present in the input.

##### *By subject* inputs

The following requirements apply to the specification of inputs laid out *by
subject* within the manifest:

**Conformance Requirement 2.11 (*By Subject* Manifest):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-11)
{: #conformance-requirement-2-11}
    1. When at least one input is laid out *by subject*, the `subjectType`
       parameter SHALL be set at the request level with a value indicating the
       resource type of all subject blocks across all inputs.
    2. The `resourceType` parameter SHALL NOT be set at the input level unless
       the input contains instances of a split-out type.

##### Multi-input subjects

The following requirements apply to the specification of inputs that contain
data for multi-input subjects:

**Conformance Requirement 2.12 (Multi-input Subject Manifest):** [<img src="conformance.png" width="20" class="self-link" height="20"/>](#conformance-requirement-2-12)
{: #conformance-requirement-2-12}
    1. Each input with instances associated with a multi-input subject SHALL
       specify the relative reference to the subject using the `multiInputSubject`
       parameter set at the input level.
    2. Each input with instances associated with a multi-input subject SHALL
       indicate whether it is the first input for the subjec that includes
       the subject instance by setting the `firstInputOfMulti` parameter
       to the appropriate boolean value.

Note that this means that each input for this subject is linked by the shared
value in the `multiInputSubject` parameter.

#### Examples and Comparison

To illustrate the different layout options, consider a producer that would like
to submit the following three data exchange MeasureReports examples from this IG:

| **MeasureReport instance** | **Measure Canonical** | **Patient instance** | **Additional Instances** |
| ***** | ***** | ***** | ***** |
| [Task Submission](Parameters-mrp-submit-task.json.html) | [`http://hl7.org/fhir/us/davinci-deqm/Measure/measure-mrp-example`](Measure-measure-mrp-example.json.html) | [`patient01`](Patient-patient01.json.html) | 8 (1 Task, 1 Practitioner, 1 Encounter, 1 Coverage, 1 Location, 3 Organization) |
| [Observation Submission](Parameters-mrp-submit-obs.json.html) | [`http://hl7.org/fhir/us/davinci-deqm/Measure/measure-mrp-example`](Measure-measure-mrp-example.json.html) | [`patient01`](Patient-patient01.json.html) | 8 (1 Observation, 1 Practitioner, 1 Encounter, 1 Coverage, 1 Location, 3 Organization) |
| [Colorectal Cancer Submission](Parameters-col-submit-collect-obs.json.html) | [`http://hl7.org/fhir/us/davinci-deqm/Measure/measure-exm130-example`](Measure-measure-exm130-example.json.html) | [`patient03`](Patient-patient03.json.html) | 3 (1 Observation, 1 Practitioner, 1 Organization) |

The following sections contain concrete examples of the input files and 
[import manifests](StructureDefinition-ImportManifestLayout.html) that
could be used to communicate the chosen layout. A 
[comparison](#transferred-rows-comparison) of the
various approaches is included in terms of data transferred and processing
requirements. The comparison uses number of rows / instances as a proxy for
size for clarity, but in a real implementation the size on disk would be used
instead.

##### Layout by type

Under this layout, inputs are created for each of the 9 resource types present in the data set. 
- [Coverage input](Type-Coverage-File-1.ndjson): 1 instance
- [Encounter input](Type-Encounter-File-1.ndjson): 1 instance
- [Location input](Type-Location-File-1.ndjson): 1 instance
- [MeasureReport input](Type-MeasureReport-File-1.ndjson): 3 instances
- [Observation input](Type-Observation-File-1.ndjson): 2 instances
- [Organization input](Type-Organization-File-1.ndjson): 4 instances
- [Patient input](Type-Patient-File-1.ndjson): 2 instances
- [Practitioner input](Type-Practitioner-File-1.ndjson): 1 instance
- [Task input](Type-Task-File-1.ndjson): 1 instance

A manifest communicating these inputs could look like [this](Parameters-manifest-by-type-example.json.html).

No instances are duplicated and there is no overhead in terms of Parameters
instances. However, processing data for a single Patient instance requires
search through the other 8 input files to find the relevant data.

##### Layout by subject (Patient)

Under this layout, blocks are created for each of the 2 Patient instances
present in the data set:
- [`patient01`'s block](Subject-Patient-Block-patient01.ndjson): 13 instances, including header
- [`patient03`'s block](Subject-Patient-Block-patient03.ndjson): 6 instances, including header

Without an input size limit, they can be combined into a single input:
- [Input containing `patient01`'s and `patient03`'s blocks](Subject-Patient-Input-Both.ndjson): 19 instances.

A manifest communicating this input could look like [this](Parameters-manifest-by-subject-example.json.html).

The complete set of instances for each Patient subject, including the subject's
MeasureReport instances, can be easily identified based on the block header
delimiters in the input and processing of the patient does not require access
to instances from anywhere else in input. However, 1 Practitioner instances is
duplicated, and there are two header Parameter instances as overhead.

###### With size limit

With an input size limit of 10 rows, the `patient01`'s block is too
large to fit within a single input. It must be spit and kept separate
from `patient03`'s block, resulting in 3 inputs:
- [`patient01` input 1](Subject-Patient-Multi-Input-patient01-1.ndjson): 10 instances
- [`patient01` input 2](Subject-Patient-Multi-Input-patient01-2.ndjson): 4 instances
- [`patient03` input](Subject-Patient-Block-patient03.ndjson): 6 instances

A manifest communicating these inputs could look like [this](Parameters-manifest-by-subject-size-limit-example.json.html).

The size limit forced the separation the blocks into more files with an extra
Parameters instance as additional overhead. However, subject blocks are still
self-contained, even if `patient01`'s block must be assembed on the receiver side
from multiple inputs.

##### Hybrid layout by subject (Patient) with shared resource types split-out

If Location, Organization, and Practitioner instances are split-out, then
the blocks for the two subjects are reduced to no longer include those instances:
- [`patient01`'s block](Subject-Patient-Hybrid-Block-patient01.ndjson): 8 instances, including header
- [`patient03`'s block](Subject-Patient-Hybrid-Block-patient03.ndjson): 4 instances, including header

Without a input size limit, these can be combined into a single input along with the 3
inputs for the split-out resource types:
- [Input containing `patient01`'s and `patient03`'s blocks without split-out types](Subject-Patient-Hybrid-Input-Both.ndjson): 12 instances.
- [Location Input](Type-Location-File-1.ndjson): 1 instance
- [Organization input](Type-Organization-File-1.ndjson): 4 instances
- [Practitioner input](Type-Practitioner-File-1.ndjson): 1 instance

A manifest communicating these inputs could look like [this](Parameters-manifest-by-subject-hybrid-example.json.html).

Splitting out the 3 shared resource types reduces the overhead by eliminating duplicate
instances transfer. While the patient blocks are no longer self-contained,
there are fewer inputs to search through (3 split-out inputs) than in the *by type* layout
because the Patient-linked, non-shared instances remain within the patient blocks.

##### Using $submit-data or MeasureReport as the subject

Submitting data using the `$submit-data` operation is similar to using a layout
with MeasureReport as the subject, which is another valid approach to bulk
submission. This layout offers less opportunity to share instances across Patient
subjects but may be appropriate for some consumers.

###### Layout by subject (MeasureReport)

Under this layout, blocks are created for each of the 3 MeasureReport instances
present in the data set:
- [`datax-measurereport01`'s block](Subject-MR-Block-datax-measurereport01.ndjson): 11 instances, including header
- [`datax-measurereport02`'s block](Subject-MR-Block-datax-measurereport02.ndjson): 11 instances, including header
- [`datax-measurereport03`'s block](Subject-MR-Block-datax-measurereport03.ndjson): 6 instances, including header

Without an input size limit, they can be combined into a single input:
- [Input containing all three blocks](Subject-MR-Input-All.ndjson): 28 instances.

A manifest communicating this input could look like [this](Parameters-manifest-by-subject-mr-example.json.html).

With no sharing between the MeasureReports for `patient01`, using bulk `$import` instead of
`$submit-data` adds a small overhead of 3 header instances.

###### Hybrid layout by subject (MeasureReport) with shared resource types split-out

If Location, Organization, and Practitioner instances are split-out, then
the blocks for the three MeasureReport subjects are reduced to no longer include those instances:
- [`datax-measurereport01`'s block](Subject-MR-Hybrid-Block-datax-measurereport01.ndjson): 6 instances, including header
- [`datax-measurereport02`'s block](Subject-MR-Hybrid-Block-datax-measurereport02.ndjson): 6 instances, including header
- [`datax-measurereport03`'s block](Subject-MR-Hybrid-Block-datax-measurereport03.ndjson): 4 instances, including header

Without a input size limit, these can be combined into a single input along with the 3
inputs for the split-out resource types:
- [Input containing MeasureReport blocks without split-out types](Subject-MR-Hybrid-Input-All.ndjson): 16 instances.
- [Location Input](Type-Location-File-1.ndjson): 1 instance
- [Organization input](Type-Organization-File-1.ndjson): 4 instances
- [Practitioner input](Type-Practitioner-File-1.ndjson): 1 instance

A manifest communicating these inputs could look like [this](Parameters-manifest-by-subject-mr-hybrid-example.json.html).

Splitting out the 3 shared resource types reduces the overhead by eliminating most
of the duplicate instances. While the MeasureReprot blocks are no longer self-contained,
there are fewer inputs to search through (3 split-out inputs) than in the *by type* layout
because the Patient-linked, non-shared instances remain within the MeasureReport blocks.
Strictly speaking, splitting out Patients, Encounters, and Coverages would [meet the
rules](#conformance-requirement-2-5) for split out types when MeasureReport is the subject. 
However, in a larger patient set, there are likely to be many of these instances that would 
not be shared amongst many MeasureReport subjects, thus loosing the benefit of having
instances tightly tied to the subjects within the subject's block. Again, it suggests that
using MeasureReport as the subject is likely to be less beneficial from a layout optimization
point of view than using the subject of the MeasureReport (e.g., Patient) as the subject.

##### Transferred Rows Comparison

The following table compares the total number of inputs and rows transferred 
for each layout described above, illustrating the impact the different approaches
have on transfer overhead in this simple example.

| **Scenario** | **Inputs** | **Instances Transferred** | **Overhead Parameters Instances** | **Duplicated Instances Transferred** |
| ***** | ***** | ***** | ***** | ***** |
| by type | 9 | 16 | 0 | 0 |
| by Patient subject | 1 | 19 | 2 | 1 |
| by Patient subject - size limit 10 rows | 3 | 20 | 3 | 1 |
| hybrid - by Patient subject with Location, Organization, and Practitioner split-out | 4 | 18 | 2 | 0 |
| by MeasureReport using $submit-data | 3 | 25 | 0 | 9 |
| by MeasureReport subject | 1 | 28 | 3 | 9 |
| hybrid - by MeasureReport subject with Location, Organization, and Practitioner split-out | 4 | 22 | 3 | 3 |



