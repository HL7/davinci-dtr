### FHIR
This implementation guide uses terminology, notations and design principles that are
specific to FHIR. Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read the following
prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This implementation guide also leverages the US Core set of profiles defined by HL7 for sharing human Electronic Medical Record (EMR) data in the US.  Additional information is located at: [US-Core](http://hl7.org/fhir/us/core/2019Jan/)

This implementation guide supports the [R4](http://hl7.org/fhir/R4/index.html) version of the FHIR standard. FHIR services based on R4 are the future of the standard, and the implementation guide aims to support the most modern solution and support transition of FHIR systems to R4.

This implementation guide also builds on the US Core Implementation Guide and implementers need to familiarize themselves with the profiles in those Implementation Guides:

| FHIR Version |
| ------------ |
| [FHIR R4 US Core](http://hl7.org/fhir/us/core/2019Jan/) |
| [FHIR STU3 US Core (1.0.1)](http://hl7.org/fhir/us/core/1.0.1) |

Implementers should also familiarize themselves with the FHIR resources used within the guide:

| Resources |
| ------------ |
| [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) |
| [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) |

### US Core
Clinical systems SHALL use the specification and workflows defined by [US Core](http://www.hl7.org/fhir/us/core/) to initiate Document Template and Rule functionality with the payers. Implementers should be familiar with this specification.

### Clinical Decision Support Hooks
 Clinical systems and payer systems SHALL use the specification and workflows defined by [Clinical Decision Support (CDS) Hooks](https://cds-hooks.hl7.org) to initiate Document Template and Rule. Implementers should be familiar with this specification.

### Coverage Requirements Discovery
Clinical systems SHALL use the specification and workflows defined by [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/2019May/) to initiate Document Template and Rule functionality with the payers. Implementers should be familiar with this specification.

### SMART on FHIR
Client systems conformant to this implementation guide SHALL also serve as a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) client. This is to allow Document Template and Rule functionality to be invoked outside of regular clinical workflows using a SMART on FHIR application to provide a consistent way of evaluating "what if?" scenarios across EMR implementations. As such client implementers will also need to be familiar with the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) specification.  Because the SMART on FHIR app will interact with payer systems through the CDS Hooks interface, payer implementers only need to be familiar with the SMART on FHIR specification if they plan to develop SMART apps for launch by CDS Hooks or for other purposes.

### Structured Data Capture
Clinical systems SHALL use the specification and workflows defined by [Structured Data Capture (SDC)](http://hl7.org/fhir/us/sdc/) to initiate Document Template and Rule functionality with the payers. Implementers should be familiar with this specification.

### Clinical Quality Language
Payer systems SHALL use the specification and workflows defined by [Clinical Quality Language (CQL)|https://cql.hl7.org/STU2/] to facilitate Documentation Templates and Rules functionality within clinical systems. Implementers should be familiar with this specification.

### Must Support
Da Vinci Documentation Templates and Rules implementation guide does NOT mark any elements with "mustSupport" flag ([http://hl7.org/fhir/R4/profiling.html#mustsupport)] in its own profiles.

This implementation guide also references US Core IG (section #3.2). Da Vinci DTR implementation shall conform the US Core IG Must Support Guidance ([http://hl7.org/fhir/us/core/general-guidance.html#must-support]) where US Core IG resources are used.