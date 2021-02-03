/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRQuestionnaireResponseR4
Parent:         QuestionnaireResponse
Id:             dtr-questionnaireresponse-r4
Title:          "DTR Questionnaire Response R4"
Description:    "The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer."

* basedOn 0..0
* partOf 0..0

* questionnaire 1..1

* subject 1..1
* subject only Reference(Resource)

* item 1..*

* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaireresponse-author named questionnaireresponse-author 0..1
