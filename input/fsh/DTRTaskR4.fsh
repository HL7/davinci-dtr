/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRTask
Parent:         Task
Id:             dtr-task-r4
Title:          "DTR Task R4"
Description:    "The task resource is used to capture a request for additional actions that arise from the DTR flow. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements."

* ^meta.versionId = "7"
* ^meta.lastUpdated = "2019-03-08T09:01:59.000-08:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-12-23T02:27:35+00:00"

* basedOn 1..1
* basedOn only Reference(DTRQuestionnaire or DTRQuestionnaireResponse)

* status = #requested (exactly)

* for 1..1
* for only Reference(Patient)
