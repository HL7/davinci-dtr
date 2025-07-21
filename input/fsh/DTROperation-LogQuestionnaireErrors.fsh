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
* description = "This operation **SHALL** be supported by payers and DTR applications. It allows submission of issues encountered when working with these DTR-provided artifacts.  The operation will pass the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred.    

The input OperationOutcome resource **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI.  The Questionnaire reference **SHOULD** be version-specific."
* inputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-log-errors-input-parameters"
* code = #log-questionnaire-errors
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"

* resource = #Questionnaire
* system = false
* type = true
* instance = false

// -------------------------- Input --------------------------
* parameter[0].name = #resource
* parameter[=].use = #in
* parameter[=].documentation = "The Questionnaire which generated the errors"
* parameter[=].type = #canonical
//* ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
* parameter[=].min = 1
* parameter[=].max = "1"

* parameter[+].name = #resource
* parameter[=].use = #in
* parameter[=].documentation = "The OperationOutcome documenting the Questionnaire/CQL errors and their location"
* parameter[=].type = #OperationOutcome
* parameter[=].min = 1
* parameter[=].max = "1"
