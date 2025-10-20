/**************************************************************************************************************/
Profile:        DTRQuestionnairePackageInputParameters
Parent:         Parameters
Id:             dtr-qpackage-input-parameters
Title:          "DTR Questionnaire Package Input Parameters"
Description:    "The Parameters profile used to define the inputs of the [$questionnaire-package](OperationDefinition-questionnaire-package.html) operation.  
If both orders and a context id are present, then the context id can be used to link to additional information retrieved during CRD and to expedite re-processing of which Questionnaires are needed.  However, the system should check that the passed orders are the same as was processed at CRD time before presuming that the questionnaires needed will be the same and if the orders have changed, or there's a possibility that the rules governing which Questionnaires are needed might have changed, **SHOULD** re-check to determine the needed Questionnaires.  If specific Questionnaires are requested as part of the DTR invocation, such additional checking is not expected."
* obeys dtr-1
* ^status = #active
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice based on $this pattern"
* parameter 1..* MS
* parameter contains 
	  coverage 1..* MS and
    order 0..* MS and
    questionnaire 0..* MS and
	  context 0..1 MS and
	  changedsince 0..1 MS
* parameter[coverage].name = "coverage"
* parameter[coverage].resource 1..1 MS
* parameter[coverage].resource only $CRDCoverage
* parameter[order].name = "order"
* parameter[order].resource 1..1 MS
* parameter[order].resource only $CRDAppointmentBase or $CRDEncounter or $CRDCommunicationRequest or $CRDDeviceRequest or $CRDMedicationRequest or $CRDNutritionOrder or $CRDServiceRequest or SupplyRequest or $CRDVisionPrescription
* parameter[order].resource ^short = "One or more Order resource instances, e.g., DeviceRequest, ServiceRequest, MedicationRequest, ... Encounter, Appointment, or prior-auth Claim, etc."
* parameter[questionnaire].name = "questionnaire"
* parameter[questionnaire].value[x] 1..1 MS
* parameter[questionnaire].value[x] only canonical
  * ^type.targetProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"

* parameter[context].name = "context"
* parameter[context] ^short = "CRD, CDex, or PAS-provided context"
* parameter[context].value[x] 1..1 MS
* parameter[context].value[x] only string
* parameter[changedsince].name = "changedsince"
* parameter[changedsince] ^short = "When the Questionnaire package was last retrieved"
* parameter[changedsince].value[x] 1..1 MS
* parameter[changedsince].value[x] only instant

/**************************************************************************************************************/
Profile:        DTRQuestionnairePackageOutputParameters
Parent:         Parameters
Id:             dtr-qpackage-output-parameters
Title:          "DTR Questionnaire Package Output Parameters"
Description:    "A profile on Parameters indicating the expected response content of a [$questionnaire-package](OperationDefinition-questionnaire-package.html) operation."
* ^status = #active
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice based on $this pattern"
* parameter 1..* MS
* parameter contains 
	PackageBundle 0..* MS and
  Outcome 0..1 MS 
* parameter[PackageBundle].name = "PackageBundle"
* parameter[PackageBundle].resource 1..1 MS
* parameter[PackageBundle].resource only DTRQuestionnairePackageBundle
* parameter[PackageBundle] ^short = "The QuestionnairePackage bundle that was retrieved"

* parameter[Outcome].name = "OperationOutcome"
* parameter[Outcome].resource 0..1 MS
* parameter[Outcome].resource only OperationOutcome
* parameter[Outcome] ^short = "Operation Outcome from this execution"

/**************************************************************************************************************/
Profile:        DTRLogErrorsInputParameters
Parent:         Parameters
Id:             dtr-log-errors-input-parameters
Title:          "DTR Log Questionnaire Errors Input Parameters"
Description:    "The Parameters profile used to define the inputs to the [$log-questionnaire-errors](OperationDefinition-log-questionnaire-errors.html) operation."
* obeys dtr-1
* ^status = #active
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice based on $this pattern"
* parameter 1..* MS
* parameter contains 
    questionnaire 0..* MS and 
    outcome 0..* MS
* parameter[questionnaire].name = "questionnaire"
* parameter[questionnaire] ^short = "The Questionnaire generating the errors (The reference SHOULD be version-specific)"
* parameter[questionnaire].value[x] 1..1
* parameter[questionnaire].value[x] only canonical
  * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
* parameter[outcome].name = "operationOutcome"
* parameter[outcome].resource 1..1
* parameter[outcome].resource only OperationOutcome
* parameter[outcome] ^short = "Operation Outcome associated with the Questionnaire/CQL"

/**************************************************************************************************************/
Profile: DTRQuestionnaireNextQuestionnaireInputParameters  
Parent: Parameters
Id: dtr-next-question-input-parameters
Title: "DTR Next Question Input Parameters"
Description: "Profile used to validate the parameters that are the input of the 'next question' adaptive questionnaire operation"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^extension[=].valueInteger.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueInteger.extension.valueCanonical = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[=].valueCode.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueCode.extension.valueCanonical = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* ^status = #active
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains QuestionnaireResponse 1..1
* parameter[QuestionnaireResponse].name = "questionnaire-response-in" (exactly)
* parameter[QuestionnaireResponse].value[x] ..0
* parameter[QuestionnaireResponse].resource only dtr-questionnaireresponse-adapt
* parameter[QuestionnaireResponse].part ..0

/**************************************************************************************************************/
Profile: DTRQuestionnaireNextQuestionnaireOutputParameters
Parent: Parameters
Id: dtr-next-question-output-parameters
Title: "DTR Next Question Output Parameters"
Description: "Profile used to validate the parameters that are the output of the 'next question' adaptive questionnaire operation"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^extension[=].valueInteger.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueInteger.extension.valueCanonical = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[=].valueCode.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueCode.extension.valueCanonical = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* ^status = #active
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains QuestionnaireResponse 1..1
* parameter[QuestionnaireResponse].name = "questionnaire-response-out" (exactly)
* parameter[QuestionnaireResponse].value[x] ..0
* parameter[QuestionnaireResponse].resource only dtr-questionnaireresponse-adapt
* parameter[QuestionnaireResponse].part ..0
