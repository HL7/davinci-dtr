Profile: DTRStdQuestionnaire
Parent: dtr-base-questionnaire
Id: dtr-std-questionnaire
Title: "DTR Standard Questionnaire"
Description: "Takes a subset of extensions and constraints from the SDC [rendering](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-render.html), [behavior](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-behave.html), and [population](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-pop-exp.html) profiles, reflecting agreed expectations around which data elements might be relevant as well as which must be supported for DTR purposes."

* ^purpose = "Elements that are not mustSupport are presented here as elements that may be of interest to certain payers, but can only be used if the payer is aware that the invoking EHR or SMART App can support them.  Further guidance on the use of these elements should be found in the underlying [SDC](http://hl7.org/fhir/uv/sdc/STU3/) specification."
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-11-12T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2021-11-12T02:27:35+00:00"
*