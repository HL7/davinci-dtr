When the Documentation Templates and Rules (DTR) application has collected all of the necessary information, it must save the results of the data collection to the patient record. This implementation guide describes two methods for saving the collected information: a text block in the Electronic Medical Record (EMR) System and a QuestionnaireResponse.

### Text Block
Many EMR Systems do not currently support writing a QuestionnaireResponse into a FHIR server. However, The US Core Implementation Guide (IG) now includes a [DocumentReference Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html), which allows clients, like the DTR application, to write notes into the EMR System's FHIR server. The following section describes how the QuestionnaireResponse that is generated through the processes described in Section 4.4.3 and Section 4.4.4 can be transformed into text such that it may be saved as a note in the EMR system.

#### QuestionnaireResponse transformation process

The information that is collected (via the Questionnaire interaction with the user) SHOULD be written to the EMR via the available FHIR API if possible. The results of the questionnaireResponse SHALL be saved as the FHIR resource and/or as a human readable format that is supported by the EMR.

 If the EMR has the capability to render a QuestionnaireResponse, it SHOULD save the QuestionnaireResponse as part of the patient record. If EMR does not have ability to render the QuestionnaireResponse, then the EMR should support saving the QuestionnaireResponse information as whichever supported structure produces the least impact on users.

The DTR application SHOULD support transforming a DTR-QuestionnaireResponse resource into a [Portable Document Format](https://www.iso.org/standard/63534.html) (PDF) representation. DTR applications SHOULD ensure that the document indicates whether data was entered by the provider in reponse to the questionnaire or retrieved from the EMR directly.

The DTR application SHALL store this information in the EMR - either as a DocumentReference resource conforming to the US Core profile or in another EMR-appropriate, human-readable form. Implementers are strongly encouraged to use the most reusable, discrete form of data they can.  If necessary, a PDF can be generated to store the information if other options are not possible.  The generated PDF SHOULD be recorded in `DocumentReference.content.attachment.data`. `DocumentReference.content.attachment.contentType` SHOULD be `application/pdf`

> Note to ballot comments
>
> This is an area the project is explicitly seeking comments on. Please provide any
> details on constraints that should be applied to the document generation process.

> Mention of stu3 but not sure if needed for removal

#### Interaction with EMR
EMR systems that conform to US Core STU3 allow for the creation of DocumentationReference resources through a FHIR API. As such, the DTR application should use the typical [FHIR create](http://hl7.org/fhir/R4/http.html#create) interaction to write the documentation into the EMR.

### QuestionnaireResponse
The DTR application creates a QuestionnaireResponse resource through the course of normal operation. This resource may be saved to the patient record in the EMR system of the healthcare provider if it is supported. It may also be transmitted to the Payer IT system.

#### Interaction with Payer API
The Payer IT system should support the FHIR create interaction to allow the DTR application to send the QuestionnaireResponse resource to the payer. The FHIR endpoint for the payer may require authentication. If it is required, it SHALL follow the procedures described in [Section 4.4.1](specification__behaviors__retrieval_of_payer_resources.html#authentication-of-smart-on-fhir-application-to-payer-api) - Authentication of SMART on FHIR application to payer API.
