Alias: $dtr-coverage = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-coverage-r4
Alias: $dtr-devicerequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-devicerequest
Alias: $dtr-medicationrequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-medicationrequest
Alias: $dtr-nutritionorder = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-nutritionorder
Alias: $dtr-servicerequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest
Alias: $us-core-encounter = http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
Alias: $practitioner-role = http://hl7.org/fhir/ValueSet/practitioner-role

/**************************************************************************************************************/
Extension: PayerEndpoint
Id: endpoint
Description: "This extension contains the endpoint for payer services."
* value[x] ^short = "The URL of the payer endpoint."
* value[x] ^definition = "This contains the canonical url for the payer endpoint, for retrieval of payer resources like the Questionnaire and CQL."
* value[x] only url
* value[x] 1..1

/**************************************************************************************************************/
Extension: PertinentOrders 
Id: pertinentOrders 
Description: "Provides a reference to the Request resource(s) and/or Encounter that the QuestionnaireResponse relates to."
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse"
* value[x] ^short = "Reference to the pertinent order associated with this QuestionnaireResponse."
* value[x] ^definition = "This contains references to the pertinent orders associated with this QuestionnaireResponse."
* value[x] only Reference(Appointment or CommunicationRequest or DeviceRequest or Encounter or MedicationRequest or NutritionOrder or ServiceRequest or VisionPrescription)
* value[x] 1..1

/**************************************************************************************************************/
Extension: IntendedUse 
Id: intendedUse 
Description: "Indicates how the EHR is to use the information with respect to the associated orders/records."
* ^context[0].type = #element
* ^context[=].expression = "QuestionnaireResponse"
* value[x] ^short = "Reference to the pertinent order associated with this QuestionnaireResponse."
* value[x] ^definition = "This contains references to the pertinent orders associated with this QuestionnaireResponse."
* value[x] only CodeableConcept
* value[x] from IntendedUse
* value[x] 1..1

/**************************************************************************************************************/
Extension: Context
Id: context
Description: "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse.  Allows finding the DTR responses associated with a particular Order/Encounter/Appointment for a particular insurance coverage."
* extension contains
    coverage 0..1 and
    order 0..1
* extension[coverage] only Extension
* extension[coverage] ^short = "Coverage associated with the QuestionnaireResponse"
* extension[coverage] ^definition = "The coverage context associated with a QuestionnaireResponse"
* extension[coverage].value[x] 1..1
* extension[coverage].value[x] only Reference($dtr-coverage)

* extension[order] only Extension
* extension[order] ^short = "Order associated with the QuestionnaireResponse"
* extension[order] ^definition = "The order context associated with a QuestionnaireResponse"
* extension[order].value[x] 1..1
* extension[order].value[x] only Reference($dtr-devicerequest or $dtr-medicationrequest or $dtr-nutritionorder or $dtr-servicerequest or $us-core-encounter or Appointment)

/**************************************************************************************************************/
Extension: InformationOrigin
Id: information-origin
Description: "Identifies the origin of the information in the answer and how it came to exist."
* ^context[0].type = #element
// * ^context[=].expression = "BackboneElement.item.answer"
* ^context[=].expression = "BackboneElement or QuestionnaireResponse.item.answer or QuestionnaireResponse.item.item.answer"

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