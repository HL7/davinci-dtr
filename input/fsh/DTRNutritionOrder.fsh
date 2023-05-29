/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

//==================================================================================
// Device Request 

Profile:        DTRNutritionOrder
Parent:         NutritionOrder
Id:             dtr-nutritionorder
Title:          "DTR Nutrition Order"
Description:    "The NutritionOrder resource is used for requesting oral diets, oral nutrition supplements and enteral feedings in an in-patient setting."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2023-05-29T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The NutritionOrder resource is used for requesting oral diets, oral nutrition supplements and enteral feedings in an in-patient setting.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2023-05-29T02:27:35+00:00"

* status MS
* intent MS

* patient only Reference(us-core-patient)
* patient MS

* orderer only Reference(us-core-practitionerrole)
* orderer MS
