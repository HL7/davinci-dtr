Profile:        DTRCoverage
Parent:         Coverage
Id:             dtr-coverage
Title:          "DTR Coverage"
Description:    "The Coverage resource is used to identify the payer."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2022-02-11T11:10:05.000-07:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Coverage resource is used to identify the payer.  It contains an extension which indicates the payer endpoint for retrieving information.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2022-02-11T02:27:35+00:00"


* dependent MS

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

//==================================================================================
// Medication Request 

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
