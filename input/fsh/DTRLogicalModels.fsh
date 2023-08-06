Logical: DTRMetricData
Id: DTRMetricData
Title: "DTR Metric Data"
Description: "A logical model describing the information that should be captured by DTR implementers about every DTR invocation to support measures evaluating DTR implementation"
* ^status = #draft
* ^experimental = false
* ^extension[$fmm].valueInteger = 1
* ^extension[$standards-status].valueCode = #informative
* source                 1..1 code            "provider-src | payer-src | SOFApp-src"  "A code to indicate which type of system collected the metric data."
* source                 from MetricSource (required)
* sofApp                 0..1 url             "URL of SOF application" "URL of SOF application to identify the specific DTR application used by the provider and payer.  If not present, then the application is an EHR applications."

* payerId                1..1 Identifier      "Identifier assigned to this payer"      "Identifier for the organization that is used to identify the organization across multiple disparate systems."
* payerId.system         1..1
* payerId.value          1..1

* providerId             1..1 Identifier      "An identifier for the person initiating DTR"  "An identifier that applies to this person in this role."
* providerId.system      = "http://hl7.org/fhir/sid/us-npi"
* providerId.value       1..1

* groupId                1..1 Identifier      "An identifier for the organization initiating DTR"  "Identifier for the organization that is used to identify the organization across multiple disparate systems."
* groupId.system         = "http://hl7.org/fhir/sid/us-npi"
* groupId.value          1..1

* action                 1..* BackboneElement  "Actions performed"  "Actions performed between a system and the DTR application."
  * actionDetail         1..1 code             "launch | Qpackage | MRQuery | NextQ | StoreQR" "The issue.code value from the OperationOutcome for this issue."
  * actionDetail         from MetricAction (required)
  * requestTime          1..1 instant          "Time for start of action"  "The time stamp when the action was initiated."
  * responseTime         0..1 instant          "Time for end of action"    "The time stamp when the action was completed (including error return)"
  * exchangeResponse     1..1 integer          "HTTP response status code" "The HTTP response status code associated with the action."
  * errorCode            0..1 code             "From OperationOutcome.code" "Describes the type of the issue from the IssueType value set."
  * errorCode            from MetricIssueType (required)
  * errorDetail          0..1 CodeableConcept  "From OperationOutcome.details" "Additional details about the error. This may be a text description of the error or a system code that identifies the error."
  * errorDetail          from MetricIssueDetails (required)

* launchMode             1..1 code             "crdlaunch | relaunch | salaunch | cdexlaunch" "Indicates the launch mode involved"
* launchMode             from MetricLaunchMode (required)

* orderItem              1..1 CodeableConcept  "USCore Procedure Code" "The specific procedure, item, medication, appointment, nutrition that is the subject of the order/appointment"
* orderItem              from $USCORE311VS (extensible)

* resourcesRetrieved     0..* BackboneElement  "Resources retrieved from the medical record"  "Resources retrieved from the patient's medical record to process this DTR request."
  * resourceProfile      1..1 code             "FHIR Resource retrieved" "Specific resource retrieved from the patient's medical record"
  * resourceProfile      from ResourceType (required)
  * quantity             1..1 positiveInt      "Quantity of resources retrieved"  "Count of the resource instances retrieved from the patient's medical record"

* serviceDetermination   0..1 boolean          "Set to true if a service determination was returned as part of an adaptive form.  The Unique ID for a Service Determination should also be returned"  "Set to true if a service determination was returned as part of an adaptive form.  The Unique ID for a Service Determination should also be returned"

* questionnaire          0..1 canonical        "This is the URL for the canonical questionnaire"  "This is the URL for the canonical questionnaire that is retrieved from the payer operation endpoint"

* questionnaireResponse  0..1 canonical        "This is the URL for the QuestionniareResponse canonical questionnaire"  "The URL for the canonical questionnaire that is the basis for the questionnaire response passed in from the payer during CRD"

* adaptiveForm           0..1 boolean          "True if adaptive form"  "If the Questionnaire is an adaptive form, the value is True"

* reviewPrior            0..1 boolean          "True if review prior to final save"  "If the provider reviewed the QuestionnaireResponse prior to saving the final version the value is set to True"

* enabledQuestions       0..1 positiveInt      "Number of enabled questions"  "The count of all questions enabled during the execution of the questionnaire"

* autoPopulated          0..1 positiveInt      "Number of questions autopopulated"  "The count of all questions that were autopopulated from the patient's medical record"

* roleInteraction        0..* BackboneElement  "Role specific interactions"  "Specific roles that were responsible for entering data manually or modifying data that was auto populated"
  * role                 0..1 CodeableConcept  "Role of information contributor" "Specific roles that were responsible for entering data manually or modifying data that was auto populated"
  // * role                 from ?valueset? (?binding?)
  * roleInteraction      1..1 code             "Manual entry or correct auto populated question"  "Was the data entry to answer a question that was not prepopulated (manual) or to modify the answer to question that was auto populated"
  * roleInteraction      from MetricRoleInteraction (required)
  * quantity             1..1 positiveInt      "Count of combination of role and roleInteraction"  "Number of questions for which manual entries occurred for the combination of role and roleinteractions"

* questionnaireFailure   0..1 code             "Questionnaire failure mode"  "Questionnaire failure mode"

* elapsedTime            0..1 time             "Cumulative time that questionnaire was active"  "cumulative time from DTR start to QR store, including from multiple sessions"

* coverageAssertionId    0..1 string           "Unique ID for order item"  "Unique ID for the order item returned by CRD in the coverage information."

* satisfiedPaId          0..1 string           "Unique ID if Service Determination is True"  "Unique ID for the Service Determination returned by the payer as part of an Adaptive Form."

* businessLine           0..1 CodeableConcept  "Patient's insurance coverage line of business" "Business line for the the specific patient's coverage (e.g. Medicare, MedicareAdvantage)"
// * businessLine           from ?valueset? (?binding?)