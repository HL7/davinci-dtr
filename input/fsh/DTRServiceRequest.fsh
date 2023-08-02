/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

//==================================================================================
// Service Request 

Profile:        DTRServiceRequest
Parent:         ServiceRequest
Id:             dtr-servicerequest
Title:          "DTR Service Request"
Description:    "This profile sets minimum expectations for recording, searching, and fetching the ServiceRequest resource to promote interoperability and adoption through common implementation."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2023-05-29T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>This profile sets minimum expectations for recording, searching, and fetching the ServiceRequest resource to promote interoperability and adoption through common implementation.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2023-05-29T02:27:35+00:00"

* status MS
* intent MS
* category MS
* code 1.. MS
* code ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."

* subject only Reference(us-core-patient)
* subject MS

* occurrence[x] only Period or dateTime or Timing
* occurrence[x] MS

* authoredOn MS

* requester only Reference(us-core-practitionerrole)
* requester MS

* reasonCode from us-core-condition-code (extensible)
