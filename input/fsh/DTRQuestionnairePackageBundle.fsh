Profile: DTRQuestionnairePackageBundle
Parent: Bundle
Id: DTR-QPackageBundle
Title: "DTR Questionnaire Package Bundle"
Description: "This profile represents the Bundle of Questionnaires and Libraries returned in a [$questionnaire-package](OperationDefinition-questionnaire-package.html) response."
// * status = #active

* obeys dtrb-1
* type = #collection

* entry 1..*
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
    questionnaire 1..1 MS and
    questionnaireResponse 1..1 MS and
    valueSet 0..* MS and
    library 0..* MS 
    
* entry[questionnaire] ^short = "SHALL have one and only one Questionnaire"
* entry[questionnaire].resource 1..1
* entry[questionnaire].resource only Questionnaire

* entry[questionnaireResponse] ^short = "SHALL have one and only one QuestionnaireResponse"
* entry[questionnaireResponse].resource 1..1
* entry[questionnaireResponse].resource only DTRQuestionnaireResponse

* entry[valueSet] ^short = "MAY have ValueSets"
* entry[valueSet].resource 1..1 
* entry[valueSet].resource only ValueSet

* entry[library] ^short = "MAY have Libraries"
* entry[library].resource 1..1 
* entry[library].resource only Library