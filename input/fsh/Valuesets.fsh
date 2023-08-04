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
ValueSet: MetricDataSource
Id: metricDataSource
Title: "Metric Data Source"
Description: "A list of codes indicating the perspective from which metric data was captured"
* ^status = #draft
* ^experimental = false
* DTRTempCodes#payer-src
* DTRTempCodes#provider-src