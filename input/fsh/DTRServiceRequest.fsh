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
* status ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* status ^extension.valueBoolean = true
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"

* intent MS
* intent ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* intent ^extension.valueBoolean = true
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"

* category MS
* category ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* category ^extension.valueBoolean = true

* code 1.. MS
* code ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* code ^extension.valueBoolean = true
* code ^short = "What is being requested/ordered"

* subject only Reference(us-core-patient)
* subject MS
* subject ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* subject ^extension.valueBoolean = true
* subject ^short = "Individual or Entity the service is ordered for"

* occurrence[x] only Period or dateTime or Timing
* occurrence[x] MS
* occurrence[x] ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* occurrence[x] ^extension.valueBoolean = true
* occurrence[x] ^short = "When service should occur"
* occurrence[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* occurrence[x] ^type.extension.valueBoolean = true

* authoredOn MS
* authoredOn ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* authoredOn ^extension.valueBoolean = true
* authoredOn ^short = "Date request signed"

* requester only Reference(us-core-practitionerrole)
* requester MS
* requester ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* requester ^extension.valueBoolean = true
* requester ^short = "Who/what is requesting service"

* reasonCode from us-core-condition-code (extensible)
* reasonCode ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* reasonCode ^extension.valueBoolean = true
* reasonCode ^short = "Explanation/Justification for procedure or service"

* reasonReference ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* reasonReference ^extension.valueBoolean = true
* reasonReference ^short = "US Core Profile that supports the requested service"