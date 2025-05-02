Profile: DTRBaseQuestionnaire
Parent: sdc-questionnaire
Id: dtr-base-questionnaire
Title: "DTR Base Questionnaire"
Description: "Takes a subset of extensions and constraints from the SDC [rendering](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-render.html), [behavior](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-behave.html), and [population](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-pop-exp.html) profiles, reflecting agreed expectations around which data elements might be relevant as well as which must be supported for DTR purposes."

* ^purpose = "Elements that are not mustSupport are presented here as elements that may be of interest to certain payers, but can only be used if the payer is aware that the invoking EHR or SMART App can support them.  Further guidance on the use of these elements should be found in the underlying [SDC](http://hl7.org/fhir/uv/sdc/STU3/) specification."
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-11-12T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2021-11-12T02:27:35+00:00"
* ^abstract = true

* text.div ^comment = "The contents of the html element are an XHTML fragment containing only the basic html formatting elements described in chapters 7-11 and 15 of the HTML 4.0 standard, 'anchor' elements (either name or href), images and internally contained stylesheets. The XHTML content SHALL NOT contain a head, a body, external stylesheet references, scripts, forms, base/link/xlink, frames, iframes and objects."
* subjectType 1..1
* subjectType = #Patient

// ***********************************************************************************************************************************************
* extension[assemble-expectation] 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/rendering-styleSensitive named styleSensitive 0..1
* extension[styleSensitive].valueBoolean = false
* extension[styleSensitive] ^comment = "If set to true, all systems that claim to support this extension and that render elements from the resource SHALL either render the content as required by the style extensions (style, xhtml and markdown or shall indicate to the user that the resource (or specific elements in the resource) cannot be appropriately rendered by the system."
* extension[terminologyServer] MS 
* extension[terminologyServer] ^comment = "Multiple repetitions are available to support availability (one server might be down) as well as to accommodate the possibility that different servers might be needed for different value sets.  In either case, client behavior is to try different servers from the available list until one is successful.  There is no implication to the order in which the servers are listed.  If no service is listed and terminology services are needed, the $expand operation should be invoked on the base URL for the payer."
* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named signatureRequired 0..1 MS
* extension[signatureRequired] ^short = "There's a cost to support this."
* extension contains http://hl7.org/fhir/StructureDefinition/variable named variable 0..* MS
* extension contains http://hl7.org/fhir/StructureDefinition/targetConstraint named constraint 0..* 
* extension contains http://hl7.org/fhir/StructureDefinition/cqf-library named cqf-library 0..* MS
* extension[cqf-library] ^short = "The library can contain CQL, FHIRPath or x-fhir-query. The implementers must handle any of the above."
* extension[cqf-library].valueCanonical only Canonical(http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-library)
* extension contains sdcLaunchContext named launchContext 0..* MS
* extension contains sdcItemPopulationContext named itemPopulationContext 0..* MS
* extension contains sdcEntryMode named entryMode 0..* MS
* extension contains sdcEndpoint named endpoint 0..0

// ***********************************************************************************************************************************************
* item obeys dtrq-2 and dtrq-3 and dtrq-4 and dtrq-5
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-hidden named itemHidden 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl named itemControl 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation named choiceOrientation 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory named displayCategory 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink named supportLink 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-sliderStepValue named sliderStepValue 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/entryFormat named entryFormat 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-usageMode named usageMode 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named itemSignatureRequired 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs named minOccurs 0..1 
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs named maxOccurs 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/minLength named minLength 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/regex named regex 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/minValue named minValue 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxValue named maxValue 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces named maxDecimalPlaces 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/mimeType named mimeType 0..1 MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxSize named maxSize 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption named unitOption 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource named referenceResource 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile named referenceProfile 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/targetConstraint named itemConstraint 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unit named unit 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitValueSet named unitValueSet 0..1 MS
* item.extension[unitValueSet] ^comment = "Provide either unitOption(s) or unitValueSet. If either of the extensions are present, the units for a Quantity element are constrained to only the units listed by the extensions - i.e. it is treated as a \"required\", not an \"extensible\" binding. In the absence of either, any unit is valid. See additional guidance and examples in the [SDC implementation guide](http://hl7.org/fhir/uv/sdc/behavior.html#unitValueSet). If this extension present and an answer is provided for the question item in the QuestionnaireResponse, then the valueQuantity **SHALL** have a Quantity.code and Quantity.system that match the Coding.code and system of one of the allowed values if the Coding has a code and/or system. If the Coding only has a display, then the Quantity.unit must match. (Note that Coding with only a display is strongly discouraged.) If there is a match on code and system, but no match on display/unit, systems MAY raise a warning. However, because of translation and bandwidth considerations, some systems **MAY** opt to drop the unit or express it in an alternate language. Validation of the Quantity unit **MAY** be performed by using the $validateCode operation, populating the elements passed into the operation from the Quantity.code, system and unit elements."

* item.extension contains sdcItemMedia named itemMedia 0..1
* item.extension contains sdcOptionalDisplay named itemOptionalDisplay 0..0
* item.extension contains sdcShortText named shortText 0..1
* item.extension contains sdcOpenLabel named openLabel 0..1
* item.extension contains sdcChoiceColumn named choiceColumn 0..*
* item.extension contains sdcWidth named width 0..1
* item.extension contains sdcCollapsible named collapsible 0..1
* item.extension contains sdcMinQuantity named minQuantity 0..1
* item.extension contains sdcMaxQuantity named maxQuantity 0..1
* item.extension contains sdcLookupQuestionnaire named lookupQuestionnaire 0..1 MS

* item.extension contains sdcCandidateExpression named candidateExpression 0..1 MS
* item.extension[candidateExpression].valueExpression.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/alternativeExpression named alternativeExpression 0..1 MS
* item.extension contains sdcInitialExpression named initialExpression 0..1 MS
* item.extension[initialExpression].valueExpression.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/alternativeExpression named alternativeExpression 0..1 MS
* item.extension contains sdcCalculatedExpression named calculatedExpression 0..1 MS
* item.extension[calculatedExpression].valueExpression.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/alternativeExpression named alternativeExpression 0..1 MS
* item.extension contains sdcContextExpression named contextExpression 0..* MS
* item.extension[contextExpression].extension[expression].valueExpression.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/alternativeExpression named alternativeExpression 0..1 MS

* item.text 1..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemTextRenderingStyle 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemTextRenderingXhtml 0..1 MS
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemPrefixRenderingStyle 0..1
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemPrefixRenderingXhtml 0..1
* item.enableBehavior 0..1 MS
* item.answerOption.value[x] 1..1 MS
* item.answerOption.value[x].extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named answerOptionRenderingXhtml 0..1 MS
* item.answerOption.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-optionExclusive named optionExclusive 0..1 MS
* item.answerOption.extension contains http://hl7.org/fhir/StructureDefinition/ordinalValue named ordinalValue 0..1
* item.answerOption.extension contains sdcItemAnswerMedia named itemAnswerMedia 0..1

* effectivePeriod MS
