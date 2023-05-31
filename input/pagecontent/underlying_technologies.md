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

The goal of the Burden Reduction IGs is to move from Telephone, FAX, Portal, and mail to electronic transaction defined by these three IGs.  We recognize it will take time for provider and payer to fully implement these IGs and that certain PAs may never be implemented due to complexity.  However, the intent is to move a rapidly as possible to full support of these IGs by Payer, providers and any required intermediaries.

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

This IG leverages and builds on the [US Core](http://hl7.org/fhir/us/core/STU3.1.1/) IG defined by HL7 for sharing human EHR data in the US.  Implementers need to familiarize themselves with the profiles in [US Core](http://hl7.org/fhir/us/core/STU3.1.1/). 

This IG supports the [R4](http://hl7.org/fhir/R4/index.html) version of the FHIR standard.

| FHIR Version |
| ------------ |
| [FHIR R4 US Core](http://hl7.org/fhir/us/core/STU3.1.1/) |  

Implementers will need the knowledge of [US Core](http://hl7.org/fhir/us/core/STU3.1.1/) to access information for pre population via CQL calls to *21st Century* compliant FHIR APIs. The light client should import the US Core Server capability statement.  

| Resources |
| ------------ |
| [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) |
| [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) |
| [Task](http://hl7.org/fhir/R4/task.html) |


### SMART on FHIR
Client systems conformant to this IG SHALL also serve as a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) client. This is to allow DTR functionality to be invoked outside of regular EHR clinical workflows using a SMART on FHIR app to provide a consistent way of evaluating payer rules and documentation requirements across EHR implementations. As such client implementers will also need to be familiar with the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) specification. Payer implementers only need to be familiar with the SMART on FHIR specification if they plan to develop SMART apps for launch by CDS Hooks or other purposes.

### Must Support
This IG marks elements with the Must Support flag in its profiles.  Implementation of Must Support SHALL be compliant with HRex. However, note that this guide does profile on top of US Core profiles where Must Support has been defined on certain elements (i.e., [DTR Document Reference](https://build.fhir.org/ig/HL7/davinci-dtr/StructureDefinition-dtr-documentreference-r4.html) profiles [USCoreDocumentReferenceProfile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html)). The FHIR specification makes it clear that when profiling another profile, a MustSupport flag can be constrained further (i.e., taken from 'false' to 'true') but cannot be loosened (i.e., changed from 'true' to 'false').  See [US Core Must Support Guidance](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#must-support).

This IG also references the [US Core IG](http://hl7.org/fhir/us/core/STU3.1.1/). Da Vinci DTR implementations SHALL conform to the US Core IG [Must Support](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#must-support) Guidance where US Core IG resources are used.

This implementation guide will adopt by reference the following [HRex Conformance Requirements](http://build.fhir.org/ig/HL7/davinci-ehrx/conformance.html)  In addition, systems SHALL comply with additional requirements called out in IG text and Profile definitions.

<div markdown="1" class="new-content">
### Impact on payer processes
Information passed to DTR will typically contain clinical terminologies, might not contain billing terminologies, and will generally not include billing modifier codes or similar information typically included in prior authorization requests. Services will also need to consider that the mapping they perform between clinical terminologies and billing codes may be different than the bill coding process performed by the client system when claims are eventually submitted. This may mean that assertions about coverage or prior authorization requirements will need to be expressed conditionally. e.g., “Provided this service is billed as X, Y or Z, then prior authorization is not needed”.  

In situations where DTR is aware of the likely billing codes at the time of ordering, they MAY send these codes as additional CodeableConcept.coding repetitions to assist in server processing. If CPT is used, note the ability to convey CPT modifier codes via post-coordination as described in the [Using CPT](https://terminology.hl7.org/CPT.html) page on terminology.hl7.org.  

It is more efficient if mappings can be shared across payers and providers. This implementation guide encourages industry participants to cooperate on the development of shared mappings and/or to work with terminology developers (e.g., AMA for CPT codes) to develop shared mappings as part of their code maintenance process.
</div>