/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRCoverage
Parent:         Coverage
Id:             dtr-coverage-r4
Title:          "DTR Coverage R4"
Description:    "The Coverage resource is used to identify the payer."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2022-02-11T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Coverage resource is used to identify the payer.  It contains an extension which indicates the payer endpoint for retrieving information.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2022-02-11T02:27:35+00:00"


* extension only PayerEndpoint


