Instance: DTRQuestionnairePackage
InstanceOf: OperationDefinition
Description: "This operation returns a collection Bundle containing one or more Questionnaire-specific collection Bundles each consisting of a single Questionnaire resource as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire."
Title: "DTR Questionnaire Package"
Usage: #definition

* id = "questionnaire-package"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* name = "QuestionnairePackage"
* title = "Get Questionnaire Packge for given order(s)"
* status = #active
* kind = #operation
* description = "This operation returns one or more 'collection' Bundles each consisting of a single Questionnaire resource as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire.

The operation **SHALL** take as input the Coverage resource(s) identifying the member and the type(s) of Coverage for which additional information is needed and at least one of:  
* Zero or more canonicals specifying the URL and, (optionally) the version of the Questionnaire(s) to retrieve;
* A CRD/PAS context ID, and/or
* One or more Request or Encounter resources

If specific Questionnaires are specified, the operation will return the specified versions of the respective Questionnaires (or current version if no version is indicated).  For the other parameters (context id or resources) the payer will determine, all Questionnaires relevant to determining coverage, prior authorization, claims acceptability, documentation requirements, etc. that are relevant to the specified context.  The list of questionnaires returned will be the union of those determined by evaluating each of the provided parameters, with each Questionnaire version only being returned once.  If multiple versions of a questionnaire are returned, each **SHALL** be associated with distinct orders or coverages in the associated QuestionnaireResponses (see below).

In most cases, only one order and one coverage will be provided.  However, the operation allows for circumstances where the decision support engine can handle multiple active coverages - either for the same payer or multiple payers handled by the same engine.  It also handles multiple orders with overlapping requirements where a payer might be able to minimize the answers to be gathered by processing the answers as a group.

If any of the explicitly requested questionnaires cannot be found, a warning **SHALL** be provided in the 'outcome' element of the outer Bundle.  Similarly, if there is an issue understanding any of the orders or coverages and determining appropriate Questionnaires, a warning will be provided.

Each Questionnaire will be packaged into a distinct Bundle.  If there is only one Questionnaire and there are no warnings, then the QuestionnaireBundle can be returned as the sole payload of the operation response.  If there are multiple Questionnaires and/or there is a need to convey an OperationOutcome alongside Questionnaires, the response will be a Parameters resource.  If the operation fails, the response payload **SHOULD** be an OperationOutcome.

The Bundle **SHALL** include the Questionnaire as the first entry along with all external Libraries referenced by the Questionnaire using the [cqf-library](https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-cqf-library.html) extension, as well as a recursive retrieval of all 'related-artifact' references of type 'depends-on'.  All Libraries **SHALL** include both CQL and EML representations.  The Bundle **SHALL** include all external ValueSet instances referenced by the Questionnaire.  All value sets **SHALL** be expanded as of the current date and using expansion parameters (such as SNOMED release) as deemed appropriate by the payer.

All references to Questionnaires, Libraries, and ValueSets within the Bundle **SHALL** be version specific, as breaking changes may occur between versions and would likely cause failures or inconsistent data. Note that the same Libraries and/or ValueSets may appear in more than one Questionnaire Bundle, possibly with a different version.

If any of the dependencies cannot be retrieved or value sets expanded, a warning will be included in the 'outcome'.  Each Library and ValueSet will only appear once in the Bundle, even if it is referenced multiple places.  The only exception is if more than one version of a Library or ValueSet are referenced.  Multiple versions of a ValueSet will be returned.  Multiple versions of a Library **MAY** be treated as an error, or **MAY** be handled by returning the 'most recent' version of the referenced versions.

NOTE: for adaptive questionnaires, there will be no question items to reference any ValueSets and no expressions to reference any Libraries.  However, the payer may still opt to include Libraries or ValueSets in the initial Bundle to avoid the overhead of needing to send contained content with each $next-question invocation.  Alternatively, any needed Libraries and ValueSets may manifest as ‘contained’ resources within the QuestionnaireResponse returned by $next-question based on which questions have been selected.

As well, the Questionnaire Bundle **SHALL** contain one or more initial draft QuestionnaireResponses that reference the Questionnaire for that Bundle and populate the subject as well as repetitions of the Context extension that identify the Coverage(s) and Request or Encounter resources the Questionnaire is to be completed for.  The same QuestionnaireResponse might be associated with multiple Request resources or may need to be filled out separately for different Requests.

The payer **MAY** opt to pre-populate some answers in the provided QuestionnaireResponses based on information the payer has in its own records or has from context from CRD or from other prior auth or claims submissions.

