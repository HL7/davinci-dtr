// **********************************************************************************************************************************
Instance: home-o2-adaptive-questionnaire
InstanceOf: DTRQuestionnaireAdapt
Usage: #inline
Description: "An example Adaptive questionnaire for Home Oxygen Therapy."
* version = "0.1.0"
* name = "HomeOxygenTherapyAdaptiveQuestionnaire"
* title = "Adaptive Home Oxygen Therapy Order Template"
* status = #draft
* subjectType = #Patient
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Example adaptive questionnaire contained in a QuestionnaireResposne</div>"
* date = "2020-01-16T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"
* derivedFrom = Canonical(dtr-questionnaire)

// * derivedFrom = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-base-questionnaire"
// * derivedFrom.extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
// * derivedFrom.extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-derivationType#compliesWith "Complies with"

* extension[sdc-questionnaire-questionnaireAdaptive].valueUrl = "http://example.com/fhir/R4"
* item[0].linkId = "1"
* item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].type = #text
* item[=].required = true
* item[+].linkId = "2"
* item[=].text = "Order Reason"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueCoding = http://example.org#1 "Initial or original order for certification"
* item[=].answerOption[+].valueCoding = http://example.org#2 "Change in status"
* item[=].answerOption[+].valueCoding = http://example.org#3 "Revision or change in equipment"
* item[=].answerOption[+].valueCoding = http://example.org#4 "Replacement"
