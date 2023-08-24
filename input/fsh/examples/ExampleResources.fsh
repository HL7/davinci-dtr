// **********************************************************************************************************************************
Instance: PatientExample
InstanceOf: Patient
Description: "An example patient used in the example resources."
Usage: #example
* gender = #male
* birthDate = "1996-12-23"
* address.use = #home
* address.type = #both
* address.state = "MA"
// **********************************************************************************************************************************
Instance: PractitionerExample1
InstanceOf: USCorePractitionerProfile
Description: "An example practitioner referred to by the example resources."
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.family = "Doe"
* name.given = "Jane"
* name.prefix = "Dr."

// **********************************************************************************************************************************
Instance: PractitionerRoleExample1
InstanceOf: USCorePractitionerRoleProfile
Description: "An example practitioner referred to by the example resources."
* practitioner = Reference(PractitionerExample1)
* organization = Reference(ProviderOrgExample)
* telecom.system = #email
* telecom.value = "drjanedoe@example.org"

// **********************************************************************************************************************************
Instance: ServiceRequestExample1
InstanceOf: ServiceRequest
//Usage: #inline
* status = #active
* intent = #original-order
* code = http://loinc.org#24338-6
* code.text = "Gas panel - Blood"
* subject = Reference(PatientExample)
* occurrenceDateTime = "2019-05-08T09:33:27+07:00"
* requester = Reference(PractitionerExample1) "Dr. Jane Doe"
* reasonCode.text = "Check for O2 blood saturation levels"

// **********************************************************************************************************************************
Instance: OrgExample1
InstanceOf: USCoreOrganizationProfile
Description: "An instance of Organization as a payer used in the example resources."
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

// **********************************************************************************************************************************
Instance: OrgExample2
InstanceOf: USCoreOrganizationProfile
Description: "A 2nd instance of Organization as a payer used in the example resources."
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "Next Door Insurance Company"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5002"
* telecom.use = #work
* address.line = "681 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"

// **********************************************************************************************************************************
Instance: ProviderOrgExample
InstanceOf: USCoreOrganizationProfile
Description: "An instance of Organization as a provider organization used in the example resources."
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Provider Organization"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5003"
* telecom.use = #work
* address.line = "682 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"

// **********************************************************************************************************************************
Instance: library-quick-model-definition
InstanceOf: Library
Description: "A sample library from the FHIR core spec to include in other examples in this IG to demonstrate the use of Library resources"
Usage: #example
* identifier.use = #official
* identifier.value = "QUICK"
* url = "http://example.org/fhir/Library/quick"
* version = "1.0.0"
* title = "QUICK Model Definition"
* status = #draft
* type.coding.code = #model-definition
* date = "2016-07-08"
* description = "Model definition for the QUICK Logical Model"
* topic.text = "QUICK"
* content.contentType = #application/xml
* content.url = "http://cqlrepository.org/quick-modelinfo.xml"

// **********************************************************************************************************************************
Instance: DTRQuestionnairePackageOperationResultSimple
InstanceOf: Bundle
Description: "And example of DTRQuestionnairePackageOperation returning a Bundle with only a single adaptive questionnaire"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:90404930-204a-4127-9c40-997b2ed7f767"
* type = #collection
* timestamp = "2023-04-20T00:00:00+05:00"
* entry[0].fullUrl = "http://example.org/fhir/Questionnaire/home-o2-sdc-adaptive-questionnaire"
* entry[0].id = "home-o2-sdc-adaptive-questionnaire"
* entry[0].resource = home-o2-sdc-adaptive-questionnaire

// **********************************************************************************************************************************
Instance: DTRQuestionnairePackageOperationResultComplex
InstanceOf: Bundle
Description: "And example of DTRQuestionnairePackageOperation returning a Bundle with only a multiple questionnaires, with references to other Library and ValueSet resources"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:90404930-204a-4127-9c40-997b2ed7f767"
* type = #collection
* timestamp = "2023-04-20T00:00:00+05:00"
* entry[0].fullUrl = "http://example.org/fhir/Questionnaire/home-o2-sdc-adaptive-questionnaire"
* entry[0].id = "home-o2-sdc-adaptive-questionnaire"
* entry[0].resource = home-o2-sdc-adaptive-questionnaire
* entry[+].fullUrl = "http://example.org/fhir/Questionnaire/home-o2-std-questionnaire"
* entry[=].id = "home-o2-std-questionnaire"
* entry[=].resource = home-o2-std-questionnaire
