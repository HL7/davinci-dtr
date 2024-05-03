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

* extension contains CRDCoverageInformation named Coverage-Information 0..* MS
* extension[Coverage-Information] ^short = "Coverage Info"

* extension[signature] MS

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/qr-context named context 2..*
* extension[context] ^short = "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse. The QuestionnaireResponse SHALL have at least one context that refers to a patient Coverage AND at least one context that refers to a Request resource or Encounter"

* extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/intendedUse named intendedUse 1..* 
* extension[intendedUse] ^short = "Indicates how the EHR is to use the information with respect to the associated orders/records."

* basedOn 0..0
* partOf 0..0

* questionnaire 1..1

* subject 1..1
* subject only Reference(us-core-patient)

* author only Reference(Device or $USCOREPatient or $USCOREPractitioner or $USCOREPractitionerRole or $USCOREOrganization or RelatedPerson)

* item 1..*
* item.extension[ItemSignature] MS

* item.answer.extension[itemAnswerMedia] MS
* item.answer.extension[ordinalValue] MS
* item.answer.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin named origin 1..1 MS
