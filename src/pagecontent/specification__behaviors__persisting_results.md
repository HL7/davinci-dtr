When the Documentation Templates and Rules (DTR) application has collected all of the necessary information, it must persist the results of the data collection. This implementation guide describes two methods for saving the collected information: a text block in the Electronic Health Record (EHR) System and a QuestionnaireResponse.

### Text Block
Many EHR Systems do not currently support writing a QuestionnaireResponse into a FHIR server. However, The US Core Implementation Guide (IG) now includes a [DocumentReference Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html), which allows clients, like the DTR application, to write notes into the EHR System's FHIR server. The following section describes how the QuestionnaireResponse that is generated through the processes described in Section 4.4.3 and Section 4.4.4 can be transformed into text such that it may be persisted as a note in the EHR system.

#### QuestionnaireResponse transformation process
The DTR application SHALL support transforming a DTR-QuestionnaireResponse resource into a [Portable Document Format](https://www.iso.org/standard/63534.html) (PDF) representation. DTR applications SHALL ensure that the document indicates differences between user supplied information and data gathered from the EHR system.

The DTR application SHALL create a DocumentReference resource with this information that conforms to the US Core DocumentReference profile. The generated PDF SHALL be recorded in `DocumentReference.content.attachment.data`. `DocumentReference.content.attachment.contentType` SHALL be `application/pdf`

> Note to ballot comments
>
> This is an area the project is explicitly seeking comments on. Please provide any
> details on constraints that should be applied to the document generation process.

#### Interaction with EHR
EHR systems that conform to US Core STU3 allow for the creation of DocumentationReference resources through a FHIR API. As such, the DTR application should use the typical [FHIR create](http://hl7.org/fhir/R4/http.html#create) interaction to write the documentation into the EHR.

### QuestionnaireResponse
The DTR application creates a QuestionnaireResponse resource through the course of normal operation. This resource may be persisted in the EHR system of the healthcare provider if it is supported. It may also be transmitted to the Payer IT system.

#### Interaction with Payer API
The Payer IT system should support the FHIR create interaction to allow the DTR application to send the QuestionnaireResponse resource to the payer. The FHIR endpoint for the payer may require authentication. If it is required, it SHALL follow the procedures described in Section 4.4.1.1 - Authentication of SMART on FHIR application to payer API.
