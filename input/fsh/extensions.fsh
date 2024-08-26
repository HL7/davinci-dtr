/**************************************************************************************************************/
Extension: ContainedReference
Id: containedReference
Title: "Contained Reference"
Description: "Indicates that when filling a QuestionnaireResponse and selecting a reference, that the referenced resource should be included as a 'contained' resource within the QuestionnaireResponse"
* ^status = #active
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse.item.where(type = 'reference')"
* value[x] ^short = "Contain the reference?"
//* value[x] ^definition = "This contains references to the pertinent orders associated with this QuestionnaireResponse."
* value[x] 1..1
* value[x] only boolean

/**************************************************************************************************************/
Extension: QuestionnaireResponseContext
Id: qr-context
Description: "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse.  Allows finding the DTR responses associated with a particular Order/Encounter/Appointment for a particular insurance coverage."
* ^title = "Questionnaire Response Context"
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse"
* ^status = #active
* value[x] 1..1
* value[x] only Reference($CRDCoverage or $CRDDeviceRequest or $CRDMedicationRequest or $CRDNutritionOrder or $CRDServiceRequest or $CRDEncounter31 or $CRDEncounter61 or $CRDAppointment)

/**************************************************************************************************************/
Extension: IntendedUse 
Id: intendedUse 
Title: "Intended Use"
Description: "Indicates how the EHR is to use the information with respect to the associated orders/records."
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse"
* ^status = #active
* value[x] ^short = "Reference to the pertinent order associated with this QuestionnaireResponse."
* value[x] ^definition = "This contains references to the pertinent orders associated with this QuestionnaireResponse."
* value[x] only CodeableConcept
* value[x] from $CRDDocReason
* value[x] 1..1

/**************************************************************************************************************/
Extension: InformationOrigin
Id: information-origin
Description: "Identifies the origin of the information in the answer and how it came to exist."
* ^title = "Information Origin"
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse.item.answer"
* ^status = #active
* obeys dtrx-1
* extension contains
    source 1..1 and
    author 0..1 
* extension[source] only Extension
* extension[source] ^short = "The origination of information"
* extension[source] ^definition = "The origination of information"
* extension[source].value[x] 1..1
* extension[source].value[x] from DTRInformationOrigins (extensible)
* extension[source].value[x] only code
* extension[source].value[x] ^short = "auto | override | manual"

* extension[author] only Extension
* extension[author] ^short = "The author of the information adjustment"
* extension[author] ^definition = "The author of the information adjustment"
* extension[author].extension contains 
    role 0..* and
    practitioner 0..1
    
* extension[author].extension[role] only Extension
* extension[author].extension[role] ^short = "The role of the final human who authored the information adjustment"
* extension[author].extension[role] ^definition = "The role of the final human who authored the information adjustment"
* extension[author].extension[role].value[x] 1..1
* extension[author].extension[role].value[x] only CodeableConcept
* extension[author].extension[role].value[x] from $USCORE311PRVS (extensible)

* extension[author].extension[practitioner] only Extension
* extension[author].extension[practitioner] ^short = "The final practitioner who authored the information adjustment"
* extension[author].extension[practitioner] ^definition = "The final practitioner who authored the information adjustment"
* extension[author].extension[practitioner].value[x] 1..1
* extension[author].extension[practitioner].value[x] only Reference($CRDPractitioner)

/**************************************************************************************************************/
Extension: ActiveRole 
Id: activeRole 
Title: "Active Role"
Description: "An extension to indicate the active role(s) a practitioner is currently functioning in."
* ^context[0].type = #element
* ^context[=].expression = "Practitioner"
* ^status = #active
* value[x] ^short = "The active role(s) of the practitioner."
* value[x] ^definition = "The active role of the practitioner."
* value[x] 0..1
* value[x] only CodeableConcept
* value[x] from $USCORE311PRVS (extensible)
