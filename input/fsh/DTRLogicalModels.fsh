Logical: DTRMetricData
Id: DTRMetricData
Title: "DTR Metric Data"
Description: "A logical model describing the information that should be captured by DTR implementers about every DTR invocation to support measures evaluating DTR implementation."
* ^purpose = "This model is NOT a FHIR data structure for information exchange. Instead, it is a logical model of the information that **SHOULD** be collected and maintained for each DTR system action. While implementers may choose any internal storage format that is appropriate for their system, the information collected should ultimately be mapped to the information model below.
Mapping implementation data to these elements will allow metrics (see the [table on the metrics page]) to be represented in a way that provides consistent responses to requirements from various interested parties (providers, payers, regulators, quality organizations, certification agencies, states, etc.) by each of the participants in the DTR exchanges.
A separate instance should be created by each participant for each DTR 'session':
* For a 'Light' EHR, a session exists from the time the DTR SMART app launches until it closes.
* For a 'Full' EHR, a session exists from the time the user interface initiates the DTR process until the user interface returns from QuestionnaireResponse population to other activity.
* For a SMART app, a session runs from the time the app is launched until it closes.
* For a payer, a session runs from the time a SMART back-end connection from the Full EHR or SMART app is established until the last operation call is made using that security token.
Resumed DTR sessions initiated from a previously stored QuestionnaireResponse will be tracked separately from initial DTR sessions.  Unless there is at least one CRD-assigned assertion id present on the record, it will not be possible to tie together multiple sessions related to the same QuestionnaireResponse or order."
* ^status = #active
* ^experimental = false
* ^extension[$fmm].valueInteger = 1
* ^extension[$standards-status].valueCode = #informative

* source                 1..1 code            "provider-src | payer-src | DTRApp-src"  "A code to indicate which type of system collected the metric data (DTRApp can be either a Native or SMART on FHIR app)"
* source                 from MetricSource (required)
* sofApp                 0..1 url             "URL of SMART on FHIR application" "The URL of SMART on FHIR application to identify the specific DTR application used by the provider and payer.  If not present, then the DTR session is with a Full EHR."

* providerId             1..1 Identifier      "Identifier for the user initiating DTR"  "The NPI number of the user who initiated this DTR session."
* providerId.system      = "http://hl7.org/fhir/sid/us-npi"
* providerId.value       1..1

* groupId                1..1 Identifier      "Identifier for the healthcare organization initiating DTR"  "The NPI of the hospital/clinic/other organization that initiated this DTR session."
* groupId.system         = "http://hl7.org/fhir/sid/us-npi"
* groupId.value          1..1

* payerId                1..1 Identifier       "Payer receiving DTR request"  "The identifier of the payer organization supplying the questionnaire bundle for this session."
* payerId.system         1..1 
* payerId.value          1..1 

* assertionId            0..* string           "Unique ID for order item" "Assertion ids passed in on the coverage-information in Requests, Encounters, or QuestionnaireResponses used as context to launch DTR (or selected by the user as context post-launch) as well as passed as a Task questionnaire launch context parameter."
  * ^comment = "If there are multiple coverage-information extensions in context, this will be the union of distinct assertionIds."
  * ^requirements = "Allows linking DTR sessions to CRD, CDex, and potentially prior DTR sessions."

* docReason              0..* code             "Reason for launching DTR" "doc-purpose passed in on the coverage-information in Requests, Encounters or QuestoinnaireResponses used as context to launch DTR (or selected by the user as context post-launch)."
  * ^comment = "If there were multiple coverage-informations present in the launch context, this will be the union of distinct codes present."

* launchMode             0..1 code             "crdlaunch | relaunch | salaunch | cdexlaunch" "Indicates the launch mode involved for this session."
* launchMode             from MetricLaunchMode (required)

* orderItem              1..* CodeableConcept  "What was ordered" "The specific procedure, item, medication, appointment, nutrition that is the subject of the order/appointment."
* orderItem              from $CRDOrderDetail (extensible)

* action                 1..* BackboneElement  "Actions the reporting system engaged in as part of the DTR session."  "Actions performed between a system and the DTR application."
  * ^comment = "See notes section below for how the action elements should be populated for different actions"
  * actionDetail         1..1 code             "launch | qpackage | mrquery | userresponse | nextq | storeqr" "What type of action occurred within the DTR session."
  * actionDetail         from MetricAction (required)
  * requestTime          1..1 instant          "Time action initiated"  "The time stamp when the action was initiated from the perspective of the reporting system."
  * responseTime         0..1 instant          "Time of action response"  "The time stamp when the action was completed (including error return) from the perspective of the reporting system."
  * httpResponse         0..1 integer          "HTTP response status code" "The HTTP response status code associated with the action (successful or not)."
    * ^comment = "Must be present unless action is a userresponse"
  * questionnaire        0..1 canonical        "Associated Questionnaire" "The questionnaire(s) tied to the current action"
    * ^type.targetProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
    * ^type.targetProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
  * issue                0..* BackboneElement  "OperationOutcome info"  "If an OperationOutcome is returned, what were the issues?"
    * code               1..1 code             "Error code"  "The issue.code value from the OperationOutcome for this issue."
    * code               from IssueType       (required)
    * details            0..1 CodeableConcept  "More detailed error code"  "The issue.details value from the OperationOutcome for this issue."
    * details            from OperationOutcomeCodes (example)

* resources              0..* BackboneElement  "Resource types accessed"  "Information that was accessed from the EHR by the one or more of the questionnaires using CQL."
  * type                 1..1 code             "Kind of resource" "What kind of resource was accessed."
  * type                 from ResourceType (required)
  * profile              0..1 canonical        "Solicited profile"  "Indicates the sub-type of data accessed in situations where multiple US-core profiles could apply (e.g., Observation).  Note: This does not mean that the data received was actually valid against the profile, merely that the search criteria used were intended to retrieve data of this type."
    * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/StructureDefinition"
  * count                1..1 positiveInt      "Number retrieved"  "How many resources of that type were accessed."

