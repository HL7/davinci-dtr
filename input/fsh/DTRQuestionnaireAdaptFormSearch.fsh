Profile: DTRQuestionnaireAdaptSearch
Parent: sdc-questionnaire
Id: dtr-questionnaire-adapt-search
Title: "DTR Questionnaire for adaptive form Search"
Description: "The DTR adaptive Questionnaire is used to represent an adaptive Questionnaire when returning the empty Questionnaire in a Questionnaire package."
* ^purpose = "While aligned with the [SDC Adaptive Questionnaire Search](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-adapt-srch.html) profile, this profile does not derive from that profile because elements that SDC make mustSupport for search purposes are not needed for the DTR use case.  (EHRs do not need to search for relevant Questionnaires)."
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2024-08-24T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource for the adaptive form is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #active

* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-questionnaireAdaptive named questionnaireAdaptive 0..* MS
* extension[sdc-questionnaire-assemble-expectation] 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/rendering-styleSensitive named styleSensitive 0..1
* extension[styleSensitive].valueBoolean = false
* extension[sdc-questionnaire-preferredTerminologyServer] 0..* MS
* extension[sdc-questionnaire-preferredTerminologyServer] ^comment = "Multiple repetitions are available to support availability (one server might be down) as well as to accommodate the possibility that different servers might be needed for different value sets.  In either case, client behavior is to try different servers from the available list until one is successful.  There is no implication to the order in which the servers are listed.  If no service is listed and terminology services are needed, the $expand operation should be invoked on the base URL for the payer."

* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-entryMode named entryMode 0..* MS
* extension[entryMode].valueCode from $sdcEntryMode (required) 

* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named signatureRequired 0..1 MS
* extension[signatureRequired] ^short = "There's a cost to support this."
* extension contains http://hl7.org/fhir/StructureDefinition/cqf-library named cqf-library 0..* MS
* extension[cqf-library] ^short = "The library can contain CQL, FHIRPath or x-fhir-query. The implementers must handle any of the above."
* extension[cqf-library].valueCanonical only Canonical(http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-library)
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named titleRenderingStyle 0..1
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named titleRenderingXhtml 0..1
* effectivePeriod 0..1 MS
  * ^short = "Validity period for the Questionnaire"

* item.extension[terminologyServer] ^comment = "Multiple repetitions are available to support availability (one server might be down) as well as to accommodate the possibility that different servers might be needed for different value sets.  In either case, client behavior is to try different servers from the available list until one is successful.  There is no implication to the order in which the servers are listed.  If no service is listed and terminology services are needed, the $expand operation should be invoked on the base URL for the payer."
