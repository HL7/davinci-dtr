/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRQuestionnaireR4
Parent:         CQF-Questionnaire
Id:             dtr-questionnaire-r4
Title:          "DTR Questionnaire R4"
Description:    "The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules."

* extension[cqf-library] 1..*

* experimental 0..0

* date 1..1

* contact 1..*

* item 1..*

* item.extension contains http://hl7.org/fhir/StructureDefinition/cqf-expression named cqf-expression 0..1
