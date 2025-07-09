///**********************************************************************************************
// Value Sets
// ************************************************************
ValueSet: DTRInformationOrigins
Id: informationOrigins
Title: "Information Origins Value Set"
Description: "Codes describing the possible origination of information."
* ^experimental = false
* DTRInformationOriginCodes#auto
* DTRInformationOriginCodes#override
* DTRInformationOriginCodes#manual

// ************************************************************
ValueSet: MetricsInformationOrigins
Id: MetricsinformationOrigins
Title: "Information Human Origins Value Set"
Description: "Questionnaire actions taken by human actors."
* ^experimental = false
* DTRInformationOriginCodes#override
* DTRInformationOriginCodes#manual

// ************************************************************
ValueSet: MetricSource
Id: metric-Source
Title: "Metric Source"
Description: "A list of codes indicating the perspective from which metric data was captured."
* ^status = #active
* ^experimental = false
* DTRMetricCodes#payer-src
* DTRMetricCodes#provider-src
* DTRMetricCodes#DTRApp-src

// ************************************************************
ValueSet: MetricLaunchMode
Id: metric-launchmode
Title: "Metric Launch Mode"
Description: "A list of codes indicating how DTR was launched."
* ^status = #active
* ^experimental = false
* DTRMetricCodes#crdlaunch
* DTRMetricCodes#relaunch
* DTRMetricCodes#salaunch
* DTRMetricCodes#cdexlaunch

// ************************************************************
ValueSet: MetricAction
Id: metric-Action
Title: "Metric Action"
Description: "A list of codes indicating the DTR action performed by a system."
* ^status = #active
* ^experimental = false
* DTRMetricCodes#launch
* DTRMetricCodes#qpackage
* DTRMetricCodes#mrquery
* DTRMetricCodes#nextq
* DTRMetricCodes#userresponse
* DTRMetricCodes#storeqr
