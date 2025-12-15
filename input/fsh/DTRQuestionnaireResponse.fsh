Profile:        DTRQuestionnaireResponse
Parent:         SDCQuestionnaireResponse
Id:             dtr-questionnaireresponse
Title:          "DTR Questionnaire Response"
Description:    "Enforces DTR requirements on a completed or partially completed QuestionnaireResponse, including allowing the response to be linked to the relevant order, coverage, etc. and enforcing constraints applicable to the DTR context."

* ^meta.versionId = "10"
* ^meta.lastUpdated = "2023-08-21T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The QuestionnaireResponse resource is used to represent the information supplied by the provider.</p></div>"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2023-08-21T02:27:35+00:00"

* extension[signature] MS

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/qr-coverage named coverage 1..* MS
* extension[coverage] ^short = "Identifies the coverages associated with the specified QuestionnaireResponse."

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/qr-context named context 0..* MS
* extension[context] ^short = "Identifies the orders and/or other resources associated with the specified QuestionnaireResponse."

* extension contains CRDCoverageInformation named coverage-information 0..* MS
* extension[coverage-information] ^short = "Coverage Info"

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/intendedUse named intendedUse 1..* MS
* extension[intendedUse] ^short = "Indicates how the EHR is to use the information with respect to the associated orders/records."

* basedOn 0..0
* partOf 0..0

* questionnaire 1..1

* subject 1..1
* subject only Reference($CRDPatient)

* author only Reference(Device or $CRDPatient or USCorePractitionerProfile or HRexPractitionerRole or $CRDOrganization or RelatedPerson)

* item 0..*
* item.extension[ItemSignature] MS

* item.answer.extension[itemAnswerMedia] MS
* item.answer.extension[itemWeight] MS
* item.answer.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin named origin 1..1 MS
* item.answer.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/containedReference named containedReference 0..1 MS
* item.answer.extension[containedReference] ^short = "Contain the reference?"

