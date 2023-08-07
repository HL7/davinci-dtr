////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Code Systems 
// ************************************************************
CodeSystem: DTRInformationOriginsCodeSystem
Id: informationOrigins-cs
Title: "Information Origins Code System"
Description: "Codes describing the possible origination of information."
* #auto "Information was auto-populated"
* ^caseSensitive = true
* ^experimental = false

* #override "Information was auto-populated but overridden by a human"
* ^caseSensitive = false
* ^experimental = false

* #manual "Information was manually entered by a human"
* ^caseSensitive = false
* ^experimental = false

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
* #provider-src "Provider-sourced" "The metric information was captured from the provider system's perspective"
* #payer-src    "Payer-sourced"    "The metric information was captured from the payer system's perspective"
* #SOFApp-src   "SOFApp-sourced"   "The metric information was captured from the SMART on FHIR App's perspective"

* #launch     "launch-action"      "The action described was a launch"
* #qpackage   "qpackage-action"    "The action described was a Questionnaire Package operation"
* #mrquery    "mrquery-action"     "The action described was a medical record query"
* #nextq      "nextq-action"       "The action described was a call for the next question"
* #response   "response-action"    "The action described was a response"
* #returnqr   "returnqr action"    "The action described was the return of a Questionnaire Response"

* #crdlaunch  "CRD launch"         "DTR App launched from CRD"
* #relaunch   "Re-launch"          "DTR App relaunched"
* #salaunch   "Standalone launch"  "DTR Standalone launch"
* #cdexlaunch "CDex launch"        "DTR App launched from CDex"
* #manual     "Manual" "Manual"
* #APmod      "APmod" "APmod"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Value Sets
// ************************************************************
ValueSet: DTRInformationOrigins
Id: informationOrigins
Title: "Information Origins Value Set"
Description: "Codes describing the possible origination of information."
* include codes from system DTRInformationOriginsCodeSystem
* ^experimental = false

// ************************************************************
ValueSet: MetricSource
Id: metric-Source
Title: "Metric Source"
Description: "A list of codes indicating the perspective from which metric data was captured"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#payer-src
* DTRTempCodes#provider-src
* DTRTempCodes#SOFApp-src

// ************************************************************
ValueSet: MetricLaunchMode
Id: metric-launchmode
Title: "Metric Launch Mode"
Description: "A list of codes indicating the Launch Mode"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#crdlaunch
* DTRTempCodes#relaunch
* DTRTempCodes#salaunch
* DTRTempCodes#cdexlaunch

// ************************************************************
ValueSet: MetricAction
Id: metric-Action
Title: "Metric Action"
Description: "A list of codes indicating the action performed"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#launch
* DTRTempCodes#qpackage
* DTRTempCodes#mrquery
* DTRTempCodes#nextq
* DTRTempCodes#response
* DTRTempCodes#returnqr