Payers must be cautious about prepopulating Questionnaires with sensitive information, because there are rare situations where a malicious application could attempt to access information that was not authorized by the EHR.

When resuming a work in progress questionnaire response the DTR client **SHALL** invoke the operation with the timestamp to see if the questionnaire package has changed since it was last retrieved, presuming that the QuestionnaireResponse.meta.lastUpdated element corresponds to the last package retrieval time.

If both questionnaire and order parameters are present, both will be sent to the payer without any expectation that the list of questionnaires is a complete list."

* code = #questionnaire-package
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* resource = #Questionnaire
* system = false
* type = true
* instance = false
* inputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-input-parameters"
* outputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-qpackage-output-parameters"

// in
* parameter[0].name = #coverage
* parameter[=].use = #in
* parameter[=].documentation = "Coverage resource instances to establish the member and the coverage for which documentation is to be collected."
* parameter[=].type = #Coverage
* parameter[=].min = 0
* parameter[=].max = "*"

* parameter[+].name = #order
* parameter[=].use = #in
* parameter[=].documentation = "Order resource instances. e.g., DeviceRequest, ServiceRequest, MedicationRequest,... Encounter, Appointment, etc. to establish context for the information to be collected."
* parameter[=].type = #Any
* parameter[=].min = 0
* parameter[=].max = "*"

* parameter[+].name = #referenced
* parameter[=].use = #in
* parameter[=].documentation = "Order-related referenced resources which are necessary to support stand-alone launch – specifically the Patient, requester, performer and location-related resources. (SHALL NOT include resources from 'supprtingInformation')."
* parameter[=].type = #Any
* parameter[=].min = 0
* parameter[=].max = "*"

* parameter[+].name = #questionnaire
* parameter[=].use = #in
* parameter[=].documentation = "Canonical url for Questionnaire(s) (possibly version-specific) to return."
* parameter[=].type = #canonical
* parameter[=].min = 0
* parameter[=].max = "*"

* parameter[+].name = #context
* parameter[=].use = #in
* parameter[=].documentation = "Context ID from CRD or CDex.  May be used to determine what Questionnaires to return and/or to support pre-population."
* parameter[=].type = #string
* parameter[=].min = 0
* parameter[=].max = "1"

* parameter[+].name = #changedsince
* parameter[=].use = #in
* parameter[=].documentation = "If present, only Questionnaire bundles whose Questionnaire or associated artifacts have changed since the specified timestamp.  If there are no changed artifacts the operation will simply return a 200 Ok indicating that nothing has changed since the specified timestamp."
* parameter[=].type = #dateTime
* parameter[=].min = 0
* parameter[=].max = "1"

// return
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"

* parameter[=].documentation = "A Bundle with a single Questionnaire, and 0..* Libraries containing needed CQL and/or ValueSets containing needed codes."
* parameter[=].type = #Bundle

* parameter[+].name = #outcome
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "This OperationOutcome satisfies the definition of this operation"
* parameter[=].type = #OperationOutcome

/**************************************************************************************************************/
Instance: DTRLogQuestionnaireErrors
InstanceOf: OperationDefinition
Description: "The operation will pass a Questionnaire reference and an OperationOutcome detailing the issue(s) including where the error occurred back to the originating Payer."
Title: "DTR Log Questionnaire Errors"
Usage: #definition

* id = "log-questionnaire-errors"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"
* name = "LogQuestionnaireErrors"
* title = "Log errors resulting from a specific Questionnaire and/or CQL to the originating Payer"
* status = #active
* kind = #operation
* description = "This operation **SHOULD** be supported by payers and DTR applications and allows submission of issues encountered when working with these DTR-provided artifacts.  The operation will pass the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred.    

The input OperationOutcome resource **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI.  The Questionnaire reference **SHOULD** be version-specific."

* code = #log-questionnaire-errors
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/log-questionnaire-errors"

* resource = #Questionnaire
* system = false
* type = true
* instance = false

// -------------------------- Input --------------------------
* parameter[0].name = #Questionnaire
* parameter[=].use = #in
* parameter[=].documentation = "The Questionnaire which generated the errors"
* parameter[=].type = #canonical
* parameter[=].min = 1
* parameter[=].max = "1"

* parameter[+].name = #OperationOutcome
* parameter[=].use = #in
* parameter[=].documentation = "The OperationOutcome documenting the Questionnaire/CQL errors and their location"
* parameter[=].type = #OperationOutcome
* parameter[=].min = 1
* parameter[=].max = "1"

