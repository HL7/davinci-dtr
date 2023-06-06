//Extension: QuestionnaireResponseContext
//Id: context
//Description: "Identifies the orders, coverages, and or other resources associated with the specified QuestionnaireResponse.  Allows finding the DTR responses associated with a particular order/encounter/appointment for a particular insurance coverage."
//* value[x] ^short = "List containing all relevant resources."
//* value[x] ^definition = "This contains references to the order and coverage resources."
//* value[x] only Reference(Coverage or DeviceRequest or USCoreMedicationRequestProfile or ServiceRequest or NutritionOrder or Claim or Appointment or USCoreEncounterProfile)

Extension: PayerEndpoint
Id: endpoint
Description: "This extension contains the endpoint for payer services."
* value[x] ^short = "THe URL of the payer endpoint."
* value[x] ^definition = "This contains the canonical url for the payer endpoint, for retrieval of payer resources like the Questionnaire and CQL."
* value[x] only url
* value[x] 1..1