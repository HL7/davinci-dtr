Instance: referred-questionnaire
InstanceOf: Questionnaire
Usage: #inline
Description: "Inline Questionnaire for QuestionnaireResponse"
* version = "0.1.0"
* name = "referred-questionnaire"
* title = "Referred Questionnaire for QuestionnaireResponse"
* status = #draft
* subjectType = #Patient
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Example adaptive questionnaire contained in a QuestionnaireResposne</div>"
* date = "2020-01-16T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"
* derivedFrom = "http://example/basequestionnaire"
* extension[sdc-questionnaire-questionnaireAdaptive].valueBoolean = true
* item[0].linkId = "1"
* item[=].text = "Patient Information"
* item[=].type = #group
* item[=].item[0].linkId = "1.1"
* item[=].item[=].text = "Last Name but Different This Time"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "1.4"
* item[=].item[=].text = "Date Of Birth"
* item[=].item[=].type = #date
* item[=].item[+].linkId = "1.5"
* item[=].item[=].text = "Gender"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* item[=].item[+].linkId = "1.6"
* item[=].item[=].text = "Medicare ID"
* item[=].item[=].type = #text
* item[+].linkId = "2"
* item[=].text = "Provider who is performing face-to-face evaluation"
* item[=].type = #group
* item[=].item[0].linkId = "2.1"
* item[=].item[=].text = "Last Name"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "2.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "2.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "2.4"
* item[=].item[=].text = "NPI"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "2.5"
* item[=].item[=].text = "Date of Face-To-Face Evaluation"
* item[=].item[=].type = #date
* item[+].linkId = "3"
* item[=].text = "Coverage Requirements"
* item[=].type = #group
* item[=].item[0].linkId = "3.1"
* item[=].item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[0].valueCoding = http://snomed.info/sct#313296004 "Mild chronic obstructive pulmonary disease"
* item[=].item[=].answerOption[+].valueCoding = http://snomed.info/sct#389087006 "Hypoxemia (disorder)"
* item[=].item[+].linkId = "3.2"
* item[=].item[=].text = "Arterial oxygen saturation (Patient on room air while at rest and awake when tested)"
* item[=].item[=].type = #quantity
* item[=].item[+].linkId = "3.3"
* item[=].item[=].type = #quantity
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient on room air while at rest and awake when tested)"
* item[=].item[+].linkId = "3.4"
* item[=].item[=].type = #quantity
* item[=].item[=].text = "Arterial oxygen saturation (Patient tested during exercise)"
* item[=].item[+].linkId = "3.5"
* item[=].item[=].type = #quantity
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient tested during exercise)"
* item[=].item[+].linkId = "3.6"
* item[=].item[=].text = "Is there a documented improvement of hypoxemia during exercise with oxygen?"
* item[=].item[=].type = #boolean
* item[+].linkId = "4"
* item[=].text = "Prescribed Use"
* item[=].type = #group
* item[=].item[0].linkId = "4.1"
* item[=].item[=].text = "Start date"
* item[=].item[=].type = #date
* item[=].item[+].linkId = "4.2"
* item[=].item[=].text = "Length of need: (months) (99 = lifetime)"
* item[=].item[=].type = #quantity
* item[=].item[+].linkId = "4.3"
* item[=].item[=].text = "Peak Flow Rate"
* item[=].item[=].type = #group
* item[=].item[=].item[0].linkId = "4.3.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].type = #quantity
* item[=].item[=].item[+].linkId = "4.3.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].type = #quantity
* item[=].item[+].linkId = "4.4"
* item[=].item[=].text = "Average Flow Rate"
* item[=].item[=].type = #group
* item[=].item[=].item[0].linkId = "4.4.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].type = #quantity
* item[=].item[=].item[+].linkId = "4.4.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].type = #quantity
* item[=].item[+].linkId = "4.5"
* item[=].item[=].text = "Frequency of use (choose all that apply)"
* item[=].item[=].type = #text
* item[+].linkId = "5"
* item[=].text = "Oxygen Supply Order Details"
* item[=].type = #group
* item[=].item[0].linkId = "5.1"
* item[=].item[=].text = "Current Order Description"
* item[=].item[=].type = #text
* item[=].item[+].linkId = "5.1b"
* item[=].item[=].text = "Current Order Is For A Portable Device"
* item[=].item[=].type = #boolean
* item[=].item[+].linkId = "5.2"
* item[=].item[=].text = "Type"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[0].valueCoding = http://example.org#121 "Liquid"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#122 "Compressed Gas"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#123 "Concentrator"
* item[=].item[+].linkId = "5.3"
* item[=].item[=].text = "Means of oxygen delivery and accessories"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[0].valueCoding = http://example.org#131 "Nasal cannula"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#132 "Non-rebreather"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#133 "Ventilator"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#134 "Mask"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#135 "PAP bleed in"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#136 "Oxygen conserving device"
* item[=].item[=].answerOption[+].valueCoding = http://example.org#137 "High flow oxygen therapy"


