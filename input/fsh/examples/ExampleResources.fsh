Instance: example1
InstanceOf: Patient
Description: "Example patient"
* gender = #male
* birthDate = "1996-12-23"
* address.use = #home
* address.type = #both
* address.state = "MA"

Instance: example2
InstanceOf: Practitioner
Description: "Example practitioner"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.family = "Doe"
* name.given = "Jane"
* name.prefix = "Dr."


Instance: example4
InstanceOf: ServiceRequest
Usage: #inline
* status = #active
* intent = #original-order
* code = http://loinc.org#24338-6
* code.text = "Gas panel - Blood"
* subject = Reference(example1)
* occurrenceDateTime = "2019-05-08T09:33:27+07:00"
* requester = Reference(example2) "Dr. Jane Doe"
* reasonCode.text = "Check for O2 blood saturation levels"

Instance: org1001
InstanceOf: Organization
Description: "An instance of Organization as a payer"
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

Instance: coverage1001
InstanceOf: Coverage
Description: "An instance of Coverage"
* subscriber = Reference(example1)
* beneficiary = Reference(example1)
* status = #active
* payor = Reference(org1001)

Instance: deviceRequest0001
InstanceOf: DeviceRequest
Description: "Example device request"
* status = #active
* intent = #original-order
* codeCodeableConcept = https://bluebutton.cms.gov/resources/codesystem/hcpcs#E0424 "Stationary Compressed Gaseous Oxygen System, Rental"
* subject = Reference(example1)
* occurrenceDateTime = "2022-01-08T09:33:27+07:00"
* requester = Reference(example2) "Dr. Jane Doe"