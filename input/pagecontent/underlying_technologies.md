### Da Vinci
Da Vinci is an HL7-sponsored project that brings together the U.S. payer, providers, and technology suppliers (including EHR vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as Connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies value-based care use cases of interest to its members and the community as a whole.

The process that Da Vinci has adopted includes:
1. identify business, clinical, technical and testing requirements.
2. develop and ballot a FHIR based implementation guide (IG).
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement.
4. pilot the standard.
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.

Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci). Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

{% include burdenReduction.md %}

### FHIR
This IG uses terminology, notations, and design principles that are specific to FHIR. It's important to be familiar with some of the basic principles of FHIR as well
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

[SDC Adaptive forms](http://build.fhir.org/ig/HL7/sdc/adaptive.html) defines an alternative way to dynamically interact with the user. DTR support for adaptive forms would help in the following scenarios:

1) Support for complex decision trees without the need for the Questionnaire and rules (CQL) to cover all of the possibilities. This is enabled by supporting the request for a small number of questions (and the ability to prepopulate the questions from the EHR), returning the results to the Payer to "prune" the decision tree, and repeat the process until complete.
2) Allowing the payer to only expose the relevant guideline logic for the clinical situation at hand.
3) Support for complex logic that depends on information available to the payer (e.g. prior services) to be part of the decision logic to evaluate the medical necessity and appropriateness of the planned service.
4) Enabling the potential for a final response from the payer including prior authorization information as part of the interactive exchange. 
5) Provide flexibility to EHR venders to adopt DTR. The adaptive form can be used as an alternative to more complex SDC form behavior, e.g., enableWhen.
6) Supports both payer side prior authorization and the ability to request specific additional information as part of the PAS exchange process

The DTR app SHALL support loading and rendering the adaptive form developed by the payer following the SDC adaptive form workflow. If there is CQL embedded in the questionnaire or the associated library, the DTR app should be able to execute the CQL based on the questions loaded in the questionnaire.

For performance, the DTR application may save the results of prior execution of the CQL where it is the same for addressing the current question(s).

### Clinical Quality Language
Payer systems SHALL use the specification and workflows defined by [Clinical Quality Language CQL](https://cql.hl7.org/) to facilitate DTR functionality within clinical systems. Implementers should be familiar with this specification. This specification supports the [current release of CQL](http://cql.hl7.org/N1/), however older versions of CQL, such as STU 2 can be used provided they work with FHIR R4.

### Must Support
This IG does NOT mark any additional elements with the [Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport) flag in its own profiles. However, note that this guide does profile on top of US Core profiles where Must Support has been defined on certain elements (i.e. [DTR Document Reference](https://build.fhir.org/ig/HL7/davinci-dtr/StructureDefinition-dtr-documentreference-r4.html) profiles [USCoreDocumentReferenceProfile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html)). The FHIR specification makes it clear that when profiling another profile, a MustSupport flag can be constrained further (i.e., taken from 'false' to 'true') but cannot be loosened (i.e., changed from 'true' to 'false').  See [US Core Must Support Guidance](http://hl7.org/fhir/us/core/must-support.html#must-support-elements).

This IG also references the [US Core IG](http://www.hl7.org/fhir/us/core/). Da Vinci DTR implementations SHALL conform to the US Core IG [Must Support](http://hl7.org/fhir/us/core/general-guidance.html#must-support) Guidance where US Core IG resources are used.

