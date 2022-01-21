Instance: home-o2-sdc-adaptive-questionnaire
InstanceOf: DTRSDCQuestionnaireAdapt
Usage: #example
Description: "Example Adaptive SDC questionnaire for Home Oxygen Therapy"

* version = "0.1.0"
* name = "HomeOxygenTherapyAdaptiveSDCQuestionnaire"
* title = "Adaptive Home Oxygen Therapy Order Template (SDC)"
* status = #draft
* subjectType = #Patient
* text.status = #generated
* text.div = "<div></div>"
* date = "2020-01-16T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"

* derivedFrom = "http://example/basequestionnaire"
* extension[cqf-library].valueCanonical = "http://example.com/Library/HomeOxygenTherapy-prepopulation"
* extension[sdc-questionnaire-questionnaireAdaptive].valueBoolean = true
* item.linkId = "1"
* item[=].text = "SQ-1.4.a: Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].type = #open-choice
* item[=].required = true
* item[=].repeats = true
* item[=].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].extension.valueExpression.language = #text/cql
* item[=].extension.valueExpression.expression = "\"HomeOxygenTherapyPrepopulation\".RelevantDiagnoses"
* item[+].linkId = "2"
* item[=].text = "Order Reason"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueCoding.code = #"Initial or original order for certification"
* item[=].answerOption[+].valueCoding.code = #"Change in status"
* item[=].answerOption[+].valueCoding.code = #"Revision or change in equipment"
* item[=].answerOption[+].valueCoding.code = #Replacement