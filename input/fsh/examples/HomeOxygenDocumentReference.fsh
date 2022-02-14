Instance: home-o2-documentreference
InstanceOf: DTRDocumentReference
Usage: #example
Description: "An example DocumentReference for Home Oxygen Therapy."
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-documentreference-r4"
* status = #current
* subject = Reference(example1) "Vlad"
* content[0].attachment.data = "e2V4YW1wbGU6IGV4YW1wbGV9"
* content[0].attachment.contentType = #application/json
* type.coding[0].code = #11503-0
* type.coding[0].system = "http://loinc.org"
* category[0].coding[0].code = #clinical-note
* category[0].coding[0].system = "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"