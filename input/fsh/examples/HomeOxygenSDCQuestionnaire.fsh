Instance: home-o2-sdc-questionnaire
InstanceOf: DTRSDCQuestionnaire
Usage: #example
Description: "An example SDC questionnaire for Home Oxygen Therapy."

* url = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-sdc-questionnaire"
* version = "0.1.0"
* name = "HomeOxygenTherapySDCQuestionnaire"
* title = "Home Oxygen Therapy Order Template (SDC)"
* status = #draft
* subjectType = #Patient
* text.status = #generated
* text.div = "<div></div>"
* date = "2020-01-13T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"

* extension[rendering-styleSensitive].valueBoolean = false
* extension[sdc-questionnaire-entryMode].valueCode = #sequential

* item.linkId = "1"
* item.text = "Patient Information"
* item.type = #group
* item.item[0].linkId = "1.1"
* item.item[=].text = "Last Name"
* item.item[=].type = #string
* item.item[=].required = true
* item.item[=].extension[minLength].valueInteger = 2
* item.item[=].extension[questionnaire-supportLink].valueUri = "https://example.com/supportLink"
* item.item[+].linkId = "1.2"
* item.item[=].text = "Fist Name"
* item.item[=].type = #string
* item.item[=].required = true
* item.item[+].linkId = "1.3"
* item.item[=].text = "Middle Name"
* item.item[=].type = #string
* item.item[=].required = false
* item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/regex"
* item[=].extension.valueString = "[A-Z][0-9][A-Z] [0-9][A-Z][0-9]"
* item[=].linkId = "1.4"
* item[=].text = "Postal Code (A1A 1A1)"
* item[=].type = #string
* item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/minValue"
* item[=].extension[=].valueDecimal = 1
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxValue"
* item[=].extension[=].valueDecimal = 400
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
* item[=].extension[=].valueInteger = 2
* item[=].linkId = "1.5"
* item[=].text = "Enter your weight in lb"
* item[=].type = #decimal
* item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item[=].extension[=].valueCode = #image/jpeg
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxSize"
* item[=].extension[=].valueDecimal = 1048576
* item[=].linkId = "1.6"
* item[=].text = "Attach latest x-ray"
* item[=].type = #attachment
* item[+].linkId = "2"
* item[=].text = "Calculation"
* item[=].type = #group
* item[=].item[0].extension[sdc-questionnaire-initialExpression].valueExpression.description = "deadline for submission"
* item[=].item[0].extension[sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
* item[=].item[0].extension[sdc-questionnaire-initialExpression].valueExpression.expression = "today() + 7 days"
* item[=].item[=].linkId = "3.1"
* item[=].item[=].text = "Deadline for submission (7 days from now)"
* item[=].item[=].type = #date
* item[=].item[=].readOnly = true

