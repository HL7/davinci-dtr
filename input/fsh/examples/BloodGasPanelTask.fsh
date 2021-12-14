Instance: blood-gas-panel-task-r4
InstanceOf: Task
Usage: #example
Description: "Example Task for Blood Gas Panel"
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-task-r4"
* contained[0] = example1
* contained[+] = example2
* contained[+] = example4
* basedOn.display = "home-o2-questionnaire"
* status = #requested
* intent = #order
* description = "Create order for getting O2 blood saturation levels"
* focus = Reference(example4) "Blood gas panel request"
* for = Reference(example1)
* priority = #routine
* executionPeriod.start = "2019-07-13T08:25:05+10:00"
* authoredOn = "2019-07-18T08:25:05+10:00"
* lastModified = "2019-07-18T09:45:05+10:00"
* requester = Reference(example2) "Dr Jane Doe"
* performerType = http://snomed.info/sct#18850004
* performerType.text = "Performer"
* restriction.repetitions = 1
* restriction.period.end = "2016-11-02T09:45:05+10:00"

Instance: example1
InstanceOf: Patient
Usage: #inline
* gender = #male
* birthDate = "1996-12-23"
* address.use = #home
* address.type = #both
* address.state = "MA"

Instance: example2
InstanceOf: Practitioner
Usage: #inline
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