This section of the IG defines the guidelines of the DTR process behavior and information on how to implement the technologies required to build a conformant app. Below are the conformance requirements.

---------------------
### Profiles

#### Questionnaire
The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules. Payers SHALL gather data needed to satisfy their rules using FHIR Questionnaires that comply with either the [DTR SDC Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire.html) or the [DTR Adaptive Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire-adapt.html).  

These Questionnaires SHALL include logic that supports population from the EHR where possible.  Such logic SHOULD rely exclusively on data elements and search parameters defined either in US Core or HRex.  Logic SHALL work if only the current version (required by ONC) is available.  These Questionnaires SHOULD also include logic that ensures that only 'relevant' questions are displayed, based on what answers have already been provided/populated.  When using 'expression' elements within Questionnaires, all logic SHALL be written in CQL.

These systems SHOULD also support all non mustSupport data elements found in the differential of the profiles as per SDC documentation for those elements and extensions and SHALL gracefully handle the presence of these elements if not supported.  (i.e., non-support for an element SHALL NOT interfere with a user's ability to complete a QuestionnaireResponse.)  (review list of non-MS elements prior to publication and remove any that are deemed to create situations that may provide incomplete or misleading responses if not supported)

Payers MAY also supply Questionnaire resources that conform to the [Structured Data Capture (SDC) Advanced Rendering Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html) to control how information requests will ultimately be presented to users.

DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) applications SHALL support the SDC Advanced Rendering Profile.

Note that elements with example bindings or missing bindings will not be used.

* [DTR SDC Questionnaire](StructureDefinition-dtr-sdc-questionnaire.html) - [Example](Questionnaire-home-o2-sdc-questionnaire.html)

