### Overview
The Documentation Templates and Rules (DTR) Implementation Guide (IG) specifies how payer rules can be executed in a provider context to ensure that documentation requirements are met. In turn provider burden will be reduced because of reduced manual data entry. This IG is a companion to the [Coverage Requirements Discovery (CRD) IG](https://build.fhir.org/ig/HL7/davinci-crd/), which uses Clinical Decision Support (CDS) Hooks to query payers to determine if there are documentation requirements for a proposed item, medication, procedure or other service. When those requirements exist, CDS cards will be returned with information about the requirements. This IG leverages the ability of CDS Hooks to link to a SMART on FHIR app (application) or native EHR app to launch and execute payer rules. This IG specifies how to maintain the transaction state as the workflow transitions from CDS Hooks to the app. It describes the interactions between the app and the payer IT system to retrieve documentation requirements, in the form of CQL and a FHIR Questionnaire resource.

> Both DTR and CRD are being balloted and will be published as "standards for trial use". As such, both are expected to evolve based on implementer experience. FHIR's approach to standards development is to release specifications that we deem "implementation-ready" for use in the real world and adapt based on feedback. Given that both specifications are at the same level of maturity, their interdependence is not problematic. The dependence relationship *does* mean that DTR will not be able to be locked down as a normative specification until CRD has also reached the same maturity.

This IG leverages Clinical Quality Language (CQL) to allow payers to inspect a patient's record for the necessary information related to the required documentation for a proposed item, medication, procedure or other service. This IG details the use of a payer provided Questionnaire resource and results from CQL execution to generate a QuestionnaireResponse resource containing the necessary information. This IG also provides methods to persist the QuestionnaireResponse in the provider's Electronic Health Record (EHR) system and “optionally” send the QuestionnaireResponse to the payer.

Since this IG does not describe a FHIR server, there is no Capability Statement.

Although not detailed in this IG it may be possible to achieve the same level of integration with a native EHR app instead of a SMART on FHIR app. The same payer sourced FHIR Questionnaire and CQL could be consumed by the native EHR app. The interface for exchanging data would need to be developed further in a method that achieves the same level of interoperability that the SMART on FHIR app achieves. A native EHR app MAY play the role of the DTR process if it reduces burden. Because of this, when the SMART on FHIR app is mentioned in this IG, native EHR app, app (application), or DTR process also applies.

>CQL and FHIR Questionnaires SHALL be required. Even in the event the payer is NOT acting as a unique (all payer) SMART on FHIR app. For example, CQL and FHIR Questionnaires SHALL be required even when DTR is implemented within a native EHR application as opposed to a SMART on FHIR application.

Provenance SHOULD be created and persisted with information created during the execution of the CQL and Questionnaire. Also, when the Questionnaire and its associated resources are exchanged with the source of the rules appropriate Provenance resource(s) SHOULD be created and exchanged.

### Content and Organization
The IG is organized into the following sections:
* [Use Cases](use_case.html) Provides examples of how this specification can be used by provider and payer organizations.
* [Underlying Technologies](underlying_technologies.html) Describes the underlying technologies this specification builds upon.
* [Specification](specification.html) Provides the technical conformance details for the specification.
* [Resources](resources.html) Introduces and provides links to the FHIR profiles.
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.

### Downloads
* The full [DTR Implementation Guide](full-ig.zip)
* [FHIR R4 DTR Resource Definitions](definitions.json.zip)
* [FHIR R4 DTR IG Validator Pack](validator-davinci-dtr.pack)
