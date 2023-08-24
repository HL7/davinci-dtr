////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Code Systems 
// ************************************************************
CodeSystem: DTRTempCodes
Id: temp
Title: "DTR Temporary Codes"
Description: "Codes temporarily defined as part of the DTR implementation guide.  These will eventually migrate into an officially maintained terminology (likely HL7's UTG code systems)."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #complete

* #auto         "Auto populated"        "Information was auto-populated"
  * #override   "Auto with override"    "Information was auto-populated but overridden by a human"
* #manual       "Manual entry"          "Information was manually entered by a human"

* #provider-src "Provider-sourced"      "The metric information was captured from the provider system's perspective"
* #payer-src    "Payer-sourced"         "The metric information was captured from the payer system's perspective"
* #DTRApp-src   "DTRApp-sourced"        "The metric information was captured from the Native or SMART on FHIR App's perspective"

* #launch       "Launch session"        "The action described was the launch of a DTR session."
* #qpackage     "Questionnaire Package operation" "The action described was a Questionnaire Package operation."
* #mrquery      "Medical Record Query"            "The action described was a medical record query."
* #nextq        "Next Question operation"         "The action described was a call for the next question for an Adaptive Questionnaire."
* #userresponse "User Response"         "The action described was an opportunity for the user to review Questionnaire answers and/or enter or override answers."
* #storeqr      "Store QuestionnaireResponse"     "The action described was the storage of a Questionnaire Response in the EHR."

* #crdlaunch    "CRD launch"            "launching with the context of an order or other resource populated with coverage-information extension when there is no associated pre-existing QR"
* #relaunch     "Re-launch"             "launching from the context of an order/resource with a pre-existing associated QR or launching in the context of a QR directly"
* #salaunch     "Standalone launch"     "launching from the context of an order/resource with no pre-existing associated QR and no coverage-information extension"
* #cdexlaunch   "CDex launch"           "launching from the context of a Task specifying a questionnaire url or context id when the Task does not yet have a Task output"

* #pa           "include-pa"            "The information in this QuestionnaireResponse should be packaged into a Bundle and submitted as part of (or in association with) a prior authorization for the associated request resource(s)."
* #claim        "include-claim"         "The information in this QuestionnaireResponse should be packaged into a Bundle and submitted as part of (or in association with) the insurance claim for the services ordered by the associated request resource(s)."
* #order        "include-order"         "The information in this QuestionnaireResponse should be packaged into a Bundle and submitted along with (or referenced as supporting information to) the associated request resource(s)."
* #retain       "retain-documentation"  "The information in this QuestionnaireResponse should be retained within the DTR as supporting evidence of the medical necessity of the associated request resource(s)."

// Coverage guidance - auth
* #no-auth                 "No Prior Authorization"            "The ordered service does not require prior authorization"
* #auth-needed             "Prior Authorization Needed"        "The ordered service will require prior authorization" 
  * #performpa             "Performer Prior Authorization"     "Prior authorization is needed for the service, however such prior authoriation must be initiated by the performing (rather than ordering) provider."
* #satisfied               "Authorization Satisfied"           "While prior authorization would typically be needed, the conditions evaluated by prior authorization have already been evaluated and therefore prior authorization can be bypassed"

// Coverage guidance - doc
* #no-doc                  "No Additional Documentation"       "There is no requirement for any additional documentation"
* #clinical                "Clinical Documentation"            "Details most likely to originate from a clinician are required to satisfy additional documentation requirements, determine coverage and/or prior auth applicability - e.g. via DTR by clinician.  Indicates that the CRD client should expose the need to launch DTR to clinical users."
* #admin                   "Administrative Documentation"      "Administrative details not likely to require clinical expertise are needed to satisfy additional documentation requirements, determine coverage and/or prior auth applicability - e.g. via DTR by back-end staff.  Indicates that while the CRD client might expose the ability to launch DTR as an option for clinical users, it should be clear that clinical input is not necessary and deferring the use of DTR to back-end staff is perfectly appropriate.  Some CRD clients might be configured (based on provider preference) to not even show clinicians the option to launch."
* #both                    "Administrative & clinical doc"     "Both clinical and administrative details are required to satisfy additional documentation requirements, determine coverage and/or prior auth applicability.  Equivalent to the union of #admin and #clinical."

// Coverage guidance - info needed
* #performer               "Performer Needed"                  "Information about who (specifically, or at least performer type and affiliation) is necessary to make a determination of coverage and/or prior auth expectations"
* #location                "Location Needed"                   "Information about where (specific clinic/site or organization) is necessary to make a determination of coverage and/or prior auth expectations"
* #timeframe               "Timeframe Needed"                  "Information about when the service will be performed that is more granular than the order effective period is necessary to make a determination of coverage and/or prior auth expectations"

// Coverage guidance - covered
* #covered                 "Covered"                           "Regular coverage applies"
* #not-covered             "Not covered"                       "No coverage or possibility of coverage for this service)"
* #conditional             "Conditional"                       "Decision cannot be made without more information (more detailed code, service rendering information, etc.)"
