
>Note: Although the DTR IG base profiles are listed below, the [HRex IG R4 base profile](https://build.fhir.org/ig/HL7/davinci-ehrx/toc.html) language supersedes the below base profile language.

FHIR resources exchanged in the execution of a DTR process are subject to conformance requirements with the following HL7 Implementation Guides.

The Da Vinci DTR Implementation Guide (IG) will make use of US Core profiles that are based on the FHIR R4 specification wherever practical. The DTR IG uses the HL7 FHIR Release 4 specification as its base.

### US Core
The DTR process accesses information about a patient to execute rules and gather documentation to satisfy payer needs. To do this, the DTR process will make requests to a FHIR server of the healthcare provider organization's Electronic Health Record (EHR) system. The FHIR server SHALL conform to the [US Core Implementation Guide R4](https://build.fhir.org/ig/HL7/davinci-ehrx/US_Core_(FHIR_R4).html) when providing access to a FHIR R4 server.

## Questionnaires
Payers have documentation requirements and rules that must be satisfied as part of their typical operations when reimbursing for care. In an ideal case, all of the information needed by a payer would be stored in a healthcare provider's EHR system in a structured format for easy retrieval. Unfortunately, this is rarely the case, so measures must be taken to allow users to input information that is not automatically discoverable. To facilitate this SDC and/or CQF Questionnaire is used as described below.

### SDC
The [Structured Data Capture Implementation Guide](http://hl7.org/fhir/us/sdc/index.html) is used to allow payers to declare information needs and provide the DTR process with a means of obtaining this data from a user.

### CQF Questionnaire
Payers will describe their information needs through the FHIR Questionnaire resource. These resources SHALL conform to the [CQF Questionnaire Profile](http://hl7.org/fhir/R4/cqf.html). This profile allows the Questionnaire to be associated with the Clinical Quality Language (CQL) used to find the desired information within a patient's data. Further, it allows each individual item in the Questionnaire to be associated with an expression in the CQL. 