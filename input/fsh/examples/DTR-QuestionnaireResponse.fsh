Instance: home-o2-questionnaireresponse
InstanceOf: DTRQuestionnaireResponse
Usage: #example
Description: "An example QuestionnaireResponse for Home Oxygen Therapy."
* meta.profile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"

* extension[context][0].valueReference = Reference(CoverageExample)
* extension[context][+].valueReference = Reference(ServiceRequestExample)
* extension[intendedUse].valueCodeableConcept.coding = http://hl7.org/fhir/us/davinci-crd/CodeSystem/temp#withorder "Include with order"
* questionnaire = "http://example.com/Questionnaire/referred-questionnaire"
* status = #completed
* subject = Reference(PatientExample) "Vlad"
* authored = "2023-08-21"
// ===========================================================================================
* item[0].linkId = "1"
* item[=].text = "Patient Information"

* item[=].item[0].linkId = "1.1"
* item[=].item[=].text = "Last Name but Different This Time"
* item[=].item[=].answer[0].valueString = "Quinton"

* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #override
* item[=].item[=].answer[=].extension[=].extension[+].url = "author"
* item[=].item[=].answer[=].extension[=].extension[=].extension[0].url = "role"
* item[=].item[=].answer[=].extension[=].extension[=].extension[=].valueCodeableConcept = 	http://terminology.hl7.org/CodeSystem/practitioner-role#doctor "Doctor"
* item[=].item[=].answer[=].extension[=].extension[=].extension[+].url = "practitioner"
* item[=].item[=].answer[=].extension[=].extension[=].extension[=].valueReference = Reference(PractitionerExample) "Dr. Jane Doe"

* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].answer[0].valueString = "Vlad"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].answer[0].valueString = "A, N"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "1.4"
* item[=].item[=].text = "Date Of Birth"
* item[=].item[=].answer[0].valueDate = "1956-12-01"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "1.5"
* item[=].item[=].text = "Gender"
* item[=].item[=].answer[0].valueCoding = http://hl7.org/fhir/administrative-gender#male "Male"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
 
* item[=].item[+].linkId = "1.6"
* item[=].item[=].text = "Medicare ID"
* item[=].item[=].answer[0].valueString = "10A3D58WH22"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

// ===========================================================================================
* item[+].linkId = "2"
* item[=].text = "Provider who is performing face-to-face evaluation"
        // ===========================================================================================
* item[=].item[0].linkId = "2.1"
* item[=].item[=].text = "Last Name"
* item[=].item[=].answer[0].valueString = "Doe"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
        // ===========================================================================================
* item[=].item[+].linkId = "2.2"
* item[=].item[=].text = "First Name"
* item[=].item[=].answer[0].valueString = "Jane"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
        // ===========================================================================================
* item[=].item[+].linkId = "2.3"
* item[=].item[=].text = "Middle Initial"
* item[=].item[=].answer[0].valueString = "B"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
        // ===========================================================================================
* item[=].item[+].linkId = "2.4"
* item[=].item[=].text = "NPI"
* item[=].item[=].answer[0].valueString = "1122334455"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
        // ===========================================================================================
* item[=].item[+].linkId = "2.5"
* item[=].item[=].text = "Date of Face-To-Face Evaluation"
* item[=].item[=].answer[0].valueDate = "2019-07-18"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #override
* item[=].item[=].answer[=].extension[=].extension[+].url = "author"
* item[=].item[=].answer[=].extension[=].extension[=].extension[0].url = "role"
* item[=].item[=].answer[=].extension[=].extension[=].extension[=].valueCodeableConcept = 	http://terminology.hl7.org/CodeSystem/practitioner-role#doctor "Doctor"
* item[=].item[=].answer[=].extension[=].extension[=].extension[+].url = "practitioner"
* item[=].item[=].answer[=].extension[=].extension[=].extension[=].valueReference = Reference(PractitionerExample) "Dr. Jane Doe"

