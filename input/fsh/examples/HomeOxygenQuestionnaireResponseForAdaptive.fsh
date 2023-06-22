Instance: home-o2-sdc-adaptive-questionnaire
InstanceOf: DTRSDCQuestionnaireAdapt
Usage: #inline
Description: "An example Adaptive SDC questionnaire for Home Oxygen Therapy."

* version = "0.1.0"
* name = "HomeOxygenTherapyAdaptiveSDCQuestionnaire"
* title = "Adaptive Home Oxygen Therapy Order Template (SDC)"
* status = #draft
* subjectType = #Patient
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Example adaptive questionnaire contained in a QuestionnaireResposne</div>"
* date = "2020-01-16T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"

* derivedFrom = "http://example/basequestionnaire"
* extension[sdc-questionnaire-questionnaireAdaptive].valueBoolean = true
* item.linkId = "1"
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

Instance: home-o2-sdc-adaptive-questionnaireresponse
InstanceOf: QuestionnaireResponse
Usage: #example
Description: "An example QuestionnaireResponse for Adaptive Questionnaire."
* contained[0] = home-o2-sdc-adaptive-questionnaire
* questionnaire = "#home-o2-sdc-adaptive-questionnaire"
* status = #completed
* subject = Reference(PatientExample1) "Vlad"
* authored = "2022-01-26T20:36:57.544Z"
* author = Reference(PractitionerExample1)
* item.linkId = "1"
* item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].answer.valueString = "diagnosis"
* item[+].linkId = "2"
* item[=].text = "Order Reason"
* item[=].answer.valueCoding = http://example.org#4 "Replacement"
