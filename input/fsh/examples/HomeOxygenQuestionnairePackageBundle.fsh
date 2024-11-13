// **********************************************************************************************************************************
Instance: home-o2-questionnairepackage-bundle
InstanceOf: DTRQuestionnairePackageBundle
Usage: #example
Description: "An example QuestionnaireResponseBundle for Home Oxygen Therapy."
* meta.profile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/DTR-QPackageBundle"
* type = #collection
* entry[questionnaire].fullUrl = "http://example.org/home-o2-questionnairepackage"
* entry[questionnaire].resource = home-o2-std-questionnaire

// **********************************************************************************************************************************
Instance: home-o2-questionnairepackage-bundle-2
InstanceOf: DTRQuestionnairePackageBundle
Usage: #example
Description: "An example QuestionnaireResponseBundle for Home Oxygen Therapy."
* meta.profile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/DTR-QPackageBundle2"
* type = #collection

* entry[questionnaire].fullUrl = "http://example.org/home-o2-questionnaire"
* entry[questionnaire].resource = home-o2-std-questionnaire

* entry[questionnaireResponse].fullUrl = "http://example.org/home-o2-questionnaireresponse"
* entry[questionnaireResponse].resource = home-o2-questionnaireresponse