/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

//==================================================================================
// Device Request 

Profile:        DTRDeviceRequest
Parent:         DeviceRequest
Id:             dtr-devicerequest
Title:          "DTR Device Request"
Description:    "Represents a request for a patient to employ a medical device. The device may be an implantable device, or an external assistive device, such as a walker."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2023-05-29T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Represents a request for a patient to employ a medical device. The device may be an implantable device, or an external assistive device, such as a walker.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2023-05-29T02:27:35+00:00"

* status MS

* intent MS

* subject only Reference(us-core-patient)
* subject MS

* requester only Reference(us-core-practitionerrole)
* requester MS
