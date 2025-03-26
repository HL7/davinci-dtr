Profile: DTRQuestionnaireAdapt
Parent: dtr-base-questionnaire
Id: dtr-questionnaire-adapt
Title: "DTR Questionnaire for adaptive form"
Description: "The DTR Adaptive Questionnaire is used to represent an adaptive Questionnaire when actually filling out a QuestionnaireResponse.
NOTE: This profile does not realistically need the `questionnaireAdaptive` extension, but will remain intact due to potential impacts on Structured Data Capture (SDC) requirements.  (Efforts will be made in an attempt to get the SDC requirements on this extension loosened in a future release)"

* ^meta.versionId = "1"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource for the adaptive form is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* text.div ^comment = "The contents of the html element are an XHTML fragment containing only the basic html formatting elements described in chapters 7-11 and 15 of the HTML 4.0 standard, 'anchor' elements (either name or href), images and internally contained stylesheets. The XHTML content SHALL NOT contain a head, a body, external stylesheet references, scripts, forms, base/link/xlink, frames, iframes and objects."

* ^version = "1.0.0"
* ^status = #active
* ^date = "2021-11-12T02:27:35+00:00"

* extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-questionnaireAdaptive named questionnaireAdaptive 1..1 MS
* extension[questionnaireAdaptive].value[x] only url
* item.enableWhen 0..0
