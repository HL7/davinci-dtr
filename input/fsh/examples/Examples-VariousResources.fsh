// =======================================================================================================================================================================================
// Various Examples
// =======================================================================================================================================================================================
Instance: CoverageExample
InstanceOf: http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage
Description: "An instance of CRD Coverage"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage|2.1.0"
* contained = OrgExample
* subscriber = Reference(PatientExample)
* beneficiary = Reference(PatientExample)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2022-01-01"
* period.end = "2023-01-01"
* payor = Reference(OrgExample) 
* subscriberId = "PFP123450000"

// *******************************************************************************************************************************
Instance: ServiceRequestExample
InstanceOf: http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest
Description: "Example of ServiceRequest used in the Home Oxygen Therapy (home-o2-questionnaireresponse) example"
* meta.profile = "http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest|2.1.0"
* status = #active
* intent = #original-order
* authoredOn = "2019-09-18T07:53:21+07:00"
* requester = Reference(PractitionerExample)
* code = http://loinc.org#24338-6
* code.text = "Gas panel - Blood"
* subject = Reference(PatientExample)
* occurrenceDateTime = "2019-05-08T09:33:27+07:00"
* reasonCode.coding.code = #4565000
* reasonCode.coding.system = "http://snomed.info/sct"
* reasonCode.text = "Decreased oxygen affinity"

// *******************************************************************************************************************************
Instance: AdaptiveSearchExample
InstanceOf: DTRQuestionnaireAdaptSearch
Description: "An example [Adaptive Form](StructureDefinition-dtr-questionnaire-adapt-search.html) search instance."
Usage: #example
* url = "http://example.org/fhir/Questionnaire/dtr-questionnaire-adapt-search"
* status = #active
* extension[questionnaireAdaptive].valueUrl = "http://example.com/fhir/R4"

// *******************************************************************************************************************************
Instance: PatientExample
InstanceOf: Patient
Description: "An example patient used in the example resources."
Usage: #example
* id = "examplepatient"
* gender = #male
* birthDate = "1996-12-23"
* address.use = #home
* address.type = #both
* address.state = "MA"

// *******************************************************************************************************************************
Instance: PractitionerExample
InstanceOf: USCorePractitionerProfile 
Description: "An example practitioner referred to by the example resources."
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|7.0.0"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.family = "Doe"
* name.given = "Jane"
* name.prefix = "Dr."
* extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/activeRole"
* extension[=].valueCodeableConcept = 	http://nucc.org/provider-taxonomy#363A00000X "Physician Assistant"

// *******************************************************************************************************************************
Instance: library-quick-model-definition
InstanceOf: Library
Description: "A sample library from the FHIR core spec to include in other examples in this IG to demonstrate the use of Library resources"
Usage: #example
* identifier.use = #official
* identifier.value = "QUICK"
* url = "http://example.org/fhir/Library/quick"
* version = "1.0.0"
* title = "QUICK Model Definition"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/library-type#model-definition
* date = "2016-07-08"
* description = "Model definition for the QUICK Logical Model"
* topic.text = "QUICK"
* content.contentType = #application/xml
* content.url = "http://cqlrepository.org/quick-modelinfo.xml"

// =======================================================================================================================================================================================
// Inline Instances
// =======================================================================================================================================================================================
Instance: OrgExample
InstanceOf: http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-organization|2.1.0
Description: "An instance of Organization as a payer used in the example resources."
Usage: #inline
* identifier[0].value = "10D0202020"
* identifier[0].system = "urn:oid:2.16.840.1.113883.4.7"
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "Insurance Company"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5001"
* telecom.use = #work
* address.line = "680 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"

// *******************************************************************************************************************************
Instance: OperationOutcomeExample
InstanceOf: OperationOutcome
Description: "An example operation outcome instance."
Usage: #inline
* issue.severity = #error
* issue.code = #not-found