// ===========================================================================================
* item[+].linkId = "3"
* item[=].text = "Coverage Requirements"

* item[=].item[0].linkId = "3.1"
* item[=].item[=].text = "Relevant Patient Diagnoses (conditions that might be expected to improve with oxygen therapy)"
* item[=].item[=].answer[+].valueCoding = http://snomed.info/sct#313296004 "Mild chronic obstructive pulmonary disease"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].answer[+].valueCoding = http://snomed.info/sct#389087006 "Hypoxemia (disorder)"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "3.2"
* item[=].item[=].text = "Arterial oxygen saturation (Patient on room air while at rest and awake when tested)"
* item[=].item[=].answer[0].valueQuantity = 95 'mm[Hg]'
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "3.3"
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient on room air while at rest and awake when tested)"
* item[=].item[=].answer[0].valueQuantity = 83 'mm[Hg]'
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "3.4"
* item[=].item[=].text = "Arterial oxygen saturation (Patient tested during exercise)"
* item[=].item[=].answer[0].valueQuantity = 95 'mm[Hg]'
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "3.5"
* item[=].item[=].answer[0].valueQuantity = 78 'mm[Hg]'
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].text = "Arterial Partial Pressure of Oxygen (PO2) (Patient tested during exercise)"

* item[=].item[+].linkId = "3.6"
* item[=].item[=].text = "Is there a documented improvement of hypoxemia during exercise with oxygen?"
* item[=].item[=].answer[0].valueBoolean = true
* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

// ===========================================================================================
* item[+].linkId = "4"
* item[=].text = "Prescribed Use"

* item[=].item[0].linkId = "4.1"
* item[=].item[=].text = "Start date"
* item[=].item[=].answer[0].valueDate = "2019-07-18"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "4.2"
* item[=].item[=].text = "Length of need: (months) (99 = lifetime)"
* item[=].item[=].answer[0].valueQuantity.value = 99
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "4.3"
* item[=].item[=].text = "Peak Flow Rate"
* item[=].item[=].item[0].linkId = "4.3.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].answer[0].valueInteger = 2
* item[=].item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].item[+].linkId = "4.3.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].answer[0].valueInteger = 98
* item[=].item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "4.4"
* item[=].item[=].text = "Average Flow Rate"
* item[=].item[=].item[0].linkId = "4.4.1"
* item[=].item[=].item[=].text = "LPM"
* item[=].item[=].item[=].answer[0].valueInteger = 2
* item[=].item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[=].item[+].linkId = "4.4.2"
* item[=].item[=].item[=].text = "oxygen %"
* item[=].item[=].item[=].answer[0].valueInteger = 97
* item[=].item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
* item[=].item[+].linkId = "4.5"
* item[=].item[=].text = "Frequency of use (choose all that apply)"
* item[=].item[=].answer[0].valueCoding = http://example.org#2112 "At rest and awake"
* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

// ===========================================================================================
* item[+].linkId = "5"
* item[=].text = "Oxygen Supply Order Details"

* item[=].item[0].linkId = "5.1"
* item[=].item[=].text = "Current Order Description"
* item[=].item[=].answer[0].valueString = "HCPCS E0424 - Stationary Compressed Gaseous Oxygen System, Rental"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "5.1b"
* item[=].item[=].text = "Current Order Is For A Portable Device"

* item[=].item[+].linkId = "5.2"
* item[=].item[=].text = "Type"
* item[=].item[=].answer[0].valueCoding = http://example.org#122 "Compressed Gas"
* item[=].item[=].answer[=].extension[+].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto

* item[=].item[+].linkId = "5.3"
* item[=].item[=].text = "Means of oxygen delivery and accessories"
* item[=].item[=].answer[0].valueCoding = http://example.org#134 "Mask"
* item[=].item[=].answer[=].extension[0].url = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/information-origin"
* item[=].item[=].answer[=].extension[=].extension[0].url = "source"
* item[=].item[=].answer[=].extension[=].extension[=].valueCode = #auto
