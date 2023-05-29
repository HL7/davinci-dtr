/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

//==================================================================================
// Service Request 

Profile:        DTRMedicationRequest
Parent:         us-core-medicationrequest
Id:             dtr-medicationrequest
Title:          "DTR Medication Request"
Description:    "The MedicationRequest resource can be used to record a patient’s medication prescription or order. This profile sets minimum expectations for the MedicationRequest resource to record, search, and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets SHALL be present in the resource when using this profile."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2023-05-29T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The MedicationRequest resource can be used to record a patient’s medication prescription or order. This profile sets minimum expectations for the MedicationRequest resource to record, search, and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets SHALL be present in the resource when using this profile.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2023-05-29T02:27:35+00:00"

// * requester only Reference(us-core-practitionerrole)
* requester only Reference(us-core-practitioner)
* requester MS
