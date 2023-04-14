### Overview
When creating orders, booking appointments, admitting patients, etc. there's often an expectation that certain types of documentation are captured that will subsequently be used for payer processing.  This might be information needed for determining prior authorization (or even whether prior authorization is necessary), for inclusion as part of claims submission, or even for retention as documentation of 'clinical necessity' in the event of a future audit.  Each payer has rules for what documentation is necessary and in what form it needs to exist.  Failure to capture appropriate documentation or to represent it in the correct manner can delay the processing of authorization requests and claims, result in denial of requests, or result in other penalties or hardships for both the provider and their patients.

The Da Vinci Documentation Templates and Rules (DTR) implementation guide provides a mechanism for payers to express their documentation requirements computably in a way that supports clinicians and other EHR users to navigate and quickly specify the needed information in a context-specific way.  The guide allows rules to be written in a way that automatically extracts existing EHR information for review/confirmation and adjusting the information prompted for based on what data is already known or entered, minimizing impact on provider time, while expediting subsequent payer interactions.

DTR leverages FHIR [Questionnaires] combined with embedded [CQL] logic and associated [value sets] to retrieve existing information, prompt for additional relevant information, and manage the logic process of determining which questions need to be answered (and what answer choices are relevant).  The function of rendering these Questionnaires and capturing the information in patient-specific QuestionnaireResponses can occur either through [SMART on FHIR applications] or through functionality embedded directly into the EHR.   

### Boundaries and Relationships

This IG is a companion to the Da Vinci Coverage Requirements Discovery (CRD) and [Prior Authorization Support (PAS)] IGs.  The former allows a provider to be alerted that DTR is relevant for a particular order/appointment/etc. and optionally allows that provider to directly launch DTR (either as a SMART application or embedded EHR functionality), or hand off to back office staff for additional processing.  The latter allows the information returned by DTR to be packaged as part of a FHIR-based prior authorization request.  DTR functions in the 'middle' of these two IGs to capture the needed documentation.

While designed to work with these other IGs, DTR can be implemented stand-alone.  Further details on the relationships between these three implementation guides can be found [here] (point to the background section that incorporates the standard relationship blurb).

A third Da Vinci IG that is relevant to DTR is the [Health Record Exchange (HRex)] implementation guide, which defines a number of shared profiles and other shared content used across Da Vinci IGs - including this one.  And a fourth relevant Da Vinci IG is [Clinical Data Exchange (CDex)], which uses DTR functionality for requesting attachments using questionnaires.

This guide also depends on a number of non-Da Vinci specifications:

    DTR leverages profiles and capabilities defined in the [Structured Data Capture (SDC)] implementation guide to define the forms used to gather information, how they're displayed, flow control log, and mechanisms to automatically populate answers.  It also describes how to support [adaptive forms].  The general capabilities of the SDC guide are further constrained in DTR to reflect the capabilities that payers can count on EHRs and/or DTR smart applications to have for managing forms - and thus the constraints that need to be adhered to when defining the questionnaires to be used.

Within the SDC Questionnaires, the logic that handles population and occasionally the flow control of forms is written using [Clinical Quality Language (CQL)].  This is a language specifically designed to encode decision support logic.  It can operate against data structures independent of their syntax (i.e. XML or JSON).  It is heavily used throughout the FHIR decision support community.

    In turn, DTR relies on the various EHR FHIR interfaces that comply with the [US Core] implementation guide.  These interfaces allow the CQL embedded in Questionnaires to retrieve data from the EHR to help populate answers and/or to guide what questions are necessary.
    Because the DTR functionality is expected, at least in the early stages, to be performed by [SMART on FHIR] systems, this implementation guide also provides explicit guidance around the use of SMART launch to manage DTR functionality.

> Both DTR and CRD are being balloted and will be published as “standards for trial use”. As such, both are expected to evolve based on implementer experience. FHIR’s approach to standards development is to release specifications that we deem “implementation-ready” for use in the real world and adapt based on feedback. Given that both specifications are at the same level of maturity, their interdependence is not problematic. 

This IG leverages Clinical Quality Language (CQL) to allow payers to inspect a patient’s record for the necessary information related to the required documentation for a proposed item, certain medications, procedure, or other service. This IG details the use of a payer provided Questionnaire resource and results from CQL execution to generate a QuestionnaireResponse resource containing the necessary information. This IG also provides methods to persist the QuestionnaireResponse in the provider’s Electronic Health Record (EHR) system and “optionally” send the QuestionnaireResponse to the payer. The payer can specify the endpoint to be a payer's, third party, Utilization Management Organization, or Business Association; the endpoint pertains to the location where Questionnaires, CQL, and ValueSets are made available.

Since this IG does not describe a FHIR server, there is no Capability Statement.

Although not detailed in this IG, it may be possible to achieve the same level of integration with a native EHR app instead of a SMART on FHIR app. The same payer sourced FHIR Questionnaire and CQL could be consumed by the native EHR app. The interface for exchanging data would need to be developed further in a method that achieves the same level of interoperability that the SMART on FHIR app achieves. A native EHR app MAY play the role of the DTR process if it reduces burden. Because of this, when the SMART on FHIR app is mentioned in this IG, native EHR app, app (application), or DTR process also applies.

Provenance SHOULD be created and persisted with information created during the execution of the CQL and Questionnaire. Also, when the QuestionnaireResponse and its associated resources are exchanged with the source of the rules, appropriate Provenance resource(s) SHOULD be created and exchanged.

> CQL and FHIR Questionnaires SHALL be required. For example, CQL and FHIR Questionnaires SHALL be required even when DTR is implemented within a native EHR application as opposed to a SMART on FHIR application.

### Content and Organization
The IG is organized into the following sections:
* [Use Cases](use_cases.html) Provides examples of how this specification can be used by provider and payer organizations.
* [Underlying Technologies](underlying_technologies.html) Describes the underlying technologies this specification builds upon.
* [Specification](specification.html) Provides the technical conformance details for the specification.
* [Resources](artifacts.html) Introduces and provides links to the FHIR profiles.
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.

### Downloads
* The full [DTR Implementation Guide](full-ig.zip)
* [FHIR R4 DTR Resource Definitions](definitions.json.zip)
* [FHIR R4 DTR IG Validator Pack](validator-hl7.fhir.us.davinci-dtr.pack)


