When the DTR process has collected all of the necessary information, it must save the results of the data collection to the patient record. This IG describes two methods for saving the collected information: a text block in the Electronic Health Record (EHR) System and a QuestionnaireResponse.

### Text Block
Many EHR Systems do not currently support writing a QuestionnaireResponse into a FHIR server. However, The US Core Implementation Guide (IG) now includes a [DocumentReference Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html), which allows clients, like the DTR process, to write notes into the EHR (or EHR) system's FHIR server. The following section describes how the QuestionnaireResponse that is generated through the processes described in Section 4.4.3 and Section 4.4.4 can be transformed into text such that it may be saved as a note in the EHR system.

#### QuestionnaireResponse transformation process

The information that is collected (via the Questionnaire interaction with the user) SHOULD be written to the EHR via the available FHIR API. The results of the questionnaireResponse SHALL be saved as the FHIR resource and/or as a human readable format that is supported by the EHR.

 If the EHR has the capability to render a QuestionnaireResponse, it SHOULD save the QuestionnaireResponse as part of the patient record. If EHR does not have ability to render the QuestionnaireResponse, then the EHR should support saving the QuestionnaireResponse information as whichever supported structure produces the least impact on users.

The DTR process SHOULD support transforming a DTR-QuestionnaireResponse resource into a [Portable Document Format](https://www.iso.org/standard/63534.html) (PDF) representation. DTR process SHOULD ensure that the document indicates whether data was entered by the provider in response to the questionnaire or retrieved from the EHR directly.

The DTR process SHALL store this information in the EHR - either as a [DocumentReference](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html) resource conforming to the US Core profile or in another EHR-appropriate, human-readable form. Implementers are strongly encouraged to use the most reusable, discrete form of data they can.  If necessary, a PDF can be generated to store the information if other options are not possible.  The generated PDF SHOULD be recorded in `DocumentReference.content.attachment.data`. `DocumentReference.content.attachment.contentType` SHOULD be `application/pdf`

#### Interaction with EHR
EHR systems that conform to [US Core](http://www.hl7.org/fhir/us/core/) allow for the creation of DocumentationReference resources through a FHIR API. As such, the DTR process should use the typical [FHIR create](http://hl7.org/fhir/R4/http.html#create) interaction to write the documentation into the EHR.

### QuestionnaireResponse
The DTR process creates a QuestionnaireResponse resource through the course of normal operation. This resource SHOULD be saved to the patient record in the EHR system of the healthcare provider if supported. It may also be transmitted to the payer IT system.

>Reusing QuestionnaireResponses may save time and effort. In the case of a QuestionnaireResponse being reused. The data in the QuestionnaireResponse should be refreshed where possible with the latest data from the EHR system when being reused. 

#### Interaction with Payer API
The payer IT system should support the FHIR create interaction to allow the DTR process to send the QuestionnaireResponse resource to the payer. The FHIR endpoint for the payer may require authentication. If it is required, it SHALL follow the procedures described in [Section 4.4.1](specification__behaviors__retrieval_of_payer_resources.html#authentication-of-smart-on-fhir-application-to-payer-api) - Authentication of SMART on FHIR application to payer API.

#### Pushing QuestionnaireResponse to Payer
This IG will support the [HRex Decision point – Configured by consumer?](http://build.fhir.org/ig/HL7/davinci-ehrx/exchanging.html#configured-by-consumer) when a SMART on FHIR or native EHR app wants to push a QuestionnaireResponse to a Payer.  


