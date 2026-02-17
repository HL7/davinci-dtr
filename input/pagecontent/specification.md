<link rel="stylesheet" type="text/css" href="formatting.css" />

### Overview
This page is organized into several sections reflecting the various steps involved in implementing DTR.  These steps are organized in roughly the order they would typically occur, though some variation in order is possible.

The core of this process is summarized in this diagram:

[![DTRQuestionnairePackageOperation](Sequence-Diagram.png){:style="float: none;width:716px;height:465px"}](Sequence-Diagram.png "Sequence Diagram")


<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
A DTR client that is currently only able to communicate to a single payer is not considered to be a 'portal' for the purposes of the conformance language in this guide. However, DTR clients that do not allow providers to interoperate with most/all payers are strongly discouraged, as the guide's intention is that providers should typically only have to deal with the interface of a single DTR client, regardless of what payers their patients need.  <span>§spec-1^dtr-server^exchange:Payer DTR services <b>SHALL NOT</b> work preferentially with their own apps for IG-defined functionality, though clients and services <b>MAY</b> offer additional behavior above and beyond what's covered in this specification.§</span>
      </td></tr>
  </table>
</div>
<br>


#### EHRs and Payers
Throughout this guide, the term 'EHR' refers to the set of systems acting on behalf of a provider, whether managed directly by the provider organization or by a third-party agency.  Similarly, 'payer' refers to the set of systems acting on behalf of the payer, whether managed directly by the payer or by a third-party agency.  For additional discussion about how this implementation guide functions when EHR and/or payer systems are not monolithic but instead are made up of components, refer to the [ePA Coordinators page](epa.html).

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")  

---------------------
### Impact on payer processes
Information passed to DTR will typically contain clinical terminologies, might not contain billing terminologies, and will generally not include billing modifier codes or similar information typically included in prior authorization requests. Services will also need to consider that the mapping they perform between clinical terminologies and billing codes could be different than the bill coding process performed by the client system when claims are eventually submitted. This could mean that assertions about coverage or prior authorization requirements will need to be expressed conditionally (e.g., "Provided this service is billed as X, Y or Z, then prior authorization is not needed").

