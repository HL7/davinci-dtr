///**********************************************************************************************
// Value Sets
// ************************************************************
ValueSet: DTRCompletionTimes
Id: completionTimes
Title: "Questionnaire Completion Time Value Set"
Description: "Codes defining estimated completion times for a Questionnaire"
* ^status = #active
* ^experimental = false
* ^extension[$fmm].valueInteger = 1
* DTRCompletionTimeCodes#under-1min
* DTRCompletionTimeCodes#under-3min
* DTRCompletionTimeCodes#under-5min
* DTRCompletionTimeCodes#over-5min

// ************************************************************
ValueSet: DTRAudience
Id: questionnaireAudience
Title: "Audience Value Set"
Description: "Codes defining audience of additional documentation to be captured"
* ^status = #active
* ^experimental = false
* ^extension[$fmm].valueInteger = 1
* DTRIntendedAudience#clinical
* DTRIntendedAudience#admin
* DTRIntendedAudience#patient

// ************************************************************
ValueSet: DTRInformationOrigins
Id: informationOrigins
Title: "Information Origins Value Set"
Description: "Codes describing the possible origination of information."
* ^experimental = false
* DTRInformationOriginCodes#auto-client
* DTRInformationOriginCodes#auto-server
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

// ************************************************************
ValueSet: ConformanceStatementCategories
Id: cs-categories
Title: "Conformance Statement Categories"
Description: "Categories for conformance statements found in the DTR Implementation Guide"
* ^status = #active
* ^experimental = false
* DTRConformanceStatementCategories#business
* DTRConformanceStatementCategories#exchange
* DTRConformanceStatementCategories#processing
* DTRConformanceStatementCategories#storage
* DTRConformanceStatementCategories#ui