* questionnaire          0..* BackboneElement  "Questionnaire"  "Questionnaire that was returned in the Questionnaire package (and information about what was done with it)"
  * reference            1..1 canonical        "This is the URL for the canonical questionnaire"  "This is the URL for the canonical questionnaire that was returned by the $questionnaire-package operation"
    * ^type.targetProfile[0] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-std-questionnaire"
    * ^type.targetProfile[+] = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-sdc-questionnaire-adapt"
  * adaptive             0..1 boolean          "True if adaptive form"  "If the Questionnaire is an adaptive form, the value is True."
    * ^meaningWhenMissing = "Questionnaire was a standard (non-adaptive) Questionnaire"
  * populated            0..1 boolean          "Whether a pre-populated response was provided from payer"  "If true, indicates that the draft QuestionnaireResponse provided in the Questionnaire package Bundle included at least some answers pre-populated with payer data."
    * ^meaningWhenMissing = "No population occurred"
  * failure              0..* CodeableConcept  "Questionnaire errors logged to payer"  "A failure reported to the payer about Questionnaire content using the $log-questionnaire-errors operation."
  * failure              from IssueType (required)
  * reviewPrior          0..1 boolean          "True if user reviewed answers prior to final save"  "If the provider reviewed the QuestionnaireResponse answers prior to marking it as complete or saving it in the EHR."
    * ^meaningWhenMissing = "User did not review the QuestionnaireRepsonse in this session"
  * enabledQuestions     0..1 positiveInt      "Number of enabled questions"  "The count of all questions enabled in the Questionnaire at the time it was marked 'complete'."
    * ^comment = "This element is a count of the number of enabled question items at the time the QuestionnaireResponse was last stored as part of this DTR session"
  * autoPopulated        0..1 positiveInt      "Number of questions autopopulated"  "The count of all questions that were auto-populated from the patient's medical record and/or by payer information."
    * ^comment = "The modification may have happened in a prior session.  This element is a count of the number of enabled question items with an information-origin extension of 'auto' or 'override' at the time the QuestionnaireResponse was last stored as part of this DTR session."
    * ^meaningWhenMissing = "No questions had their answers auto-populated"
  * roleInteraction      0..* BackboneElement  "Role specific interactions"  "A summary of the information-origin extensions for all enabled questions in the Questionnaire as they were at the time the QuestionnaireResponse was last stored within the DTR session reflecting human intervention."
    * role               1..1 CodeableConcept  "Role of information contributor" "The type of humanrole whose questionnaire completion is summarized here.  Corresponds to the information-origin.author.role.  NOTE: if a form is edited by multiple people with the same roles, the items they edit or override will be aggregated together."
    * role               from $USCORE311PRVS (extensible)
    * roleAction         1..1 code             "override | manual"  "This will indicate the type of human intervention action being summarized (auto, override or manual)."
    * roleAction         from MetricsInformationOrigins (extensible)
    * count              1..1 positiveInt      "Count of combination of role and roleInteraction"  "This is the sum of enabled questions for the specified with an information-origin of that source AND an author.role that matches the specified role."

* coverageInfo    0..* BackboneElement "Coverage information"                "Coverage information extensions returned as part of completed adaptive Questionnaires within this DTR session."
  * covered       0..1 code            "covered | not-covered | conditional" "Indicates whether the service is covered."
  * covered       from CoveredInfo              (required)
  * paNeeded      0..1 code            "auth-needed | no-auth | satisfied +" "Indicates whether prior authorization is necessary or not, as well as considerations about applying for prior authorization."
  * paNeeded      from CoveragePaDetail         (required)
  * docNeeded     0..1 code            "no-doc | clinical | admin | both +"  "Indicates whether additional information is necessary (for prior auth, claims submission, or some other purpose)."
  * docNeeded     from AdditionalDocumentation  (required)
  * infoNeeded    0..1 code            "performer | location | timeframe"    "Indicates what additional inforamtion is necessary in order to determine authorization/coverage - which might be available on a later hook invocation."
  * infoNeeded    from InformationNeeded        (required)
  * questionnaire 0..* BackboneElement "Questionnaire(s) returned"           "Information about the Questionnaire(s) returned to gather additional information (e.g. through DTR)."
    * ^requirements = "Allows linking metadata about forms identified 'to be filled out' in CRD with what is actually completed in DTR, and eventually submitted in CDex, PAS or claims"
    * reference   1..1 canonical       "Questionnaire url & version"         "The official identifier of one of the Questionnaires provided to be filled out."
      * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
    * adaptive    1..1 boolean         "Is questionnaire adaptive?"          "If true, indicates that the questionnaire is adaptive (i.e. uses the $next-question operation to determine questions)."
    * response    1..1 boolean         "Pre-pop response provided?"          "If true, indicates that the card included a partially populated QuestionnaireResponse with answers filled by the payer from pre-known data."
  * assertionId   1..1 string          "Id for coverage assertion"           "Corresponds to the coverage-assertion-id from the coverage-information extension."
    * ^requirements = "Used to link the results of CRD to metric information captured for DTR and/or PAS."
  * satisfiedId   0..1 string          "Id if PA is satisfied"               "Corresponds to the satisfied-pa-id from the coverage-information extension."
  * businessLine  0..1 CodeableConcept "E.g. MedicareAdvantage"              "A code that indicates which type of insurance this assertion applies to."

* elapsedTime       1..1 time             "Cumulative user response time that questionnaire was active in session"  "cumulative time from DTR start to QR store, including from multiple sessions."

