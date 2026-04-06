/**************************************************************************************************************/
Instance: DTRLogQuestionnaireErrors
InstanceOf: OperationDefinition
Description: "The operation will pass a Questionnaire reference and an OperationOutcome detailing the issue(s) including where the error occurred back to the originating Payer."
Title: "DTR Log Questionnaire Errors"
Usage: #definition

* id = "log-questionnaire-errors"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"
* name = "LogQuestionnaireErrors"
* title = "Log errors resulting from a specific Questionnaire and/or CQL to the originating Payer"
* status = #active
* kind = #operation
* description = "§oper-1^dtr-client,dtr-server^exchange:This operation **SHALL** be supported by payers and DTR applications.§  It allows submission of issues encountered when working with these DTR-provided artifacts.  The operation will pass the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred.    

§oper-2^dtr-client^exchange:The input OperationOutcome resource **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI.§  §oper-3^dtr-client^exchange:The Questionnaire reference **SHOULD** be version-specific.§"
* code = #log-questionnaire-errors

* resource = #Questionnaire
* system = false
* type = true
* instance = false

* inputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-log-errors-input-parameters"

// -------------------------- Input --------------------------

* parameter[+].name = #questionnaire
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "The Questionnaire generating the errors (The reference SHOULD be version-specific)"
* parameter[=].type = #canonical
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"

* parameter[+].name = #operationOutcome
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "Operation Outcome associated with the Questionnaire/CQL"
* parameter[=].type = #OperationOutcome
