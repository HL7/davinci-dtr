Instance: home-o2-adaptive-questionnaireresponse
InstanceOf: QuestionnaireResponse
Usage: #example
Description: "An example [QuestionnaireResponse](StructureDefinition-dtr-questionnaireresponse.html) for Adaptive Questionnaire."
* contained[0] = home-o2-adaptive-questionnaire
* questionnaire = "#home-o2-adaptive-questionnaire"
* status = #completed
* authored = "2022-01-26T20:36:57.544Z"
* item[+].linkId = "1"
* item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].answer.valueString = "diagnosis"
* item[+].linkId = "2"
* item[=].text = "Order Reason"
* item[=].answer.valueCoding = http://example.org#4 "Replacement"
