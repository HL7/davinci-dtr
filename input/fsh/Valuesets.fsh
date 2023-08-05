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

* #launch    "launch-action"       "The action described was a launch"
* #Qpackage  "Qpackage-action"     "The action described was a Questionnaire Package operation"
* #MRQuery   "MRQuery-action"      "The action described was a medical record query"
* #NextQ     "NextQ-action"        "The action described was a call for the next question"
* #StoreQR   "StoreQR-action"      "The action described was the storage of a Questionnaire Response"

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
ValueSet: Metric-Source
Id: metric-Source
Title: "Metric Source"
Description: "A list of codes indicating the perspective from which metric data was captured"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#payer-src
* DTRTempCodes#provider-src
* DTRTempCodes#SOFApp-src

// ************************************************************
ValueSet: Metric-Action
Id: metric-Action
Title: "Metric Action"
Description: "A list of codes indicating the action performed"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#launch
* DTRTempCodes#Qpackage
* DTRTempCodes#MRQuery
* DTRTempCodes#NextQ
* DTRTempCodes#StoreQR
