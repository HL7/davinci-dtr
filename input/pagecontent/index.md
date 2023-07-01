### Overview
When creating orders, booking appointments, admitting patients, etc. there's often an expectation that certain types of documentation are captured that will subsequently be used for payer processing.  This might be information needed for determining prior authorization (or even whether prior authorization is necessary), for inclusion as part of claims submission, or even for retention as documentation of 'clinical necessity' in the event of a future audit.  Each payer has rules for what documentation is necessary and in what form it needs to exist.  Failure to capture appropriate documentation or to represent it in the correct manner can delay the processing of authorization requests and claims, result in denial of requests, or result in other penalties or hardships for both the provider and their patients.

The Da Vinci Documentation Templates and Rules (DTR) implementation guide provides a mechanism for payers to express their documentation requirements computably in a way that supports clinicians and other EHR users to navigate and quickly specify the needed information in a context-specific way.  The guide allows rules to be written in a way that automatically extracts existing EHR information for review/confirmation and adjusting the information prompted for based on what data is already known or entered, minimizing impact on provider time, while expediting subsequent payer interactions.

DTR leverages FHIR [Questionnaires](http://hl7.org/fhir/R4/questionnaire.html) combined with embedded [CQL](https://cql.hl7.org/) logic and associated value sets to retrieve existing information, prompt for additional relevant information, and manage the logic process of determining which questions need to be answered (and what answer choices are relevant).  The function of rendering these Questionnaires and capturing the information in patient-specific QuestionnaireResponses can occur either through [SMART on FHIR applications](http://hl7.org/fhir/smart-app-launch/index.html) or through functionality embedded directly into the EHR.

### Expected Systems
This Implementation Guide has expectations defined for four types of systems that can be involved (with corresponding Capability Statements):

- [DTR - EHRs that use SMART apps](CapabilityStatement-dtr-smart-client.html)
- [EHRs that don't use SMART apps](CapabilityStatement-dtr-native-client.html)
- [SMART apps with payer systems](CapabilityStatement-dtr-payer-app.html)
- [Intermediary systems with defined functionality has been defined](CapabilityStatement-dtr-intermediary-system.html)

### Boundaries and Relationships

This IG is a companion to the Da Vinci [Coverage Requirements Discovery (CRD)](https://build.fhir.org/ig/HL7/davinci-crd/) and [Prior Authorization Support (PAS)](http://build.fhir.org/ig/HL7/davinci-pas/) IGs.  The former allows a provider to be alerted that DTR is relevant for a particular order/appointment/etc. and optionally allows that provider to directly launch DTR (either as a SMART application or embedded EHR functionality), or hand off to back office staff for additional processing.  The latter allows the information returned by DTR to be packaged as part of a FHIR-based prior authorization request.  DTR functions in the 'middle' of these two IGs to capture the needed documentation.

While designed to work with these other IGs, DTR can be implemented stand-alone.  Further details on the relationships between these three implementation guides can be found [here](background.html#da-vinci-burden-reduction).

The third Da Vinci IG that is relevant to DTR is the [Health Record Exchange (HRex)](http://hl7.org/fhir/us/davinci-hrex/STU1/) implementation guide, which defines a number of shared profiles and other shared content used across Da Vincie IGs - including this one.

This guide also depends on a number of non-Da Vinci specifications:

    DTR leverages profiles and capabilities defined in the Structured Data Capture (SDC) implementation guide to define the forms used to gather information, how they're displayed, flow control log, and mechanisms to automatically populate answers.  It also describes how to support Adaptive Forms.  The general capabilities of the SDC guide are further constrained in DTR to reflect the capabilities that payers can count on EHRs and/or DTR smart applications to have for managing forms - and thus the constraints that need to be adhered to when defining the questionnaires to be used.

Within the SDC Questionnaires, the logic that handles population and occasionally the flow control of forms is written using [Clinical Quality Language (CQL)](https://cql.hl7.org/).  This is a language specifically designed to encode decision support logic.  It can operate against data structures independent of their syntax (e.g., XML or JSON).  It is heavily used throughout the FHIR decision support community.

    In turn, DTR relies on the various EHR FHIR interfaces that comply with the US Core implementation guide.  These interfaces allow the CQL embedded in Questionnaires to retrieve data from the EHR to help populate answers and/or to guide what questions are necessary.
    Because the DTR functionality is expected, at least in the early stages, to be performed by SMART on FHIR systems, this implementation guide also provides explicit guidance around the use of SMART launch to manage DTR functionality.

This IG leverages [Clinical Quality Language (CQL)](https://cql.hl7.org/) to allow payers to inspect a patient’s record for the necessary information related to the required documentation for a proposed item, certain medications, procedure, or other service. This IG details the use of a payer provided Questionnaire resource and results from CQL execution to generate a QuestionnaireResponse resource containing the appropriate and necessary information. This IG also provides methods to persist the QuestionnaireResponse in the provider’s Electronic Health Record (EHR) system and “optionally” send the QuestionnaireResponse to the payer. The payer can specify the endpoint to be a payer's, third party, Utilization Management Organization, or Business Association; the endpoint pertains to the location where Questionnaires, CQL, and ValueSets are made available.

#### EHR and DTR Initiation
The current [CRD](https://build.fhir.org/ig/HL7/davinci-crd/), DTR, [PAS](http://build.fhir.org/ig/HL7/davinci-pas/), and [CDex](http://build.fhir.org/ig/HL7/davinci-ecdx/) supporting the ePA workflow only focuses on the interactions between the provider HIT in total and the payer HIT in total, not the necessary interactions among the respective HIT solutions that make up the provider and payer HIT environment that need to participate in the ePA workflow.

[ONC](https://www.healthit.gov/) should support certification where certified software can use generic (or generically referenced) relied-upon software to meet certain requirements and can clearly specify the capabilities they rely on without the need to assert each permutation of relied-upon software with which they support the ePA workflow.  Further guidance is needed for the interactions necessary within each of the provider and payer HIT configurations based on the functions/roles of those HIT solutions, and requires the relied upon software approach using predictable, standards-based capabilities to participate in an ePA workflow and for HIT that provides full support for ePA workflow through its certified HIT. 

> This community requests Da Vinci seek adequate financial support to accelerate the process described here.

### Content and Organization
The IG is organized into the following sections:
* [Use Cases and Overview](usecases.html) Provides examples of how this specification can be used by provider and payer organizations.
* [Technical Background and Underlying Technologies](background.html) Describes the underlying technologies this specification builds upon.
* [Formal Specification](specification.html) Provides the technical conformance details for the specification.
* [Artifacts Summary](artifacts.html) Introduces and provides links to the FHIR profiles, operations, extensions, as well as examples.
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.
