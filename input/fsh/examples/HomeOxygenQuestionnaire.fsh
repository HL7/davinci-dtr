Instance: home-o2-questionnaire
InstanceOf: Questionnaire
Usage: #example
Description: "An example questionnaire for Home Oxygen Therapy."
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaire-r4"
* extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-library"
* extension.valueCanonical = "#HomeOxygenTherapy-prepopulation"
* url = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-questionnaire"
* version = "0.2.0"
* name = "HomeOxygenTherapyQuestionnaire"
* title = "Home Oxygen Therapy Order Template"
* status = #draft
* subjectType = #Patient
* date = "2019-03-11T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"
* item.linkId = "1"
* item.text = "Patient Information"
* item.type = #group
* item.item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-expression"
* item.item[=].extension.valueExpression.language = #text/cql
* item.item[=].extension.valueExpression.expression = "PatientLastName"
* item.item[=].linkId = "1.1"
* item.item[=].text = "Last Name"
* item.item[=].type = #string
* item.item[=].required = true
* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-expression"
* item.item[=].extension.valueExpression.language = #text/cql
* item.item[=].extension.valueExpression.expression = "PatientMiddleInitial"
* item.item[=].linkId = "1.3"
* item.item[=].text = "Middle Initial"
* item.item[=].type = #text
* item.item[=].required = false
* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-expression"
* item.item[=].extension.valueExpression.language = #text/cql
* item.item[=].extension.valueExpression.expression = "PatientFirstName"
* item.item[=].linkId = "1.2"
* item.item[=].text = "First Name"
* item.item[=].type = #string
* item.item[=].enableWhen.question = "1.3"
* item.item[=].enableWhen.operator = #=
* item.item[=].enableWhen.answerString = "S"
* item.item[=].required = true
* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-expression"
* item.item[=].extension.valueExpression.language = #text/cql
* item.item[=].extension.valueExpression.expression = "PatientDateOfBirth"
* item.item[=].linkId = "1.4"
* item.item[=].text = "Date Of Birth"
* item.item[=].type = #date
* item.item[=].required = true
* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-expression"
* item.item[=].extension.valueExpression.language = #text/cql
* item.item[=].extension.valueExpression.expression = "PatientGender"
* item.item[=].linkId = "1.5"
* item.item[=].text = "Gender"
* item.item[=].type = #choice
* item.item[=].required = true
* item.item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"