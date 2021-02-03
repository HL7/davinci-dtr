/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRTaskR4
Parent:         Task
Id:             dtr-task-r4
Title:          "DTR Task R4"
Description:    "The task resource is used to capture a request for additional actions that arise from the DTR flow. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements."

* basedOn 1..1
* basedOn only Reference(DTRQuestionnaireR4 or DTRQuestionnaireResponseR4)

* status = TSCSYS#requested

* for only Reference(Patient)
