/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRQuestionnaireResponse
Parent:         QuestionnaireResponse
Id:             dtr-questionnaireresponse-r4
Title:          "DTR Questionnaire Response R4"
Description:    "Enforces DTR requirements on a completed or partially completed Questionnaire, including allowing the response to be linked to the relevant order, coverage, etc. and enforcing constraints applicable to the DTR context. For EHRs that support storing 'work-in-progress' QuestionnaireResponses, the DTR response will be persisted as a 'completed' QuestionnaireResponse, optionally tied to the relevant order by an extension. For EHRs that do not support storing 'work-in-progress', the DTR app will create a DocumentReference on the provider system containing a PDF with the relevant information tied to the patient and encounter and humans will need to figure out what to do.  The DocumentReference will have an identifier linking it to the work in progress and if the DocumentReference gets included in a subsequent prior authorization request (e.g., PAS) or claim submission, the payer will be able to retrieve the discrete data from the work in progress stored on the payer side to aid in automated processing.

This profile allows questions to be answered with a type of Reference.  I.e. The answer to a question might be pointing to an existing resource (a Practitioner, a Condition, a DocumentReference, etc.)  In general, all such answers **SHOULD** be references to resources held within the launching EHR.  However, with mutual agreement with the EMR, a payer **MAY** provide Questionnaires that allow answers as references to an external FHIR repository - e.g. a centralized practitioner or organization registry.  The EMR would need to have access to the external entries in order to allow them to be incorporated into the [QuestionnaireResponse Bundle]."

* ^meta.versionId = "10"
* ^meta.lastUpdated = "2019-03-11T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The QuestionnaireResponse resource is used to represent the information supplied by the provider.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-12-23T02:27:35+00:00"

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/context named Context 0..1 
* extension[Context] ^short = "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse."

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/pertinentOrders named pertinentOrders 1..* 
* extension[pertinentOrders] ^short = "Provides a reference to the Request resource(s) and/or Encounter that the QuestionnaireResponse relates to."

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/intendedUse named intendedUse 0..* 
* extension[intendedUse] ^short = "Indicates how the EHR is to use the information with respect to the associated orders/records."

* basedOn 0..0
* partOf 0..0

* questionnaire 1..1

* subject 1..1
* subject only Reference(Patient)

* item 1..*
* item.extension only $QRAUTHOR

* item.answer.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin named Origin 0..1 MS