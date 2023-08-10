Profile: DTRQuestionnaireResponseBundle
Parent: Bundle
Id: DTR-QRBundle
Title: "DTR Questionnaire Response Bundle"
Description: "This profile constrains the Bundle to be for QuestionnaireResponse information."

* meta.profile 1..*
* meta.profile ^slicing.discriminator.type = #pattern
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.description = "Slice based on pattern"
* meta.profile ^slicing.ordered = false
* meta.profile ^slicing.rules = #open
* meta.profile ^comment = "meta.profile is required as a matter of convenience of receiving systems. The meta.profile SHALL be used by the Server to hint/assert/declare that this instance conforms to the stated profiles (with business versions). meta.profile does not capture any business logic, processing directives, or semantics (for example, inpatient or outpatient). "
* meta.profile contains asserted 1..1
* meta.profile[asserted] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/DTR-QRBundle"

* obeys dtrb-1
// * obeys dtrb-2

* type = #collection
