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
* sofApp                 0..1 url             "URL of SOF application" "The URL of SOF application to identify the specific DTR application used by the provider and payer.  If not present, then the application is an EHR applications."

* providerId             1..1 Identifier      "Identifier for the user initiating DTR"  "The NPI number of the user who initiated DTR."
* providerId.system      = "http://hl7.org/fhir/sid/us-npi"
* providerId.value       1..1

* groupId                1..1 Identifier      "Identifier for the healthcare organization initiating DTR"  "The NPI of the hospital/clinic/other organization that initiated DTR."
* groupId.system         = "http://hl7.org/fhir/sid/us-npi"
* groupId.value          1..1

* payerId                1..1 Identifier       "Payer receiving DTR request"  "The identifier of the payer organization supplying the questionnaire bundle."
* payerId.system         1..1
* payerId.value          1..1

* action                 1..* BackboneElement  "Actions performed"  "Actions performed between a system and the DTR application."
  * actionDetail         1..1 code             "launch | qpackage | mrquery | response | nextq | returnqr" "The issue.code value from the OperationOutcome for this issue."
  * actionDetail         from MetricAction (required)
  * requestTime          1..1 instant          "Time action initiated"  "The time stamp when the action was initiated."
  * responseTime         0..1 instant          "Time of action response"  "The time stamp when the action was completed (including error return)."
  * httpResponse         1..1 integer          "HTTP response status code" "The HTTP response status code associated with the action."
  * issue                0..* BackboneElement  "OperationOutcome info"  "In the event of an HTTP error, if an OperationOutcome is returned, what were the issues?"
    * code               1..1 code             "Error code"  "The issue.code value from the OperationOutcome for this issue."
    * code               from IssueType       (required)
    * details            0..1 CodeableConcept  "More detailed error code"  "The issue.details value from the OperationOutcome for this issue."
    * details            from OperationOutcomeCodes (example)

* launchMode             1..1 code             "crdlaunch | relaunch | salaunch | cdexlaunch" "Indicates the launch mode involved."
* launchMode             from MetricLaunchMode (required)

* orderItem              1..1 CodeableConcept  "USCore Procedure Code" "The specific procedure, item, medication, appointment, nutrition that is the subject of the order/appointment."
* orderItem              from $USCORE311VS (extensible)

* resources              0..* BackboneElement  "Resource types accessed"  "Information that was accessed accessed by the questionnaire using CQL."
  * type                 1..1 code             "Kind of resource" "What kind of resource was accessed."
  * type                 from ResourceType (required)
  * profile              0..1 canonical        "Solicited profile"  "Indicates the sub-type of data accessed in situations where multiple US-core profiles could apply (e.g., Observation).  Note: This does not mean that the data received was actually valid against the profile, merely that the search criteria used were intended to retrieve data of this type."
    * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/StructureDefinition"
  * count                1..1 positiveInt      "Number retrieved"  "How many resources of that type were accessed."

* questionnaire          1..* BackboneElement  ""  ""
  * reference            1..1 canonical        "This is the URL for the canonical questionnaire"  "This is the URL for the canonical questionnaire that is retrieved from the payer operation endpoint."
  * adaptive             1..1 boolean          "True if adaptive form"  "If the Questionnaire is an adaptive form, the value is True."
  * response             1..1 boolean          "This is the URL for the QuestionniareResponse canonical questionnaire"  "The URL for the canonical questionnaire that is the basis for the questionnaire response passed in from the payer during CRD."
  * failure              0..1 CodeableConcept  ""  ""
  * reviewPrior          1..1 boolean          "True if review prior to final save"  "If the provider reviewed the QuestionnaireResponse prior to saving the final version the value is set to True."
  * enabledQuestions     0..1 positiveInt      "Number of enabled questions"  "The count of all questions enabled during the execution of the questionnaire."
  * autoPopulated        0..1 positiveInt      "Number of questions autopopulated"  "The count of all questions that were autopopulated from the patient's medical record."
  * roleInteraction      0..* BackboneElement  "Role specific interactions"  "Specific roles that were responsible for entering data manually or modifying data that was auto populated."
    * role               0..1 CodeableConcept  "Role of information contributor" "Specific roles that were responsible for entering data manually or modifying data that was auto populated."
    * roleAction         0..1 code             "auto | override | manual"  "Was the data entry to answer a question that was not prepopulated (manual) or to modify the answer to question that was auto populated."
    * roleAction         from DTRInformationOrigins (required)
    * count              0..1 positiveInt      "Count of combination of role and roleInteraction"  "Number of questions for which manual entries occurred for the combination of role and roleinteractions."

* elapsedTime            0..1 time             "Cumulative time that questionnaire was active"  "cumulative time from DTR start to QR store, including from multiple sessions."
* assertionId            1..1 string           "Unique ID for order item"  "Unique ID for the order item returned by CRD in the coverage information."
* serviceDetermination   0..1 boolean          "Set to true if a service determination was asserted."  "Set to true if a service determination was returned as part of an adaptive form.  The Unique ID for a Service Determination should also be returned."
* satisfiedPaId          0..1 string           "ID assoicted with service determination"  "Unique ID for the Service Determination returned by the payer as part of an Adaptive Form."
* businessLine           0..1 CodeableConcept  "Patient's insurance coverage line of business" "Business line for the the specific patient's coverage (e.g. Medicare, MedicareAdvantage)"
