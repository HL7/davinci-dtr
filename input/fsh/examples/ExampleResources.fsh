// **********************************************************************************************************************************
Instance: PatientExample1
InstanceOf: Patient
Description: "An example patient used in the example resources."
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
* subject = Reference(PatientExample1)
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
Instance: DeviceRequestExample1
InstanceOf: DTRDeviceRequest
Description: "An example device request used in the example resources."
* status = #active
* intent = #original-order
* codeCodeableConcept = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#E0424 "Stationary Compressed Gaseous Oxygen System, Rental"
* subject = Reference(PatientExample1)
* occurrenceDateTime = "2022-01-08T09:33:27+07:00"
* requester = Reference(PractitionerRoleExample1) "Dr. Jane Doe"

// Instance: CoverageExample1
// InstanceOf: Coverage
// Description: "An instance of Coverage used in the example resources."
// * subscriber = Reference(PatientExample1)
// * beneficiary = Reference(PatientExample1)
// * status = #active
// * payor = Reference(OrgExample1)

// Instance: CoverageExample2
// InstanceOf: Coverage
// Description: "An instance of Coverage used in the example resources."
// * subscriber = Reference(PatientExample1)
// * beneficiary = Reference(PatientExample1)
// * status = #active
// * payor = Reference(OrgExample2)

// **********************************************************************************************************************************
Instance: DTRCoverageExample1
InstanceOf: DTRCoverage
Description: "An instance of DTRCoverage"
* subscriber = Reference(PatientExample1)
* beneficiary = Reference(PatientExample1)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2022-01-01"
* period.end = "2023-01-01"
* payor = Reference(OrgExample1)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00

// **********************************************************************************************************************************
Instance: DTRCoverageExample2
InstanceOf: DTRCoverage
Description: "A 2nd instance of DTRCoverage used in examples"
* subscriber = Reference(PatientExample1)
* beneficiary = Reference(PatientExample1)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2022-01-01"
* period.end = "2023-01-01"
* payor = Reference(OrgExample2)
* subscriberId = "PFP123450001"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00

// **********************************************************************************************************************************
Instance: DTRParametersComplexExample
InstanceOf: DTRParameters
Description: "An example Parameters resource for DTRQuestionnairePackageOperation showing all parameters with multiple Coverage and Order parameters"
Usage: #example
* parameter[coverage][0].name = "coverage"
* parameter[coverage][=].resource = DTRCoverageExample1
* parameter[coverage][+].name = "coverage"
* parameter[coverage][=].resource = DTRCoverageExample2
* parameter[order][0].name = "order"
* parameter[order][=].resource = DeviceRequestExample1
* parameter[order][+].name = "order"
* parameter[order][=].resource = ServiceRequestExample1
* parameter[questionnaire].name = "questionnaire"
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-sdc-questionnaire"
* parameter[context].name = "context"
* parameter[context].valueString = "EXAMPLE_CRD_CONTEXT_ID"
* parameter[changedsince].name = "changedsince"
* parameter[changedsince].valueDateTime = "2023-04-20T00:00:00+00:00"

// **********************************************************************************************************************************
Instance: DTRParametersSimpleQuestionnaireExample
InstanceOf: DTRParameters
Description: "An example Parameters resource for DTRQuestionnairePackageOperation with Coverage and a Questionnaire"
Usage: #example
* parameter[coverage].name = "coverage"
* parameter[coverage].resource = DTRCoverageExample1
* parameter[questionnaire].name = "questionnaire"
* parameter[questionnaire].valueCanonical = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-sdc-questionnaire"

// **********************************************************************************************************************************
Instance: DTRParametersSimpleOrderExample
InstanceOf: DTRParameters
Description: "An example Parameters resource for DTRQuestionnairePackageOperation with Coverage and an Order"
Usage: #example
* parameter[coverage].name = "coverage"
* parameter[coverage].resource = DTRCoverageExample1
* parameter[order].name = "order"
* parameter[order].resource = DeviceRequestExample1

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
* entry[+].fullUrl = "http://example.org/fhir/Questionnaire/home-o2-sdc-questionnaire"
* entry[=].id = "home-o2-sdc-questionnaire"
* entry[=].resource = home-o2-sdc-questionnaire

// **********************************************************************************************************************************
