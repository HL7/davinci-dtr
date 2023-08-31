/**************************************************************************************************************/
Profile:        DTRQuestionnairePackageInputParameters
Parent:         Parameters
Id:             dtr-qpackage-input-parameters
Title:          "DTR Questionnaire Package Input Parameters"
Description:    "The Parameters profile used to define the inputs of the [$questionnaire-package](OperationDefinition-questionnaire-package.html) operation."
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
* parameter[order].resource only $CRDAppointment or $USCOREEncounter or $CRDCommunicationRequest or $CRDDeviceRequest or ImmunizationRecommendation or $CRDMedicationRequest or $CRDNutritionOrder or $CRDServiceRequest or SupplyRequest or $CRDVisionPrescription
* parameter[order].resource ^short = "One or more Order resource instances. e.g., DeviceRequest, ServiceRequest, MedicationRequest, ... Encounter, Appointment, or prior-auth Claim, etc."
* parameter[questionnaire].name = "questionnaire"
* parameter[questionnaire].value[x] 1..1 MS
* parameter[questionnaire].value[x] only canonical
  * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
* parameter[context].name = "context"
* parameter[context] ^short = "CRD or CDex-provided context"
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
	PackageBundle 1..* MS and
  Outcome 0..* MS 
* parameter[PackageBundle].name = "PackageBundle"
* parameter[PackageBundle].resource 1..1 MS
* parameter[PackageBundle].resource only DTRQuestionnairePackageBundle
* parameter[PackageBundle] ^short = "The QuestionnairePackage bundle that was retrieved"

* parameter[Outcome].name = "operationOutcome"
* parameter[Outcome].resource 0..1 MS
* parameter[Outcome].resource only OperationOutcome
* parameter[Outcome] ^short = "Operation Outcome from this execution"

