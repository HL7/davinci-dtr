Profile: DTRQuestionnaireResponseBundle
Parent: Bundle
Id: DTR-QRBundle
Title: "DTR Questionnaire Response Bundle"
Description: "This profile represents the Bundle created by EHRs for transmission of a QuestionnaireResponse and associated resources to PAS, for claim submission, etc.."
// * status = #active

* obeys dtrb-2
* type = #collection

* entry 1..*
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains
    questionnaireResponse 1..1 MS 
    
* entry[questionnaireResponse] ^short = "SHALL have one and only one QuestionnaireResponse"
* entry[questionnaireResponse].resource 1..1
* entry[questionnaireResponse].resource only QuestionnaireResponse
