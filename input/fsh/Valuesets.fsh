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

// ************************************************************
ValueSet: IntendedUse
Id: intended-Use
Title: "Intended Use"
Description: "A list of codes indicating the intended use of the QuestionnaireResponse."
* ^status = #active
* ^experimental = false
* DTRTempCodes#pa
* DTRTempCodes#claim
* DTRTempCodes#order
* DTRTempCodes#retain

// ************************************************************
ValueSet: CoveredInfo
Id: coverageInfo
Title: "Covered Information Value Set"
Description: "Codes defining whether the ordered/requested service is covered under patient's plan"
* ^status = #active
* ^experimental = false
* DTRTempCodes#not-covered
* DTRTempCodes#covered
* DTRTempCodes#conditional

// ************************************************************
ValueSet: CoveragePaDetail
Id: coveragePaDetail
Title: "Coverage Prior Authorization Value Set"
Description: "Codes defining whether prior auth will be needed for coverage to be provided"
* ^status = #active
* ^experimental = false
* DTRTempCodes#no-auth
* DTRTempCodes#auth-needed
* DTRTempCodes#satisfied
* DTRTempCodes#performpa
* DTRTempCodes#conditional

// ************************************************************
ValueSet: AdditionalDocumentation
Id: AdditionalDocumentation
Title: "Additional Documentation Value Set"
Description: "Codes defining whether additional documentation needs to be captured"
* ^status = #active
* ^experimental = false
* DTRTempCodes#no-doc
* DTRTempCodes#clinical
* DTRTempCodes#admin
* DTRTempCodes#both
* DTRTempCodes#conditional

// ************************************************************
ValueSet: InformationNeeded
Id: informationNeeded
Title: "Information Needed Value Set"
Description: "Codes defining whether information about the perfomer, location, and/or performance date is needed to determine coverage information"
* ^status = #active
* ^experimental = false
* DTRTempCodes#performer
* DTRTempCodes#location
* DTRTempCodes#timeframe
