/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRQuestionnaireResponse
Parent:         QuestionnaireResponse
Id:             dtr-questionnaireresponse-r4
Title:          "DTR Questionnaire Response R4"
Description:    "The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer."

* ^meta.versionId = "10"
* ^meta.lastUpdated = "2019-03-11T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The QuestionnaireResponse resource is used to represent the information supplied by the provider.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-12-23T02:27:35+00:00"

* extension only QuestionnaireResponseContext

* basedOn 0..0
* partOf 0..0

* questionnaire 1..1

* subject 1..1
* subject only Reference(Resource)

* item 1..*
* item.extension only $QRAUTHOR
