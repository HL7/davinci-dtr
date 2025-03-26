Profile: DTRStdQuestionnaire
Parent: dtr-base-questionnaire
Id: dtr-std-questionnaire
Title: "DTR Standard Questionnaire"
Description: "Takes a subset of extensions and constraints from the SDC [rendering](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-render.html), [behavior](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-behave.html), and [population](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-pop-exp.html) profiles, reflecting agreed expectations around which data elements might be relevant as well as which must be supported for DTR purposes."

* item 1..* 
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression named enableWhenExpression 0..1 MS
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerOptionsToggleExpression named answerOptionsToggleExpression 0..1
* item.enableWhen 0..* MS
* item.text.extension contains $cqf-expression named itemTextCqfExpression 0..1
* item.required.value ^mustSupport = false
* item.required.value.extension contains $cqf-expression named requiredExpression 0..1
* item.repeats.value ^mustSupport = false
* item.repeats.value.extension contains $cqf-expression named repeatsExpression 0..1
* item.readOnly.value ^mustSupport = false
* item.readOnly.value.extension contains $cqf-expression named readOnlyExpression 0..1
* item.answerValueSet.value ^mustSupport = false
* item.answerValueSet.value.extension contains $cqf-expression named answerValueSetExpression 0..1
