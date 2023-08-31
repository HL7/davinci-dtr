// **********************************************************************************************************************************
Instance: home-o2-questionnairepackage-bundle
InstanceOf: DTRQuestionnairePackageBundle
Usage: #example
Description: "An example QuestionnaireResponseBundle for Home Oxygen Therapy."
* meta.profile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/DTR-QPackageBundle"
* type = #collection
* entry[0].fullUrl = "http://example.org/home-o2-questionnairepackage"
* entry[=].resource = home-o2-std-questionnaire