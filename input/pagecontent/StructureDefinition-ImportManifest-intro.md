### General Structure

The Import Manifest is designed to communicate as a part of an [`$import`](OperationDefinition-import.html) operation invocation a set of inputs for a recipient to retrieve, while also providing context about the request and how to perform the retrieval. It provides a structure for communicating the following information both at the request level and the individual input level:

| **Category** | **Description** | **Top-level parameter name** | **Input-level parameter name** |
| Request Details | Identity of and details about the request itself, such as an identifier, submitter information, or other specifics. For individual inputs, this is always just the url where the input can be found. | requestIdentity | url |
| Transfer Details | Specifics on how the receiver will access and transfer the data, such as the protocol and security details. | transferDetails | transferDetails |
| Input Details | Specifics on the input, such as the format and scope. | inputDetails | inputDetails |

The specifics of what information is included in each of these categories will different depending on the use case. Rather than specify the representational details for these categories, this IG allows those details to be selected by the use case and provides common patterns and examples that derivative specifications may choose to use. Where patterns exist that meet the needs of a use case, those patterns **SHOULD** be used or extended. See the [Patterns and Examples](#patterns-and-examples) section below for more details.