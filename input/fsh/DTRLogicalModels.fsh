Logical: DTRMetricData
Id: DTRMetricData
Title: "DTR Metric Data"
Description: "> **WORK IN PROGRESS**  
  
A logical model describing the information that should be captured by DTR implementers about every DTR invocation to support measures evaluating DTR implementation"
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

// * coverage-assertion-id  0..1 string           "Id for coverage assertion"           "Corresponds to the coverage-assertion-id from the coverage-information extension."


// * requestTime       1..1 instant         "Time hook initiated"                 "For providers, the time the hook call was made.  For payers, the time the hook call was received."
// * responseTime      0..1 instant         "Time of hook response"               "For providers, the time the hook response was received.  For payers, the time the hook response was returned."
// * httpResponse      1..1 positiveInt     "e.g. 200"                            "What HTTP response code was returned for the hook invocation."
// * issue             0..* BackboneElement "OperationOutcome info"               "In the event of an HTTP error, if an OperationOutcome is returned, what were the issues?"
//   * code            1..1 code            "Error code"                          "The issue.code value from the OperationOutcome for this issue."
//   * code            from IssueType             (required)
//   * details         0..1 CodeableConcept "More detailed error code"            "The issue.details value from the OperationOutcome for this issue."
//   * details         from OperationOutcomeCodes (example)
// * tokenUse          0..1 code            "used | not-used | rejected"          "Indicates whether the provided access token was used to retrieve additional information.  Rejected indicates that when used, the access failed."
// * tokenUse          from MetricTokenUse        (example)
// * resources         0..* BackboneElement "Resource types accessed"             "Information other than the 'focal' resources (orders, encounter, appointment) for the hook that were accessed by the payer."
//   * type            1..1 code            "Kind of resource"                    "What kind of resource was accessed."
//   * type            from ResourceType          (required)
//   * profile         0..1 canonical       "Solicited profile"                   "Indicates the sub-type of data accessed in situations where multiple US-core profiles could apply (e.g. Observation).  Note: This does not mean that the data received was actually valid against the profile, merely that the search criteria used were intended to retrieve data of this type."
//     * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/StructureDefinition"
//   * count           1..1 positiveInt     "Number retrieved"                    "How many resources of that type were accessed."
//   * prefetch        0..1 boolean         "Retrieved by prefetch?"              "Was the data retrieved by prefetch or direct query.  (If some resources of the same type were accessed both with and without prefetch, include two repetitions.)"
// * response          0..* BackboneElement "Returned card/system action"         "Summary information about each card or system action returned."
//   * type            0..1 code            "Type of CRD card"                    "The CRD code for the card.  Mandatory if the card corresponds to a type defined by CRD, otherwise omit."
//   * type            from CardType              (required)
//   * focus           0..* code            "Resource tied to card"               "Indicates the type of resource(s) tied to the card."
//   * engagement      0..1 code            "ignore | accept | override"          "Indicates if the user engaged with the card as per the CDS Hooks feedback mechanism."
//   * coverageInfo    0..* BackboneElement "Coverage information"                "If the card is a coverage-information card, indicates additional information about the information provided in the coverage-information extension."
//     * covered       0..1 code            "covered | not-covered | conditional" "Indicates whether the service is covered."
//     * covered       from CoveredInfo              (required)
//     * paNeeded      0..1 code            "auth-needed | no-auth | satisfied +" "Indicates whether prior authorization is necessary or not, as well as considerations about applying for prior authorization."
//     * paNeeded      from CoveragePaDetail         (required)
//     * docNeeded     0..1 code            "no-doc | clinical | admin | both +"  "Indicates whether additional information is necessary (for prior auth, claims submission, or some other purpose)."
//     * docNeeded     from AdditionalDocumentation  (required)
//     * infoNeeded    0..1 code            "performer | location | timeframe"    "Indicates what additional inforamtion is necessary in order to determine authorization/coverage - which might be available on a later hook invocation."
//     * infoNeeded    from InformationNeeded        (required)
//     * questionnaire 0..* BackboneElement "Questionnaire(s) returned"           "Information about the Questionnaire(s) returned to gather additional information (e.g. through DTR)."
//       * reference   1..1 canonical       "Questionnaire url & version"         "The official identifier of one of the Questionnaires provided to be filled out."
//         * ^type.targetProfile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
//       * adaptive    1..1 boolean         "Is questionnaire adaptive?"          "If true, indicates that the questionnaire is adaptive (i.e. uses the $next-question operation to determine questions)."
//       * response    1..1 boolean         "Pre-pop response provided?"          "If true, indicates that the card included a partially populated QuestionnaireResponse with answers filled by the payer from pre-known data."
//     * assertionId   1..1 string          "Id for coverage assertion"           "Corresponds to the coverage-assertion-id from the coverage-information extension."
//       * ^requirements = "Used to link the results of CRD to metric information captured for DTR and/or PAS."
//     * satisfiedId   0..1 string          "Id if PA is satisfied"               "Corresponds to the satisfied-pa-id from the coverage-information extension."
//     * businessLine  0..1 CodeableConcept "E.g. MedicareAdvantage"              "A code that indicates which type of insurance this assertion applies to."
// TODO need a binding here, but don't yet have one