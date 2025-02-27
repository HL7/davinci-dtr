// ***********************************************************************************************************
Instance: DTRQuestionnairePackageOperationResultSimple
InstanceOf: DTRQuestionnairePackageBundle
Title: "Questionnaire Package Operation Results - Simple"
Description: "An example of [DTRQuestionnairePackageOperation](OperationDefinition-questionnaire-package.html) returning a Parameters instance containing multiple Questionnaire bundles, each with references to other Library and ValueSet resources."
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:90404930-204a-4127-9c40-997b2ed7f767"
* type = #collection
* timestamp = "2023-04-20T00:00:00+05:00"
* entry[questionnaire].fullUrl = "http://example.org/fhir/home-o2-adaptive-questionnaire"
* entry[questionnaire].id = "home-o2-adaptive-questionnaire"
* entry[questionnaire].resource = home-o2-adaptive-questionnaire

* entry[questionnaireResponse].fullUrl = "http://example.org/fhir/home-o2-questionnaireresponse"
* entry[questionnaireResponse].resource = home-o2-questionnaireresponse

// ***********************************************************************************************************
Instance: DTRQuestionnairePackageOperationResultComplex
InstanceOf: DTRQuestionnairePackageBundle
Title: "Questionnaire Package Operation Results - Complex"
Description: "An example of [DTRQuestionnairePackageOperation](OperationDefinition-questionnaire-package.html) returning a Bundle with only a multiple questionnaires, with references to other Library and ValueSet resources"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:90404930-204a-4127-9c40-997b2ed7f767"
* type = #collection
* timestamp = "2023-04-20T00:00:00+05:00"
* entry[questionnaire].fullUrl = "http://example.org/fhir/home-o2-adaptive-questionnaire"
* entry[questionnaire].id = "home-o2-adaptive-questionnaire"
* entry[questionnaire].resource = home-o2-adaptive-questionnaire

* entry[questionnaireResponse].fullUrl = "http://example.org/fhir/home-o2-questionnaireresponse"
* entry[questionnaireResponse].resource = home-o2-questionnaireresponse