Instance: dtr-payer-service
InstanceOf: CapabilityStatement
Title: "DTR Payer Service"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service"
* version = "2.2.0"
* name = "DTRPayerService"
* title = "DTR Payer Service"
* status = #active
* experimental = false
* date = "2026-02-04"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This capability statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients. Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [HRex implementation guide](https://build.fhir.org/ig/HL7/davinci-ehrx)."

// ****************************************************************************************************************************
// Operations
* rest.resource[+].type = #Questionnaire
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "questionnaire-package"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"

* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "next-question"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question"

* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "log-questionnaire-errors"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"

//****
* rest.resource[+].type = #ValueSet
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "expand"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"

