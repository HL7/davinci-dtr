Instance: home-o2-std-questionnaire
InstanceOf: DTRStdQuestionnaire
Usage: #example
Description: "An example [Standard questionnaire](StructureDefinition-dtr-std-questionnaire.html) for Home Oxygen Therapy."

* url = "http://hl7.org/fhir/us/davinci-dtr/Questionnaire/home-o2-std-questionnaire"
* version = "0.1.0"
* name = "HomeOxygenTherapyStdQuestionnaire"
* title = "Home Oxygen Therapy Order Template"
* status = #draft
* subjectType = #Patient
* date = "2020-01-13T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"

* extension[audience].valueCode = #clinical
* extension[request-specific].valueBoolean = false
* extension[rendering-styleSensitive].valueBoolean = false
* extension[sdc-questionnaire-entryMode].valueCode = #sequential
* extension[cqf-library].valueCanonical = "http://example.org/fhir/Library/quick"

// * extension[estimatedCompletionTime].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/estimated-completion-time"
// * extension[estimatedCompletionTime].extension[clinicalTime].url = "clinicalTime"
// * extension[estimatedCompletionTime].extension[clinicalTime].valueCode = #under-3min
// * extension[estimatedCompletionTime].extension[totalTime].url = "totalTime"
// * extension[estimatedCompletionTime].extension[totalTime].valueCode = #over-5min

* item[+].linkId = "1"
* item[=].text = "Patient Information"
* item[=].type = #group

* item[=].item[0].linkId = "1.1"
* item[=].item[=].text = "Last Name"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "Fist Name"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Middle Name"
* item[=].item[=].type = #string
* item[=].item[=].required = false

* item[=].item[+].linkId = "1.gender"
* item[=].item[=].definition = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-question-library#Demographics.sex"
* item[=].item[=].text = "What is this person's gender?"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype"

* item[=].item[+].linkId = "1.4"
* item[=].item[=].text = "Date Of Birth"
* item[=].item[=].type = #date

* item[=].item[+].linkId = "1.5"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/minValue"
* item[=].item[=].extension[=].valueDecimal = 1
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxValue"
* item[=].item[=].extension[=].valueDecimal = 400
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
* item[=].item[=].extension[=].valueInteger = 2
* item[=].item[=].text = "Enter your weight in lb"
* item[=].item[=].type = #decimal

* item[=].item[+].linkId = "1.6"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item[=].item[=].extension[=].valueCode = #image/jpeg
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxSize"
* item[=].item[=].extension[=].valueDecimal = 1048576
* item[=].item[=].text = "Attach latest x-ray"
* item[=].item[=].type = #attachment

* item[+].linkId = "2"
* item[=].text = "Calculation"
* item[=].type = #group
* item[=].item[+].linkId = "2.1"
* item[=].item[=].text = "Deadline for submission (7 days from now)"
* item[=].item[=].type = #date
* item[=].item[=].readOnly = true
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.description = "deadline for submission"
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.expression = "today() + 7 days"
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/alternativeExpression"
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.extension[0].valueExpression.language = #application/elm+json
* item[=].item[=].extension[sdc-questionnaire-initialExpression].valueExpression.extension[0].valueExpression.expression = "corresponding elm data"