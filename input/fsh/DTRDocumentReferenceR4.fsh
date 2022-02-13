/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRDocumentReference
Parent:         DocumentReference
Id:             dtr-documentreference-r4
Title:          "DTR Document Reference R4"
Description:    "The DocumentReference resource is used to represent a saved DTR session waiting for relaunch."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2022-02-11T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The DocumentReference resource is used to represent a saved DTR session waiting for relaunch.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2022-02-11T02:27:35+00:00"

* subject 1..1
* subject only Reference(Patient)

* author only Reference(Organization)


