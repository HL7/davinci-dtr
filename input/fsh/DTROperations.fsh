Instance: DTRQuestionnaireOperation
InstanceOf: OperationDefinition
Description: "This operation returns 1 or more [collection] Bundles each consisting of a single Questionnaire resource as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire.

The operation takes in either:
(1) one or more canonicals specifying the URL and, optionally, the version of the Questionnaire(s) to retrieve; or
(2) one or more Coverage instances and one or more patient orders, appointments or encounters that might trigger the need for a Questionnaire to be completed

In the first case, the operation will return the specified versions of the respective Questionnaires (or current version if no version is indicated).  In the second case, all Questionnaires relevant to determining coverage, prior authorization, claims acceptability, documentation requirements, etc. will be returned.  The Coverage SHALL comply with either the  [identified coverage] or [de-identified coverage] profiles.  Similarly the Order shall comply with one of the following profiles [insert list here of all the candidates as per CRD]

In most cases, only one order and one coverage will be provided.  However, the operation allows for circumstances where the decision support engine can handle multiple active coverages - either for the same payer or multiple payers handled by the same engine.  It also handles multiple orders with overlapping requirements where a payer might be able to minimize the answers to be gathered by processing the answers as a group.

If any of the explicitly requested questionnaires cannot be found, a warning will be provided in the 'outcome' output.  Similarly, if there is an issue understanding any of the orders or coverages and determining appropriate Questionnaires, a warning will be provided.

The Bundle will include the Questionnaire as the first entry along with all external Libraries referenced by the Questionnaire using the [cqf-library] extension, as well as a recursive retrieval of all 'related-artifact' references of type 'depends-on'.  The Bundle will also include all external ValueSet instances referenced by the Questionnaire.  All value sets will be expanded as of the current date and using expansion parameters (such as SNOMED release) as deemed appropriate by he server

All references will will be resolved on a version-specific basis if version is declared, or retrieve the 'current' version if none is specified.  

If any of the dependencies cannot be retrieved or value sets expanded, a warning will be included in the 'outcome'.  Each Library and ValueSet will only appear once, even if it is referenced multiple places.  The only exception is if more than one version of a Library or ValueSet are referenced.  Multiple versions of a ValueSet will be returned.  Multiple versions of a Library MAY be treated as an error, or MAY be handled by returning the 'most recent' version of the referenced versions.

NOTE: for adaptive questionnaires, there will be no ValueSets and may not be any Libraries as CQL is typically in-line and questions - when they appear - will only provide answerOptions, not value sets.When resuming a work in progress questionnaire response the DTR client SHALL invoke the operation with the timestamp to see if the questionnaire package has changed since it was last retrieved.  The DTR system SHALL store as meta data the timestamp of the last time it checked for changes."
Usage: #definition

* id = "questionnaire-package"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* name = "QuestionnairePackage"
* title = "Get Questionnaire for given order"
* status = #draft
* kind = #operation
* code = #questionnaire-package
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"

* resource = #Questionnaire
* system = false
* type = true
* instance = true

// in
* parameter[0].name = #coverage
* parameter[=].use = #in
* parameter[=].documentation = "One or more Coverage resource instances. (Note: This could also be de-identified)"
* parameter[=].type = #Coverage
* parameter[=].min = 1
* parameter[=].max = "*"

* parameter[+].name = #order
* parameter[=].use = #in
* parameter[=].documentation = "One or more Order resource instances. e.g., DeviceRequest, ServiceRequest, MedicationRequest, ... Encounter, Appointment, or prior-auth Claim, etc. (Note: This could also be de-identified)"
* parameter[=].type = #Any
* parameter[=].min = 1
* parameter[=].max = "*"

* parameter[+].name = #changedsince
* parameter[=].use = #in
* parameter[=].documentation = "If present, the package will only contain the questionnaire or associated artifact that have changes since the specified timestamp.  If there are no changed artifacts the operation will simply return a 200 Ok indicating that nothing has changed since the specified timestamp."
* parameter[=].type = #dateTime
* parameter[=].min = 0
* parameter[=].max = "*"

// return
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "1 or more bundles each with a Questionnaire, Library/CQL, and value set(s)."
* parameter[=].type = #Bundle

* parameter[+].name = #outcome
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "This OperationOutcome satisfies the definition of this operation"
* parameter[=].type = #OperationOutcome