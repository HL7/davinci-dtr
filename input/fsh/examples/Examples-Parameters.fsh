// **********************************************************************************************************************************
Instance: QuestionnairePackageInputParamsExample
InstanceOf: DTRQuestionnairePackageInputParameters
Description: "An example instance of Input Parameters for the QuestionnairePackage operation."
Title: "$questionnaire-package Input Parameters Example"
Usage: #example
* parameter[coverage].resource = CoverageExample
* parameter[order].resource = ServiceRequestExample
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire"

// **********************************************************************************************************************************
Instance: QuestionnairePackageOutputParamsExample
InstanceOf: DTRQuestionnairePackageOutputParameters
Description: "An example instance of Output Parameters for the QuestionnairePackage operation."
Title: "$questionnaire-package Output Parameters Example"
Usage: #example
* parameter[PackageBundle].resource = home-o2-questionnairepackage-bundle

// **********************************************************************************************************************************
Instance: LogQuestionnaireErrorsInputParamsExample
InstanceOf: DTRLogErrorsInputParameters
Description: "An example instance of Input Parameters that are supplied to the Log Questionnaire Errors operation."
Title: "$log-questionnaire-errors Input Parameters Example"
Usage: #example
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire"
* parameter[outcome].resource = OperationOutcomeExample

// **********************************************************************************************************************************
Instance: NextQuestionInputParamsExample
InstanceOf: DTRQuestionnaireNextQuestionnaireInputParameters
Description: "An example instance of input Parameters used by the Next Question operation."
Title: "$next-question Input Parameters Example"
Usage: #example
* parameter[QuestionnaireResponse].resource = home-o2-questionnaireresponse

// **********************************************************************************************************************************
Instance: NextQuestionOutputParamsExample
InstanceOf: DTRQuestionnaireNextQuestionnaireOutputParameters
Description: "An example instance of output Parameters used by the Next Question operation."
Title: "$next-question Output Parameters Example"
Usage: #example
* parameter[QuestionnaireResponse].resource = home-o2-questionnaireresponse
