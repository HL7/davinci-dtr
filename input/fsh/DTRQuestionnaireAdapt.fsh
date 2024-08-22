Profile: DTRQuestionnaireAdapt
Parent: sdc-questionnaire-adapt
Id: dtr-questionnaire-adapt
Title: "DTR Questionnaire for adaptive form"
Description: "The DTR Adaptive Questionnaire is used to represent an adaptive Questionnaire when actually filling out a QuestionnaireResponse."

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-11-12T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource for the adaptive form is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* text.div ^comment = "The contents of the html element are an XHTML fragment containing only the basic html formatting elements described in chapters 7-11 and 15 of the HTML 4.0 standard, 'anchor' elements (either name or href), images and internally contained stylesheets. The XHTML content SHALL NOT contain a head, a body, external stylesheet references, scripts, forms, base/link/xlink, frames, iframes and objects."

* ^version = "1.0.0"
* ^status = #active
* ^date = "2021-11-12T02:27:35+00:00"

/////////////////////////
// Rendering extensions 
* extension contains http://hl7.org/fhir/StructureDefinition/rendering-styleSensitive named styleSensitive 0..1
* extension[styleSensitive].valueBoolean = false
* extension[styleSensitive] ^comment = "If set to true, all systems that claim to support this extension and that render elements from the resource SHALL either render the content as required by the style extensions (style, xhtml and markdown or shall indicate to the user that the resource (or specific elements in the resource) cannot be appropriately rendered by the system."
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named titleRenderingStyle 0..1
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named titleRenderingXhtml 0..1
* text 1..1 
* effectivePeriod MS
  * ^short = "Validity period for the Questionnaire"
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemPrefixRenderingStyle 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemTextRenderingStyle 0..1
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemPrefixRenderingXhtml 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemTextRenderingXhtml 0..1 MS

* item.extension contains http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/containedReference named containedReference 0..1 MS
* item.extension[containedReference] ^short = "Contain the reference?"
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemMedia named itemMedia 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-optionalDisplay named itemOptionalDisplay 0..0
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-shortText named shortText 0..1
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

/////////////////////////
// Behavior extension
* item.enableWhen 0..0
* item.enableBehavior 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/cqf-library named cqf-library 0..* MS
* extension[cqf-library] ^short = "The library can contain CQL, FHIRPath or x-fhir-query. The implementers must handle any of the above."
* extension[cqf-library].valueCanonical only Canonical(http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-library)
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression named initialExpression 0..1 MS

/////////////////////////
// Populate extensions
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext named itemPopulationContext 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unit named unit 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression named candidateExpression 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-contextExpression named contextExpression 0..* MS

