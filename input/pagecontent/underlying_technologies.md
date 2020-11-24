### Da Vinci
Da Vinci is an HL7-sponsored project that brings together the U.S. payer, providers, and technology suppliers (including EHR vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as Connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies value-based care use cases of interest to its member and the community as a whole.

The process that Da Vinci has adopted includes:
1. identify business, clinical, technical and testing requirements,
2. develop and ballot a FHIR based implementation guide (IG),
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement,
4. pilot the standard
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.

Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci). Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

{% include burdenReduction.md %}

### FHIR
This IG uses terminology, notations and design principles that are specific to FHIR. It's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read the following prior to reading the rest of this IG.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This IG leverages and builds on the [US Core](http://hl7.org/fhir/us/core/) IG defined by HL7 for sharing human EHR data in the US.  Implementers need to familiarize themselves with the profiles in [US Core](http://hl7.org/fhir/us/core/). 

This IG supports the [R4](http://hl7.org/fhir/R4/index.html) version of the FHIR standard.

| FHIR Version |
| ------------ |
| [FHIR R4 US Core](http://hl7.org/fhir/us/core/) |

Implementers should also familiarize themselves with the FHIR resources used within this IG.

| Resources |
| ------------ |
| [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) |
| [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) |
| [Task](http://hl7.org/fhir/R4/task.html) |

### US Core
Clinical systems SHALL use the specification defined by [US Core](http://www.hl7.org/fhir/us/core/) in exchanging information with payers. Implementers should be familiar with this specification.

### Clinical Decision Support Hooks
Clinical systems and payer systems SHALL use the specification and workflows defined by [Clinical Decision Support (CDS) Hooks](https://cds-hooks.hl7.org) to initiate [CRD](http://hl7.org/fhir/us/davinci-crd/). Implementers should be familiar with this specification.

### Coverage Requirements Discovery
Clinical systems SHOULD use the specification and workflows defined by [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/) to initiate DTR functionality with payers, where it is appropriate. Implementers should be familiar with this specification.

### SMART on FHIR
Client systems conformant to this IG SHALL also serve as a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) client. This is to allow DTR functionality to be invoked outside of regular EHR clinical workflows using a SMART on FHIR app to provide a consistent way of evaluating payer rules and documentation requirements across EHR implementations. As such client implementers will also need to be familiar with the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) specification. Payer implementers only need to be familiar with the SMART on FHIR specification if they plan to develop SMART apps for launch by CDS Hooks or other purposes.

### Structured Data Capture
Clinical systems SHALL use the specification and workflows defined by [Structured Data Capture (SDC)](http://hl7.org/fhir/us/sdc/) to initiate DTR functionality with the payers. Implementers should be familiar with this specification.

### Clinical Quality Language
Payer systems SHALL use the specification and workflows defined by [Clinical Quality Language CQL](https://cql.hl7.org/) to facilitate DTR functionality within clinical systems. Implementers should be familiar with this specification. Older versions of CQL such as STU 2 can be used provided they work with FHIR R4.

### Must Support
This IG does NOT mark any elements with the [Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport)  flag in its own profiles. 

This IG also references the [US Core IG](http://www.hl7.org/fhir/us/core/). Da Vinci DTR implementations SHALL conform to the US Core IG [Must Support](http://hl7.org/fhir/us/core/general-guidance.html#must-support) Guidance where US Core IG resources are used.

