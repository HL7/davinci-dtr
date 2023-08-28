
/**************************************************************************************************************/
Instance: light-dtr-ehr
InstanceOf: CapabilityStatement
Title: "Light DTR EHR"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/light-dtr-ehr"
* version = "1.1.0-ballot"
* name = "LightDTREHR"
* title = "Light DTR EHR"
* status = #active
* experimental = false
* date = "2023-06-29"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of EHRs that rely on a SMART on FHIR application to handle the form filling function of DTR"
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR intermediary system provides an SMART on FHIR application"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[http://hl7.org/fhir/us/davinci-hrex/STU1/security.html|HRex implementation guide]]."
* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving coverages for the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Allows filtering to only active coverages"
* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #Parameters
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-input-parameters"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #Questionnaire
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
* rest.resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[=].searchParam.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam.extension.valueCode = #SHALL
* rest.resource[=].searchParam.name = "context"
* rest.resource[=].searchParam.definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam.type = #reference
* rest.resource[=].searchParam.documentation = "Allows retrieving QuestionnaireResponse for a context"
* rest.operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "QuestionnairePackage"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* rest.operation[=].documentation = "This operation returns 1 or more 'collection' Bundles each consisting of a single Questionnaire resource as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire.  \r\nThe operation SHALL take in either:\r\n(1) one or more canonicals specifying the URL and, (optionally) the version of the Questionnaire(s) to retrieve; or (2) a CRD Context ID - or both."
* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHOULD
* rest.operation[=].name = "log-questionnaire-errors"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"
* rest.operation[=].documentation = "This operation **SHOULD** be supported by payers and DTR applications and allows submission of issues encountered when working with these DTR-provided artifacts. The operation will pass the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred. \r\nThe input OperationOutcome resource **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI."


/**************************************************************************************************************/
Instance: full-dtr-ehr
InstanceOf: CapabilityStatement
Title: "Full DTR EHR"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr"
* version = "1.1.0-ballot"
* name = "FullDTREHR"
* title = "Full DTR EHR"
* status = #active
* experimental = false
* date = "2023-06-29"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of EHRs that manage the form filling functions of DTR internally"
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "A DTR Native Client provides an EHR-based application"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[http://hl7.org/fhir/us/davinci-hrex/STU1/security.html|HRex implementation guide]]."
* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving coverages for the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Allows filtering to only active coverages"
* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #Parameters
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-input-parameters"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #Questionnaire
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
* rest.resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[=].searchParam.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam.extension.valueCode = #SHALL
* rest.resource[=].searchParam.name = "context"
* rest.resource[=].searchParam.definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam.type = #reference
* rest.resource[=].searchParam.documentation = "Allows retrieving QuestionnaireResponse for a context"


/**************************************************************************************************************/
Instance: dtr-payer-app
InstanceOf: CapabilityStatement
Title: "DTR Payer App"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-app"
* version = "1.1.0-ballot"
* name = "DTRPayerApp"
* title = "DTR Payer App"
* status = #active
* experimental = false
* date = "2023-06-29"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR Payer App provides an SMART on FHIR application"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[http://hl7.org/fhir/us/davinci-hrex/STU1/security.html|HRex implementation guide]]."
* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving coverages for the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Allows filtering to only active coverages"
* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #Parameters
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-input-parameters"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #Questionnaire
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
* rest.resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[=].searchParam.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam.extension.valueCode = #SHALL
* rest.resource[=].searchParam.name = "context"
* rest.resource[=].searchParam.definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam.type = #reference
* rest.resource[=].searchParam.documentation = "Allows retrieving QuestionnaireResponse for a context"
* rest.operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "QuestionnairePackage"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* rest.operation[=].documentation = "This operation returns 1 or more 'collection' Bundles each consisting of a single Questionnaire resource as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire.  \r\nThe operation SHALL take in either:\r\n(1) one or more canonicals specifying the URL and, (optionally) the version of the Questionnaire(s) to retrieve; or (2) a CRD Context ID - or both."
* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHOULD
* rest.operation[=].name = "log-questionnaire-errors"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"
* rest.operation[=].documentation = "This operation **SHOULD** be supported by payers and DTR applications and allows submission of issues encountered when working with these DTR-provided artifacts. The operation will pass the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred. \r\nThe input OperationOutcome resource **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI."


/**************************************************************************************************************/
Instance: dtr-smart-client
InstanceOf: CapabilityStatement
Title: "DTR SMART Client"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-smart-client"
* version = "1.1.0-ballot"
* name = "DTRSmartClient"
* title = "DTR SMART on FHIR Client"
* status = #active
* experimental = false
* date = "2023-06-29"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of DTR SMART on FHIR applications"
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "A DTR SMART on FHIR Client provides an application conforming to the SMART on FHIR specification and related requirements declared in this Implementation Guide."
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[http://hl7.org/fhir/us/davinci-hrex/STU1/security.html|HRex implementation guide]]."
* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving coverages for the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Allows filtering to only active coverages"
* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[+].type = #Parameters
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-input-parameters"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #Questionnaire
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
* rest.resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read
* rest.resource[=].searchParam.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam.extension.valueCode = #SHALL
* rest.resource[=].searchParam.name = "context"
* rest.resource[=].searchParam.definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam.type = #reference
* rest.resource[=].searchParam.documentation = "Allows retrieving QuestionnaireResponse for a context"