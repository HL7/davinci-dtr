Profile:        DTRQuestionnaireResponseAdapt
Parent:         dtr-questionnaireresponse //SDCQuestionnaireResponse
Id:             dtr-questionnaireresponse-adapt
Title:          "DTR Questionnaire Response for adaptive form"
Description:    "Enforces DTR requirements on a completed or partially completed Adaptive QuestionnaireResponse, including allowing the response to be linked to the relevant order, coverage, etc. and enforcing constraints applicable to the DTR context."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2025-07-02T01:22:45+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The QuestionnaireResponse resource is used to represent the information supplied by the provider.</p></div>"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2025-07-02T01:22:45+00:00"

* contained 1..1 MS 
* contained only DTRQuestionnaireAdapt

* questionnaire ^type.aggregation = #contained

