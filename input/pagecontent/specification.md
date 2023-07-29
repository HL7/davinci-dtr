<link rel="stylesheet" type="text/css" href="formatting.css" />

This section of the IG defines the guidelines of the DTR process behavior and information on how to implement the technologies required to build a conformant app. Below are the conformance requirements.

---------------------
### Profiles
This implementation guide will adopt by reference the following [HRex Conformance Requirements](http://build.fhir.org/ig/HL7/davinci-ehrx/conformance.html).  In addition, systems **SHALL** comply with additional requirements called out in the IG narrative and Profile definitions.

#### Questionnaire
Payers have documentation requirements and rules that must be satisfied as part of their typical operations when reimbursing for care for certain services requiring authorization or documentation.

The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules. Payers **SHALL** gather data needed to satisfy their rules using FHIR Questionnaires that comply with either the [DTR SDC Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire.html) or the [DTR Adaptive Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire-adapt.html).  

The DTR process **SHALL** use the URL provided in the `questionnaire` property of the appContext to retrieve a Questionnaire resource. The payer **SHALL** provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer’s server. 

These Questionnaires **SHALL** include logic that supports population from the EHR where possible.  Such logic **SHOULD** rely exclusively on data elements and search parameters defined either in [US Core](http://hl7.org/fhir/us/core/STU3.1.1/) or [HRex](http://build.fhir.org/ig/HL7/davinci-ehrx/).  Logic **SHALL** work if only the current version (required by ONC) is available.  These Questionnaires **SHOULD** also include logic that ensures that only 'relevant' questions are displayed, based on what answers have already been provided/populated.  When using 'expression' elements within Questionnaires, all logic **SHALL** be written in CQL.

These systems **SHOULD** also support all non mustSupport data elements found in the differential of the profiles as per SDC documentation for those elements and extensions and **SHALL** gracefully handle the presence of these elements if not supported.  (i.e., non-support for an element **SHALL NOT** interfere with a user's ability to complete a QuestionnaireResponse.)  It should be noted that DTR can gather additional information to determine coverage of service or item.

Payers **MAY** also supply Questionnaire resources that conform to the [Structured Data Capture (SDC) Advanced Rendering Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html) to control how information requests will ultimately be presented to users.  DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) applications **SHALL** support the SDC Advanced Rendering Profile.  

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Elements with example bindings or missing bindings will not be used.
</p>

More information regarding Questionnaires, workflow, and behaviors in the Structured Data Capture Implementation Guide:
- [Basic SDC Workflow](http://hl7.org/fhir/uv/sdc/STU3/workflow.html)  
- [Form Behavior and Calculation](http://hl7.org/fhir/uv/sdc/STU3/behavior.html)  
- [Advanced Form Rendering](http://hl7.org/fhir/uv/sdc/STU3/rendering.html)
- [DTR SDC Questionnaire](StructureDefinition-dtr-sdc-questionnaire.html) - [Example](Questionnaire-home-o2-sdc-questionnaire.html)

##### Pre-Population
DTR will automatically populate the answers to certain questions based on existing EHR data.  In some cases, it may populate all answers to the Questionnaire.  The DTR application **SHALL** provide the ability, but not requirement, for providers to review pre-populated answers prior to saving the resulting response for subsequent use within the EHR.  

##### Extension Usage
With current EHR capabilities with respect to updating 'request' resources, there is no mechanism to revise the 'request' resource to have its "supportingInfo" (or "insurance") element point to the [QuestionnaireResponse](StructureDefinition-dtr-questionnaireresponse-r4.html)/[Bundle](http://build.fhir.org/ig/HL7/davinci-pas/StructureDefinition-profile-pas-request-bundle.html)/[ClaimResponse](http://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-claimresponse.html) that results from the DTR process. Instead, extensions are used to reference the relevant order. DTR clients **SHOULD** update their 'request' resources with the appropriate "supportingInfo" or "insurance" link to the relevant resource.

#### Questionnaire Response
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. The source of the data is important for both providers and payers to attribute the information to a particular source and provide feedback on the design and use of the questionnaire and the implications regarding provider burden.  Information pulled from the medical record by CQL needs to be clearly identified as should the information entered by a provider or office staff.  As an example, if information is not found in the medical record and needs to be manually entered, or if it is "found" and needs to be changed, then the questionnaire needs to be updated to better utilize the information available in the record where possible. In addition, understanding who is entering the information, will help to optimize questionnaires to focus provider interactions on information that only they can realistically provide.  

The [InformationOrigin extension](StructureDefinition-information-origin.html) is intended for inclusion on each answer to identify how the information originated - auto-populated, auto-populated and overridden, or manually entered.  (If the origin source is 'auto-populated and overridden' or 'manually entered', then an information author **SHALL** be supplied).  This process **SHALL** be automatic and populated without human intervention by the DTR application.

Any `QuestionnaireResponse` provided **SHALL** either be an adaptive form or correspond to a specified Questionnaire (See the [DTR profiles](artifacts.html#structures-resource-profiles))

* [DTR QuestionnaireResponse R4](StructureDefinition-dtr-questionnaireresponse-r4.html) - [Example](QuestionnaireResponse-home-o2-questionnaireresponse.html)

#### SDC Adaptive Forms

##### General Adaptive Form Support

[SDC Adaptive Forms](http://build.fhir.org/ig/HL7/sdc/adaptive.html) define an alternative way to dynamically interact with the user. DTR support for adaptive forms helps in the following scenarios:

1. Support for complex decision trees without the need for the Questionnaire and rules (CQL) to cover all the possibilities. This is enabled by supporting the request for a small number of questions (and the ability to pre-populate the questions from the EHR), returning the results to the Payer to "prune" the decision tree, and repeat the process until complete.

2. Allowing the payer to only expose the relevant guideline logic for the clinical situation at hand.

3. Support for complex logic that depends on information available to the payer (e.g., prior auth services) to be part of the decision logic to evaluate the medical necessity and appropriateness of the planned service.

4. Enabling the potential for a final response from the payer including prior authorization information as part of the interactive exchange. 

5. Provide flexibility to EHR venders to adopt DTR. The adaptive form can be used as an alternative to more complex SDC form behavior (e.g., enableWhen).

6. Supports both payer side prior authorization and the ability to request specific additional information as part of the PAS exchange process.

A payer wishing to use Adaptive Forms **SHOULD** return a questionnaire instance compliant with the [SDC AdaptiveQuestionnaire-Search profile](http://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-adapt-srch.html).  This instance **SHALL** include the QuestionnaireAdaptive extension which will identify the endpoint the DTR app is to call to receive the "next question".

The DTR app **SHALL** support loading and rendering the adaptive form developed by the payer following the SDC adaptive form workflow. If there is CQL embedded in the questionnaire or the associated library, the DTR app should be able to execute the CQL based on the questions loaded in the questionnaire. For performance, the DTR application **MAY** save the results of prior execution of the CQL where it is the same for addressing the current question(s).

##### Adaptive Forms and Prior Authorization

When a prior authorization comes back while using an Adaptive Form, the SMART app **SHALL**:
1. Store the [ClaimResponse](http://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-claimresponse.html) on the EHR with a simple create.

2. Update the "in-memory" request (e.g., ServiceRequest) to have a supportingInfo reference to the [ClaimResponse](http://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-claimresponse.html). 

Although not detailed in this IG, it may be possible to achieve the same level of integration with a DTR Native App instead of a DTR SMART app. The same payer sourced FHIR Questionnaire and CQL could be consumed by the DTR Native App. The interface for exchanging data would need to be developed further in a method that achieves the same level of interoperability that the SMART on FHIR app achieves. A DTR Native App **MAY** play the role of the DTR process if it reduces burden. Because of this, when the DTR SMART app is mentioned in this IG, DTR Native App, app (application), or DTR process also applies.

##### Requesting Provider and Organization
To provide a mechanism to support Prior Authorization bundle creation for submission, this guide provides multiple request/order profiles that enable the requesting provider and organization to be accessible:  [DTR Service Request](StructureDefinition-dtr-servicerequest.html), [DTR Device Request](StructureDefinition-dtr-devicerequest.html), [DTR Medication Request](StructureDefinition-dtr-medicationrequest.html), and [DTR Nutrition Order](StructureDefinition-dtr-nutritionorder.html)

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### CDS Hooks
#### Use of Card.links
One entry point into the DTR process is launching from a [Clinical Decision Support (CDS) Hooks Card](https://cds-hooks.hl7.org/1.0/#card-attributes).  The use of this standard specification enables an EHR to swap the SMART app which is used, or even choose to use the information from a CDS Hooks service for a local DTR app implementation.  

In most cases, a card that results in the launch of DTR will deal with only one patient coverage, multiple orders, one Questionnaire and (possibly) one initial QuestionnaireResponse.  However, there may be edge cases where more than one of these is possible.

The DTR App requests an OAuth token using SMART backend services and then uses that second access token to authenticate against the payer FHIR server.

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;As a part of a CDS Hooks response, if there is a need for further information then the payer IT system <b>MAY</b> return a Card object with a Link object populated in the Card.links property. If the Link object has a URL property set to the launch URL of a DTR process, this can still be overridden by the EHR or Provider's preferred DTR application.
</p>

DTR **SHALL** receive the full order in those cases where the order isn't yet persisted and available on the RESTful interface.

Details of the DTR launch process from CRD can be found [here](https://build.fhir.org/ig/HL7/davinci-crd/hooks.html#launch-smart-application)

#### Establish Patient Context
When the DTR process is being launched from a CDS card Link, the Electronic Health Record (EHR) system and DTR process **SHALL** follow the procedures established by the [SMART App Launch Framework](http://hl7.org/fhir/smart-app-launch) - specifically the SMART App Launch Framework's [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence). 

In [Step 1 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-1-app-asks-for-authorization), the DTR process **SHALL** request the `patient/Patient.read` scope. DTR apps are expected to be technically able to run against any EHR and work with any payer.  However, for a DTR app to be used it needs to be trusted appropriately to manage access to personal health information by the EHRs and payers.  EHRs will choose which DTR apps they will trust and support, and similarly, all DTR apps **SHALL** be registered with the payer systems with which they communicate.  

This registration process will ensure the following:
- The DTR app is 'trusted' by the payer to deal with patient-identifiable data.
- The DTR app knows the relevant endpoints to use to access Questionnaires, DocumentReferences and other relevant information.
- The DTR app has a shared secret allowing secure access to the payer endpoints.

Even after an application has been successfully registered, payers and EHRs **SHOULD** monitor the application behavior and **MAY** suspend an application's access if it is suspected of malicious behavior. The app will need to ask for scope sufficient to execute any CQL that the payer may provide as part of the questionnaires, provide a link to the payer registration section, and add to payer registration that the payer **SHOULD** indicate the scopes required by their questionnaires.

In [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system **SHALL** also provide a patient property set to the subject patient identifier of this interaction.

For cases where the DTR process is being launched outside the context of Coverage Requirements Discovery workflow, please see [Launch Outside of CRD](specification.html#launch-outside-of-crd).

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Retrieval of Payer resources and SMART Launch
The DTR process will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The payer can specify the endpoint to be a payer's, third party, Utilization Management Organization, or Business Association where ever the questionnaires, CQL, and value sets are made available. 

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;All Questionnaires and valuesets retrieved <b>SHALL</b> be version specific, as breaking changes may occur between versions and would likely cause failures or inconsistent data.
</p>

The information needed to obtain the required resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in [CDS Hooks](specification.html#use-of-cardlinks). When launched in context of CRD and a CDS Hook, that object will have the following properties:

<table border="1">
  <tr>
    <th>Field</th>
    <th>Optionality</th>
    <th>Cardinality</th>  
    <th>Type</th>  
    <th>Description</th>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>OPTIONAL</td>
    <td>0..*</td>   
    <td><em>string</em></td>   
    <td>The canonical URL of the Questionnaire(s).  Required if "response" is not adaptive.</td>   
  </tr>
  <tr>
    <td>order</td>
    <td>OPTIONAL</td>
    <td>0..*</td>   
    <td><em>string</em></td>   
    <td>The EHR local URL or JSON encoded content of the order(s) in context.  Prefer EHR local URL when available.</td>   
  </tr>
  <tr>
    <td>response</td>
    <td>OPTIONAL</td>
    <td>0..*</td>   
    <td><em>object</em></td>   
    <td>The QuestionnaireResponse resource(s) that DTR should load data from</td>   
   </tr>
  <tr>
    <td>coverage</td>
    <td>OPTIONAL </td>
    <td>0..*</td>   
    <td><em>string</em></td>   
    <td>Local reference to relevant coverage resource(s) on EHR</td>   
  </tr>
</table>
<br>
When launched without the context of a CDS Hook, but within context from an EHR, the token returned from the auth server **SHOULD** still include an appContext.  The token bundle is required to have a patient in context.  The appContext **SHOULD** have the following properties:
  
<table border="1">
  <tr>
    <th>Field</th>
    <th>Optionality</th>
    <th>Cardinality</th>  
    <th>Type</th>  
    <th>Description</th>
  </tr>
  <tr>
    <td>order</td>
    <td>OPTIONAL</td>
    <td>0..*</td>   
    <td><em>string</em></td>   
    <td>Local reference to the order or claim in context.</td>   
  </tr>
  <tr>
    <td>response</td>
    <td>OPTIONAL</td>
    <td>0..*</td>   
    <td><em>string</em></td>   
    <td>Local reference to a QuestionnaireResponse stored on the EHR</td>   
  </tr>
</table>

If the QuestionnaireResponse is not present, but the order is, the QuestionnaireResponse can be searched for using the order.  If the order is not present, then it can be retrieved from the QuestionnaireResponse.  If neither is present, the user **SHOULD** be prompted to select a QuestionnaireResponse based on the patient that is in context.

A DTR app is allowed to throw an error if not launched within one and only one of the following contexts:
1. QuestionnaireResponse
2. Task
3. Order

The resources corresponding to this context (if any) **SHALL** be passed in the fhirContext element.  As part of configuration during app enablement process the app **SHOULD** also always ask for the launch/patient and the openId and fhirUser contexts.

#### App Relaunch 
The DTR app **SHALL** support usage of the following new scopes to alter the launch context: 
* `launch/request` 
* `launch/response`
* `launch/currentorder`  
* `launch/currentqr`
  
If the `request` scope is included when launching, the access token bundle should return with the `request` field of the `appContext` filled.  If the `response` scope is included, it should return with the `response` field of the `appContext` filled.

At least one of the two fields `request` or `response` must be filled in order for the DTR app to successfully launch. In the case that `response` is filled but `request` is empty, the DTR process **SHALL** use the URL provided in the `response` property of the `appContext` to retrieve the referenced QuestionnaireResponse. The QuestionnaireResponse can be used to discover the request through the `context` extension. The app should allow the user to relaunch the deferred usage session defined by the QuestionnaireResponse. 

When launching with the `currentorder` or `currentqr` scopes, if no QuestionnaireResponse is passed, SMART app will query the EHR to try to find the QuestionnaireResponses linked to that order by the [context extension](StructureDefinition-context.html).  If there are multiple QuestionnaireResponses for an order, will need to investigate whether it's possible to pass multiple responses as a launch context.  

The QuestionnaireResponse will have all the information required to request the Questionnaire and CQL from the payer server and allow relaunch of the session with previously answered questions already filled out. (See the [Save Context for Relaunch](specification.html#persisting-application-state) section) 

#### Authentication of SMART on FHIR application to payer API
The Electronic Health Record (EHR) system **SHALL** be the primary system used to initiate the DTR process. The [SMART App Launch](http://hl7.org/fhir/smart-app-launch) will typically be initiated from within the EHR.  
  
Payers **SHALL** require the DTR process to authenticate in order to retrieve resources when PHI is exchanged, and **SHOULD** required authentication in other situations. The app is required to register and obtain a client id to register and authenticate via SMART Backend services.

[SMART on FHIR Backend Services](https://build.fhir.org/ig/HL7/smart-app-launch/backend-services.html) provides a flow that authorizes a system to connect to a FHIR server where no user needs to be involved in the authorization process, and allows systems like EHRs to easily interact with pre-authorized defined scopes of access.  The scopes necessary are: 
 - `system/questionnaire.rs`
 - `system/valueset.rs` 
 - `system/library.rs`  
 
These are sufficient to invoke the DTR Questionnaire operations `$next-question` and `ValueSet/$expand`, as well as retrieval of libraries and value sets.  

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Payers must be cautious about prepopulating Questionnaires with sensitive information, because there are rare situations where a malicious application could attempt to access information that was not authorized by the EHR.  
</p>

#### CQL Rules
CQL can either be embedded inline as part of an expression or referenced in a library.  All libraries needed by a questionnaire **SHALL** be referenced by the cqf-library extension which **SHALL** be resolvable by the SMART app. Metadata about the rules will be represented as a FHIR Library resource. The payer **SHALL** provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Launch Outside of CRD
The DTR process **MAY** be launched outside of the workflow of Coverage Requirements Discovery. This is likely to be the case if a user is resuming a previous session. Depending on the context of the Electronic Health Record (EHR) system, the interaction with the DTR process will vary.

#### Launch Context
The launch context, which comes to the DTR app through the access token bundle, can be used to include necessary information when launching. When launched outside the context of CRD, the DTR app **SHOULD** add the `launch/order` scope, to indicate that the EHR should include the order currently in context when it returns an access token.  The EHR should provide a local reference, which the DTR app can use to retrieve the request, from which it can relaunch the associated usage session. The requests **SHALL** have an identifier, with type "placer", which remains consistent over the resources lifetime and can be used to search for them despite changes to their `id`.  

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Any new parameters defined by this Implementation Guide should not be confused for generic resource-specific SMART launch parameters (which are handled as 'mandatory' and will cause the EHR to prompt the user for them if they're not already in active context).  For detailed guidance on the latest specifics of SMART launch context, refer to the <a href="http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#app-launch-scopes-and-launch-context">App Launch: Scopes and Launch Context</a> section of the SMART App Launch Implementation Guide. 
</p>

The launch **SHALL** occur in the context of a specific patient and **SHOULD** occur in the context of a specific encounter and ideally a specific order.  DTR will check to see if there is already work-in-progress by looking for an existing QuestionnaireResponse (on the EHR) for the specified order.  If no order is specified, DTR will allow the user to select one of the existing "work-in-progress" sessions.  

If an order was selected and there was no work in progress:
* If there are multiple coverages whose payers are supported by the DTR app, the app will allow the user to select the coverage(s) to use DTR for.  (Each coverage selected would result in a separate QuestionnaireResponse.)
* The DTR app will hit an operation endpoint on the payer (likely similar to that used internally by the CRD service) passing the order and coverage to determine the DTR ruleset.  

This operation will not have a token allowing the payer to access any information other than what's in the order.  This means that the ruleset will often be broader (i.e., more questions and more questionnaire logic) than when the ruleset is determined within CRD.

#### Starting a New Session
To start a new session outside of the context of the CRD workflow, a user or EHR should initiate the launch and pass DTR a fhirContext with the `Order` and `Coverage` fields filled. The DTR app **SHALL** use this information to invoke the `$questionnaire-package` operation on the payer server, which should return a Questionnaire and associated CQL resources. If the base endpoint of the payer server is contained in the `Coverage` resource extension, then the app can be automatically launched. Otherwise, a user will have to manually select which payer to interact with at that point.

[![DTRQuestionnairePackageOperation](questionnaire-package-sequence.png){:style="float: none;width:630px;height:420px"}](questionnaire-package-sequence.png "Sequence Diagram")

#### When the EHR is in a patient context
When the user of the EHR is working in the context of an individual patient and the EHR system allows the launch of a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) application, launching of a DTR compliant application **SHOULD** follow the [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence) as described in [Establish Patient Context](specification.html#establish-patient-context) which will allow the DTR process to establish the patient of interest. When the user of the EHR is not working in the context of an individual patient and the EHR system allows the launch of a SMART on FHIR application, the DTR process should allow the user to select a usage session from all of the sessions available.

The DTR process will then allow the user to restore a session. The possible sessions to restore **SHALL** be based on the user's identity and patient that has been established. Further information on establishing user identity and sessions is available in [Persisting Application State](specification.html#persisting-application-state).

When DTR processes are launched in this manner, in [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system will not provide a `template` property, which would point to a Questionnaire resource. This is an indication to the DTR process that it has been launched outside of the Coverage Requirements Discovery (CRD) workflow.

#### Requesting User Identity
To persist application state, the DTR process will need to know who is currently using the application. SMART on FHIR provides methods for the application to obtain this information.

#### Standalone launch
DTR process **SHALL** support the [Standalone launch sequence](http://hl7.org/fhir/smart%2Dapp%2Dlaunch/#standalone-launch-sequence). In this case, the DTR process **SHALL** establish the user's identity following the procedures in [Requesting User Identity](specification.html#requesting-user-identity).

Once user identity has been established, the DTR process should allow the user to select a usage session from all of the sessions available to that particular user.

#### Launch of DTR by CDex
The [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) implementation guide also uses DTR functionality to [request attachments using questionnaires](https://hl7.org/fhir/us/davinci-cdex/requesting-attachments-questionnaire.html).  See the [CDex Task Data Request Profile](https://hl7.org/fhir/us/davinci-cdex/StructureDefinition-cdex-task-data-request.html).

It is important to note that other IGs might provide additional mechanisms for transmitting the results of the completed QuestionnaireResponse, and the client that launches DTR is responsible for understanding the context of the launch, and thus what to do with any QuestionnaireResponses persisted as a result of that launch.

#### DTR Task
The task resource is used to capture a request for additional actions that arise from the DTR flow. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements. 

Through interactions with the DTR process, a user may be prompted with a question that leads to the discovery of a needed action for the desired treatment to proceed. For example, a healthcare provider may be preparing an order for a Continuous Positive Airway Pressure (CPAP) device. In this example, the payer requires that the provider conduct a sleep study that shows a diagnosis of obstructive sleep apnea. While using the DTR process, it prompts the provider that the CQL/Questionnaire execution was unable to find a sleep study in the Electronic Health Record (EHR) system for the patient. 

The provider can confirm that the sleep study has not yet been conducted and generate a task for office staff to schedule a sleep study directly in the questionnaire interface. Alternatively, the provider could attest that the sleep study was performed or is already scheduled to be performed, either at this provider or another provider. Attestation by the provider can prevent duplicate tests in the case that the patient's electronic record is incomplete.

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;The ability to create tasks or 'to-dos' is outside of the scope of DTR and <b>SHOULD</b> be supported by the EHR implementation.  The questionnaire <b>SHOULD</b> be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire <b>SHOULD</b> be preserved.
</p>

The questionnaire **SHALL** be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire **SHALL** be preserved.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Determination of Payers Supported by a DTR App
It is possible that the apps used to provide DTR functionality will not support all payers the EHR might have "DTR requests" for, either from CRD or CDex.  It is important for the EHR to know what payers their app supports so that they only allow their users to launch the DTR app in the context of payers the app will be able to support.  (Launching an app only to be told "this payer isn't supported" is an unpleasant user experience.)

Where an EHR uses a third-party app rather than implementing DTR app functionality internally, the developer of the app **SHALL** define an endpoint maintaining a list of payers currently supported by that app and EHRs using external DTR apps **SHALL** support accessing the endpoint.  The EHR will be configured with knowledge of which endpoint to hit for a given app as part of the process of configuring support for that app within the EHR.  Different endpoints **SHALL** be defined for different versions of the application in situations where support for payers varies by application version.

Accessing the endpoint will be by a simple `GET` with an Accept header of `application/json` and **SHALL** be performed over [TLS](http://hl7.org/fhir/R4/security.html#http).  The returned JSON object will contain a "payers" property referring to an array of objects.  Each object will have an `id` and `name` property, both with string values.  It is possible that additional properties may be supported in the future.

EHRs will typically retrieve the list of supported payers for the app once per day and will use this information to determine whether to expose the ability to launch DTR for orders associated with coverages for that payer.

<div markdown="1" class="stu-note">
<br>
 &nbsp;&nbsp;&nbsp;Standardization of payer ids is still an open issue.
</div>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Persisting Application State
Users of the DTR process are likely to be performing many tasks to support patient care or administration of the provider organization. As such, it should be expected that users may need to halt interaction with the DTR process and resume it at a later time.

When the provider system can support storage of work in progress, it **SHALL** be stored exclusively on the provider's system.  If the provider cannot store work in progress, then work in progress **SHALL** be stored on the payer's system, in encrypted form, until a time it is considered complete and then at that point it will be stored unencrypted. 

#### How DTR Saves Context of DTR for a Relaunch
  
At any point prior to completion the app **SHOULD** be able to save the session, and then relaunch it later. If an EHR system performs DTR functionality internally, it may save session information however it likes. The guidance below does NOT apply in this scenario. 

Providers may go days to weeks before completing questionnaires and may go many months to a year before completing paperwork and Prior Authorization to claim submission. Therefore, the time span between the creation of a Questionnaire to the completion of QuestionnaireResponse should be accounted for accordingly.

Context for the DTR app is made up of the QuestionnaireResponse, the Questionnaire, the pre-population CQL and its supporting files, the order(s), the coverage, and the patient. The QuestionnaireResponse resource contains a reference to the patient in the `subject` field, and the order(s) and coverage in the `context` extension. From the coverage and order, the DTR app can determine the payer and retrieve the CQL, Questionnaire, and other files from a standard endpoint on the payer server.  

If the DTR app receives a QuestionnaireResponse resource in the app context, it **SHALL** reload the session information from that QuestionnaireResponse using its associated order and coverage.  If the DTR app does not receive a QuestionnaireResponse, it **SHALL** first search the EHR for QuestionnaireResponses associated with the order included in the app context.  Depending on the result of the search, the app will either offer an option to reload context from a found QuestionnaireResponse or launch normally and create a new QuestionnaireResponse.

The EHR **SHOULD** be able to associate orders with the QuestionnaireResponses they pertain to by linking their FHIR IDs internally. This means that even if the ID of an order changes, the EHR **SHOULD** be capable of updating the QuestionnaireResponse to reference the new ID. This way, even if DTR receives the updated orders, it will still be able to search the EHR for the associated QuestionnaireResponse.  

The EHR is responsible for storing and updating the QuestionnaireResponse, as well as providing the user a way to choose sessions to relaunch. Additionally, the EHR **SHOULD** pass the QuestionnaireResponse as a [SMART launch parameter](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#app-launch-scopes-and-launch-context).

When the DTR app receives a QuestionnaireResponse but does not receive a Questionnaire URL, it should check the QuestionnaireResponse for the context extension. The contents of the extension can be sent to the CRD payer server using the questionnaire-for-order operation. The CRD payer server will return a Questionnaire if one is relevant for the provided coverage and order.

The contents of the extension can be sent to the payer server using the [questionnaire-package operation](OperationDefinition-questionnaire-package.html).  The payer server **SHALL** return a Questionnaire upon receiving a valid coverage and order.

If the app is a DTR SMART app (and not a DTR Native App) then it **SHALL** use [SMART Backend Services authentication](https://build.fhir.org/ig/HL7/smart-app-launch/backend-services.html).

A PDF **MAY**  include prior authorization information, if appropriate. Information in the PDF is not machine readable, and association with the order or prior authorization request must be done by hand. 

When launched with context of the organization, patient, and user, the app **SHOULD** display a list of open or “in-progress” QuestionnaireResponses for the user to select from, scoped to the patient that is in context. The DTR app should check the EHR for stored sessions.  The QuestionnaireResponses on the EHR has a reference to the order which it is linked to, which can be used to search for the correct resource.  

When launched in standalone mode, the app **SHOULD** include the `launch/patient` scope to indicate that the EHR needs to provide patient context. The app can use the returned patient to search for relevant unfinished sessions.  Since a patient won’t be in context, the app **SHOULD** provide a selection of patients that the user can choose from (Currently this would be from the EHR). 
 
The DTR app **SHALL** only be scoped to one patient and be prohibited from accessing resources aside from the ones the EHR has authorized it to gain access to. The DTR app **SHOULD NOT** be allowed to query all in-progress QuestionnaireResponses without specifying a patient to limit the search.  

##### SMART App Launch Framework IG
Using the SMART App Launch Framework IG, the DTR process **SHOULD** request [scopes for requesting identity data](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#scopes-for-requesting-identity-data), namely `openid` and `fhirUser`. The DTR process can then retrieve the FHIR resource representing the current person and extract whatever identifiers it deems necessary for the persistence of application state.

The EHR's authorization server **SHALL** support the `openid` and `fhirUser` scopes, due to the importance of the `fhirUser` element in the QuestionnaireResponse resource.

#### Resuming Work in-Progress
In order to resume a work-in-progress that has been persisted, there are three basic requirements:
- The user must be from the same organization
- The user must have authority to access the patient (i.e., launch from patient context)
- The user must have authority to use DTR

##### Visibility of Usage Sessions to Other Users

Depending on workflows within an organization, implementations **SHALL** allow for one authorized user to start a session, and have it completed by another authorized user. 

The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) and FHIR specification provide methods for discovering information about the user and how that user fits into the provider organization. With this information, the DTR process, possibly consulting with the payer and provider IT systems, can decide which usage sessions to expose to a given user.

As an example, the DTR process may retrieve a Practitioner resource by retrieving the URL supplied in the `fhirUser` claim. The DTR process may then query the CareTeam or PractitionerRole resources to determine their relationship to other staff in the provider organization and determine if their usage sessions should also be made available.

Furthermore, the notion of workflows and multiple users could get extended to work queues. The EHR could maintain a list of in-progress FHIR Questionnaires and store a reference to each of these within the EHR for the clinicians and other employees within the organization to continue working on. There could be built in mechanisms to assign FHIR Tasks for the work to the queues of other employees. Specific details surrounding this type of work queue implementation are out of the scope for this IG.

#### Session Expiration
While a user might need to suspend interaction with the DTR process, there could possibly be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started five years in the past.

Payers **SHOULD** use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid. The DTR process **SHALL NOT** allow completion of a usage session if the current time has exceeded the end of the `effectivePeriod`.

The system can decide how long to wait before deleting an old session. 

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Persisting Results
When the DTR process has collected all of the necessary information, it **SHALL** save the results of the data collection to the patient record. This IG describes two methods for saving the collected information: a text block in the Electronic Health Record (EHR) System and a QuestionnaireResponse.

The information that is collected (via the Questionnaire interaction with the user) **SHOULD** be written to the EHR via the available FHIR API. The results of the QuestionnaireResponse **SHALL** be saved as the FHIR resource and/or as a human readable format that is supported by the EHR.

If the EHR has the capability to render a QuestionnaireResponse, it **SHOULD** save the QuestionnaireResponse as part of the patient record. If the EHR does not have ability to render the questionnaireResponse, then the EHR **SHOULD** support saving the QuestionnaireResponse information as whichever supported structure produces the least impact on users.  Implementers are strongly encouraged to use the most reusable, discrete form of data they can. 

#### QuestionnaireResponse
The DTR process creates a QuestionnaireResponse resource through the course of normal operation. This resource **SHOULD** be saved to the patient record in the EHR system of the healthcare provider if supported. It **MAY** also be transmitted to the payer IT system.

Updating work-in-progress (WIP) QuestionnaireResponses may save time and effort. In cases of QuestionnaireResponse updates, the App **SHALL** have the ability to continue, **SHOULD** allow the ability to start over, and **MAY**, for non-adaptive forms, provide the ability to ability to refresh and retain or discard provider entered information during a refresh. The data in the QuestionnaireResponse **SHOULD** be refreshed where possible with the latest data from the EHR system. 

##### Interaction with Payer API
The payer IT system should support the FHIR create interaction to allow the DTR process to send the QuestionnaireResponse resource to the payer. The FHIR endpoint for the payer **MAY** require authentication. If it is required, it **SHALL** follow the procedures described in [Authentication of SMART on FHIR application to payer API](specification.html#authentication-of-smart-on-fhir-application-to-payer-api).

##### Pushing QuestionnaireResponse to Payer
This IG will support the [HRex Decision point – Configured by consumer?](http://build.fhir.org/ig/HL7/davinci-ehrx/exchanging.html#configured-by-consumer) when a DTR SMART App or DTR Native App wants to push a QuestionnaireResponse to a Payer.  

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Other IGs might provide additional mechanisms for transmitting results of the completed QuestionnaireResponse to the payer.  The client that launches DTR is responsible for understanding the context of the launch, and thus for what to do with any QuestionnaireResponses that are persisted as a result of that launch.
</p>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### How DTR passes information to PAS, FOE or Other Exchanges
The DTR application **SHALL** save the QuestionnaireResponse to the EHR upon completion (see section [Persisting Results](specification.html#persisting-results)). The next step after completing the Questionnaire may include sending a Claim to a PAS [(Prior Auth Support)](http://build.fhir.org/ig/HL7/davinci-pas/) server for or an Order to FOE [(FHIR Orders Exchange)](http://build.fhir.org/ig/HL7/dme-orders/) for ordering. Specifications on required resources can be found in the Implementation Guides for each of those use cases.  
 
The QuestionnaireResponse may include groups (items with specific linkIds) that contain references to resources to include. These may be attachments needed by either PAS or FOE. Also  subject, author, and source will be included.

There are some expectations around how DTR will pass this information:  
* Save the QuestionnaireResponse (only) on the EHR once it is complete.   
* The QuestionnaireResponse may include groups (with magic linkIds) that contain references to resources to include, for example, as attachments in PAS, in claim submission or as attachments to the order (e.g., FOE).     
* There **SHOULD** be a magic linkId that includes the order id of the order the   QuestionnaireResponse is associated with that an EHR could use after-the-fact to establishing a link (if the temporary id of the in-memory order is retained/meaningful).   
 
#### Prior Authorization Support (PAS) 
The PAS Bundle linkId **SHOULD** be used for attached bundles containing resources needed for PAS. All of the referenced resources needed for PAS **SHALL** be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Claim sent to PAS. If the [ClaimResponse](http://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-claimresponse.html) has already been received from a PAS request, this **SHALL** be stored in the QuestionnaireResponse with a reference to it in the items list as well. (All references to a ClaimResponse **SHALL** refer to the [HRex Prior Authorization profile of ClaimResponse](http://hl7.org/fhir/us/davinci-hrex/STU1/StructureDefinition-hrex-claimresponse.html))
 
#### FHIR Orders Exchange (FOE) 
The FOE Bundle linkId should be used for attached bundles containing resources needed for FHIR Orders Exchange. All the referenced resources needed for FOE **SHALL** be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Order sent to FOE. If a response has already been received from a FOE request, this **SHALL** be stored in the QuestionnaireResponse with a reference to it in the items list as well. (See the [FOE Implementation Guide](http://build.fhir.org/ig/HL7/dme-orders/) for more details)

#### Additional Workflow
In a QuestionnaireResponse, this will be a 'repeating' question with one or more answers with a linkId of "DTR_TASK".  The question type will be 'Reference' and will refer to contained Task instances that describe workflow actions that need to occur, such as the creation of additional companion orders, pre-execution testing, follow-up orders, etc. These are created when the completion of the questionnaire has made evident that certain workflow steps necessary to satisfy payer requirements were confirmed missing by the user.  The EHR **SHOULD** add 'to do' items to the user's task list that correspond to the actions described within the Task instances.

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;It may be appropriate to re-execute the DTR process once the specified tasks have been completed, as the DTR results may change.
</p>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Value Set and Code System Guidance
The table below is guidance that **SHOULD** be used when using values sets and code systems in DTR, and can also be considered a best practice.

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

According to the [ValueSet Identification](https://www.hl7.org/fhir/valueset.html#ident), it is common practice to copy (cache) value sets locally, most references to value sets use the canonical URL. This IG specifies that the DTR application **SHALL** support the [$expand](https://hl7.org/fhir/R4/valueset-operation-expand.html) operation, as well as the [Preferred Terminology Server](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-preferredTerminologyServer.html) extension.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------

### Use of CQL 
As part of the SDC Questionnaires that define the information payers require to be captured, CQL is used to support automatic population of answers from existing EHR data and, occasionally, to enforce complex logic around what questions should be displayed.  For example, whether answers are required, what answers should be enabled, etc.  This CQL may query for patient observations, conditions, or other discrete information within the EHR to use as part of the population process or logic.  The SDC specification provides guidance about how [CQL expressions](http://build.fhir.org/ig/HL7/sdc/expressions.html#using-expressions) can be used for different purposes, as well as how information gathered by CQL in one portion of the Questionnaire can be made available in other portions of the Questionnaire.  

One of the core purposes of this specification is to automate the retrieval of documentation required by the payer in a manner that reduces provider burden. Authors of DTR questionnaires **SHOULD** include CQL to auto-populate the questionnaire as much as possible. Due to differences in workflows or information systems, clinical information may be represented in different FHIR resources or with different codes or code systems. Therefore, payer CQL may have to examine different resources or use value sets to find patient information. It is preferable to have more extensive CQL or value sets than require a user to input values that the rules were unable to find.

In general CQL **SHALL** be used when pre-populating anything exposed in the FHIR based patient data access API ([The 21st Century Cures Act API](https://www.congress.gov/bill/114th-congress/house-bill/34/text?q=%7B%22search%22%3A%5B%22HR+34%22%5D%7D&r=1)).

#### Guidance on Structure of CQL Logic
Like many other programming languages, CQL allows for statements to be nested within conditional logic. This creates instances where some statements may not be executed due to a prior condition being met. This behavior should be used intentionally by payers creating CQL.  This implementation guide does not support authorization logic in the CQL.

Data retrieval is highly dependent on the `enableWhen`` attribute/element:

1. Questionnaires **SHOULD** be designed with appropriate use of `enableWhen` such that questions are only displayed when needed.

2. CQL logic should be partitioned to be specific to groups/questions/etc. when doing so will allow it to be more efficient - though consideration should also be given to whether performing significant data gathering at the outset (even if the data is unneeded) will produce a more positive experience than intermittent data retrieval 'on demand', when such retrieval may introduce user-interface delays.

This pattern of logic structure is referred to by several names, including *eager quitting*, *early return* or, *short circuiting*. The goal is to avoid the execution of statements if they will not be relevant given other information available to the logic. This is done to streamline workflow and allow the user to focus on relevant input fields.

As an example, a payer may have a set of rules or specific information that must be gathered on a patient only if they have diabetes. This information may be gathered through a series of CQL statements. When constructing this CQL for DTR, these statements **SHOULD** be nested in conditionals to first check if the patient has diabetes before checking for information dependent on that condition.  
  
<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Implementers could use <a href="specification.html#sdc-adaptive-forms">Adaptive Forms</a> to minimize the need for any CQL that provides conditional informational retrieval. 
</p>

#### Expression Naming Conventions
CQL allows for the gathering of information through the use of `define` statements. These statements are given an identifier. When CQL execution is complete, a context will be created where these identifiers are populated with the results of the statement execution.

DTR makes use of the identifier names within the CQL. The DTR process will examine the payer supplied Questionnaire resource. 

This resource **SHALL** conform to the [DTR SDC Questionnaire](StructureDefinition-dtr-sdc-questionnaire.html):  
  * Resources are retrieved from the EHR FHIR server with RESTful queries and CQL is executed to extract relevant information.
  * Values extracted from the FHIR resources are assigned identifier strings and the DTR process will then use these statement identifiers to retrieve a value from the CQL execution. 
  
The resulting value is used to satisfy documentation requirements. If the value is `null`, the user will be prompted to supply a value.

#### CQL Constraints
CQL for use in DTR **SHALL** have a `context` of "Patient".  Within the Questionnaire, CQL **SHALL** follow SDC rules for determining context.  Specifically, CQL definitions and variables defined on ancestor elements or preceding expression extensions within the same Questionnaire item are in scope for referencing in descendant/following expressions.  The CQL **SHALL** be version [CQL STU2](http://cql.hl7.org/N1/) or later.

#### Execution of CQL
##### Retrieval of patient FHIR resources to supply to CQL execution engine
The app **SHOULD** retrieve the FHIR resources specified in the `dataRequirement` section of a [Library](https://www.hl7.org/fhir/library.html), it can then pass these resources to the Clinical Quality Language (CQL) engine. Using `dataRequirement` allows for a more declarative means of understanding the resource data needed from the EHR. For example, the below snippet is from a `Library` that contains a `dataRequirement` section. In this code snippet the resource data needed from the EHR is Condition. 

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

The app **SHALL** be provided with a token that allows it to access relevant information for the patient in question. The token is provided by the EHR or the application that controls access to the patient's record. Depending on user permissions, the app may not have access to all the data. The app developer should consider the possibility that access to some data may be restricted or prohibited and access restrictions may happen silently (e.g., indistinguishable absent data). The app’s CQL execution engine **SHOULD** constrain queries to reduce data retrieval overhead. (for example, if the CQL logic filters for medications meeting certain conditions. It is acceptable if the engine retrieves all medications for the patient, even if a more constrained query was possible).

As discussed in the Execution Results section below, it’s possible not every CQL statement will be executed (for example some questions may only be relevant given certain answers to prior questions). In order to reduce data transfers and increase overall speed, data **MAY** be fetched as needed. However, the app’s execution engine **MAY** be implemented using a different strategy (for example by doing bulk fetches before starting execution).

##### Engine Execution

The FHIR Library containing/referencing a CQL logic file can reference other needed CQL files (e.g., helper libraries) using the `relatedArtifact` field and a `RelatedArtifact` with a `type` of `depends-on`. The engine **SHALL** make available to the execution context all such referenced CQL libraries. If the Questionnaire has multiple `cqf-library` fields, then any `valueExpression` must specify the library name as well as the statement name as follows: `"LibraryName".statementName`.

This Implementation Guide's use of CQL **SHALL** be [CQL version 1](http://cql.hl7.org/N1/).

##### Behavior when receiving malformed CQL
If the CQL is malformed (is not syntactically correct) in any way, the app’s execution engine **SHALL NOT** attempt any execution of the malformed CQL, the app **SHALL** log the error, and the user **SHALL** be notified with an appropriate message indicating that population did not occur and they **SHALL** be allowed to enter the information manually either now or at a later time. The app **SHOULD** log failures and ensure the maintainer of the CQL/Questionnaire package is notified (see the [DTR Log Questionnaire Errors operation](OperationDefinition-log-questionnaire-errors.html) for details). 

In an effort to notify the appropriate party or maintainer that the CQL/Questionnaire is malformed, the app developer **SHOULD** use FHIR resource OperationOutcome. The details property of the OperationOutcome should use `MSG_BAD_SYNTAX` to indicate syntactical errors. The destination of the OperationOutcome should be the endpoint the malformed CQL/Questionnaire was retrieved from.

It is a CQL failure if the CQL cannot be executed by the app's CQL engine in the SMART on FHIR app or in a capable EHR.  

##### Behavior when encountering execution errors
If any errors are encountered during execution, the app’s engine **SHALL NOT** attempt any further execution, and the user **SHALL** be notified with an appropriate on-screen error message. The app **SHALL** log failures and ensure the maintainer of the CQL/Questionnaire package is notified. The user should have the option to complete the Questionnaire if possible, despite the error.

<p markdown="1" class="notebox">
<b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;A query for data that returns no results <b>SHALL NOT</b> be considered a failure.
</p>

##### Logging Errors and Failures
In an effort to notify the appropriate party or maintainer that the Questionnaire/CQL produces errors, this IG includes the [Log Questionnaire Errors](OperationDefinition-log-questionnaire-errors.html) operation that allows submission of issues encountered when working with these DTR-provided artifacts. This operation **SHOULD** be supported by payers and DTR applications. This operation will pass in the Questionnaire and an OperationOutcome detailing the issue(s) including where the error occurred. The input OperationOutcome **SHOULD** include information on the DTR application identity and version, date-time with time-zone offset, as well as the provider endpoint during which the error occurred, and it **SHALL NOT** contain information about the response or information retrieved from FHIR APIs that could potentially include PHI.

##### Execution Results
The flow of execution of the CQL will be determined by the associated Questionnaire. The app will proceed through the Questionnaire, and for any question that is associated with the result of a CQL statement, that specific CQL statement will be executed. The DTR application will use result caching so that results that are already available will be reused without requesting them again.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Requesting Additional Information from the User
While the goal of DTR is to automatically gather all of the necessary information to satisfy documentation requirements without interrupting the user, this is not possible in all cases. 

It is likely that at least some answers will not be able to be gleaned from the EHR, due to missing data, data that is not computable, or data that is not represented in a standardized way.  Also, even where answers are determined automatically, users may wish to review them for accuracy and completeness.  Therefore, the system acting as a form filler is responsible for displaying all 'enabled' questions, groups and display items to the end user for completion and/or review

When the execution of Clinical Quality Language (CQL) is unable to obtain the required data, it is necessary to prompt the user for more input.

#### Questionnaire Rendering
DTR leverages a subset of extensions and capabilities defined by the SDC implementation guide to support control over rendering, flow logic, and population and calculation of answers.  The [DTR SDC Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire.html) and [DTR Adaptive Questionnaire profile](StructureDefinition-dtr-sdc-questionnaire-adapt.html) identify the set of core elements and extensions that must be supported by 'full' EHRs and DTR solutions in terms of rendering and processing Questionnaires and their associated responses - and the elements that payers can count on being supported in the Questionnaires they expose.

Two different profiles are used to support two different approaches to managing questionnaire logic and two different levels of engagement between the form filling interface and the payer:

* [DTR SDC Questionnaire](StructureDefinition-dtr-sdc-questionnaire.html) - all logic around what questions should be displayed, what answers are available, etc. is embedded in the Questionnaire (or in libraries linked to from the Questionnaire).  The only interaction with the payer is to retrieve the Questionnaire appropriate for a particular order or set of orders for a given set of patient coverage.  The only possible result from the DTR process is a completed QuestionnaireResponse.

* [DTR Adaptive Questionnaire](StructureDefinition-dtr-sdc-questionnaire-adapt.html) - the logic around what questions should be displayed and what answers are available is managed within software maintained by the payer.  The only CQL needed in the Questionnaire is that needed to support populating question answers.  The form filling process interacts with the payer continuously during the process of filling out the QuestionnaireResponse.  This interactivity means that it is possible for a payer to provide a Service Coverage Determination along with the QuestionnaireResponse.  
  
Implementers should review the [advanced rendering]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html), [advanced behavior]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/behavior.html), [population]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/populate.html) and [adaptive forms]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/adaptive.html) portions of the SDC implementation guide, focusing on the elements and extensions included in the DTR profiles.  Implementers should also be familiar with the documentation about the [Questionnaire](http://hl7.org/fhir/R4/questionnaire.html) and [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html) resources from the core FHIR specification.  Conformance with DTR requires conformance with the relevant portions of the SDC implementation guide".

All DTR applications **SHALL** support rendering according to the extensions supported in the DTR Questionnaire profile as well as executing all CQL found within Questionnaire extensions. Payers **SHALL** craft their Questionnaires such that they include CQL that attempts to pre-populate QuestionnaireResponse answers where such population can be accomplished using discrete data returned by EHR FHIR APIs that are required as part of current regulation (including simple calculations there-on - e.g., age from birthdate). Translation between standard codes **SHOULD** be supported where possible.  CQL and FHIR Questionnaires **SHALL** be required even when DTR is implemented within a DTR Native App as opposed to a DTR SMART App.

#### Structured Data Capture
Payers may have requirements on how questions are presented to users. To allow for this, payers **MAY** supply Questionnaire resources that conform to the [Advanced Rendering Questionnaire Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}/rendering.html) as defined in Structured Data Capture.

If the `rendering-styleSensitive` extension property is not present or `false` the DTR process **SHOULD** use `rendering-style` and `rendering-xhtml` properties.  The purpose of this extension is to indicate that it is not SAFE to render the form if the styles indicated in the Questionnaire are not followed. If the system is not capable of rendering the form as the Questionnaire dictates, then it cannot display the form.  Note the use of this flag should be extremely rare in DTR.

##### Rendering Questionnaire items without specified styles
Payers are not required to provide Questionnaires that conform to the Advanced Rendering Questionnaire Profile. When a Questionnaire is provided that does not conform to this profile, it is at the discretion of the DTR process to choose a reasonable presentation of the questions that require user input. The DTR process **SHALL** use the appropriate input mechanism depending on the `item.type`. When working with a FHIR R4 Questionnaire, the DTR process **SHALL** support `item.answerValueSet`, `item.answerOption`, and `item.initial` if provided.

##### Rendering multiple items
This IG does not place any requirements on the DTR process to display multiple `Questionnaire.item`s to a user at a time or only a single `item`.  Implementers should decide which method of displaying questions makes the most sense within the end user workflow. We encourage Questionnaire designs that minimize the number of questions that are necessary to view/complete (i.e., if an answer obviates the need to complete a section, then the section should not appear for completion, unless local workflow(s) determine a need for editing or review).

#### Provider Attestation
In some cases, if there isn't specific data that can be retrieved computably from the EHR, it may be sufficient for a payer to merely have an attestation by the provider that certain documentation exists, that a certain patient condition exists, or that certain actions have been completed.  This can be represented in a Questionnaire as a simple boolean or choice question where the text describes what the user is attesting to.  Payers **SHOULD** design questionnaires to support attestation rather than discrete data where this is sufficient for the business requirements.

Some payers may require that attestations or other answers be 'signed' (the electronic equivalent of 'initialing' the answer).  This would be identified by means of the [signatureRequired](https://hl7.org/fhir/extensions/StructureDefinition-questionnaire-signatureRequired.html) extension on the Questionnaire item and the [signature](https://hl7.org/fhir/extensions/StructureDefinition-questionnaireresponse-signature.html) extension on the QuestionnaireResponse.

Questionnaires may also support attaching reports or other supporting documentation (e.g., images, pathology reports, etc.) where providing question answers is not sufficient.  The 'attachment' question type can be used to support this.  Attachments might be found by searching for DocumentReference, DiagnosticReport or Media instances, or by the provider directly uploading something to the Questionnaire rendering tool.  

#### Recording Responses
The DTR process **SHALL** take input from the user and record the provided information. As with provider attestation, the DTR process **SHALL** record that in the corresponding QuestionnaireResponse.item. In this case, the DTR process **SHALL** create an `answer` property on the `item`. The `answer` **SHALL** have an appropriate `value[x]` depending on the corresponding `type` in the `Questionnaire.item`. Again, similar to attestations, the `item` will have an [`author` extension](https://hl7.org/fhir/extensions/StructureDefinition-questionnaireresponse-author.html) property which will reference the `fhirUser` provided to the DTR process.

##### QuestionnaireResponse
The DTR process **SHALL** create a QuestionnaireResponse resource based on all of the information collected. 
  
Given the following JSON fragment representing a `Questionnaire.item`:
```json
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
<br>
The following `QuestionnaireResponse.item` JSON fragment would be created assuming that the patient's age is 65 years old and that this information was gathered through CQL execution.
```json
{
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```
<br>
If the value was supplied by the user, the `author` extension property will be set. The following `QuestionnaireResponse.item` JSON fragment provides an example of this:
```json
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
<br>
Finally, if the user did not supply a value, but provided an attestation that the information exists in the patient's record, it would be represented by the following  `QuestionnaireResponse.item` JSON fragment:
```json
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
the DTR process **SHALL** populate the `QuestionnaireResponse.item.answer` with the `author` property of the `InformationOrigin` extension if the item was created by user input. If the `author` property is not present, then the information was gathered through the execution of CQL (see the [`InformationOrigin`](StructureDefinition-information-origin.html) extension for specific options and requirements).

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Privacy, Safety and Security

Guidance and conformance expectations around privacy and security are provided by all three specifications this IG relies on. Implementers **SHALL** be familiar with and adhere primarily to any security and privacy rules defined by Da Vinci [HRex Privacy and Security](http://build.fhir.org/ig/HL7/davinci-ehrx/security.html).  

Implementers **SHALL** also adhere to the security guidelines defined in:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch Framework](http://www.hl7.org/fhir/smart-app-launch)

The DTR / SMART on FHIR application will have access to the scope of data authorized by the organization as appropriate for use by the app, and accessible to the user. This scope granted may provide the  SMART on FHIR application  access to more data than is needed for the specific situation. For example, if `Observation.read` capabilities are needed, the app will have access to all observations for that patient. For compliance with HIPAA Minimum Necessary, the CQL **SHALL** limit requests for information from the EHR's API to only items that are relevant to the documentation requirements for which DTR was launched (e.g., documentation requirements for a service that requires prior authorization).

Compliant questionnaires **SHALL NOT** include hidden or read-only questions unless the information is populated by the payer or their out-sourced service.  If information is privacy restricted, the information **SHOULD** be treated as if it does not exist. The provider **SHOULD** ask the patient if they want to share the information with the payer.

Any EHR with SMART on FHIR support **SHOULD** be prepared to deal with the implications of providing a client with the scopes they request. For example, EHRs **SHOULD** limit FHIR search capabilities for clients, requiring a patient ID in any search query to ensure the client can only access resources related to that patient.

When meeting the DTR / SMART on FHIR app requirements using a distinct app (i.e., not within the EHR), the app **SHALL** have a distinct client id for when it’s being invoked purely as a mechanism to supplement EHR data vs. when it is being invoked to share data back to the payer.

<p markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;CRD and DTR are designed to function without use case Prior Authorization Support (PAS). For example, to augment the documentation of medical necessity. Since not all orders require Prior Authorization some only require documentation therefore not all QuestionnaireResponses will need to be sent to a payer or PAS service.
</p>
<br>
This will allow the scopes to be different depending on whether data is expected to flow to the payer. It will also allow the EHR to appropriately audit data accesses where data will flow external to the EHR. Additionally, there is a requirement that the data passed to a payer **SHALL** also be stored in the EHR where it can be audited for appropriate use.

It is under the control of the SMART on FHIR app or the capable EHR, based on the API access scope, what information is accessible to be included in the QuestionnaireResponse. The SMART on FHIR app cannot be responsible for informing the user that the information exists in the patient’s record but is inaccessible to the application. This may differ depending on whether it is a native EHR application or a third-party application.

It is important for implementers to be aware that data is going to be auto-populated that could be considered sensitive - so there will likely be a need for a human to review and confirm that the information is appropriate to be shared (and be able to remove it without risk of it being put back if they wish).  Also the app may not have access to certain data for retrieval because of security considerations.

Payer systems **SHALL** use information received during execution of DTR solely for the purpose for which the documentation template was created (typically processing of a specific claim or prior authorization request) and **SHALL NOT** use information received over the DTR interfaces for any additional purposes other than audit.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Best Practices 

#### The use of OIDs

If OIDs are used they **SHALL** be prefixed with `urn:oid:` per the [OID primitive datatype definition](https://www.hl7.org/fhir/datatypes.html#oid).

#### Referencing value sets in Questionnaires

When remote value sets are referenced in Questionnaires, full URLs are recommended. If you are using local value sets a relative path is recommended. 

<p markdown="1" class="notebox">
<b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Expanding a large value set at run time, may slow down the DTR app. In other words, having the value set already expanded could give the user a better client side experience.
</p>

#### Questionnaires and expressions

When referencing expressions in libraries such as a CQL library, the name of the library should be included.  

e.g., "expression": "\\"LowerLimbProsthesis\\".PhysicalExaminationType"

In this example above `LowerLimbProsthesis` is the `library name` and `PhysicalExaminationType` is the `expression name`.

#### FHIR Library and included CQL

When developing FHIR Libraries that depend on CQL content, the content element **SHALL** include the `data` element. 

<p markdown="1" class="notebox">
<b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;The use of the `data` element requires it to contain a base-64 encoded string that represents the CQL file per the <a href="https://www.hl7.org/fhir/datatypes.html#Attachment">attachment specification</a>.
</p>
<br>

For example, note this snippet from a FHIR Library:

[![FHIR Library snippet](FHIR_Library_snippet.png){:style="float: none;width:1160px;height:240px"}](FHIR_Library_snippet.png "View Image")
  
<p markdown="1" class="notebox">
<b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;Although the use of `url` in the content element is valid, using the `data` element will likely be more interoperable.
</p>

A reference implementation has been created. The code is available at [DTR GitHub](https://github.com/HL7-DaVinci/dtr). The executable is at [DTR Logica Health](https://davinci-dtr.logicahealth.org/smart/launch.html).

 