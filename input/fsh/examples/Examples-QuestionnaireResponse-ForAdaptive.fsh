Instance: home-o2-adaptive-questionnaireresponse
InstanceOf: DTRQuestionnaireResponseAdapt
Usage: #example
Description: "An example [QuestionnaireResponse](StructureDefinition-dtr-questionnaireresponse.html) for Adaptive Questionnaire."
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse-adapt"
* contained[0] = home-o2-adaptive-questionnaire

* extension[coverage][0].valueReference = Reference(CoverageExample)
* extension[context][0].valueReference = Reference(ServiceRequestExample)
* extension[intendedUse].valueCodeableConcept.coding = http://hl7.org/fhir/us/davinci-crd/CodeSystem/temp#withorder "Include with order"

* questionnaire = "#home-o2-adaptive-questionnaire"
* status = #completed
* subject = Reference(PatientExample) "Vlad"
* authored = "2022-01-26T20:36:57.544Z"
* item[+].linkId = "1"
* item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].answer[0].valueString = "diagnosis"
* item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[+].linkId = "2"
* item[=].text = "Order Reason"
* item[=].answer[0].valueCoding = http://example.org#4 "Replacement"
* item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].answer[=].extension[=].extension[=].valueCode = #auto
