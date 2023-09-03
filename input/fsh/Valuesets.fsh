////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Value Sets
// ************************************************************
ValueSet: DTRInformationOrigins
Id: informationOrigins
Title: "Information Origins Value Set"
Description: "Codes describing the possible origination of information."
* ^experimental = false
* DTRTempCodes#auto
* DTRTempCodes#override
* DTRTempCodes#manual

// ************************************************************
ValueSet: MetricsInformationOrigins
Id: MetricsinformationOrigins
Title: "Information Human Origins Value Set"
Description: "Questionnaire actions taken by human actors."
* ^experimental = false
* DTRTempCodes#override
* DTRTempCodes#manual

// ************************************************************
ValueSet: MetricSource
Id: metric-Source
Title: "Metric Source"
Description: "A list of codes indicating the perspective from which metric data was captured"
* ^status = #active
* ^experimental = false
* DTRTempCodes#payer-src
* DTRTempCodes#provider-src
* DTRTempCodes#DTRApp-src

// ************************************************************
ValueSet: MetricLaunchMode
Id: metric-launchmode
Title: "Metric Launch Mode"
Description: "A list of codes indicating how DTR was launched"
* ^status = #active
* ^experimental = false
* DTRTempCodes#crdlaunch
* DTRTempCodes#relaunch
* DTRTempCodes#salaunch
* DTRTempCodes#cdexlaunch

// ************************************************************
ValueSet: MetricAction
Id: metric-Action
Title: "Metric Action"
Description: "A list of codes indicating the DTR action performed by a system"
* ^status = #active
* ^experimental = false
* DTRTempCodes#launch
* DTRTempCodes#qpackage
* DTRTempCodes#mrquery
* DTRTempCodes#nextq
* DTRTempCodes#userresponse
* DTRTempCodes#storeqr
