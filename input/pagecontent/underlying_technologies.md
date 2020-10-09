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

Implementers should also familarize themselves with the FHIR resources used within this IG.

| Resources |
| ------------ |
| [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) |
| [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) |
| [Task](http://hl7.org/fhir/R4/task.html) |

### US Core
Clinical systems SHALL use the specification and workflows defined by [US Core](http://www.hl7.org/fhir/us/core/) to initiate DTR functionality with payers. Implementers should be familiar with this specification.

### Clinical Decision Support Hooks
 Clinical systems and payer systems SHALL use the specification and workflows defined by [Clinical Decision Support (CDS) Hooks](https://cds-hooks.hl7.org) to initiate DTR. Implementers should be familiar with this specification.

### Coverage Requirements Discovery
Clinical systems SHALL use the specification and workflows defined by [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/2019May/) to initiate DTR functionality with  payers. Implementers should be familiar with this specification.

### SMART on FHIR
If payer implementers choose to not implement DTR within a native EHR app. 
Client systems conformant to this IG SHALL also serve as a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) client. This is to allow DTR functionality to be invoked outside of regular clinical workflows using a SMART on FHIR app to provide a consistent way of evaluating what-if scenarios across EHR implementations. As such client implementers will also need to be familiar with the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) specification. Because the SMART on FHIR app will interact with payer systems through the CDS Hooks interface, payer implementers only need to be familiar with the SMART on FHIR specification if they plan to develop SMART apps for launch by CDS Hooks or other purposes.

### Structured Data Capture
Clinical systems SHALL use the specification and workflows defined by [Structured Data Capture (SDC)](http://hl7.org/fhir/us/sdc/) to initiate DTR functionality with the payers. Implementers should be familiar with this specification.

### Clinical Quality Language
Payer systems SHALL use the specification and workflows defined by [Clinical Quality Language CQL](https://cql.hl7.org/) to facilitate DTR functionality within clinical systems. Implementers should be familiar with this specification. Older verisons of CQL such as STU 2 can be used provided they work with FHIR R4.

### Must Support
This IG does NOT mark any elements with the [Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport)  flag in its own profiles. 

This IG also references US Core IG (section #3.2). Da Vinci DTR implementations SHALL conform to the US Core IG [Must Support](http://hl7.org/fhir/us/core/general-guidance.html#must-support) Guidance where US Core IG resources are used.