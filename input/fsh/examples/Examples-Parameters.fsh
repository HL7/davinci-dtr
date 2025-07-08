// **********************************************************************************************************************************
Instance: QuestionnairePackageInputParamsExample
InstanceOf: DTRQuestionnairePackageInputParameters
Description: "An example instance of [Input Parameters](StructureDefinition-dtr-qpackage-input-parameters.html) for the [QuestionnairePackage](OperationDefinition-questionnaire-package.html) operation."
Title: "$questionnaire-package Input Parameters Example"
Usage: #example
* parameter[coverage].resource = CoverageExample
* parameter[order].resource = ServiceRequestExample
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire|2.1.0"

// **********************************************************************************************************************************
Instance: QuestionnairePackageOutputParamsExample
InstanceOf: DTRQuestionnairePackageOutputParameters
Description: "An example instance of [Output Parameters](StructureDefinition-dtr-qpackage-output-parameters.html) for the [QuestionnairePackage](OperationDefinition-questionnaire-package.html) operation."
Title: "$questionnaire-package Output Parameters Example"
Usage: #example
* parameter[PackageBundle].resource = home-o2-questionnairepackage-bundle

// **********************************************************************************************************************************
Instance: LogQuestionnaireErrorsInputParamsExample
InstanceOf: DTRLogErrorsInputParameters
Description: "An example instance of [Input Parameters](StructureDefinition-dtr-log-errors-input-parameters.html) that are supplied to the [Log Questionnaire Errors](OperationDefinition-log-questionnaire-errors.html) operation."
Title: "$log-questionnaire-errors Input Parameters Example"
Usage: #example
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire|2.1.0"
* parameter[outcome].resource = OperationOutcomeExample

// **********************************************************************************************************************************
Instance: NextQuestionInputParamsExample
InstanceOf: DTRQuestionnaireNextQuestionnaireInputParameters
Description: "An example instance of [input Parameters](StructureDefinition-dtr-next-question-input-parameters.html) used by the [Next Question](OperationDefinition-DTR-Questionnaire-next-question.html) operation."
Title: "$next-question Input Parameters Example"
Usage: #example
* parameter[QuestionnaireResponse].resource = home-o2-questionnaireresponse

// **********************************************************************************************************************************
Instance: NextQuestionOutputParamsExample
InstanceOf: DTRQuestionnaireNextQuestionnaireOutputParameters
Description: "An example instance of [output Parameters](StructureDefinition-dtr-next-question-output-parameters.html) used by the [Next Question](OperationDefinition-DTR-Questionnaire-next-question.html) operation."
Title: "$next-question Output Parameters Example"
Usage: #example
* parameter[QuestionnaireResponse].resource = home-o2-questionnaireresponse
