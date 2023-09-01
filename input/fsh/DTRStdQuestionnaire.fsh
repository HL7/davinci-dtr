Profile: DTRStdQuestionnaire
Parent: sdc-questionnaire
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
* text.div ^comment = "The contents of the html element are an XHTML fragment containing only the basic html formatting elements described in chapters 7-11 and 15 of the HTML 4.0 standard, 'anchor' elements (either name or href), images and internally contained stylesheets. The XHTML content SHALL NOT contain a head, a body, external stylesheet references, scripts, forms, base/link/xlink, frames, iframes and objects."
* subjectType 1..1
* subjectType = #Patient

/////////////////////////
// Rendering extensions 
* extension contains http://hl7.org/fhir/StructureDefinition/rendering-styleSensitive named styleSensitive 0..1
* extension[styleSensitive].valueBoolean = false
// * extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-preferredTerminologyServer named preferredTerminologyServer 0..* MS
* extension[terminologyServer] MS 
* extension[terminologyServer] ^comment = "Multiple repetitions are available to support availability (one server might be down) as well as to accommodate the possibility that different servers might be needed for different value sets.  In either case, client behavior is to try different servers from the available list until one is successful.  There is no implication to the order in which the servers are listed.  If no service is listed and terminology services are needed, the $expand operation should be invoked on the base URL for the payer."
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named titleRenderingStyle 0..1
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named titleRenderingXhtml 0..1
* text 1..1 
// * text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named textRenderingStyle 0..1
// * text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named textRenderingXhtml 0..1
* effectivePeriod MS
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemPrefixRenderingStyle 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemTextRenderingStyle 0..1
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemPrefixRenderingXhtml 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemTextRenderingXhtml 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemMedia named itemMedia 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-optionalDisplay named itemOptionalDisplay 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-shortText named shortText 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-hidden named itemHidden 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-openLabel named openLabel 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl named itemControl 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation named choiceOrientation 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory named displayCategory 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink named supportLink 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn named choiceColumn 0..*
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-width named width 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-sliderStepValue named sliderStepValue 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/entryFormat named entryFormat 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-collapsible named collapsible 0..1
* item.answerOption.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemAnswerMedia named itemAnswerMedia 0..1
* extension[assemble-expectation] 0..0

* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-entryMode named entryMode 0..* MS
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-endpoint named endpoint 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named signatureRequired 0..1 MS
* extension[signatureRequired] ^short = "There's a cost to support this."
* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-constraint named constraint 0..* 
* extension contains http://hl7.org/fhir/StructureDefinition/cqf-library named cqf-library 0..* MS
* extension[cqf-library] ^short = "The library can contain CQL, FHIRPath or x-fhir-query. The implementers must handle any of the above."
* extension[cqf-library].valueCanonical only Canonical(http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-library)
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext named launchContext 0..* MS
* extension contains http://hl7.org/fhir/StructureDefinition/variable named variable 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-usageMode named usageMode 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named itemSignatureRequired 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs named minOccurs 0..1 
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs named maxOccurs 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/minLength named minLength 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/regex named regex 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/minValue named minValue 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxValue named maxValue 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-minQuantity named minQuantity 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-maxQuantity named maxQuantity 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces named maxDecimalPlaces 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/mimeType named mimeType 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxSize named maxSize 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerOptionsToggleExpression named answerOptionsToggleExpression 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption named unitOption 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitValueSet named unitValueSet 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource named referenceResource 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile named referenceProfile 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression named candidateExpression 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-lookupQuestionnaire named lookupQuestionnaire 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-constraint named itemConstraint 0..*
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression named initialExpression 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression named calculatedExpression 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression named enableWhenExpression 0..1 MS
* item.text.extension contains $cqf-expression named itemTextCqfExpression 0..1
* item.enableWhen 0..* MS
* item.enableBehavior 0..1 MS
* item.required.value ^mustSupport = false
* item.required.value.extension contains $cqf-expression named requiredExpression 0..1
* item.repeats.value ^mustSupport = false
* item.repeats.value.extension contains $cqf-expression named repeatsExpression 0..1
* item.readOnly.value ^mustSupport = false
* item.readOnly.value.extension contains $cqf-expression named readOnlyExpression 0..1
* item.answerValueSet.value ^mustSupport = false
* item.answerValueSet.value.extension contains $cqf-expression named answerValueSetExpression 0..1
* item.answerOption.value[x] 1..1 MS
* item.answerOption.value[x].extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named answerOptionRenderingXhtml 0..1 MS
* item.answerOption.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-optionExclusive named optionExclusive 0..1 MS
* item.answerOption.extension contains http://hl7.org/fhir/StructureDefinition/ordinalValue named ordinalValue 0..1

* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext named itemPopulationContext 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unit named unit 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-contextExpression named contextExpression 0..* MS
