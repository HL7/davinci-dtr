Extension: QuestionnaireResponseContext
Id: context
Description: "This extension contains references for DTR relaunch context."
* value[x] ^short = "List containing all relevant resources."
* value[x] ^definition = "This contains references to the order and coverage resources."
* value[x] only Reference(Coverage or DeviceRequest or MedicationRequest or ServiceRequest or NutritionOrder or Claim)


Extension: PayerEndpoint
Id: endpoint
Description: "This extension contains the endpoint for payer services."
* value[x] ^short = "THe URL of the payer endpoint."
* value[x] ^definition = "This contains the canonical url for the payer endpoint, for retrieval of payer resources like the Questionnaire and CQL."
* value[x] only url
* value[x] 1..1