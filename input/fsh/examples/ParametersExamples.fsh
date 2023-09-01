// **********************************************************************************************************************************
Instance: QuestionnairePackageInputParamsExample
InstanceOf: DTRQuestionnairePackageInputParameters
Description: "An example instance of Input Parameters for the QuestionnairePackage operation."
Usage: #example
* parameter[coverage].resource = CoverageExample
* parameter[order].resource = ServiceRequestExample

// **********************************************************************************************************************************
Instance: QuestionnairePackageOutputParamsExample
InstanceOf: DTRQuestionnairePackageOutputParameters
Description: "An example instance of Output Parameters for the QuestionnairePackage operation."
Usage: #example
* parameter[PackageBundle].resource = home-o2-questionnairepackage-bundle

// **********************************************************************************************************************************
Instance: LogQuestionnaireErrorsInputParamsExample
InstanceOf: DTRLogErrorsInputParameters
Description: "An example instance of Input Parameters for the Log Questionnaire Errors operation."
Usage: #example
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire"
* parameter[outcome].resource = OperationOutcomeExample