Instance: home-o2-questionnaireresponse
InstanceOf: QuestionnaireResponse
Usage: #example
Description: "An example QuestionnaireResponse for Home Oxygen Therapy."
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse-r4"
* authored = "2019-07-18"
* status = #completed
* subject = Reference(PatientExample1) "Vlad"
* questionnaire = "http://example.com/Questionnaire/referred-questionnaire"
* item[0].linkId = "1"
* item[=].text = "Patient Information"
* item[=].item[0].linkId = "1.1"
* item[=].item[=].text = "Last Name but Different This Time"
* item[=].item[=].answer.valueString = "Quinton"
* item[=].item[=].answer.extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer.extension[=].extension[0].url = "source"
* item[=].item[=].answer.extension[=].extension[=].valueCode = #override
* item[=].item[=].answer.extension[=].extension[+].url = "author"
* item[=].item[=].answer.extension[=].extension[=].valueReference = Reference(PractitionerExample1) "Dr. Jane Doe"
* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].answer.valueString = "Vlad"
* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].answer.valueString = "A, N"
* item[=].item[+].linkId = "1.4"
* item[=].item[=].text = "Date Of Birth"
* item[=].item[=].answer.valueDate = "1956-12-01"
* item[=].item[+].linkId = "1.5"
* item[=].item[=].text = "Gender"
* item[=].item[=].answer.valueCoding = http://hl7.org/fhir/administrative-gender#male "Male"
* item[=].item[+].linkId = "1.6"
* item[=].item[=].text = "Medicare ID"
* item[=].item[=].answer.valueString = "10A3D58WH22"
* item[+].linkId = "2"
* item[=].text = "Provider who is performing face-to-face evaluation"
* item[=].item[0].linkId = "2.1"
* item[=].item[=].text = "Last Name"
* item[=].item[=].answer.valueString = "Doe"
* item[=].item[+].linkId = "2.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].answer.valueString = "Jane"
* item[=].item[+].linkId = "2.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].answer.valueString = "B"
* item[=].item[+].linkId = "2.4"
* item[=].item[=].text = "NPI"
* item[=].item[=].answer.valueString = "1122334455"
* item[=].item[+].linkId = "2.5"
* item[=].item[=].text = "Date of Face-To-Face Evaluation"
* item[=].item[=].answer.valueDate = "2019-07-18"
* item[+].linkId = "3"
* item[=].text = "Coverage Requirements"
* item[=].item[0].linkId = "3.1"
* item[=].item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].item[=].answer[0].valueCoding = http://snomed.info/sct#313296004 "Mild chronic obstructive pulmonary disease"
* item[=].item[=].answer[+].valueCoding = http://snomed.info/sct#389087006 "Hypoxemia (disorder)"
* item[=].item[+].linkId = "3.2"
* item[=].item[=].text = "Arterial oxygen saturation (Patient on room air while at rest and awake when tested)"
* item[=].item[=].answer.valueQuantity = 95 'mm[Hg]'
* item[=].item[+].linkId = "3.3"
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient on room air while at rest and awake when tested)"
* item[=].item[=].answer.valueQuantity = 83 'mm[Hg]'
* item[=].item[+].linkId = "3.4"
* item[=].item[=].text = "Arterial oxygen saturation (Patient tested during exercise)"
* item[=].item[=].answer.valueQuantity = 95 'mm[Hg]'
* item[=].item[+].linkId = "3.5"
* item[=].item[=].answer.valueQuantity = 78 'mm[Hg]'
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient tested during exercise)"
* item[=].item[+].linkId = "3.6"
* item[=].item[=].text = "Is there a documented improvement of hypoxemia during exercise with oxygen?"
* item[=].item[=].answer.valueBoolean = true
* item[+].linkId = "4"
* item[=].text = "Prescribed Use"
* item[=].item[0].linkId = "4.1"
* item[=].item[=].text = "Start date"
* item[=].item[=].answer.valueDate = "2019-07-18"
* item[=].item[+].linkId = "4.2"
* item[=].item[=].text = "Length of need: (months) (99 = lifetime)"
* item[=].item[=].answer.valueQuantity.value = 99
* item[=].item[+].linkId = "4.3"
* item[=].item[=].text = "Peak Flow Rate"
* item[=].item[=].item[0].linkId = "4.3.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].answer.valueInteger = 2
* item[=].item[=].item[+].linkId = "4.3.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].answer.valueInteger = 98
* item[=].item[+].linkId = "4.4"
* item[=].item[=].text = "Average Flow Rate"
* item[=].item[=].item[0].linkId = "4.4.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].answer.valueInteger = 2
* item[=].item[=].item[+].linkId = "4.4.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].answer.valueInteger = 97
* item[=].item[+].linkId = "4.5"
* item[=].item[=].text = "Frequency of use (choose all that apply)"
* item[=].item[=].answer.valueCoding = #"At rest and awake" "At rest and awake"
* item[+].linkId = "5"
* item[=].text = "Oxygen Supply Order Details"
* item[=].item[0].linkId = "5.1"
* item[=].item[=].text = "Current Order Description"
* item[=].item[=].answer.valueString = "HCPCS E0424 - Stationary Compressed Gaseous Oxygen System, Rental"
* item[=].item[+].linkId = "5.1b"
* item[=].item[=].text = "Current Order Is For A Portable Device"
* item[=].item[+].linkId = "5.2"
* item[=].item[=].text = "Type"
* item[=].item[=].answer.valueCoding = http://example.org#122 "Compressed Gas"
* item[=].item[+].linkId = "5.3"
* item[=].item[=].text = "Means of oxygen delivery and accessories"
* item[=].item[=].answer[0].valueCoding = http://example.org#134 "Mask"

