/**************************************************************************************************************/
Extension: QuestionnaireResponseContext
Id: qr-context
Description: "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse.  Allows finding the DTR responses associated with a particular Order/Encounter/Appointment for a particular insurance coverage."
* ^title = "Questionnaire Response Context"
* ^context.expression = "QuestionnaireResponse"
* extension contains
    coverage 0..1 and
    order 0..1
* extension[coverage] only Extension
* extension[coverage] ^short = "Coverage associated with the QuestionnaireResponse"
* extension[coverage] ^definition = "The coverage context associated with a QuestionnaireResponse"
* extension[coverage].value[x] 1..1
* extension[coverage].value[x] only Reference($CRDCoverage)

* extension[order] only Extension
* extension[order] ^short = "Order associated with the QuestionnaireResponse"
* extension[order] ^definition = "The order context associated with a QuestionnaireResponse"
* extension[order].value[x] 1..1
* extension[order].value[x] only Reference($CRDDeviceRequest or $CRDMedicationRequest or $CRDNutritionOrder or $dtr-servicerequest or $us-core-encounter or Appointment)

/**************************************************************************************************************/
Extension: IntendedUse 
Id: intendedUse 
Title: "Intended Use"
Description: "Indicates how the EHR is to use the information with respect to the associated orders/records."
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse"
* value[x] ^short = "Reference to the pertinent order associated with this QuestionnaireResponse."
* value[x] ^definition = "This contains references to the pertinent orders associated with this QuestionnaireResponse."
* value[x] only CodeableConcept
* value[x] from IntendedUse
* value[x] 1..1

/**************************************************************************************************************/
Extension: InformationOrigin
Id: information-origin
Description: "Identifies the origin of the information in the answer and how it came to exist."
* ^title = "Information Origin"
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse.item.answer"
* obeys dtrx-1
* extension contains
    source 1..1 and
    author 0..1 
* extension[source] only Extension
* extension[source] ^short = "The origination of information"
* extension[source] ^definition = "The origination of information"
* extension[source].value[x] 1..1
* extension[source].value[x] from DTRInformationOrigins (required)
* extension[source].value[x] only code
* extension[source].value[x] ^short = "auto | override | manual"

* extension[author] only Extension
* extension[author] ^short = "The author of the information adjustment"
* extension[author] ^definition = "The author of the information adjustment"
* extension[author].extension contains 
    role 1..1 and
    practitioner 0..1
    
* extension[author].extension[role] only Extension
* extension[author].extension[role] ^short = "The role of the final human who authored the information adjustment"
* extension[author].extension[role] ^definition = "The role of the final human who authored the information adjustment"
* extension[author].extension[role].value[x] 1..1
* extension[author].extension[role].value[x] only CodeableConcept
* extension[author].extension[role].value[x] from $practitioner-role (required)

* extension[author].extension[practitioner] only Extension
* extension[author].extension[practitioner] ^short = "The final practitioner who authored the information adjustment"
* extension[author].extension[practitioner] ^definition = "The final practitioner who authored the information adjustment"
* extension[author].extension[practitioner].value[x] 1..1
* extension[author].extension[practitioner].value[x] only Reference(Practitioner)