> More information regarding Questionnaires, workflow, and behaviors in the Structured Data Capture Implementation Guide:
> * [Basic SDC Workflow](http://hl7.org/fhir/uv/sdc/STU3/workflow.html)  
> * [Form Behavior and Calculation](http://hl7.org/fhir/uv/sdc/STU3/behavior.html)  
> * [Advanced Form Rendering](http://hl7.org/fhir/uv/sdc/STU3/rendering.html)


#### Questionnaire Response
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR process by the user.

* [DTR QuestionnaireResponse R4](StructureDefinition-dtr-questionnaireresponse-r4.html) - [Example](QuestionnaireResponse-home-o2-questionnaireresponse.html)

#### SDC Adaptive Forms

##### General Adaptive Form Support

[SDC Adaptive Forms](http://build.fhir.org/ig/HL7/sdc/adaptive.html) define an alternative way to dynamically interact with the user. DTR support for adaptive forms helps in the following scenarios:

1. Support for complex decision trees without the need for the Questionnaire and rules (CQL) to cover all the possibilities. This is enabled by supporting the request for a small number of questions (and the ability to prepopulate the questions from the EHR), returning the results to the Payer to "prune" the decision tree, and repeat the process until complete.

2. Allowing the payer to only expose the relevant guideline logic for the clinical situation at hand.

3. Support for complex logic that depends on information available to the payer (e.g., prior auth services) to be part of the decision logic to evaluate the medical necessity and appropriateness of the planned service.

4. Enabling the potential for a final response from the payer including prior authorization information as part of the interactive exchange. 

5. Provide flexibility to EHR venders to adopt DTR. The adaptive form can be used as an alternative to more complex SDC form behavior, e.g., enableWhen.

6. Supports both payer side prior authorization and the ability to request specific additional information as part of the PAS exchange process.

A payer wishing to use Adaptive Forms will return a questionnaire instance compliant with the SDC AdaptiveQuestionnaire-Search profile (http://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-adapt-srch.html).  This instance will include the QuestionnaireAdaptive extension which will identify the endpoint the DTR app is to call to receive the "next question".

The DTR app SHALL support loading and rendering the adaptive form developed by the payer following the SDC adaptive form workflow. If there is CQL embedded in the questionnaire or the associated library, the DTR app should be able to execute the CQL based on the questions loaded in the questionnaire. For performance, the DTR application may save the results of prior execution of the CQL where it is the same for addressing the current question(s).

##### Adaptive Forms and Prior Authorization

When a prior authorization comes back while using an Adaptive Form, the SMART app SHALL:
1. Store the ClaimResponse on the EHR with a simple create, and 

2. Update the "in-memory" request (e.g., ServiceRequest) to have a supportingInfo reference to the ClaimResponse. 

Although not detailed in this IG, it may be possible to achieve the same level of integration with a native EHR app instead of a SMART on FHIR app. The same payer sourced FHIR Questionnaire and CQL could be consumed by the native EHR app. The interface for exchanging data would need to be developed further in a method that achieves the same level of interoperability that the SMART on FHIR app achieves. A native EHR app MAY play the role of the DTR process if it reduces burden. Because of this, when the SMART on FHIR app is mentioned in this IG, native EHR app, app (application), or DTR process also applies.

---------------------
### Retrieval of Payer resources and SMART Launch
The DTR process will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The information needed to obtain the required resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in [CDS Hooks](specification__cds_hooks.html#use-of-cardlinks). When launched in context of CRD and a CDS Hook, that object will have the following properties:

| Field    | Optionality | Cardinality | Type  | Description |
| -------- | ----------- | ------      | -------- | ----------- |
| questionnaire | OPTIONAL    |0..*| *string* | The canonical URL of the Questionnaire(s).  Required if "response" is not adaptive.  |
| order  | OPTIONAL    |0..*| *string* | The EHR local URL or JSON encoded content of the order(s) in context.  Prefer EHR local URL when available. |
| response  | OPTIONAL    |0..*| *object* | The QuestionnaireResponse resource(s) that DTR should load data from |
| coverage  | OPTIONAL    |0..*| *string* | Local reference to relevant coverage resource(s) on EHR |
{: .grid } 

When launched without the context of a CDS Hook, but within context from an EHR, the token returned from the auth server should still include an appContext.  The token bundle is required to have a patient in context.  The appContext should have the following properties:

| Field    | Optionality | Cardinality | Type  | Description |
| -------- | ----------- | ------      | -------- | ----------- |
| order  | OPTIONAL    |0..*| *string* | Local reference to the order or claim in context. |
| response  | OPTIONAL    |0..*| *string* | Local reference to a QuestionnaireResponse stored on the EHR |
{: .grid } 

If the QuestionnaireResponse is not present, but the order is, the QuestionnaireResponse can be searched for using the order.  If the order is not present, then it can be retrieved from the QuestionnaireResponse.

If neither is present, the user should be prompted to select a QuestionnaireResponse based on the patient that is in context.

>A DTR app is allowed to throw an error if not launched within one and only one of the following contexts:
>1. QuestionnaireResponse
>2. Task
>3. Order

The resources corresponding to this context (if any) SHALL be passed in the fhirContext element.  As part of configuration during app enablement process the app SHOULD also always ask for the launch/patient and the openId and fhirUser contexts.

#### App Relaunch 
The DTR app SHALL support usage of two new scopes to alter the launch context: `launch/request` and `launch/response`.  If the `request` scope is included when launching, the access token bundle should return with the `request` field of the `appContext` filled.  If the `response` scope is included, it should return with the `response` field of the `appContext` filled.  

At least one of the two fields `request` or `response` must be filled in order for the DTR app to successfully launch. In the case that `response` is filled but `request` is empty, the DTR process SHALL use the URL provided in the `response` property of the `appContext` to retrieve the referenced QuestionnaireResponse. The QuestionnaireResponse can be used to discover the request through the `context` extension. The app should allow the user to relaunch the deferred usage session defined by the QuestionnaireResponse. 

The QuestionnaireResponse will have all the information required to request the Questionnaire and CQL from the payer server and allow relaunch of the session with previously answered questions already filled out. [Save Context for Relaunch](formal_specification.html#persisting-application-state)  

This IG will support the [HRex Decision point - REST searchable?](http://build.fhir.org/ig/HL7/davinci-ehrx/exchanging.html#rest-searchable) when using RESTful endpoints to get payer resources (e.g., CQL rules and templates).

#### Authentication of SMART on FHIR application to payer API
The Electronic Health Record (EHR) system SHALL be the primary system used to initiate the DTR process. The [SMART App Launch](http://hl7.org/fhir/smart-app-launch) will typically be initiated from within the EHR.  
  
Payers SHALL require the DTR process to authenticate in order to retrieve resources when PHI is exchanged, and SHOULD required authentication in other situations. The app is required to register and obtain a client id to register and authenticate via SMART Backend services.

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| access_token | REQUIRED | *string* | The OAuth 2 access token that provides access to the payer FHIR server. |
| token_type | REQUIRED | *string* | Fixed value: `Bearer`. |
| expires_in | REQUIRED | *integer* | The lifetime of the access token in seconds. |
| scope | REQUIRED | *string* | Fixed value: `user/Questionnaire.read user/Library.read`. |
| subject | REQUIRED | *string* | The OAuth 2.0 client identifier of the DTR process, as registered with the payer's authorization server. |
{: .grid } 

#### Questionnaire
The DTR process SHALL use the URL provided in the `questionnaire` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the [CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) and MAY conform to [Structured Data Capture (SDC) Advanced Rendering Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html).

The Questionnaire SHALL have a `cqf-library` extension property specified. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

Questionnaires and ValueSets SHALL be version specific to address the possibility of breaking changes between differing versions.

> There is no need for the user to see the Questionnaire if it can be auto completed, unless they need to approve sending the result to the payer or to *sign* the information prior to submission. The application SHALL give the provider the ability, but not the requirement to review any information prior to sending it to a third party. This ability may be *turned-off* by the organization and possibly the individual provider. 
>
> If the resulting information is to be sent to a third  party (e.g., payer), the DTR SMART on FHIR App (or equivalent native app) SHALL include a configurable step to allow  the provider to review and grant permission to send the information gathered in the QuestionnaireResponse before sending. 
>
> However, this SHOULD be configurable on a site or provider basis.

DTR does not support creating new orders or changing existing orders. DTR supports documentation requirements for device, service, and medication requests. When the required documentation cannot be populated from the EHR, DTR SHOULD provide the ability to capture the missing information.

#### CQL Rules
CQL can either be embedded inline as part of an expression or referenced in a library.  All libraries needed by a questionnaire SHALL be referenced by the cqf-library extension which SHALL be resolvable by the SMART app. Metadata about the rules will be represented as a FHIR Library resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server.

---------------------
### Determination of Payers Supported by a DTR App
It is possible that the apps used to provide DTR functionality to an app will not support all payers the EHR might have "DTR requests" for - either from CRD or CDex.  It is important for the EHR to know what payers their app supports so that they only allow their users to launch the DTR app in the context of payers the app will be able to support.  (Launching an app only to be told "this payer isn't supported" is an unpleasant user experience.)

Where an EHR uses a third-party app rather than implementing DTR app functionality internally, the developer of the app SHALL define an endpoint maintaining a list of payers currently supported by that app and EHRs using external DTR apps SHALL support accessing the endpoint.  The EHR will be configured with knowledge of which endpoint to hit for a given app as part of the process of configuring support for that app within the EHR.  Different endpoints will be defined for different versions of the application in situations where support for payers varies by application version.

Accessing the endpoint will by a simple GET with an Accept header of "application/json" and SHALL be performed over TLS as described elsewhere in this guide.  The returned JSON object will contain a "payers" property referring to an array of objects.  Each object will have an "id" and "name" property, both with string values.  It is possible that additional properties may be supported in the future.

EHRs will typically retrieve the list of supported payers for the app once per day and will use this information to determine whether to expose the ability to launch DTR for orders associated with coverages for that payer.

> **NOTE:** Standardization of payer ids is still an open issue.

---------------------
### Launch Outside of CRD
The DTR process may be launched outside of the workflow of Coverage Requirements Discovery. This is likely to be the case if a user is resuming a previous session. Depending on the context of the Electronic Health Record (EHR) system, the interaction with the DTR process will vary.

The [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) implementation guide also uses DTR functionality to [request attachments using questionnaires](https://hl7.org/fhir/us/davinci-cdex/requesting-attachments-questionnaire.html).  See the [CDex Task Data Request Profile](https://hl7.org/fhir/us/davinci-cdex/StructureDefinition-cdex-task-data-request.html).

#### Launch Context
The launch context, which comes to the DTR app through the access token bundle, can be used to include necessary information when launching. When launched outside the context of CRD, the DTR app should add the `launch/order` scope, to indicate that the EHR should include the order currently in context when it returns an access token.  The EHR should provide a local reference, which the DTR app can use to retrieve the request, from which it can relaunch the associated usage session. The requests SHALL have an identifier, with type "placer", which remains consistent over the resources lifetime and can be used to search for them despite changes to their `id`.  

#### When the EHR is in a patient context
When the user of the EHR is working in the context of an individual patient and the EHR system allows the launch of a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) application, launching of a DTR compliant application SHOULD follow the [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence) as described in [Section 4.2.2](specification__cds_hooks.html#establish-patient-context) which will allow the DTR process to establish the patient of interest. When the user of the EHR is not working in the context of an individual patient and the EHR system allows the launch of a SMART on FHIR application, the DTR process should allow the user to select a usage session from all of the sessions available.

The DTR process will then allow the user to restore a session. The possible sessions to restore SHALL be based on the user's identity and patient that has been established. Further information on establishing user identity and sessions is available in [Persisting Application State](formal_specification.html#persisting-application-state).

When DTR processes are launched in this manner, in [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system will not provide a `template` property, which would point to a Questionnaire resource. This is an indication to the DTR process that it has been launched outside of the Coverage Requirements Discovery workflow.

#### Requesting User Identity
To persist application state, the DTR process will need to know who is currently using the application. SMART on FHIR provides methods for the application to obtain this information.

#### Standalone launch
DTR process SHALL support the [Standalone launch sequence](http://hl7.org/fhir/smart%2Dapp%2Dlaunch/#standalone-launch-sequence). In this case, the DTR process SHALL establish the user's identity following the procedures in [Requesting User Identity](formal_specification.html#requesting-user-identity).

Once user identity has been established, the DTR process should allow the user to select a usage session from all of the sessions available to that particular user.

#### DTR Task
The task resource is used to capture a request for additional actions that arise from the DTR flow. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements. 

Through interactions with the DTR process, a user may be prompted with a question that leads to the discovery of a needed action for the desired treatment to proceed. For example, a healthcare provider may be preparing an order for a Continuous Positive Airway Pressure (CPAP) device. In this example, the payer requires that the provider conduct a sleep study that shows a diagnosis of obstructive sleep apnea. While using the DTR process, it prompts the provider that the CQL/Questionnaire execution was unable to find a sleep study in the Electronic Health Record (EHR) system for the patient. 

The provider can confirm that the sleep study has not yet been conducted and generate a task for office staff to schedule a sleep study directly in the questionnaire interface. Alternatively, the provider could attest that the sleep study was performed or is already scheduled to be performed, either at this provider or another provider. Attestation by the provider can prevent duplicate tests in the case that the patient's electronic record is incomplete.

The ability to create tasks or todos is outside of the scope of DTR and should be supported by the EHR implementation. 

The questionnaire SHALL be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire SHALL be preserved.

The questionnaire SHOULD be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire SHOULD be preserved. 

---------------------
### Persisting Application State
Users of the DTR process are likely to be performing many tasks to support patient care or administration of the provider organization. As such, it should be expected that users may need to halt interaction with the DTR process and resume it at a later time.

The DTR process should not assume that users will be able to fully complete their questionnaire response and save it in a single session. It is recommended that DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) (or native) applications preserve state automatically as a user interacts with it. In this manner, the user does not need to explicitly take action to save their state.

#### How DTR Saves Context of DTR for a Relaunch

<br>
At any point prior to completion the app should be able to save the session, and then relaunch it later. If an EHR system performs DTR functionality internally, it may save session information however it likes. Guidance below does not apply in this scenario. 

Providers may go days to weeks before completing questionnaires and may go many months to a year before completing paperwork and Prior Authorization ot claim submission. Therefore, the time span between the creation of a Questionnaire to the completion of QuestionnaireResponse should be accounted for accordingly.

Context for the DTR app is made up of the QuestionnaireResponse, the Questionnaire, the prepopulation CQL and its supporting files, the order(s), the coverage, and the patient. The QuestionnaireResponse resource contains a reference to the patient in the `subject` field, and the order(s) and coverage in the `context` extension. From the coverage and order, the DTR app can determine the payer and retrieve the CQL, Questionnaire, and other files from a standard endpoint on the payer server.  

If the DTR app receives a QuestionnaireResponse resource in the app context, it SHALL reload the session information from that QuestionnaireResponse using its associated order and coverage.  If the DTR app does not receive a QuestionnaireResponse, it SHALL first search the EHR for QuestionnaireResponses associated with the order included in the app context.  Depending on the result of the search, the app will either offer an option to reload context from a found QuestionnaireResponse or launch normally and create a new QuestionnaireResponse.

The EHR should be able to associate orders with the QuestionnaireResponses they pertain to by linking their FHIR IDs internally. This means that even if the ID of an order changes, the EHR should be capable of updating the QuestionnaireResponse to reference the new ID. This way, even if DTR receives the updated orders, it will still be able to search the EHR for the associated QuestionnaireResponse.  

The EHR is responsible for storing and updating the QuestionnaireResponse, as well as providing the user a way to choose sessions to relaunch. Additionally, the EHR SHOULD pass the QR as a [SMART launch parameter](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#app-launch-scopes-and-launch-context)

The contents of the extension can be sent to the payer server using the [questionnaire-for-order operation](http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order).  The payer server SHALL return a Questionnaire upon receiving a valid coverage and order.

If the app is a SMART app (and not a native application) that it SHALL use SMART backend authentication and will also provide a link to the SMART backend authentication process which provides the full protocol and details. 

The following information should be contained inside the DocumentReference: 

| Element | Description |
| ----- | ----------- |
| DocumentReference.subject.reference | EHR Patient URL|
| DocumentReference.subject.identifier | Payer member identifier|
| DocumentReference.author | Provider organization reference|
| DocumentReference.date | Current date |
| DocumentReference.meta.lastUpdated | Date of last change|
| DocumentReference.content.attachment | PDF containing the QuestionnaireResponse |
{: .grid } 

The PDF may also include prior authorization information, if appropriate. Information in the PDF is not machine readable, and association with the order or prior authorization request must be done by hand. 

When launched with context of the organization, patient, and user, the app should display a list of open or “in-progress” QuestionnaireResponses or DocumentReferences for the user to select from, scoped to the patient that is in context. The DTR app should check both the EHR and the payer server for stored sessions.  The QuestionnaireResponses on the EHR and the DocumentReferences on the payer server have reference to the order which they are linked to, which can be used to search for the correct resource.  

When launched in standalone mode, the app should include the `launch/patient` scope to indicate that the EHR needs to provide patient context. The app can use the returned patient to search for relevant unfinished sessions. 

Since a patient won’t be in context, the app will need to provide a selection of patients that the user can choose from. But this would be from the EHR, currently. 
 
The DTR app SHALL only be scoped to one patient and be prohibited from accessing resources aside from the ones the EHR has authorized it to gain access to. The payer system SHALL only provide DocumentReferences for usage by the DTR app if it is scoped to a specific patient. The DTR app should not be allowed to query all in-progress QuestionnaireResponses without specifying a patient to limit the search.  

The system responsible for saving the sessions should prune old sessions by checking the date on the DocumentReference resource. The system can decide how long to wait before deleting an old session. The DocumentReference SHALL be deleted if the QuestionnaireResponse is saved to the EHR and the session finishes. 

##### SMART App Launch Framework IG
Using the SMART App Launch Framework IG, the DTR process should request [scopes for requesting identity data](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context/index.html#scopes-for-requesting-identity-data), namely `openid` and `fhirUser`. The DTR process can then retrieve the FHIR resource representing the current person and extract whatever identifiers it deems necessary for the persistance of application state.

The EHR's authorization server MUST support the `openid` and `fhirUser` scopes, due to the importance of the `fhirUser` element in the QuestionnaireResponse resource.

#### Resuming Work in Progress
In order to resume a work in progress that has been persisted, there are three basic requirements:
- The user must be from the same organization
- The user must have authority to access the patient (i.e. launch from patient context)
- The user must have authority to use DTR

##### Visibility of Usage Sessions to Other Users
 
The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) and FHIR specification provide methods for discovering information about the user and how that user fits into the provider organization. With this information, the DTR process, possibly consulting with the payer and provider IT systems, can decide which usage sessions to expose to a given user.

As an example, the DTR process may retrieve a Practitioner resource by retrieving the URL supplied in the `fhirUser` claim. The DTR process may then query the CareTeam or PractitionerRole resources to determine their relationship to other staff in the provider organization and determine if their usage sessions should also be made available.

Furthermore, the notion of workflows and multiple users could get extended to work queues. The EHR could maintain a list of in progress FHIR Questionnaires and store a reference to each of these within the EHR for the clinicians and other employees within the organization to continue working on. There could be built in mechanisms to assign FHIR Tasks for the work to the queues of other employees. Specific details surrounding this type of work queue implementation are out of the scope for this IG.

#### Session Expiration
While a user may need to suspend interaction with the DTR process, there may be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started five years in the past.

Payers SHOULD use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid. The DTR process SHALL NOT allow completion of a usage session if the current time has exceeded the end of the `effectivePeriod`.

---------------------
### Persisting Results
When the DTR process has collected all of the necessary information, it SHALL save the results of the data collection to the patient record. This IG describes two methods for saving the collected information: a text block in the Electronic Health Record (EHR) System and a QuestionnaireResponse.

#### Text Block
Many EHR Systems do not currently support writing a QuestionnaireResponse into a FHIR server. However, The US Core Implementation Guide (IG) now includes a [DocumentReference Profile](https://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html), which allows clients, like the DTR process, to write notes into the EHR (or EHR) system's FHIR server. The following section describes how the QuestionnaireResponse that is generated through the processes described in Section 4.4.3 and Section 4.4.4 can be transformed into text such that it may be saved as a note in the EHR system.

##### QuestionnaireResponse transformation process

The information that is collected (via the Questionnaire interaction with the user) SHOULD be written to the EHR via the available FHIR API. The results of the QuestionnaireResponse SHALL be saved as the FHIR resource and/or as a human readable format that is supported by the EHR.

If the EHR has the capability to render a QuestionnaireResponse, it SHOULD save the QuestionnaireResponse as part of the patient record. If the EHR does not have ability to render the questionnaireResponse, then the EHR should support saving the QuestionnaireResponse information as whichever supported structure produces the least impact on users.

The DTR process SHALL store this information in the EHR - either as a [DocumentReference](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html) resource conforming to the US Core profile or in another EHR-appropriate, human-readable form. Implementers are strongly encouraged to use the most reusable, discrete form of data they can. 

>If necessary, a PDF can be generated to store the information if other options are not possible. The generated PDF SHOULD be recorded in `DocumentReference.content.attachment.data`. `DocumentReference.content.attachment.contentType` SHOULD be `application/pdf`

##### Interaction with EHR
EHR systems that conform to [US Core](http://www.hl7.org/fhir/us/core/) allow for the creation of DocumentationReference resources through a FHIR API. As such, the DTR process should use the typical [FHIR create](http://hl7.org/fhir/R4/http.html#create) interaction to write the documentation into the EHR.

#### QuestionnaireResponse
The DTR process creates a QuestionnaireResponse resource through the course of normal operation. This resource SHOULD be saved to the patient record in the EHR system of the healthcare provider if supported. It may also be transmitted to the payer IT system.

>Updating work-in-progress (WIP) QuestionnaireResponses may save time and effort. In cases of QuestionnaireResponse updates, the App SHALL have the ability to continue, SHOULD allow the ability to start over, and MAY, for non-adaptive forms, provide the ability to ability to refresh and retain or discard provider entered information during a refresh. The data in the QuestionnaireResponse SHOULD be refreshed where possible with the latest data from the EHR system. 

##### Interaction with Payer API
The payer IT system should support the FHIR create interaction to allow the DTR process to send the QuestionnaireResponse resource to the payer. The FHIR endpoint for the payer may require authentication. If it is required, it SHALL follow the procedures described in [Authentication of SMART on FHIR application to payer API](formal_specification.html#authentication-of-smart-on-fhir-application-to-payer-api) - Authentication of SMART on FHIR application to payer API.

##### Pushing QuestionnaireResponse to Payer
This IG will support the [HRex Decision point – Configured by consumer?](http://build.fhir.org/ig/HL7/davinci-ehrx/exchanging.html#configured-by-consumer) when a SMART on FHIR or native EHR app wants to push a QuestionnaireResponse to a Payer.  

Note: Other IGs might provide additional mechanisms for transmitting results of the completed QuestionnaireResponse to the payer.  The client that launches DTR is responsible for understanding the context of the launch, and thus for what to do with any QuestionnaireResponses that are persisted as a result of that launch.

---------------------
### How DTR passes information to PAS, PAO or Other Exchanges
The DTR application shall save the QuestionnaireResponse to the EHR upon completion (see section [Persisting Results](formal_specification.html#persisting-results)). The next step after completing the Questionnaire may include sending a Claim to a PAS [(Prior Auth Support)](http://build.fhir.org/ig/HL7/davinci-pas/) server for or an Order to PAO [(Post-Acute Orders)](http://build.fhir.org/ig/HL7/dme-orders/) for ordering. Specifications on required resources can be found in the Implementation Guides for each of those use cases.  
 
The QuestionnaireResponse may include groups (items with specific linkIds) that contain references to resources to include. These may be attachments needed by either PAS or PAO. Also  subject, author, and source will be included.
 
#### Prior Authorization Support (PAS) 
The PAS Bundle linkId should be used for attached bundles containing resources needed for PAS. All of the referenced resources needed for PAS shall be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Claim sent to PAS. If the ClaimResponse has already been received from a PAS request, this shall be stored in the QuestionnaireResponse with a reference to it in the items list as well. 
 
#### Post-Acute Orders (PAO) 
The PAO Bundle linkId should be used for attached bundles containing resources needed for Post-Acute Orders. All the referenced resources needed for PAO shall be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Order sent to PAO. If a response has already been received from a PAO request, this shall be stored in the QuestionnaireResponse with a reference to it in the items list as well. 

#### Additional Workflow

In a QuestionnaireResponse, this will be a 'repeating' question with one or more answers with a linkId of "DTR_TASK".  The question type will be 'Reference' and will refer to contained Task instances that describe workflow actions that need to occur, such as the creation of additional companion orders, pre-execution testing, follow-up orders, etc. These are created when the completion of the questionnaire has made evident that certain workflow steps necessary to satisfy payer requirements were confirmed missing by the user.  The EHR should add 'to do' items to the user's task list that correspond to the actions described within the Task instances.

> **NOTE:** It may be appropriate to re-execute the DTR process once the specified tasks have been completed, as the DTR results may change.

---------------------
### Provenance
Provenance SHOULD be created and persisted with information created during the execution of the CQL and Questionnaire. Also, when the QuestionnaireResponse and its associated resources are exchanged with the source of the rules, appropriate Provenance resource(s) SHOULD be created and exchanged.

> All DTR applications SHALL support rendering according to the extensions supported in the DTR Questionnaire profile as well as executing all CQL found within Questionnaire extensions. Payers SHALL craft their Questionnaires such that they include CQL that attempts to pre-populate QuestionnaireResponse answers where such population can be accomplished using discrete data returned by EHR FHIR APIs that are required as part of current regulation (including simple calculations there-on - e.g. age from birthdate). Translation between standard codes SHOULD be supported where possible. 
> 
> For example, CQL and FHIR Questionnaires SHALL be required even when DTR is implemented within a native EHR application as opposed to a SMART on FHIR application.

---------------------
### Value Set and Code System Guidance
The table below is guidance that SHOULD be used when using values sets and code systems in DTR. This can also be considered a best practice.

<table border="1">
  <tr>
    <th></th>
    <th>CQL and Questionnaire terminology usage</th>
    <th>Comment</th>    
  </tr>
  <tr>
    <td>1</td>
    <td>No value set, embed the codes. </td>
    <td>This is OK if there is no need to reuse the codes. </td>   
  </tr>
  <tr>
    <td>2</td>
    <td>Pass a value set in the package with the expansion already in place. </td>
    <td>You've got the value set in-line with an expansion if the set of the codes is reasonably small. So, no need for a terminology service. </td>    
  </tr>
  <tr>
    <td>3</td>
    <td>Pass value set in place, but recipient needs to run the expansion or ask a terminology server to do the expansion. </td>
    <td>You've got a composed value set, but no expansion (probably because the value set is too large to embed/expand inline). So, you need to ask a terminology service to find out what the set of codes are. By providing the filters to limit the size of codes returned for the value sets. 
    </td>    
  </tr>
  <tr>
    <td>4</td>
    <td>Value set reference and recipient need to retrieve the value set and run expand or invoke a terminology server somewhere else to run the expansion. </td>
    <td>You don't have the value set (e.g., probably because of licensing issues) - you need to look for it on a registry/terminology server, resolve the canonical URL to retrieve it, then cache the value set(s) if allowed by the code system(s). For some code systems, you may need to license the data file first in order to retrieve codes and descriptors by browser or API. Also, once you get the value set, you might still need to expand it like scenario (3) above. </td>    
  </tr>
</table>

Note: According to the [ValueSet Identification](https://www.hl7.org/fhir/valueset.html#ident), it is common practice to copy (cache) value sets locally, most references to value sets use the canonical URL. 

---------------------
### CQL 
Clinical Quality Language (CQL) is used to query the Electronic Health Record (EHR) FHIR server to prepopulate the DTR Questionnaire.
  
As part of the SDC Questionnaires that define the information payers require to be captured, CQL is used to support automatic population of answers from existing EHR data and, occasionally, to enforce complex logic around what questions should be displayed.  For example, whether answers are required, what answers should be enabled, etc.  This CQL may query for patient observations, conditions, or other discrete information within the EHR to use as part of the population process or logic.  The SDC specification provides guidance about how CQL expressions can be used for different purposes, as well as how information gathered by CQL in one portion of the Questionnaire can be made available in other portions of the Questionnaire.  See [Using expressions].

One of the core purposes of this specification is to automate the retrieval of documentation required by the payer in a manner that reduces provider burden. Authors of DTR questionnaires SHOULD include CQL to auto-populate the questionnaire as much as possible. Due to differences in workflows or information systems, clinical information may be represented in different FHIR resources or with different codes or code systems. Therefore, payer CQL may have to examine different resources or use value sets to find patient information. It is preferable to have more extensive CQL or value sets than require a user to input values that the rules were unable to find.

In general CQL SHALL be used when pre-populating anything exposed in the FHIR based patient data access API (The 21st Century Cures Act API).

#### Guidance on Structure of CQL Logic
Like many other programming languages, CQL allows for statements to be nested within conditional logic. This creates instances where some statements may not be executed due to a prior condition being met. This behavior should be used intentionally by payers creating CQL.

Data retrieval is highly dependent on the *enableWhen* attribute/element:

1. Questionnaires should be designed with appropriate use of *enableWhen* such that questions are only displayed when needed.

2. CQL logic should be partitioned to be specific to groups/questions/etc. when doing so will allow it to be more efficient - though consideration should also be given to whether performing significant data gathering at the outset (even if the data is unneeded) will produce a more positive experience than intermittent data retrieval 'on demand', when such retrieval may introduce user-interface delays

This pattern of logic structure is referred to by several names, including *eager quitting*, *early return* or, *short circuiting*. The goal is to avoid the execution of statements if they will not be relevant given other information available to the logic. This is done to streamline workflow and allow the user to focus on relevant input fields.

As an example, a payer may have a set of rules or specific information that must be gathered on a patient only if they have diabetes. This information may be gathered through a series of CQL statements. When constructing this CQL for DTR, these statements should be nested in conditionals to first check if the patient has diabetes before checking for information dependent on that condition.

#### Expression Naming Conventions
CQL allows for the gathering of information through the use of `define` statements. These statements are given an identifier. When CQL execution is complete, a context will be created where these identifiers are populated with the results of the statement execution.

DTR makes use of the identifier names within the CQL. The DTR process will examine the payer supplied Questionnaire resource. 

* This resource SHALL conform to the [CQF Questionnaire Profile](http://hl7.org/fhir/R4/cqf.html) 
  *  The DTR process will examine each `Questionnaire.item` to find a `valueExpression` 

  * Resources are retrieved from the EHR FHIR server with RESTful queries and CQL is executed to extract relevant information
  * Values extracted from the FHIR resources are assigned identifier strings and the DTR process will then use these statement identifiers to retrieve a value from the CQL execution 
  
>The resulting value is used to satisfy documentation requirements. If the value is `null`, the user will be prompted to supply a value

#### CQL Constraints
CQL for use in DTR SHALL have a `context` of `Patient`.  Within the Questionnaire, CQL SHALL follow SDC rules for determining context.  Specifically, CQL definitions and variables defined on ancestor elements or preceding expression extensions within the same Questionnaire item are 'in scope' for referencing in descendant/following expressions.

CQL must be version [CQL STU2](https://cql.hl7.org/STU2/index.html) or later.

#### Execution of CQL
##### Retrieval of patient FHIR resources to supply to CQL execution engine
The app SHOULD retrieve the FHIR resources specified in the `dataRequirement` section of a [Library](https://www.hl7.org/fhir/library.html), it can then pass these resources to the Clinical Quality Language (CQL) engine. Using `dataRequirement` allows for a more declarative means of understanding the resource data needed from the EHR. For example, the below snippet is from a `Library` that contains a `dataRequirement` section. In this code snippet the resource data needed from the EHR is Condition. 

```json
"dataRequirement": [
    {
      "type": "Condition",
      "codeFilter": [
        {
          "path": "code",
          "valueSet": "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1219.25"
        }
      ]
    },
```

>For further guidance and details implementers are encouraged to reference the [FHIR Clinical Guidelines IG - Library Resources section](http://build.fhir.org/ig/HL7/cqf-recommendations/libraries.html#library-resources). 

The app SHALL be provided with a token that allows it to access relevant information for the patient in question. The token is provided by the EHR or the application that controls access to the patient's record. Depending on user permissions, the app may not have access to all the data. The app developer should consider the possibility that access to some data may be restricted or prohibited(and access restrictions may happen silently (i.g., indistinguishable absent data). The app’s CQL execution engine SHOULD constrain queries to reduce data retrieval overhead. (for example, if the CQL logic filters for medications meeting certain conditions. It is acceptable if the engine retrieves all medications for the patient, even if a more constrained query was possible).

As discussed in the Execution Results section below, it’s possible not every CQL statement will be executed (for example some questions may only be relevant given certain answers to prior questions). In order to reduce data transfers and increase overall speed, data MAY be fetched as needed. However, the app’s execution engine MAY be implemented using a different strategy (for example by doing bulk fetches before starting execution).

##### Engine Execution

The FHIR Library containing/referencing a CQL logic file can reference other needed CQL files (e.g., helper libraries) using the `relatedArtifact` field and a `RelatedArtifact` with a `type` of `depends-on`. The engine SHALL make available to the execution context all such referenced CQL libraries. If the Questionnaire has multiple `cqf-library` fields, then any `valueExpression` must specify the library name as well as the statement name as follows: `"LibraryName".statementName`.

Consideration must also be made regarding the CQL version.

##### Behavior when receiving malformed CQL
If the CQL is malformed (is not syntactically correct) in any way, the app’s execution engine SHALL NOT attempt any execution of the malformed CQL, the app SHALL log the error, and the user SHALL be notified with an appropriate message indicating that population did not occur and they SHALL be allowed to enter the information manually either now or at a later time. The app SHOULD log failures and ensure the maintainer of the CQL/Questionnaire package is notified. 

In an effort to notify the appropriate party or maintainer that the CQL/Questionnaire is malformed, the app developer SHOULD use FHIR resource OperationOutcome. The details property of the OperationOutcome should use `MSG_BAD_SYNTAX` to indicate syntactical errors. The destination of the OperationOutcome should be the endpoint the malformed CQL/Questionnaire was retrieved from.

>It is a CQL failure if the CQL cannot be executed by the app's CQL engine in the SMART on FHIR app or in a capable EHR.  

##### Behavior when encountering execution errors
If any errors are encountered during execution, the app’s engine SHALL NOT attempt any further execution, and the user SHALL be notified with an appropriate on-screen error message. The app SHALL log failures and ensure the maintainer of the CQL/Questionnaire package is notified. The user should have the option to complete the Questionnaire if possible, despite the error.

In an effort to notify the appropriate party or maintainer that the CQL/Questionnaire is malformed, the app developer SHOULD use FHIR resource OperationOutcome. The destination of the OperationOutcome should be the endpoint the malformed CQL/Questionnaire was retrieved from.

>Note: A query for data that returns no results is never considered a failure.

##### Execution Results

The flow of execution of the CQL will be determined by the associated Questionnaire. The app will proceed through the Questionnaire, and for any question that is associated with the result of a CQL statement, that specific CQL statement will be executed. The DTR application will use result caching so that results that are already available will be reused without requesting them again.

---------------------
### Requesting Additional Information from the User
While the goal of DTR is to automatically gather all of the necessary information to satisfy payer rules and documentation requirements without interrupting the user, this is not possible in all cases. 

It is likely that at least some answers will not be able to be gleaned from the EHR, due to missing data, data that is not computable, or data that is not represented in a standardized way.  Also, even where answers are determined automatically, users may wish to review them for accuracy and completeness.  Therefore, the system acting as a form filler is responsible for displaying all 'enabled' questions, groups and display items to the end user - for completion and/or review

When the execution of Clinical Quality Language (CQL) is unable to obtain the required data, it is necessary to prompt the user for more input.

#### Questionnaire Rendering
"DTR leverages a subset of extensions and capabilities defined by the SDC implementation guide to support control over rendering, flow logic, and population and calculation of answers.  The [DTR SDC Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire.html) and [DTR Adaptive Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire-adapt.html) identify the set of core elements and extensions that must be supported by 'full' EHRs and DTR solutions in terms of rendering and processing Questionnaires and their associated responses - and the elements that payers can count on being supported in the Questionnaires they expose.

Two different profiles are used to support two different approaches to managing questionnaire logic and two different levels of engagement between the form filling interface and the payer.

With the [DTR SDC Questionnaire](StructureDefinition-dtr-sdc-questionnaire.html), all logic around what questions should be displayed, what answers are available, etc. is embedded in the Questionnaire (or in libraries linked to from the Questionnaire).  The only interaction with the payer is to retrieve the Questionnaire appropriate for a particular order or set of orders for a given set of patient coverage.  The only possible result from the DTR process is a completed QuestionnaireResponse.

With the [DTR Adaptive Questionnaire](StructureDefinition-dtr-sdc-questionnaire-adapt.html), the logic around what questions should be displayed and what answers are available is managed within software maintained by the payer.  The only CQL needed in the Questionnaire is that needed to support populating question answers.  The form filling process interacts with the payer continuously during the process of filling out the QuestionnaireResponse.  This interactivity means that it is possible for a payer to provide a Service Coverage Determination along with the QuestionnaireResponse.

Implementers should review the [advanced rendering]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html), [advanced behavior]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/behavior.html), [population]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/populate.html) and [adaptive forms]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/adaptive.html) portions of the SDC implementation guide, focusing on the elements and extensions included in the DTR profiles.  Implementers should also be familiar with the documentation about the [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) and [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) resources from the core FHIR specification.  Conformance with DTR requires conformance with the relevant portions of the SDC implementation guide"

#### Structured Data Capture
Payers may have requirements on how questions are presented to users. To allow for this, payers MAY supply Questionnaire resources that conform to the [Advanced Rendering Questionnaire Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html) as defined in Structured Data Capture.

The purpose of this extension is to indicate that it is not SAFE to render the form if the styles indicated in the Questionnaire are not followed. If the system is not capable of rendering the form as the Questionnaire dictates, then it cannot display the form.  Note the use of this flag should be extremely rare in DTR.

If the `rendering-styleSensitive` extension property is not present or `false` the DTR process SHOULD use `rendering-style` and `rendering-xhtml` properties.

##### Rendering Questionnaire items without specified styles
Payers are not required to provide Questionnaires that conform to the Advanced Rendering Questionnaire Profile. When a Questionnaire is provided that does not conform to this profile, it is at the discretion of the DTR process to choose a reasonable presentation of the questions that require user input. The DTR process SHALL use the appropriate input mechanism depending on the `item.type`. When working with a FHIR R4 Questionnaire, the DTR process SHALL support `item.answerValueSet`, `item.answerOption`, and `item.initial` if provided.

##### Rendering multiple items
This IG does not place any requirements on the DTR process to display multiple `Questionnaire.item`s to a user at a time or only a single `item`.  Implementers should decide which method of displaying questions makes the most sense within the end user workflow. We encourage Questionnaire designs that minimize the number of questions that are necessary to view/complete (i.e., if an answer obviates the need to complete a section, then the section should not appear for completion, unless local workflow(s) determine a need for editing or review).

#### Provider Attestation
There may be cases where the CQL provided by a payer was unable to locate information for a patient that is present in the Electronic Health Record (EHR) system. This may be due to the information existing in unstructured notes or in locations the CQL did not expect. To reduce the burden on the users of the application, DTR provides a mechanism for the user to attest that the information exists in the patient’s record, without specifying the exact value or location of the information. This will not require the user to reenter the missing information.

The DTR process SHALL include a mechanism to allow a user to attest the answer to the presented question exists in the patient's record. This mechanism MAY be an HTML `input` element with the `type` set to `button` or it may be an `a` element. The behavior of these elements SHALL be to record the user's attestation that the information is present in the patient's record.

When a user provides an attestation, the DTR process SHALL record that in the corresponding QuestionnaireResponse.item. In this case, the DTR process SHALL create an `answer` property on the `item`. The `answer` SHALL have a `valueCoding` that is set to the SNOMED CT code `410515003`, known present. The `item` will also have an `author` extension property which will reference the `fhirUser` provided to the DTR process.

If an answer is attested, the user should provide evidence that the attested value exists in the patient’s record by including an attachment or the equivalent with the QuestionnaireResponse.

>Compliant questionnaires SHALL NOT include hidden or read-only questions unless the information is populated by the payer or their out-sourced service.  If information is privacy restricted, the information SHOULD be treated as if it does not exist. The provider SHOULD ask the patient if they want to share the information with the payer.

#### Recording Responses
The DTR process SHALL take input from the user and record the provided information. As with provider attestation, the DTR process SHALL record that in the corresponding QuestionnaireResponse.item. In this case, the DTR process SHALL create an `answer` property on the `item`. The `answer` SHALL have an appropriate `value[x]` depending on the corresponding `type` in the `Questionnaire.item`. Again, similar to attestations, the `item` will have an `author` extension property which will reference the `fhirUser` provided to the DTR process.

##### QuestionnaireResponse
The DTR process SHALL create a QuestionnaireResponse resource based on all of the information collected. Given the following JSON fragment representing a `Questionnaire.item`:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/cqf-expression",
      "valueExpression": {
        "language": "text/cql",
        "expression": "Age"
      }
    }
  ],
  "linkId": "age",
  "code": [
    {
      "system": "http://loinc.org",
      "code": "30525-0"
    }
  ],
  "text": "What is the patient's age?",
  "type": "quantity"
}
```

The following `QuestionnaireResponse.item` JSON fragment would be created assuming that the patient's age is 65 years old and that this information was gathered through CQL execution.

```
{
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```

If the value was supplied by the user, the `author` extension property will be set. The following `QuestionnaireResponse.item` JSON fragment provides an example of this:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/questionnaireresponse-author",
      "valueReference": {
        "reference": "http://exampleprovider.org/fhir/Practitioner/1234"
      }
    }
  ],
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```

Finally, if the user did not supply a value, but provided an attestation that the information exists in the patient's record, it would be represented by the following  `QuestionnaireResponse.item` JSON fragment:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/questionnaireresponse-author",
      "valueReference": {
        "reference": "http://exampleprovider.org/fhir/Practitioner/1234"
      }
    }
  ],
  "linkId": "age",
  "answer": {
    "valueCoding": {
      "system": "http://snomed.info/sct", "code": "410515003"
    }
  }
}
```

##### Separating user provided information from CQL retrieved information
For the sake of information systems processing a QuestionnnaireResponse generated,
the DTR process SHALL populate the `QuestionnaireResponse.item` with the `author` extension property if the item was created by user input. If the `author` property is not present, then the information was gathered through the execution of CQL.

---------------------
### Related Information 
   
* [Privacy, Safety and Security](specification__privacy_safety_and_security.html)

* [CDS Hooks](specification__cds_hooks.html)
  
* [Best Practices](specification__best_practices.html)
  
>Note: A reference implementation has been created. The code is available at [DTR GitHub](https://github.com/HL7-DaVinci/dtr). The executable is at [DTR Logica Health](https://davinci-dtr.logicahealth.org/smart/launch.html).

 