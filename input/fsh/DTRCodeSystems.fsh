// ---------- Code Systems -----------

// ************************************************************
CodeSystem: DTRInformationOriginCodes
Id: dtr-informationorigin-codes
Title: "DTR Information Origin Codes"
Description: "Codes used within the Information Origin valueset."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #complete
* #auto         "Auto populated"        "Information was auto-populated"
  * #override   "Auto with override"    "Information was auto-populated but overridden by a human"
* #manual       "Manual entry"          "Information was manually entered by a human"

// ************************************************************
CodeSystem: DTRMetricCodes
Id: dtr-metric-codes
Title: "DTR Metric Codes"
Description: "Codes used within 'code' elements in the DTR Metric logical model."
* ^status = #active 
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #complete
* #provider-src "Provider-sourced"                "The metric information was captured from the provider system's perspective"
* #payer-src    "Payer-sourced"                   "The metric information was captured from the payer system's perspective"
* #DTRApp-src   "DTRApp-sourced"                  "The metric information was captured from the Native or SMART on FHIR App's perspective"
* #launch       "Launch session"                  "The action described was the launch of a DTR session."
* #qpackage     "Questionnaire Package operation" "The action described was a Questionnaire Package operation."
* #mrquery      "Medical Record Query"            "The action described was a medical record query."
* #nextq        "Next Question operation"         "The action described was a call for the next question for an Adaptive Questionnaire."
* #userresponse "User Response"                   "The action described was an opportunity for the user to review Questionnaire answers and/or enter or override answers."
* #storeqr      "Store QuestionnaireResponse"     "The action described was the storage of a Questionnaire Response in the EHR."
* #crdlaunch    "CRD launch"                      "launching with the context of an order or other resource populated with coverage-information extension when there is no associated pre-existing QR"
* #relaunch     "Re-launch"                       "launching from the context of an order/resource with a pre-existing associated QR or launching in the context of a QR directly"
* #salaunch     "Standalone launch"               "launching from the context of an order/resource with no pre-existing associated QR and no coverage-information extension"
* #cdexlaunch   "CDex launch"                     "launching from the context of a Task specifying a questionnaire url or context id when the Task does not yet have a Task output"
