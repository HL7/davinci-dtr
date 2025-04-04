Instance: referred-questionnaire
InstanceOf: Questionnaire
Usage: #example
Description: "Inline Questionnaire for QuestionnaireResponse"
* version = "0.1.0"
* title = "Referred Questionnaire for QuestionnaireResponse"
* status = #active
* subjectType = #Patient
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Example adaptive questionnaire contained in a QuestionnaireResposne</div>"
* date = "2023-08-21T00:00:00+00:00"
* publisher = "Da Vinci DTR"
* contact.name = "Example Author"
* derivedFrom = Canonical(dtr-questionnaire)
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

* item[=].item[+].linkId = "2.6"
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Patient
* item[=].item[=].text = "Record"
* item[=].item[=].type = #reference
* item[=].item[=].required = true

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
