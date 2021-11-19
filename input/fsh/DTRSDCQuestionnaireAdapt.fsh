Profile: DTRSDCQuestionnaireAdapt
Parent: sdc-questionnaire-adapt
Id: dtr-sdc-questionnaire-adapt
Title: "DTR SDC Questionnaire for adaptive form"
Description: "The DTR SDC Questionnaire for adaptive form resource profile"

* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-11-12T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource for the adaptive form is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2021-11-12T02:27:35+00:00"

/////////////////////////
// Rendering extensions
* extension contains http://hl7.org/fhir/StructureDefinition/rendering-styleSensitive named styleSensitive 0..1
* extension[styleSensitive].valueBoolean = false
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named titleRenderingStyle 0..1
* text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named textRenderingStyle 0..1
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemPrefixRenderingStyle 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-style named itemTextRenderingStyle 0..1
* title.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named titleRenderingXhtml 0..1
* text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named textRenderingXhtml 0..1
* item.prefix.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemPrefixRenderingXhtml 0..1
* item.text.extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named itemTextRenderingXhtml 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-optionalDisplay named itemOptionalDisplay 0..0
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-hidden named itemHidden 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl named itemControl 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation named choiceOrientation 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory named displayCategory 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink named supportLink 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn named choiceColumn 0..*
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-width named width 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-sliderStepValue named sliderStepValue 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/entryFormat named entryFormat 0..*

/////////////////////////
// Behavior extensions
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-entryMode named entryMode 0..* MS
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-endpoint named endpoint 0..* MS
* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired named signatureRequired 0..* MS
* extension[signatureRequired] ^short = "There's a cost to support this. Therefore, only ask for it if you genuinely need it."
* extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-constraint named constraint 0..* 
* extension contains http://hl7.org/fhir/StructureDefinition/cqf-library named cqf-library 0..* MS
* extension[cqf-library] ^short = "The library can contain CQL, FHIRPath or x-fhir-query. The implementers must handle any of the above."
//* extension[cqf-library].value[x] only http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-library
* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext named launchContex 0..* MS
* extension contains http://hl7.org/fhir/StructureDefinition/variable named variable 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-usageMode named usageMode 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs named minOccurs 0..* 
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs named maxOccurs 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/minLength named minLength 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/regex named regex 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/minValue named minValue 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxValue named maxValue 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces named maxDecimalPlaces 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/mimeType named mimeType 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/maxSize named maxSize 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption named unitOption 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitValueSet named unitValueSet 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource named referenceResource 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile named referenceProfile 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-lookupQuestionnaire named lookupQuestionnaire 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-constraint named itemConstraint 0..*
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression named initialExpression 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression named calculatedExpression 0..* MS
* item.enableWhen 0..* MS
* item.enableBehavior 0..1 MS
//* item.text 0..1
* item.repeats 0..1
* item.readOnly 0..1

/////////////////////////
// Populate extensions
// * extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext name itemPopulationContext 0..* MS
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unit named unit 0..*
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression named candidateExpression 0..* MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-contextExpression named contextExpression 0..* MS

