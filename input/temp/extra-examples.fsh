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

