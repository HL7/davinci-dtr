Extension: QuestionnaireResponseContext
Id: context
Description: "This extension contains references for DTR relaunch context."
* value[x] ^short = "List containing all relevant resources."
* value[x] ^definition = "This contains references to the order and coverage resources."
* value[x] only Reference(Resource)
