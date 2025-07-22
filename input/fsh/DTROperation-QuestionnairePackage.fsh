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
* description = "This operation returns one or more 'collection' Bundles each consisting of a single Questionnaire resource, one or more QuestionnaireResponse resources, as well as any dependency Library and ValueSet instances needed to allow a renderer to fully render and otherwise process the Questionnaire.

The operation **SHALL** take as input the Coverage resource(s) identifying the member and the type(s) of Coverage for which additional information is needed and at least one of:  
* Zero or more canonicals specifying the URL and, (optionally) the version of the Questionnaire(s) to retrieve;
* A CRD/PAS context ID, and/or
* One or more Request or Encounter resources

If specific Questionnaires are specified, the operation will return the specified versions of the respective Questionnaires (or current version if no version is indicated).  For the other parameters (context id or resources) the payer will determine, all Questionnaires relevant to determining coverage, prior authorization, claims acceptability, documentation requirements, etc. that are relevant to the specified context.  The list of questionnaires returned will be the union of those determined by evaluating each of the provided parameters, with each Questionnaire version only being returned once.  If multiple versions of a questionnaire are returned, each **SHALL** be associated with distinct orders or coverages in the associated QuestionnaireResponses (see below).

In most cases, only one order and one coverage will be provided.  However, the operation allows for circumstances where the decision support engine can handle multiple active coverages - either for the same payer or multiple payers handled by the same engine.  It also handles multiple orders with overlapping requirements where a payer might be able to minimize the answers to be gathered by processing the answers as a group.

If any of the explicitly requested questionnaires cannot be found, a warning **SHALL** be provided in the [`Outcome`](StructureDefinition-dtr-qpackage-output-parameters.html) element of the outer `Parameters` resource.  Similarly, if there is an issue understanding any of the orders or coverages and determining appropriate Questionnaires, a warning will be provided.

Each Questionnaire will be packaged into a distinct Bundle. If the operation is successful, the response **SHALL** be a `Parameters` resource conformant to the [DTRQuestionnairePackageOutputParameters](StructureDefinition-dtr-qpackage-output-parameters.html) profile.  If the operation fails, the response payload **SHOULD** be an OperationOutcome.

The Bundle **SHALL** include the Questionnaire as the first entry along with all external Libraries referenced by the Questionnaire using the [cqf-library](https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-cqf-library.html) extension, as well as a recursive retrieval of all `relatedArtifact` references of type 'depends-on'.  All Libraries **SHALL** include both CQL and EML representations.  The Bundle **SHALL** include all external ValueSet instances referenced by the Questionnaire.  All value sets with expansions under 40 entries **SHALL** be expanded as of the current date and using expansion parameters (such as SNOMED release) as deemed appropriate by the payer.

All references to Questionnaires, Libraries, and ValueSets within the Bundle **SHALL** be version specific, as breaking changes may occur between versions and would likely cause failures or inconsistent data. Note that the same Libraries and/or ValueSets may appear in more than one Questionnaire Bundle, possibly with a different version.

If any of the dependencies cannot be retrieved or value sets expanded, a warning will be included in the [`Outcome`](StructureDefinition-dtr-qpackage-output-parameters.html). Each Library and ValueSet will only appear once in the Bundle, even if it is referenced multiple places.  The only exception is if more than one version of a Library or ValueSet are referenced.  Multiple versions of a ValueSet will be returned.  Multiple versions of a Library **MAY** be treated as an error, or **MAY** be handled by returning the 'most recent' version of the referenced versions.

As well, the Questionnaire Bundle **SHALL** contain one or more initial draft QuestionnaireResponses that reference the Questionnaire for that Bundle and populate the subject as well as repetitions of the Context extension that identify the Coverage(s) and Request or Encounter resources the Questionnaire is to be completed for. The same QuestionnaireResponse might be associated with multiple Request resources or may need to be filled out separately for different Requests.

The payer **MAY** opt to pre-populate some answers in the provided QuestionnaireResponses based on information the payer has in its own records or has from context from CRD or from other prior auth or claims submissions.

Payers must be cautious about prepopulating Questionnaires with sensitive information, because there are rare situations where a malicious application could attempt to access information that was not authorized by the EHR.

When resuming a work in progress questionnaire response the DTR client **SHALL** invoke the operation with the timestamp to see if the questionnaire package has changed since it was last retrieved, presuming that the `QuestionnaireResponse.meta.lastUpdated` element corresponds to the last package retrieval time.

### Notes
* For adaptive questionnaires, there will be no question items to reference any ValueSets and no expressions to reference any Libraries.  However, the payer may still opt to include Libraries or ValueSets in the initial Bundle to avoid the overhead of needing to send contained content with each [`$next-question`](http://hl7.org/fhir/uv/sdc/STU3/OperationDefinition-Questionnaire-next-question.html) invocation.  Alternatively, any needed Libraries and ValueSets may manifest as ‘contained’ resources within the QuestionnaireResponse returned by [`$next-question`](http://hl7.org/fhir/uv/sdc/STU3/OperationDefinition-Questionnaire-next-question.html) based on which questions have been selected. (see [Adaptive Form Considerations](https://build.fhir.org/ig/HL7/davinci-dtr/specification.html#adaptive-form-considerations))

* The `outcome` parameter is only present if the operation completes successfully with a 200 HTTP response code.  In the event of an error, no Parameters response will be returned at all, though a bare `OperationOutcome` might be returned.

* When DTR is launched from CRD the context is available in the `coverage-information` extension, but when launched from PAS the context is from the Task.  

#### Working with Multiple Forms
When retrieving a Questionnaire Package, it's possible that a payer will have some sets of information they need to collect that is 'conditional'.  i.e., Depending on answers to initial questions, other sets of information may or may not need to be collected.  Historically, this may have been handled as 'First, fill out Form A.  Then, depending on the answers provided in Form A, there may be instructions to fill out Form B, C, and/or D'.  However, in the context of the Questionnaire Package operation, the expectation is that all forms returned by the $questionnaire-package operation are intended to be filled out, and they might be filled out in any order based on user preference. 

If a payer is in a situation where they have historically had 'conditional' forms, there are two technical approaches that can be used to meet the requirement:

1.  Make use of adaptive forms and define a single adaptive form rooted in the questions from A that will subsequently ask questions from the internal forms B, C, and/or D as necessary, gathering all of the answers into a single Questionnaire Response.
2.  Make use of standard forms and combine forms A, B, C, and D into a single monolithic form that makes use of enableWhen logic to determine when the questions from the B, C, and/or D form sections are available/required to be completed.  Note that it's possible for the CRD server to continue to maintain the separate individual forms and use a light-weight 'parent' form and SDC assembly or a similar mechanism to combine them all into a single Questionnaire before including it in the `$questionnaire-package` response."

* code = #questionnaire-package
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"
* resource = #Questionnaire
* system = false
* type = true
* instance = false

// In
* parameter[0].name = #Parameters
* parameter[=].type = #Parameters
* parameter[=].targetProfile = Canonical(dtr-qpackage-input-parameters)
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The"

// Out
* parameter[+].name = #Parameters
* parameter[=].type = #Parameters
* parameter[=].targetProfile = Canonical(dtr-qpackage-output-parameters)
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "A Bundle with a single Questionnaire, and 0..* Libraries containing needed CQL and/or ValueSets containing needed codes."