In situations where the DTR App is aware of the likely billing codes at the time of ordering, it might send these codes as additional CodeableConcept.coding repetitions to assist in server processing. If CPT is used, note the ability to convey CPT modifier codes via post-coordination as described in the Using CPT page on [terminology.hl7.org](https://terminology.hl7.org/).

It is more efficient if mappings can be shared across payers and providers. This implementation guide encourages industry participants to cooperate on the development of shared mappings and/or to work with terminology developers (e.g., AMA for CPT codes) to develop shared mappings as part of their code maintenance process.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Configuring Connectivity

#### EHR to App Connectivity
[![Connectivity-EHR-to-App](Connectivity-EHR-to-App.png){:style="float: none;width:256px;height:67px"}](Connectivity-EHR-to-App.png "EHR to App Connectivity")

EHRs have the option of delivering DTR functionality internally or leveraging a DTR [SMART on FHIR Application](https://www.hl7.org/fhir/smart-app-launch/) (SMART App) that handles the primary data capture and population functions of the DTR process.  Such SMART applications may be developed by the EHR vendors, by payers, or by third parties.

DTR apps are expected to be technically able to run against any EHR and work with any payer. §spec-2^dtr-client^business:This means that EHRs are free to choose which app they prefer and **MAY** switch apps as they see fit.§  However, for a DTR app to be used it needs to be trusted appropriately to manage access to personal health information by the EHRs and payers. EHRs that leverage DTR SMART apps will choose which DTR apps they will trust and support.  §spec-3?^dtr-client^business:In some cases, an EHR **MAY** opt to support multiple DTR SMART apps.§  If so, the EHR will be responsible for determining which app is used in which circumstances.

SMART on FHIR defines the basic expectations for an EHR to [register a SMART app](https://www.hl7.org/fhir/smart-app-launch/app-launch.html#register-app-with-ehr).  Most EHRs and organizations impose additional registration expectations.  DTR imposes an additional expectation as part of the app registration process, which is discussed in more detail in the [Determination of Payers Supported by a DTR App](specification.html#determination-of-payers-supported-by-a-dtr-app) section of this specification.

#### App/EHR to Payer Connectivity
[![Connectivity-App-to-Payer](Connectivity-App-to-Payer.png){:style="float: none;width:330px;height:118px"}](Connectivity-App-to-Payer.png "App to Payer Connectivity")

§spec-4^dtr-client^business:Similarly, all DTR apps **SHALL** be registered with the payer systems with which they communicate.  If an EHR opts to interact with the payer directly without using an app, then the EHR itself will need to register.§

Initial setup of connectivity between client and payer will have a manual component to establish security credentials and a trust relationship (unless both parties are part of a shared trust network).  Dynamic endpoint discovery allows for the potential to use different endpoints for the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation over time without changing security credential or legal agreement expectations.

§spec-5^dtr-server^processing:Payers **MAY** have multiple back-end functions that handle different types of decision support and/or different types of services.§ §spec-6^dtr-server^exchange:However, for the purpose of DTR conformance, payers **SHALL** have a single endpoint (managed by themselves or a delegate) that can handle responding to all DTR service calls.§

§spec-7^dtr-client,dtr-server^business:This registration process **SHALL** ensure that the DTR app or Full EHR (i.e., Native App):§
* Is 'trusted' by the payer to deal with patient-identifiable data (i.e., There is a BAA, or its equivalent, in place between the Payer and the application vendor).
* Knows the relevant endpoint to use for the payer to access the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation.
* Has communicated the public keys to enable [SMART on FHIR Backend Services](https://www.hl7.org/fhir/smart-app-launch/backend-services.html).
  
§spec-8^dtr-client,dtr-server^exchange:Implementers of this IG **SHOULD** support the [endpoint discovery]({{site.data.fhir.ver.hrex}}/endpoint-discovery.html) mechanism defined in the HRex specification to allow discovery of the endpoints used in this IG - specifically the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation endpoint used to retrieve the Questionnaires and associated libraries, value sets, etc. to be completed.§  

(Also see [Authenticating DTR client to payer API](specification.html#authenticating-dtr-client-to-payer-api))

§spec-9^dtr-client,dtr-server^business:Even after an application has been successfully registered, payers and EHRs **SHOULD** monitor the application behavior and **MAY** suspend an application's access if it is suspected of malicious behavior.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
<span>§spec-10^dtr-server^business:Some payers <b>MAY</b> create Questionnaires that rely on code systems that require licensing for use where there isn’t already a cross-U.S. license in place (e.g., UB, CPT).§</span>  In such cases, the payer, provider, and if necessary, the SMART on FHIR app vendor will need to have the relevant licenses to display, store, and retransmit the information captured.  <span>§spec-11^dtr-client,dtr-server^business:The expectations around licensing requirements <b>SHALL</b> be established as part of the configuration process between the parties.§</span>
      </td></tr>
  </table>
</div><br>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Defining Questionnaires

#### Questionnaire Use
Payers have documentation requirements and rules that must be satisfied as part of their typical operations when reimbursing for care for certain services requiring authorization or documentation.
The Questionnaire resource is used to represent the information needs that providers must satisfy to meet payer documentation requirements and/or rules. The Questionnaire resource allows specifying:  

* What questions are asked
* What constraints exist on allowed answers (data types, choice lists, etc.) 
* Logic about which questions are enabled or disabled based on prior answers or other context
* How questions are organized and grouped
* Rules about what answers are mandatory or may have multiple answers
* How the questions should be rendered (tables, drop-downs, etc.)
* How to automatically fill in answers to some of the questions based on data already available from the EHR
* Etc.

The base Questionnaire resource defines some of these capabilities.  However, to allow specifying all the expectations needed to meet payer requirements for data collection forms, additional extensions are necessary.  DTR leverages the extended Questionnaire capabilities defined in the [Structured Data Capture (SDC) implementation guide](http://hl7.org/fhir/uv/sdc/STU3/) to define the complete set of functionality necessary to support data capture for payer purposes.  

§spec-12^dtr-server^exchange:DTR services **SHOULD** have DTR questionnaires available for all covered items that require additional data collection to support prior auth submission, claim submission, or appropriate use documentation. (Future versions of this guide will likely tighten this expectation to a 'SHALL')§<a id="spec-12" href="operational.html#additional-considerations">

§spec-13^dtr-server^exchange:DTR server organizations **MAY** surface their Questionnaires via a registry or some similar mechanism that allows DTR client organizations to pre-examine/pre-process Questionnaires to allow for more optimal handling when those Questionnaires are actually solicited.§  §spec-14^dtr-client^exchange:DTR clients **SHALL NOT** be dependent on such pre-availability in order to perform form completion.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
DTR requires, at a minimum, exposing question text, and permitted answers in a computable API.  Where payers are using third party logic in their data gathering processes, they may need to negotiate licenses to allow this information to be shared computably.
      </td></tr>
  </table>
</div><br>

More information regarding Questionnaires, workflow, and behaviors implementers will need to understand can be found in the SDC Guide:
* [Basic SDC Workflow](http://hl7.org/fhir/uv/sdc/STU3/workflow.html)
* [Form Behavior and Calculation](http://hl7.org/fhir/uv/sdc/STU3/behavior.html)
* [Advanced Form Rendering](http://hl7.org/fhir/uv/sdc/STU3/rendering.html)
* [DTR SDC Questionnaire - Example](Questionnaire-home-o2-std-questionnaire.html)
  
This IG defines two different profiles on Questionnaire that can be used to define data gathering requirements: the [DTR Standard Questionnaire profile](StructureDefinition-dtr-std-questionnaire.html) and the [DTR Adaptive Questionnaire profile](StructureDefinition-dtr-questionnaire-adapt.html).

In the first approach, all possible questions that can be asked, as well as the logic around when questions are enabled and what answers are permitted are expressed in computable form and shared as a complete set when the [Questionnaire Package](OperationDefinition-questionnaire-package.html) is retrieved.  Typically, the same Questionnaires are used across a wide variety of order types and members, though in theory the payer could generate a custom Questionnaire that is specific to a particular order and/or member.

In the second approach, the complete set of questions is not exposed.  Instead, the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation is called repeatedly to slowly build up the list of questions, influenced by answers to prior questions.  The set of questions asked will typically vary from patient to patient and order to order.

A summary of the trade-offs between the two approaches can be seen in the table below:

<table border="1">
  <tr>
    <th>Standard Questionnaire</th>
    <th>Adaptive Questionnaire</th>    
  </tr>
  <tr>
    <td>All questions and logic shared when the questionnaire package is first downloaded. i.e., all potential questions, logic and rules are visible to the EHR or DTR app.
    </td>
    <td>Questions are exposed one at a time (or occasionally a couple at a time) and only relevant questions are exposed.
Rules and logic are hidden and only questions relevant to the current member/order are visible to the EHR or DTR app
 </td>   
  </tr>
  <tr>
    <td>Only <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> operation is needed</td>
    <td>Payer must support both <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> and <a href="OperationDefinition-DTR-Questionnaire-next-question.html"><code>$next-question</code></a> operations</td>    
  </tr>
  <tr>
    <td>Logic for which questions are asked and which answers are available is encoded in the Questionnaire, possibly using CQL, and is executed by the DTR app/EHR.</td>
    <td>Logic for which questions are asked and which answers are available is written in software maintained by the payer in the language of their choice.  The DTR app/EHR simply exposes whatever questions and answer choices are returned by the operation</td>    
  </tr>
  <tr>
    <td>Payers will need to write CQL and/or leverage advanced Questionnaire logic elements for both rules as well as data pre-population</td>
    <td>Payers will need to write CQL for data pre-population only (though they will need to express rules in some programming/configuration language of their choice)</td>    
  </tr>
  <tr>
    <td>Rules that require accessing other payer systems or logic not expressible in CQL cannot be expressed.</td>
    <td>Code defining rules for what questions to display, the text of the question, the answers available, etc. can depend on calls to other payer interfaces and can leverage logic of any needed level of complexity, including using third-party rules engines.</td>    
  </tr>
  <tr>
    <td>Any population from payer data must occur at the time the <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> operation is called and cannot be dependent on data populated from the EHR or entered by the user.</td>
    <td>Answers to later questions can be pre-populated from payer data based on previously answered questions (whether answered by pre-population from the EHR or by users)</td>    
  </tr>
  <tr>
    <td>Questionnaires and associated logic can be shared in a standardized way across payers as part of industry standardization efforts to drive consistency in data collection</td>
    <td>Individual questions could theoretically be shared, but any special logic around which questions are asked or answers are available would not be easily shareable</td>    
  </tr>
  <tr>
    <td>Logic cannot leverage payer data except as present in pre-populated answers in the initial QuestionnaireResponse provided in the <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> operation</td>
    <td><a href="OperationDefinition-DTR-Questionnaire-next-question.html"><code>$next-question</code></a> logic is free to leverage data held by the payer about the member, plan, or other information
    </td>    
  </tr>
  <tr>
    <td>Outcomes of the Questionnaire process are only reflected in answers in the QuestionnaireResponse
    </td>
    <td>The QuestionnaireResponse returned by <a href="OperationDefinition-DTR-Questionnaire-next-question.html"><code>$next-question</code></a> can contain extensions as well as answers – such as the <a href="https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html"><code>coverage-information</code></a> extension (see below)
    </td>    
  </tr>
  <tr>
    <td>The payer has no access to what answers have been provided in the QuestionnaireResponse until/unless the QuestionnaireResponse is later transmitted to the payer (e.g., as part of a prior authorization request or a claim).  The payer cannot inject any identifiers around commitments with respect to coverage or the satisfaction of authorization requirements.
    </td>
    <td>The payer receives the data each time a question is asked and, while limited in how they can use that data, they can associate it with identifiers that allow them to adhere to commitments with respect to coverage or the satisfaction of authorization requirements.</td>    
  </tr>
</table><br>
  
§spec-15^dtr-server^exchange:Payers **MAY** support either approach or opt to provide some Questionnaires using one approach and others using the second based on the requirements of the form.§  §spec-16^dtr-client^exchange:DTR apps and Full EHRs **SHALL** support both types of Questionnaires.§

#### Questionnaire Design
§spec-17^dtr-server^exchange:Questionnaires, whether standard or adaptive, **SHALL** also use logic that ensures that only questions and answer choices which are required for the intended clinical or administrative purposes are included, based on what answers have already been provided/populated using elements such as `enableWhen` or `enableWhenExpression`.§ §spec-18?^dtr-server^exchange:When using elements with a data type of 'Expression' within Questionnaires to control flow or rendering, all logic **SHALL** be written in CQL.§  However, there are many other properties and extensions that control the rendering and behavior of Questionnaires. The DTR [Standard](StructureDefinition-dtr-std-questionnaire.html) and [Adaptive](StructureDefinition-dtr-questionnaire-adapt.html) Questionnaires have identified the elements and extensions from the SDC [Base](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire.html), [Advanced Rendering](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-render.html), [Advanced Behavior](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-behave.html) and [Expression-based Population](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-pop-exp.html) profiles that must be supported in DTR.  §spec-19^dtr-client^exchange:The Elements flagged as mustSupport **SHALL** be supported by DTR Apps and Full EHRs.§ 

§spec-20^dtr-client^exchange:These systems **SHOULD** also support all non `mustSupport` data extensions included in the differential of the DTR Questionnaire profiles as per SDC documentation for those elements and extensions, and non-support for an element **SHALL NOT** interfere with a user's ability to complete a QuestionnaireResponse.§  §spec-21^dtr-server^exchange:However, payers **SHALL NOT** rely on support for any of these elements in the design of their Questionnaire (i.e., a DTR client that ignores such elements cannot impact the successful collection of information acceptability of the information gathered).§ 

§spec-22?^dtr-client^processing:If there is a need to collect both patient or clinical data as well as administrative data, forms **SHALL** be designed in one of the two the following manners:§
* Define separate form(s) for the data capture that requires patient and/or clinician output from the form(s) that can reasonably be filled out by administrative staff.
* Front-load forms that capture a mixture of patient/clinical and administrative data such that the clinical and patient data can be captured first with a clear 'display' item included in the form that indicates when the patient/clinical portion is completed so that clinicans know when it is safe to save the response and leave the rest for later staff if that's their preference.


It should be noted that in some cases, decision logic may mean that a few questions that could be answered by administrative staff will need answers to determine which clinical and/or patient questions need to be displayed.  In this situation, these questions will need to be intermixed with the patient / clinical questions.

It should be noted that hyperlinks in XHTML or `supportLink` may point to 'contained' binary resources.  §spec-160?^dtr-server^exchange:Such resources **SHALL** either be PDFs or XHTML pages that adhere to FHIR's ['safe' HTML rules](https://hl7.org/fhir/R4/security.html#narrative) (no active content or scripts)§ Hyperlinks in these XHTML pages may themselves point to 'contained' binary resources.


<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
It is important for the questionnaire designer to be aware that the absence of data is not always because the data does not exist, but may be due to restricted or prohibited data not being exposed.
      </td></tr>
  </table>
</div><br>

<div class="dragon" markdown="1">
Some terminologies, question text, or other questionnaire design features have legal constraints on their use and/or distribution.  DTR services providing Questionnaires and ValueSets (and possibly terminology services to expand value set contents) need to consider those legal constraints before deciding to make use of a given set of codes in their Questionnaire.  In particular, the legal considerations need to consider:
<ul>
    <li>Can codes be shared with and stored by the EHR?</li>
    <li>Can a completed QuestionnaireResponse containing chosen answers be transmitted to the performing provider (as DTR requires)?</li>
    <li>Can the EHR system make use of terminology services to access allowed lists of codes (if value sets are expression-based rather than enumerating codes)</li>
</ul>
</div><br>

Payers licensing their decision logic from third parties and are concerned about disclosing licensed IP may find adaptive forms a helpful mechanism to conceal logic rules.  DTR requires, at a minimum, exposing question text, and permitted answers in a computable API.  Where payers are using third party logic in their data gathering processes, they may need to negotiate licenses to allow this information to be shared computably.

#### Adaptive Form Considerations
§spec-23?^dtr-server^exchange:When a payer uses an Adaptive Form, they **SHALL** return a questionnaire instance compliant with the DTR [AdaptiveQuestionnaire-Search](StructureDefinition-dtr-questionnaire-adapt-search.html) profile.§ This will include a [`questionnaireAdaptive`](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-questionnaireAdaptive) extension that indicates that the Questionnaire is adaptive and is also used to determine the endpoint on which the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation should be called to start completing the QuestionnaireResponse.  The extension's url value is the base for the next question operation (i.e., `[url]/Questionnaire/$next-question`).  

§spec-24?^dtr-server^exchange:If present, any `questionnaireAdaptive` url **SHALL** be a sub-url under the base for the payer and able to be accessed within the same SMART Backend Services connection as was established to make the [$questionnaire-package](OperationDefinition-questionnaire-package.html) call.§

§spec-25^dtr-server^exchange:The QuestionnaireResponse included in the [Questionnaire Package Bundle](StructureDefinition-DTR-QPackageBundle.html) accompanying an adaptive Questionnaire **SHALL** follow the convention of referencing a [contained](https://hl7.org/fhir/R4/references.html#contained) Questionnaire `derivedFrom` the canonical for the Questionnaire being completed.§  §spec-26^dtr-server^exchange:Typically, the QuestionnaireResponse and [contained](https://hl7.org/fhir/R4/references.html#contained) Questionnaire will contain no answers (or corresponding questions), though the payer **MAY** opt to include a few pre-populated answers for user review prior to soliciting additional questions using the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation.§

The [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation provides no opportunity to pass context to the server posing the questions.  It will have no information about who the member is, the nature of the order, or anything else.  Any information needed will need to be passed in as the answer to a question.  §spec-27^dtr-server^exchange:Payers **MAY** define pre-populatable questions to extract such information, using CQL to access the Questionnaire's [`launchContext`](https://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-launchContext.html) extension or performing any necessary data retrieval.§  The populated (and potentially user-reviewed or adjusted) answers can then be leveraged in subsequent calls to [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) to determine what to ask next.

Adaptive questionnaires pose a slight challenge when it comes to preparing the Questionnaire package.  Unlike standard questionnaires, adaptive forms do not identify all their questions up-front.  As such, it is not clear exactly which ValueSets will be needed for coded elements, nor which [Libraries](http://hl7.org/fhir/R4/library.html) might be needed to contain CQL to support pre-population.  

§spec-28^dtr-server^exchange:There are three strategies payers can use – and payers **MAY** opt to combine strategies within a single Questionnaire:§

* §spec-29^dtr-server^exchange:The payer **MAY** opt to include CQL [Libraries](http://hl7.org/fhir/R4/library.html) and ValueSets in the package that are not actually referenced by any questions, on the prospect that they *might* be (or are likely to be) referenced by one of the questions at some point.§  Libraries might also be included that define common helper functions that will be leveraged by question-specific CQL provided later.  The downside of this approach is that an adaptive form might draw from a library of hundreds of different questions but only actually use a handful.  This could result in needing to share an extremely large questionnaire package.  It may also expose more of the proprietary logic than the payer might wish to make known.  On the other hand, any CQL or code lists provided in the package is content that will not need to appear contained in the QuestionnaireResponse, which can lighten subsequent calls to [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html). 
  
* §spec-30^dtr-server^exchange:The payer **MAY** add CQL [Libraries](http://hl7.org/fhir/R4/library.html) and ValueSets as ['contained'](https://hl7.org/fhir/R4/references.html#contained) resources inside the QuestionnaireResponse that are relevant to the questions that are part of the Questionnaire for each [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) call, slowly building up the set of resources that happen to be relevant to the questions actually asked.§  The benefit of this approach is that only codes and CQL relevant to the questions asked needs to be shared.  The downside is that this content is then present on every call to [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html).
  
* §spec-31^dtr-server^exchange:Finally, the payer **MAY** opt to specify the CQL and codes without using [Libraries](http://hl7.org/fhir/R4/library.html) or ValueSets at all – the CQL can be sent in-line within the various Expression elements, and the codes can be listed directly as answerOption Codings.§  This has similar advantages and disadvantages to the second option, though it has less overhead.  On the other hand, CQL and codes can't be shared across different items.

In some cases, an adaptive form may need to retrieve resources from the EHR in order to determine what subsequent questions to ask or to make a prior authorization decision.  The only way for information to be relayed to the payer is with answers inside a QuestionnaireResponse.  However, QuestionnaireResponse answers can't actually be full resources, only references.  §spec-32?^dtr-server^exchange:Payers needing full resources to be returned **SHOULD** use the [`containedReference`](StructureDefinition-containedReference.html) extension to indicate that the selected resource(s) for an answer of type reference should be included as [contained](https://hl7.org/fhir/R4/references.html#contained) resources within the QuestionnaireResponse.§  This provides a mechanism for full resources to be included as part of the QuestionnaireResponse.

§spec-33?^dtr-server^exchange:Implementers that support Adaptive Questionnaires **SHOULD** always include a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension when the QuestionnaireResponse is deemed complete.  (Future versions of this guide will likely tighten this expectation to a 'SHALL')§<a id="spec-33" href="operational.html#additional-considerations">

§spec-34?^dtr-server^exchange:The package returned by the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation **MAY** include Library and/or ValueSet instances that are not referenced by any of the returned questionnaires if at least one of those questionnaires is adaptive.§  §spec-35?^dtr-client^exchange:In this circumstance these additional resources are being made available, and **SHALL** be retained in the session, on the likelihood that a question in one of those adaptive questionnaires returned by the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation will need (and reference) these resources.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
This mechanism is not necessary for non-adaptive forms as all resources pointed to by the QuestionnaireResponse will be returned as part of the <a href="StructureDefinition-DTR-QPackageBundle.html">Questionnaire Package Bundle</a>
      </td></tr>
  </table>
</div><br>
    
§spec-36?^dtr-server^exchange:When using adaptive forms, DTR servers **SHOULD** return as many items in a single call as possible (within reason), including questions that can be determined as enabled or disabled using simple 'enableWhen' logic.§  §spec-37?^dtr-client^exchange:Calling the `$next-question` operation **SHOULD** only be necessary when the DTR client requires invocation of more complex or non-disclosable logic to determine the next set of items.§  Population will be more efficient the more items are returned at once (minimizing the number of calls).  Efficient population will be necessary to ensure a user experience that will make questionnaire completion amenable to clinicians.

For adaptive questionnaires to be useable by clinicians, responses must be fast.  Initial calls to `$next-question` on a questionnaire from a DTR client are expected to have responses within 5 seconds.  Subsequent invocations of `$next-question` on the same QuestionnaireResponse within 60 minutes are expected to have responses within 1 second.  §spec-38^dtr-server^exchange:Conformant systems **SHALL** meet these timing expectations at least 90% of the time.§

§spec-39?^dtr-client^exchange:In an adaptive Questionnaire with clinical or patient questions, systems that know that, after submitting the answers to the current unanswered questions, there will be no further questions targeted to patient or clinician, those systems **SHALL** provide a display item indicating that patient/clinical questions are complete.§  Note that there might still be more administrative questions.

§spec-40^dtr-server^exchange:Wherever possible, DTR services **SHOULD** leverage data retrieved from CRD and other mechanisms (claims data, PDex, etc.) to pre-populate answers in the QuestionnaireResponse returned to the client (regardless of whether the forms used are adaptive or standard).§  This can be done in combination with population logic to retrieve EHR data.  In such a situation, EHR data will override payer-provided data if EHR data is available.  Clients can allow users to adjust data populated either by the payer or by local population.

The [Privacy, Security, and Safety page](security.html) includes additional guidance on the use of Adaptive questionnaires.

#### Determinations from Adaptive Forms
In some cases, upon receiving enough answers from an adaptive form, a payer will be able to make assertions about coverage, prior authorization, and/or any 'additional documentation needed' similar to what is provided by the CRD process. This information needs to be made available to the DTR client in a computable fashion. To do so, the adaptive form service will place the [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension on the root of the [QuestionnaireResponse](StructureDefinition-dtr-questionnaireresponse.html), alongside the [`qr-context`](StructureDefinition-qr-context.html) extension. 

§spec-41?^dtr-server^exchange:If Adaptive Forms are being used, and a DTR service determines that prior authorization is both necessary and the requirements have been satisfied, then the final question in the form **SHALL** be a question that asks the user if they would like the prior authorization identifier to be issued, and indicate the appropriate response options.§  If the answer indicates a desire to have the identifier issued, then the completed [`questionnaireResponse`](StructureDefinition-dtr-questionnaireresponse.html) from the payer will contain the issued Prior Authorization identifier in the `satisfied-pa-id` element of the [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension.  §spec-42^dtr-server^exchange:DTR Servers **SHALL NOT** provide a `satisfied-pa-id` in response to a DTR invocation that was triggered by a PAS request.§

§spec-43^dtr-server^exchange:DTR payers **SHALL** ONLY use DTR adaptive forms to return a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension when:§
* CRD has already been called and a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension is already present on the relevant order; and
* Information is needed from a user that cannot be made available via the CRD process (either by pre-fetch or active query).

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
It will be unusual for a <code>coverage-information</code> extension created by an adaptive form to come back saying 'additional documentation required', however there are theoretical use-cases for this to be useful and this specification does not prohibit such behavior. If this occurs, it could result in a subsequent launch of DTR, or could result in the DTR client prompting the user as to whether they want to move on to filling out the new form(s).
      </td></tr>
  </table>
</div><br>

§spec-44?^dtr-client^exchange:If an adaptive QuestionnaireResponse includes an unsolicited determination that authorization requirements have been "satisfied", the EHR **SHALL** allow the clinician to flag the provided determination number as "not valid".§  For example, If they feel the determination was based on incorrect information. §spec-45?^dtr-server^exchange:If a payer receives a new invocation of an adaptive form for the same order, they **SHALL** treat the result of the new completion as replacing any previous completion from a prior coverage determination process.§ 

§spec-46?^dtr-client^exchange:If a final DTR QuestionnaireResponse includes a Coverage Information extension, the DTR Client **SHALL** associate the Coverage Information returned with the relevant Appointment, Encounter and/or Request resources and **SHALL** make the information provided in the extension available to their users for viewing.§  This might be managed with icons, flyovers, or other mechanisms as is appropriate to the workflow of the users of that DTR Client.

When `coverage-information` repetitions come back in a QuestionnaireResponse, they may be intended to replace or supplement the `coverage-information` extensions already present on the order(s) linked to the QuestionnaireResponse.  §spec-47^dtr-client^exchange:For the purpose of determining whether to update or replace, the combination of the 'coverage' reference and the `coverage-assertion-id` **SHALL** be treated as a primary key  (i.e., if the coverage and `coverage-assertion-id` is the same, then the expectation is to replace the existing `coverage-information` repetition.  If either are different then the intention is to add an additional `coverage-information` extension repetition to the list.)§  NOTE: This means that the `coverage-assertion-id` cannot change unless the intention is to add an additional repetition.

§spec-48^dtr-client^exchange:When updating an existing `coverage-information` instance, all elements other than the primary key may change, except that `doc-needed` and `doc-purpose` **SHOULD NOT** change to remove types of documentation needed merely to reflect forms that have already been completed.§

§spec-49?^dtr-client^ui:If an updated `coverage-information` lists more Questionnaires to fill out then the original, DTR clients **SHALL** expose additional forms to the user in their typical manner.§

#### Provider Attestation
§spec-50^dtr-server^business:In some cases, if there isn't specific data that can be retrieved computably from the EHR, it **MAY** be sufficient for a payer to merely have an attestation by the provider that certain documentation exists, that a certain patient condition exists, or that certain actions have been completed.§ This can be represented in a Questionnaire as a simple boolean or choice question where the text describes what the user is attesting to. §spec-51?^dtr-server^business:Payers **SHOULD** design questionnaires to support attestation rather than discrete data where this is sufficient for the business requirements.§

§spec-161^dtr-server^business:Some payers **MAY** require that attestations or other answers be 'signed' (the electronic equivalent of 'initialing' the answer).§ This would be identified by means of the [`questionnaire-signatureRequired`](http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired) extension on the Questionnaire item.  

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
This IG does not define any expectations around certificate management or other considerations involved in the creation or validation of signatures, only the means by which signatures are requested and provided.
      </td></tr>
  </table>
</div><br>

§spec-52^dtr-server^exchange:Questionnaires **MAY** also support attaching reports or other supporting documentation (e.g., images, pathology reports, etc.) where providing question answers is not sufficient.§  The 'attachment' question type can be used to support this. Attachments might be found by searching for DiagnosticReport or Media instances, or by the provider directly uploading something to the Questionnaire rendering tool.

#### Questionnaire Expiry
While a user might need to suspend interaction with the DTR process, there could possibly be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started several years ago because it would produce a QuestionnaireResponse that would still be valid if submitted now.  On the other hand, if a form was filled out five days ago and submitted today, it will be frustrating for providers if the form is rejected as "out of date".  
§spec-53^dtr-server^exchange:Payers **SHOULD** use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid.§  The DTR App or EHR can then check against that period when resuming a previously stored QuestionnaireResponse.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Pre-Population
One of the core purposes of this specification is to automate the retrieval of documentation required by the payer in a manner that reduces provider burden. 

Pre-populating answers reduces burden in two ways:
* It reduces the time that providers or back-end staff need to spend looking through the record for information when completing forms; and
* It eliminates issues from being introduced as part of transcription and reduces the likelihood of relevant information being missed.
  
Pre-population requires that logic be embedded in the Questionnaire that identifies where in the EHR the information can be found.  This in turn requires that the information needed be reliably locatable.

§spec-54^dtr-server^exchange:Questionnaires **SHALL** include logic that supports population from the EHR where possible.§ §spec-55^dtr-server^exchange:Such logic **SHOULD** rely exclusively on data elements and search parameters defined either in US Core or [HRex]({{site.data.fhir.ver.hrex}}/index.html) (including simple calculations there-on - e.g., age from birthdate).§  §spec-56^dtr-server^exchange:Ideally, the design of questions in payer forms **SHOULD** consider what data is likely to be available for pre-population purposes, with an objective of minimizing provider data entry effort.§ 

§spec-57^dtr-client,dtr-server^exchange:Due to differences in workflows or information systems, clinical information **MAY** be represented in different FHIR resources or with different codes or code systems.§  §spec-58^dtr-server^exchange:Therefore, payer CQL **MAY** have to examine different resources or use value sets to find patient information.§ It is preferable to have more extensive CQL or value sets than to require a user to input values that the rules were unable to resolve.

DTR uses the [SDC Expression-based Population mechanism](http://hl7.org/fhir/uv/sdc/STU3/populate.html#expression-based-population) as the mechanism for populating, and specifically the use of CQL as the expression language.  §spec-59^dtr-client^exchange:Any supplied CQL **SHALL** be used as the basis for pre-populating elements using data gathered from the EHR.§  §spec-60^dtr-client^exchange:DTR clients **SHALL** handle expressions in Questionnaires denoted as either CQL or FHIRPath (which is a proper subset of CQL).§  §spec-61^dtr-server^exchange:DTR servers **SHOULD** identify inline expressions that are valid FHIRPath as FHIRPath rather than CQL.§  This will mean using the [`launchContext`](https://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-launchContext.html), [`variable`](https://hl7.org/fhir/extensions/StructureDefinition-variable.html) and the [`initialExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-initialExpression.html), [`contextExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-contextExpression.html) or [`calculatedExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-calculatedExpression.html) extensions together with logic in [Libraries](http://hl7.org/fhir/R4/library.html) referenced by the [`cqf-library`](https://hl7.org/fhir/extensions/StructureDefinition-cqf-library.html) extension to help populate the QuestionnaireResponse.

§spec-62^dtr-client^ui:Prior to exposing items from the draft QuestionnaireResponse to the user for completion and/or review, the DTR client **SHALL** attempt to perform the SDC population of all elements having [`initialExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-initialExpression.html), [`candidateExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-candidateExpression.html) and [`calculatedExpression`](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-calculatedExpression.html) extensions found in the Questionnaire for any enabled elements.§  In the absence of an alternate approach this will be done by executing the CQL found in these expressions. §spec-63^dtr-client^processing:However, clients **MAY** use alternative mechanisms that take into account the data requirements expressed by the CQL.§  §spec-64^dtr-client^processing:Such alternative mechanisms **SHALL** provide pre-population that is overall at least as complete and accurate as would be achieved through CQL execution.§

§spec-65?^dtr-client^processing:All items that are pre-populated (whether by the payer in the initial QuestionnaireResponse provided in the questionnaire package, or from data retrieved from the EHR) **SHALL** have their `origin.source` set to 'auto-server' (pre-populated by Payer) or 'auto-client' (pre-populated by EHR) within the required [`information-origin`](StructureDefinition-information-origin.html) extension.§

#### Execution Sequence
The flow of execution of the CQL will be determined by the associated Questionnaire. The client will proceed through the Questionnaire, and for any question that is associated with the result of a CQL expression, that specific CQL statement will be executed. §spec-162?^dtr-client^processing:The DTR client **SHOULD** use result caching so that results queried by CQL (or otherwise retrieved based on CQL) previously remain available after a subsequent call to $next-question.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
The answers to questions populated by an <code>initialExpression</code> or <code>calculatedExpression</code> might themselves be dependencies to determine whether a Questionnaire item is enabled or not, which might in turn influence whether additional pre-population is required.  <span>§spec-66^dtr-client^processing:DTR clients <b>SHALL</b> iterate as necessary until a steady state is reached.§</span>  <span>§spec-67?^dtr-client^processing:If dependencies are such that a steady state cannot be reached (e.g., an item that is enabled causes a value to be set which causes a different item to be enabled, that then disables the first item…), then the Questionnaire <b>SHALL</b> be treated as erroneous and attempts at automatic population <b>SHALL</b> end, with the user being informed of that.§</span>
      </td></tr>
  </table>
</div><br>

#### Retrieval of patient FHIR resources to supply to CQL execution engine
§spec-68?^dtr-client^exchange:If executing CQL directly, the DTR client **SHALL** retrieve the FHIR resources specified in the `dataRequirement` section of a Library.§  SMART apps will do this using the access token provided on launch.  The client can then pass these resources to the Clinical Quality Language (CQL) engine. For example, the snippet below is from a Library that contains a `dataRequirement` section. In this code snippet the resource data needed from the EHR is Condition.

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

Depending on user permissions, the client might not have access to all the data. §spec-69^dtr-client^processing:Queries **SHOULD** be constructed to minimize the retrieval of information that is not necessary to answer the relevant questions (For example, queries for medications that only require active medications should have appropriate filters to retrieve active medications and not inactive medications).§
It's possible not every CQL statement will be executed (for example some questions may only be enabled given certain answers to prior questions). To reduce data transfers and increase overall speed, data can be fetched as needed. However, the app's execution engine might be implemented using a different strategy (for example by doing bulk fetches before starting execution).

#### Populating adaptive questionnaires
An adaptive form handles population slightly differently from a 'standard' form because questions only become available one (or a few) at a time.  Some CQL [Libraries](http://hl7.org/fhir/R4/library.html) might themselves only become available once certain questions are displayed.  The population process must therefore happen after each call to [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html), populating any newly available questions.  §spec-70^dtr-client^processing:DTR clients **SHALL** support such an incremental population of adaptive QuestionnaireResponses.§  For performance, the DTR client may find it helpful to cache the results of CQL prior to the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) call.

#### Populating resumed QuestionnairesResponses
§spec-71?^dtr-client^processing:If DTR is launched using a previously saved QuestionnaireResponse, the DTR client **SHOULD** re-execute CQL to populate all empty elements, as well as those with an [`origin.source`](StructureDefinition-information-origin.html) of 'auto-client' or 'auto-server'.§  §spec-72?^dtr-client^processing:Any answers with an `origin.source` of 'override' or 'manual' **SHALL NOT** be changed, though if pre-population would have asserted a value for an answer with an `origin.source` of 'manual', the `origin.source` **SHALL** be changed to 'override'.§  §spec-73?^dtr-client^processing:When executing CQL for population, DTR clients **SHALL** replace payer-prepopulated data unless the results of the CQL population is an empty set.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
It is possible that future versions of this specification may allow greater configuration of how population by both payer and provider systems should be managed, for example supporting merger of population data from each.  Implementers are encouraged to share requirements around population where the current rules are inadequate/inappropriate.
      </td></tr>
  </table>
</div><br>

#### Library Dependencies
The FHIR Library containing/referencing a CQL logic file can reference other needed CQL files (e.g., helper libraries) using the `relatedArtifact` field and a RelatedArtifact with a type of depends-on. §spec-74?^dtr-client^processing:If executing CQL directly, the engine **SHALL** make available to the execution context all such referenced CQL [Libraries](http://hl7.org/fhir/R4/library.html).§  §spec-75?^dtr-client^processing:If not executing the CQL directly, alternative processes **SHOULD** consider the content of referenced libraries as well.§

#### Behavior when encountering CQL-related errors
§spec-76?^dtr-client^processing:If the CQL is malformed (is not syntactically correct) in any way, a client directly executing the CQL **SHALL NOT** attempt any execution of the malformed CQL.§ If the CQL engine reports an error when executing any of the CQL, the client should similarly stop all CQL execution.  §spec-77?^dtr-client^processing:Clients not executing the CQL **SHOULD** be tolerant of malformed CQL.§  §spec-78^dtr-client^exchange,processing:In either case, the client **SHALL** report the error to the payer using the [Log Questionnaire Errors operation](OperationDefinition-log-questionnaire-errors.html) in addition to performing its own internal logging processes.§

§spec-79?^dtr-client^ui:If the CQL in the Questionnaire is only used for form population purposes, the app **SHALL**:§
* Notify the user with an appropriate message indicating that the form population did not occur.
* Allow the user to enter the information manually, either now or at a later time.

§spec-80?^dtr-client^processing:If the CQL also includes questionnaire logic, such as whether certain elements are enabled, or other validation rules, the DTR client (potentially in consultation with the user) **MAY** attempt to determine if the questionnaire is sufficiently simple that it would be reasonable to allow the user to attempt completion with potentially improperly enabled items.§  §spec-81?^dtr-client^ui:If this is not possible, the client **SHALL** notify the user that there is an issue with the questionnaire and prohibit further completion of the form.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
<span>§spec-82^dtr-client^exchange:A query for data that returns no results <b>SHALL NOT</b> be considered a failure.§</span>
      </td></tr>
  </table>
</div><br>

Further guidance on writing the necessary CQL can be found at ['Use of CQL'](specification.html#use-of-cql) later in this guide.


---------------------
### Value Set and Code System Guidance
The Questionnaire resource provides several mechanisms for conveying coded answer choices.  §spec-83^dtr-server^exchange:The table below is guidance that **SHOULD** be used when constructing questions with coded answers:§

<table border="1">
  <tr>
    <th style="width:40%">CQL and Questionnaire terminology usage</th>
    <th>Comment</th>    
  </tr>
  <tr>
    <td>No value set, embed the code choices using answerOption.</td>
    <td>This is OK if there is no need to reuse the codes across multiple questions and the list of codes is ‘fixed’ and relatively small (< 40).</td>   
  </tr>
  <tr>
    <td>Pass a value set in the questionnaire package with the expansion already in place.</td>
    <td>The same set of codes is used for multiple answers and the set of codes is relatively small (< 40).  This saves the need for a terminology service call.’</td>    
  </tr>
  <tr>
    <td>Pass a value set in the questionnaire package, but the client recipient will need to run the expansion or ask a terminology server to do the expansion.</td>
    <td>The value set expansion is on the larger size (> ~40 codes), such that using the <a href="OperationDefinition-DTR-ValueSet-expand.html"><code>$expand</code></a> operation with a filter will be more efficient from a user interface perspective. §spec-163^dtr-client^exchange:These value sets <b>SHOULD</b> be expanded by the client and therefore <b>SHOULD NOT</b> be included in the questionnaire package.§  DTR clients running as SMART on FHIR apps will typically need to hold the complete content of the questionnaire package in memory. §spec-164^dtr-server^exchange:Payers <b>SHOULD</b> design their questionnaires, value sets, and libraries with the knowledge that content which is too large may cause DTR clients to fail.§</td>    
  </tr>
</table>
  

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
<span>§spec-84^dtr-client^processing:All value set expansions <b>SHOULD</b> be made by using the <a href="OperationDefinition-DTR-ValueSet-expand.html">DTR Valueset Expand (<code>$expand</code>)</a> operation.§</span>
      </td>
    </tr>
  </table>
</div><br>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Use of CQL
As part of the SDC Questionnaires that define the information payers require to be captured, CQL is used to support automatic population of answers from existing EHR data and, occasionally, to enforce complex logic around what questions should be displayed. For example, whether answers are required, what answers should be enabled, etc. §spec-85^dtr-server^processing:This CQL **MAY** query for patient observations, conditions, or other discrete information within the EHR to use as part of the population process or logic.§ The [SDC specification](http://hl7.org/fhir/uv/sdc/STU3/) provides guidance about how CQL expressions can be used for different purposes, as well as how information gathered by CQL in one portion of the Questionnaire can be made available in other portions of the Questionnaire. §spec-86^dtr-server^processing:The mime type that **SHOULD** be used for a CQL Identifier is "text/cql-identifier".§ 

CQL can either be embedded inline as part of an expression or referenced in a Library resource. §spec-87^dtr-server^exchange:All [Libraries](http://hl7.org/fhir/R4/library.html) needed by a questionnaire **SHALL** be referenced by the [`cqf-library`](https://hl7.org/fhir/extensions/StructureDefinition-cqf-library.html) extension and included as part of the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation.§

It is recommended implementers review available resources for the use of CQL, such as the [Using CQL With FHIR](https://hl7.org/fhir/uv/cql/STU2/) and [Common CQL Artifacts for FHIR](https://build.fhir.org/ig/HL7/us-cql-ig/) implementation guides.
  
<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
This guide sets expectation that Questionnaires returned from the <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> operation will include CQL to support population and/or flow control and rendering of the Questionnaire within the DTR app or EHR.  It is possible that payers may opt to use CQL internally to support population of QuestionnaireResponses returned in the <a href="OperationDefinition-questionnaire-package.html"><code>$questionnaire-package</code></a> or as part of the <a href="OperationDefinition-DTR-Questionnaire-next-question.html"><code>$next-question</code></a> operations.  However, there is <u>no expectation</u> this will occur and this specification provides no guidance on how such CQL would be written.
      </td>
    </tr>
  </table>
</div><br>

#### Guidance on Structure of CQL Logic
Like many other programming languages, CQL allows for statements to be nested within conditional logic. This creates instances where some statements may not be executed due to a prior condition not being met.  

Data retrieval in a QuestionnaireResponse is dependent on the `enableWhen` element.

§spec-88^dtr-server^exchange:CQL logic **SHOULD** be partitioned to be specific to groups/questions/etc., when doing so will allow it to be more efficient - though consideration should also be given to whether performing significant data gathering at the outset (even if the data is unneeded) will produce a more positive experience than intermittent data retrieval 'on demand', when such retrieval **MAY** introduce user-interface delays.§
This pattern of logic structure is referred to by several names, including eager quitting, early return or, short circuiting. The goal is to avoid the execution of statements if they will not be relevant given other information available to the logic. This is done to streamline workflow and allow the user to focus on relevant input fields.

As an example, a payer could have a set of rules or specific information that must be gathered on a patient only if they have diabetes. §spec-89^dtr-client^processing:This information **MAY** be gathered through a series of CQL statements.§ §spec-90^dtr-server^exchange:When constructing this CQL for DTR, these statements **SHOULD** be nested in conditionals to first check if the patient has diabetes before checking for information dependent on that condition.§

Implementers could use [Adaptive Forms](specification.html#adaptive-form-considerations) to minimize the need for any CQL that provides conditional information retrieval.

#### Organizing CQL within Questionnaires
§spec-91^dtr-server^exchange:While CQL can either be embedded inline in Expression elements or packaged in [Libraries](http://hl7.org/fhir/R4/library.html), This guide strongly recommends that implementers **SHOULD** place CQL logic in libraries as it is much easier to edit and debug such logic when it is all in one place, rather than when it's scattered through many different expression elements throughout the Questionnaire.§
In this approach and results of the queries, filtering, and other operations are to variables in the Libraries using define statements. These variables can then be referenced in the [valueExpression](https://hl7.org/fhir/extensions/StructureDefinition-variable.html), [contextExpression](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-contextExpression.html) or [calculatedExpression](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaire-calculatedExpression.html) elements asserted for the various Questionnaire item elements.  If a given variable evaluates to null the answer will be left empty, for the end user to complete.

#### CQL Constraints
DTR imposes the following additional rules on CQL use by payers to maximize interoperability:
* §spec-92^dtr-server^exchange:The CQL **SHALL** be compatible with version [CQL 1.5](http://cql.hl7.org/N1/).§
* §spec-93^dtr-server^exchange:CQL **SHALL** have a context of "Patient".§
* §spec-94^dtr-server^exchange:Within the Questionnaire, CQL **SHALL** follow SDC rules for determining [context](https://hl7.org/fhir/uv/sdc/STU3/populate.html).§ Specifically, CQL definitions and variables defined on ancestor elements or preceding expression extensions within the same Questionnaire item are in scope for referencing in descendant/following expressions. 
* §spec-95^dtr-server^exchange:Within [Libraries](http://hl7.org/fhir/R4/library.html), both raw CQL and compiled ELM (in JSON syntax – i.e., application/elm+json) **SHALL** be provided as separate content repetitions within the library.§  §spec-96^dtr-server^exchange:Within Expression elements, the base expression CQL **SHALL** be accompanied by an [Alternative Expression Extension](StructureDefinition-alternativeExpression.html) containing the compiled JSON ELM for the expression.§
* §spec-97?^dtr-server^exchange:If the Questionnaire depends on multiple [Libraries](http://hl7.org/fhir/R4/library.html) (has multiple [`cqf-library`](https://hl7.org/fhir/extensions/StructureDefinition-cqf-library.html) elements), then any [`valueExpression`](https://hl7.org/fhir/extensions/StructureDefinition-variable.html) referring to defined variables **SHALL** specify the library name as well as the statement name as follows: "LibraryName".statementName.§
* §spec-98^dtr-server^exchange:Library names **SHALL** be unique within a Questionnaire package and **SHOULD** be unique across all Libraries made available by the payer (e.g., "expression": \"LowerLimbProsthesis\".PhysicalExaminationType where LowerLimbProsthesis is the library name and PhysicalExaminationType is the expression name).§
* §spec-99^dtr-server^exchange:FHIR [Libraries](http://hl7.org/fhir/R4/library.html) **SHALL** send CQL and ELM using the `content.data` element.§
* §spec-100^dtr-client^exchange:CQL tools **SHOULD** support additional FHIRPath variables and functions that are [defined within SDC](https://hl7.org/fhir/uv/sdc/STU3/expressions.html#fhirpath-supplements).§

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Determination of Payers Supported by a DTR App
While all apps must '*technically*' support all payers, it is possible that the apps used to provide DTR functionality will not have the business arrangements in place to allow data sharing with all payers the EHR might have "DTR requests" for. It is important for the EHR to know what payers their app supports so that they only allow their users to launch the DTR app in the context of payers the app will be able to support. (Launching an app only to be told "this payer isn't supported" is an unpleasant user experience.)  

§spec-101?^dtr-client^exchange:Entities deploying SMART on FHIR DTR apps **SHALL** define an endpoint maintaining a list of payers currently supported by that app.§ §spec-102^dtr-client^exchange:This listing of Payers **SHALL** conform to the [DTR Supported Payers](StructureDefinition-dtr-supported-Payers.html) profile also published in this IG.§  §spec-103?^dtr-client^exchange:EHRs using external DTR apps **SHALL** support accessing the endpoint.§ The EHR will be configured with knowledge of which endpoint to access for a given app as part of the process of configuring support for that app within the EHR. §spec-104^dtr-client^exchange:Different endpoints **SHALL** be defined for different versions of the application in situations where support for payers varies by application version.§

§spec-105^dtr-client^exchange:It is important to note that the Payer Identifier used in this file **SHALL** be the same as the ones that are returned by the [endpoint discovery mechanism]({{site.data.fhir.ver.hrex}}/endpoint-discovery.html) defined in [HRex]({{site.data.fhir.ver.hrex}}/index.html).§  


§spec-106^dtr-client,dtr-server^exchange:Accessing the endpoint will be by a simple GET with an Accept header of application/json and **SHALL** be performed over TLS.§  The returned JSON object will contain a "payers" property referring to an array of objects. Each object will have an id and name property, both with string values. It is possible that additional properties might be supported in the future.  EHRs will typically retrieve the list of supported payers for the app once per day and will use this information to determine whether to expose the ability to launch DTR for orders associated with coverages for that payer.

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
The purpose of the DTR client registration process is to establish trust - NOT to establish custom questionnaire behavioral expectations.
      </td></tr>
  </table>
</div><br>


<blockquote class="stu-note" markdown="1">
The standardization of payer ids is still considered an open issue.  Guidance on standardization of payer identity is expected to be provided in the <a href="https://confluence.hl7.org/x/dwjEE">DTR Implementer Support page</a> on the HL7 Confluence site.
</blockquote>

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Launching DTR

#### Launch Workflow 
DTR can be launched in three circumstances:
* In response to CRD, if the `info-needed` flag on the [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension is set.  §spec-107^dtr-client^exchange:The [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation **SHALL** include a `coverage-assertion-id` element of the `coverage-information` as the context value.§  (§spec-108?^dtr-client^exchange:DTR **MAY** error if invoked with CRD `coverage-assertion-id` where the Coverage-Information did not indicate that info was needed.§)  The invocation might also include the associated orders.
* In response to PAS, when the PAS response includes a request for the 102089-0 LOINC code in the HI segment of the response. §spec-109^dtr-server^exchange:The [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation **SHALL** include the TRN associated with the LOINC code as the context value.§  §spec-110?^dtr-client^exchange:DTR **SHOULD** error if it is invoked with an unrecognized TRN value or one from a PAS response that did not specify such a LOINC code.§
* As stand-alone, where no context is provided and only orders are indicated.

#### Launching a DTR SMART app 
 
 <div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
      This section only applies if an EHR is using a SMART app.
      </td></tr>
  </table>
</div>
    
§spec-111^dtr-client^exchange:When the DTR process is being launched, the Electronic Health Record (EHR) system and DTR process **SHALL** follow the procedures established by the SMART App Launch Framework - specifically the [SMART App Launch Framework's EHR launch sequence](https://www.hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch).§

Like any SMART app, DTR is passed a context when launched.  §spec-112^dtr-client^exchange:The openId, user, and patient launch contexts **SHALL** be requested and provided.§  
§spec-113^dtr-client^exchange:In addition, the launch context **SHOULD** include fhirContext references as follows:§
* One active Coverage resource indicating the coverage(s) associated with the documentation to be captured (unless Coverage is already conveyed in the [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension of the Request or Encounter passed below) and 
* Exactly one of the following:
  * A CRD-type Request or Encounter resource ([CRD profiles](https://build.fhir.org/ig/HL7/davinci-crd/artifacts.html#structures-resource-profiles))\
    (Used when launching based on recommendations from CRD or for stand-alone launch without CRD)
  * An existing incomplete QuestionnaireResponse previously created with DTR.\
    (Used when re-launching DTR to continue a previous session)
  * A Questionnaire [Task](https://hl7.org/fhir/us/davinci-cdex/StructureDefinition-cdex-task-attachment-request.html)\
    (Used when launching based on a request from [CDex](https://hl7.org/fhir/us/davinci-cdex/index.html), possibly prompted by instructions in PAS)

§spec-114?^dtr-client^exchange:If these are not passed in as part of context, then the app **MAY** either raise an error or guide the user to select the needed records.§

In addition to launch contexts, the SMART app will need to request scopes for the type of information it needs to access and manipulate.  §spec-115^dtr-server^exchange:Payer-provided Questionnaires **MAY** require access to a wide range of resources.§

§spec-116^dtr-client,dtr-server^exchange:At a minimum, the DTR app and the HIT server **SHALL** support search access to the following resources via their FHIR RESTful API using the profiles defined by or referenced by this guide:§
* Patient
* Coverage 
* QuestionnaireResponse
* Encounter 
* ServiceRequest
* MedicationRequest 
* DeviceRequest 
* Appointment
* NutritionOrder 
* VisionPrescription
  

§spec-117?^dtr-client^exchange:Resources referenced from the above via Must Support elements, including transitive references, **SHALL** also be supported.§

However, typically CQL in Questionnaires will also need access to Observation, Condition, Procedure, DocumentReference and potentially others.  Therefore, in most cases, apps will simply request `patient/*.rs` and `patient/questionnaireresponse.cu`.  §spec-118^dtr-client^exchange:However, apps **MAY** opt to be more restrictive in their access requests if they are confident that they can do so while meeting payer CQL needs and EHRs indicate this is desirable.§

§spec-119^dtr-client^exchange:Regardless of the scopes asked for and granted by the user, the EHR **SHALL** limit access to only that data they deem appropriate for use in automatically populating payer forms, in particular restricting sensitive data.§  (Refer to the [Privacy and Security section for more details](security.html))

#### Authenticating DTR client to payer API
To collect data for a payer, the EHR or SMART app responsible for data collection must first establish a connection to the payer.   §spec-120^dtr-server^exchange:Payers **SHALL** require DTR apps and EHRs connecting to their endpoint to authenticate using [SMART on FHIR Backend Services](https://www.hl7.org/fhir/smart-app-launch/backend-services.html).§  This mechanism provides a flow that authorizes a system to connect to a FHIR server where no user needs to be involved in the authorization process. It allows systems like EHRs to easily interact with pre-authorized defined scopes of access. The scopes necessary are:
* `system/questionnaire.rs`
* `system/valueset.rs`
* `system/library.rs`

These are sufficient to invoke the DTR Questionnaire operations [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) and [`$expand`](OperationDefinition-DTR-ValueSet-expand.html), as well as the retrieval of libraries and value sets.


#### Retrieving Launch Context Information
Again, this is only relevant for SMART on FHIR clients, though a similar process will happen for Full EHRs.
There are several steps in processing the launch context to begin the data collection process.  The following recommended workflow describes the steps and mechanisms that would be necessary to determine the QuestionnaireResponse(s) to render.  Some EHRs or SMART apps may vary their behavior slightly, but the end result of determining the relevant QuestionnaireResponse(s) should be the same.

1.	§spec-121?^dtr-client^exchange:If the launch context did not include Coverages, a QuestionnaireResponse or a Request or Encounter, the DTR app **SHALL** either generate an error or allow the user to search to find one to use as context for the DTR session.§  QuestionnaireResponses would be filtered by patient, a status of in-progress, and a context that is not empty, while requests and encounters would be filtered by patient, active status, and any other standard search parameters the DTR client chooses to offer.
2.	Otherwise, retrieve the referenced fhirUser, patient, and fhirContext resources referenced in the SMART authorization response by performing read or search operations.  (Search operations allow _including the requester, performer and location resources for encounters and request resources, which will be needed later.)
3.	For any Request resources or Encounter resources passed in context, perform a search to see if there are any QuestionnaireResponses associated with those orders using the [`qr-context`](SearchParameter-qr-context.html) search parameter (e.g., `[EHR-base]/QuestionnaireResponse?patient=123&context=ServiceRequest/789`).
4.	If no Request or Encounter resource was passed as context, check any provided QuestionnaireResponse for a [`qr-context`](StructureDefinition-qr-context.html) extension identifying any associated requests or encounters, and if so, perform searches to retrieve them with _includes for requester, performer, etc.
5.	Look in the Request or Encounter resources (if any) passed from context or referenced by a QuestionnaireResponse (if any) to see if there is an existing [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension, either from CRD or from DTR.
6.	If found, look at the Coverages as well as the coverage-assertion-id in such extensions.
7.	Determine which payers are associated with the coverages found, and then retrieve Questionnaire packages from each payer using the context information found.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Retrieving Questionnaire Packages
Once the EHR or app has authenticated itself, it can invoke the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation using the information gathered in the preceding [Retrieving Launch Context Information](specification.html#retrieving-launch-context-information) step.  The operation will be invoked with a 'POST' using the base endpoint associated with the coverages provided based on payer configuration.  If multiple Coverages are provided that are associated with payers having different endpoints, then the operation will be invoked once per payer endpoint (e.g., `POST [base]/$questionnaire-package`).

The operation will be invoked passing a [DTR Questionnaire Package Input Parameters](StructureDefinition-dtr-qpackage-input-parameters.html) instance containing the following information:
* All Coverages associated with the payer endpoint in repetitions of the `coverage` element.
* If a Questionnaire was identified, the version-specific canonical of that Questionnaire in the `questionnaire` element.
* If no Questionnaires were identified but Request or Encounter resources were found in the preceding step, those resources as the `order` resources, plus the associated performer and requester Practitioner and Organizations, as well as any referenced Devices or Medications as 'referenced' resources.
* If a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension was available, the `coverage-assertion-id` as `context`.
* Otherwise, the context id provided in the Questionnaire Task as `context`.
* If working from a previously stored QuestionnaireResponse, the `meta.lastUpdated` as `changedsince`.

The result will be a response with one or more Questionnaire package Bundles.  The remainder of the DTR process will involve the completion, storage, and use of the QuestionnaireResponses found in those Bundles.

The operation will return a [Questionnaire Package Bundle](StructureDefinition-DTR-QPackageBundle.html) for each Questionnaire that needs to be completed.  The Bundle will include the Questionnaire to be filled out, any ValueSets or CQL Libraries needed to support completion of the Questionnaire, and a partially pre-populated QuestionnaireResponse to use as a starting point when filling out the form.  §spec-122?^dtr-server^exchange:The `QuestionnaireResponse.questionnaire` **SHALL** point to the same canonical URL as the Questionnaire provided in the package Bundle.§  If no Questionnaires need to be completed, the Parameters instance will not contain any Questionnaire Package Bundles.

It is the responsibility of the DTR client to check whether there's already an existing eligible response to a "shared" form and to not prompt the user to complete the form, even though the DTR Questionnaire Package operation includes the form in its response.

§spec-123?^dtr-client^exchange:If any of the retrieved Questionnaires have an `effectivePeriod` that ends prior to the current date, then the DTR client **SHALL** change the status of any retrieved work-in-progress QuestionnaireResponses for the expired Questionnaires to 'stopped' and notify the user that the previously recorded content has expired.§  The [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation would then need to be re-invoked just passing the orders and not specifying canonical questionnaire URLs to retrieve the updated Questionnaire(s) appropriate for the order, using the same `context`.

§spec-124?^dtr-client^exchange:If an expired Questionnaire is retrieved when it wasn't explicitly requested by referring to a canonical version, but instead by passing in the relevant order(s) and/or context id, the DTR client **SHOULD** report an error to the payer.§

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
<span>§spec-125^dtr-client^exchange:Previously completed QuestionnaireResponses <b>SHALL NOT</b> be supported due to concerns about currency of clinical information.§</span>
      </td></tr>
  </table>
</div><br>

#### Data Expectations for Invoking Questionnaire Package
The expectations for what data is available for invoking the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation will be dependent on how DTR is launched:
1.	When launched from PAS, the only element that will be present is the context.  There will be no Questionnaire or Request present.
2.  §spec-126?^dtr-client^exchange:When launched after CRD, the context, Request and referenced resources **SHALL** be present.§  §spec-127^dtr-client^exchange:Questionnare canonicals **MAY** be present.§  The payer will determine whether to drive off the context, Request or both, as well as how much cross-checking to do between them.  §spec-128^dtr-server^exchange:DTR servers **SHALL** allow for the possibility of minor changes in the order between CRD and DTR (e.g., changes to status, adding notes, etc.) that mean that the instances don't have to be identical to be considered the same order.§  §spec-129?^dtr-server^exchange:DTR servers **MAY** raise an error if they receive an order that is unrelated to the provided context id.§
3.  If launching DTR without either PAS or CRD, no context will be present, only Request and referenced resources and possibly Questionnaire canonicals.
   
In situation 2 and 3 above, if Questionnaire canonicals are present, the presence of these canonicals will limit what questionnaires are returned in the package (i.e., if there are multiple Questionnaires relevant for an order, but only one canonical is provided on the questionnaire-package call, the response will only return a package for the specified Questionnaire)

§spec-130?^dtr-server^exchange:If DTR is invoked and there are issues with the source data (e.g., the coverage cannot be found, the context id can't be found, etc.), then the DTR service **SHALL** return a 4xx error with an accompanying OperationOutcome.§

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")


---------------------
### User Interaction with Questionnaires
While the goal of DTR is to automatically gather all the necessary information to satisfy documentation requirements without interrupting the user, this is not possible in all cases.
It is likely that at least some answers will not be able to be gleaned from the EHR, due to missing data, data that is not computable, or data that is not represented in a standardized way. Also, even where answers are determined automatically, users may wish to review them for accuracy and completeness. Therefore, the system acting as a form filler is responsible for displaying all 'enabled' questions, groups, and display items to the end user for completion and/or review.
§spec-131^dtr-client^ui:In some cases, the population process **MAY** populate all answers to the Questionnaire.§ §spec-132^dtr-client^ui,processing:The DTR client **SHALL** provide the ability, but NOT a requirement, for providers to review, and if necessary revise, pre-populated answers prior to saving the resulting response for subsequent use within the EHR.§

#### Questionnaire Rendering
DTR leverages a subset of extensions and capabilities defined by the SDC implementation guide to support control over [rendering](http://hl7.org/fhir/uv/sdc/STU3/rendering.html), [flow logic](https://hl7.org/fhir/uv/sdc/STU3/workflow.html), and [population and calculation](https://hl7.org/fhir/uv/sdc/STU3/populate.html) of answers. The DTR SDC Questionnaire profile and DTR Adaptive Questionnaire profile identify the set of core elements and extensions that must be supported by 'full' EHRs and DTR solutions in terms of rendering and processing Questionnaires and their associated responses - and the elements that payers can count on being supported in the Questionnaires they expose.

Two different profiles are used to support two different approaches to managing questionnaire logic and two different levels of engagement between the form filling interface and the payer:
* [DTR Standard Questionnaire](StructureDefinition-dtr-std-questionnaire.html) 
* [DTR Adaptive Questionnaire](StructureDefinition-dtr-questionnaire-adapt.html)
  
§spec-133^dtr-client,dtr-server^exchange:Implementers **SHOULD** review the advanced rendering, advanced behavior, population and adaptive forms portions of the SDC implementation guide, focusing on the elements and extensions included in the DTR profiles.§ §spec-134^dtr-client,dtr-server^exchange:Implementers **SHOULD** also be familiar with the documentation about the Questionnaire and QuestionnaireResponse resources from the core FHIR specification.§ Conformance with DTR requires conformance with the relevant portions of the SDC implementation guide.

§spec-135^dtr-client^ui,processing:All DTR applications **SHALL** support rendering according to the `mustSupport` elements in the DTR Questionnaire profile as well as executing all CQL found within Questionnaire extensions.§ §spec-136^dtr-client^exchange:CQL and FHIR Questionnaires **SHALL** be required even when DTR is implemented within a DTR Native App as opposed to a DTR SMART App.§

#### Separating user provided information from CQL retrieved information
§spec-137?^dtr-client^processing:When a user fills in a value or changes an answer in a QuestionnaireResponse, the DTR client **SHALL** populate the [`information-origin`](StructureDefinition-information-origin.html) extension, setting the `author` property to the current user, and setting `source` to 'override' if the source was already 'override', 'auto-client', 'auto-server', or 'manual' otherwise.§ §spec-138^dtr-client^exchange:DTR clients **SHALL** either provide a PractitionerRole in the SMART App launch of DTR or support transmitting the role by means of the [`activeRole`](StructureDefinition-activeRole.html) extension within the Practitioner resource.§

#### QuestionnaireResponse Contained Resources 
This guide contains certain expectations around the use of ['contained'](https://hl7.org/fhir/R4/references.html#contained) resources with a QuestionnaireResponse:
* §spec-139^dtr-server^exchange:All references within the QuestionnaireResponse **SHALL** only point to either contained resources or to resources that reside on the DTR client's FHIR endpoint.§  (It is not acceptable to point to resources on the payer's endpoint or anywhere else).
* §spec-140^dtr-server^exchange:The only situation where a resource can be ['contained'](https://hl7.org/fhir/R4/references.html#contained) **SHALL** be if the contained instance is provided by the payer either:§
  *  In the initial partially pre-populated QuestionnaireResponse that is provided in the [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation, or 
  *  In a response to the [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) operation. 
* §spec-141^dtr-server^exchange:The only place ['contained'](https://hl7.org/fhir/R4/references.html#contained) resource references are permitted **SHALL** be in `item.answer` references.§  (References such as subject or author will never be contained resources).

Non-contained resources will be packaged inside a Bundle prior to submission to the payer.

#### QuestionnaireResponse validation
Each Questionnaire has a set of rules that determine whether a QuestionnaireResponse is allowed to be considered 'complete'.  For example, cardinality expectations on answers, restrictions on allowed values, etc.  These rules are defined both by core elements as well as by extensions.

§spec-142^dtr-client^processing:The DTR client **SHALL** validate the QuestionnaireResponse on an ongoing basis as the user is reviewing and entering data.§  §spec-143^dtr-client^ui:The client **SHALL** visually flag any elements that require adjustment to meet validation rules.§  

§spec-144?^dtr-client^ui:For Standard Questionnaires, when the QuestionnaireResponse is valid, the DTR client **SHALL** indicate that to the user and allow them to mark the QuestionnaireResponse as complete, though the user **MAY** opt to continue making changes or save the QuestionnaireResponse in draft form.§  §spec-145^dtr-client^processing:The DTR app **SHALL NOT** mark a Standard QuestionnaireResponse as 'complete' automatically.§  

With an adaptive Questionnaire, there is an iteration of invoking [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html), populating if possible, and allowing user review/adjustment of answers.  §spec-146^dtr-client^ui,processing:The DTR client **SHALL NOT** allow the user to indicate they are ready for the next question/set of questions until the answers to the current QuestionnaireResponse pass validation rules.§  §spec-147?^dtr-server^exchange:If [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) is invoked with a QuestionnaireResponse the payer determines is invalid based on the rules in the [contained](https://hl7.org/fhir/R4/references.html#contained) Questionnaire, it **SHALL** return an HTTP 400 error with an OperationOutcome indicating the circumstances where the QuestionnaireResponse is invalid.§

Unlike Standard Questionnaires, with adaptive QuestionnaireResponses the determination that a QuestionnaireResponse is complete is made by the payer.  The final call to [`$next-question`](OperationDefinition-DTR-Questionnaire-next-question.html) will result in an echo back of the QuestionnaireResponse with no further questions provided in the [contained](https://hl7.org/fhir/R4/references.html#contained) Questionnaire, and with the QuestionnaireResponse set to 'complete'.  §spec-148^dtr-server^exchange:However, the QuestionnaireResponse **MAY** have a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension added reflecting the payer's coverage assessment based on the information gathered in the QuestionnaireResponse.§

#### Additional considerations
If a questionnaire or question is marked as [`questionnaire-signatureRequired`](http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired), then the DTR client will need to add a [`questionnaireresponse-signature`](http://hl7.org/fhir/StructureDefinition/questionnaireresponse-signature) extension to the appropriate location in the QuestionnaireResponse.  The signature would attest to the QuestionnaireResponse as a whole, or to the specific item the signature appears on – excluding any [`questionnaireresponse-signature`](http://hl7.org/fhir/StructureDefinition/questionnaireresponse-signature) extensions themselves.  
  
§spec-149^dtr-client^processing:In some cases, the answer to a question modified by a user **MAY** be the input to an expression driving other logic within the questionnaire.§  §spec-150^dtr-client^processing:DTR clients **SHALL** monitor for changes to dependent questionnaire answers and re-execute logic, adjusting calculatedValues, enabling elements, adjusting validation rules, etc. based on changes made by the user.§

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Storing QuestionnaireResponses
The DTR process creates a QuestionnaireResponse resource through the course of normal operation.  §spec-151^dtr-client^processing,storage:At any point prior to completion a DTR client **SHALL** be able to save the `in-progress` QuestionnaireResponse, both to ensure that work-in-progress is not lost, and to allow the user to close the session and then relaunch it later.§  §spec-152?^dtr-client^storage:When the QuestionnaireResponse has been marked as `completed`, the DTR client **SHALL** save the QuestionnaireResponse to the EHR.§

§spec-153?^dtr-client^processing,storage:A DTR SMART App **SHALL** 'create' the record if it had not previously been stored, or 'update' if the record had already been saved at least once via the FHIR API.§

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")

---------------------
### Passing DTR QuestionnaireResponses to Downstream Processes
The information gathered via DTR can be used for a variety of purposes:
* For inclusion as a prior authorization attachment (either via PAS, CDex, or via traditional attachment submission mechanisms).
* For inclusion as a claims attachment as part of an X12 submission.
* To accompany the order so the information is available to the performing system as per the FHIR Orders Exchange IG.
* To be retained by the EHR in the event of a subsequent audit.
* Additional purposes not yet defined.
  
Once DTR has written a QuestionnaireResponse to the DTR Client and updated the `QuestionnaireResponse.status` element to complete, the DTR Client needs to understand what action(s) it should take with the collected information. This is accomplished via three extensions:
1. The [`qr-coverage`](StructureDefinition-qr-coverage.html) extension provides a reference to the Coverage resource(s) related to the QuestionnaireResponse.
2. The [`qr-context`](StructureDefinition-qr-context.html) extension provides a reference to the Request resource(s) and/or Encounter related to the QuestionnaireResponse.
3. The [`intendedUse`](StructureDefinition-intendedUse.html) extension indicates how the EHR is to use the information with respect to the associated orders/records
4. The [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extension captures any coverage determination made by the payer with respect to the Request or encounter resources mentioned in the `context` extension.
 
§spec-154^dtr-client^processing:Upon storing a completed QuestionnaireResponse with one or more [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extensions, the EHR **SHALL** propagate the [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) extensions to all non-Coverage resources included on the [`qr-context`](StructureDefinition-qr-context.html) extension on the QuestionnaireResponse.§  §spec-155?^dtr-client^processing:If a [`coverage-information`](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) already exists on the target resource with the same `coverage-information.coverage`, it **SHALL** be overridden.§

§spec-156^dtr-client^exchange:In those cases where a QuestionnaireResponse is to be used to convey information either to the payer or to downstream service providers, the DTR Client **SHALL** place the QuestionnaireResponse in a 'collection' Bundle complying with the [questionnaireResponseBundle](StructureDefinition-DTR-QRBundle.html) profile.§ §spec-157^dtr-client^exchange:This Bundle **SHALL** include no more than one QuestionnaireResponse entry and it **SHALL** be the initial entry.§  §spec-158^dtr-client^exchange:The bundle **SHALL** also include any resources that are referenced by the QuestionnaireResponse as answerReference that are not already contained within the QuestionnaireResponse.§ This ensures that all necessary information is delivered without a need for subsequent queries.

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
Only those resources directly referenced in the QuestionnaireResponse are included. If further references from a referenced resource are desired, the designer of the Questionnaire must ensure that these are also included as answers (possibly as hidden answers automatically populated by CQL within the Questionnaire).
      </td></tr>
  </table>
</div><br>

While multiple purposes are possible, the expectation is that all information in the QuestionnaireResponse will be used for that purpose (e.g., If a QuestionnaireResponse had a purpose of 'prior authorization' and 'order transmission', then the full QuestionnaireResponse bundle would be sent as a prior authorization attachment and as an attachment when the order is sent to the performer).

§spec-159?^dtr-client^exchange:If there is a desire to send different content to different recipients, then distinct QuestionnaireResponses **SHALL** be used.§
It is up to the DTR Client to determine the process by which attachments to prior auth requests, claims or orders are assembled - this could be done automatically, or with human review.

[![ToTop](PageTop.png){:style="float: none;"}](specification.html "Back to top of page")
