
<div class="stu-note">
<br/>
<p>This ballot addresses several additions, modifications, technical corrections, errata, and clarifications listed below. They have been reviewed
and voted on by the members of the <a href="http://www.hl7.org/Special/committees/dss/">HL7 Clinical Decision Support WorkGroup</a>, which is sponsoring this ballot release and reconciliation of the comments.</p>
<h3>STU 1.1.0 Ballot Changes</h3>

<p><b>The following issues are addressed for this ballot:</b></p>

<ul> 
   <li>
  <a href="https://jira.hl7.org/browse/FHIR-34291">FHIR-34291</a>:
  Deferring and relaunching DTR App
  <a href="specification__behaviors__persisting_application_state.html#persisting-application-state">(Persisting Application State)</a>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34151">FHIR-34151</a>:
  Need an ability for DTR to store prior authorization
  <a href="specification__behaviors__sdc_adaptive_forms.html#adaptive-forms-and-prior-authorization">(Adaptive Forms and Prior Authorization)</a>
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34121">FHIR-34121</a>:
  Provide a mechanism for Template to specify what to do when DTR ends
  <a href="specification__behaviors__persisting_application_state.html#how-dtr-saves-context-of-dtr-for-a-relaunch">(How DTR Saves Context of DTR for a Relaunch)</a>
  </li>

 <li>
  <a href="https://jira.hl7.org/browse/FHIR-34128">FHIR-34128</a>:
  Allow passing 'order' context when launching DTR
  <a href="specification__behaviors__persisting_application_state.html#how-dtr-saves-context-of-dtr-for-a-relaunch">(How DTR Saves Context of DTR for a Relaunch)</a>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34103">FHIR-34103</a>:
  Clarify minimum Questionnaire capabilities
  <a href="artifacts.html#structures-resource-profiles">(Structures: Resource Profiles )</a>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34077">FHIR-34077</a>:
  Incorporate relevant portions of the STU1 supplemental guide into the STU2 version
  <a href="specification__behaviors__best_practices.html#best-practices">(Best Practices)</a>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33328">FHIR-33328</a>:
  Need clarification of what the DTR Task page is actually for
  <a href="specification__behaviors__task_creation.html">(Task Creation)</a>
  </li>
 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33226">FHIR-33226</a>:
  Formalize how DTR passes information to PAS, PAO or other exchange IG
  <a href="specification__behaviors__passing_information_other_exchanges.html">(How DTR passes information to PAS, PAO or other exchanges)</a>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33224">FHIR-33224</a>:
  Add support for SDC Adaptive forms
  <a href="specification__behaviors__sdc_adaptive_forms.html">(SDC Adaptive Forms)</a>
  </li>

</ul>

<br>

<h3>STU 1.1.0 Publication Changes</h3>
<p><b>The following issues are addressed resulting from this ballot:</b></p>

<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-24714">FHIR-24714</a>:
  This is a security risk as described in the last ballot. - DTR #60
  <a href="specification__cds_hooks.html#use-of-cardlinks">(Use of Card.links)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33328">FHIR-33328</a>:
  Need clarification of what the DTR Task page is actually for
  <a href="specification__behaviors__task_creation.html">(Task Creation)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36117">FHIR-36117</a>:
  DTR Document Reference R4 Resource Profile Inappropriately Marks Elements As Must Support
  <a href="underlying_technologies.html#must-support">(Must Support)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36220">FHIR-36220</a>:
  CQL execution errors in an automated process should not require an end user to be notified
  <a href="specification__behaviors__execution_of_CQL.html#engine-execution">(Engine Execution)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36225">FHIR-36225</a>:
  statement doesn't quite make sense
  <a href="use_cases.html#crd-and-dtr-workflow">(CRD and DTR Workflow)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36227">FHIR-36227</a>:
  fix link (& therefore normative requirement) to DTR Questionnaire, instead of base CQF questionnaire
  <a href="specification__profiles.html#cqf-questionnaire">(CQF Questionnaire)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36228">FHIR-36228</a>:
  Need clearer expectations around reusing and refreshing the QuestionnaireResponse
  <a href="specification__behaviors__persisting_results.html">(Persisting Results)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36355">FHIR-36355</a>:
  Refactor the overview
  <a href="index.html">(Overview)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36371">FHIR-36371</a>:
  Clarify 'required' documentation
  <a href="use_cases.html">(Use Cases)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36378">FHIR-36378</a>:
  Clarify CQL version expectations
  <a href="underlying_technologies.html#clinical-quality-language">(Clinical Quality Language)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36481">FHIR-36481</a>:
  STU note should go away
  <a href="specification__behaviors__persisting_application_state.html#how-dtr-saves-context-of-dtr-for-a-relaunch">(How DTR Saves Context of DTR for a Relaunch)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36484">FHIR-36484</a>:
  Remove SMART on FHIR applications and servers section
  <a href="specification__behaviors__persisting_application_state.html#smart-on-fhir-applications-and-servers">(Persisting Application State)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36489">FHIR-36489</a>:
  Requesting user identity stuff belongs in section on launch
  <a href="specification__behaviors__persisting_application_state.html#requesting-user-identity">(Requesting User Identity)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36522">FHIR-36522</a>:
  add to sentence 
  <a href="use_cases.html#ehr-system">(EHR System)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36523">FHIR-36523</a>:
  change SHOULD to SHALL
  <a href="use_cases.html#home-oxygen-therapy-ordering---dtr-workflow-details">(Home Oxygen Therapy Ordering - DTR Workflow Details)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36525">FHIR-36525</a>:
  Change MAY to SHALL
  <a href="specification__cds_hooks.html#establish-patient-context">(Establish Patient Content)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36528">FHIR-36528</a>:
  it is essential that payers create extensive CQL for payer rule automation
  <a href="specification__cql.html">(CQL)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36529">FHIR-36529</a>:
  Change MAY to SHOULD
  <a href="specification__behaviors__retrieval_of_payer_resources.html#authentication-of-smart-on-fhir-application-to-payer-api">(Authentication of SMART on FHIR application to payer API)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36530">FHIR-36530</a>:
  refine verbiage 
  <a href="specification__behaviors__retrieval_of_payer_resources.html#retrieval-of-payer-resources">(Retrieval of Payer Resources)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36532">FHIR-36532</a>:
  Operation needs a detailed description
  <a href="artifacts.html#behavior-operation-definitions">(DTRQuestionnaireOperation)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36492">FHIR-36492</a>:
  Handling updates to Questionnaire.effectivePeriod
  <a href="OperationDefinition-questionnaire-package.html">(OperationDefinition: DTRQuestionnaireOperation)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36139">FHIR-36139</a>:
  More clarity around how UM Payer multi party arangements are handled
  <a href="index.html#overview">(Overview)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36148">FHIR-36148</a>:
  no template property is defined in appContext, and questionnaire is OPTIONAL
  <a href="specification__behaviors__retrieval_of_payer_resources.html#questionnaire">(Questionnaire)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36150">FHIR-36150</a>:
  is a CRD server the same as a payer API?
  <a href="specification__behaviors__persisting_application_state.html#how-dtr-saves-context-of-dtr-for-a-relaunch">(How DTR Saves Context of DTR for a Relaunch)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36433">FHIR-36433</a>:
  Should be guidance about the use of versioning
  <a href="specification__behaviors__retrieval_of_payer_resources.html#questionnaire">(Questionnaire)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36439">FHIR-36439</a>:
  Why do we mandate the use of library?
  <a href="specification__behaviors__retrieval_of_payer_resources.html#questionnaire">(Questionnaire)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36445">FHIR-36445</a>:
  Caching guidance needs to be clarified
  <a href="specification__behaviors__execution_of_CQL.html#execution-results">(Executing Results)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36538">FHIR-36538</a>:
  DTR Questionnaire should be removed
  <a href="specification__behaviors__execution_of_CQL.html#execution-results">(Profiles)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36542">FHIR-36542</a>:
  Context extension needs more definition
  <a href="StructureDefinition-context.html">(Extension: QuestionnaireResponseContext)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36548">FHIR-36548</a>:
  add guidance to value set
  <a href="specification_value_set_code_system_guidance.html">(Value Set and Code System Guidance)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36549">FHIR-36549</a>:
  relaunch for other users
  <a href="specification__behaviors__persisting_application_state.html#visibility-of-usage-sessions-to-other-users">(Visibility of Usage Sessions to Other Users)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36550">FHIR-36550</a>:
  Add SHALL save DTR response in EMR to beginning of section
  <a href="specification__behaviors__persisting_results.html">(Persisting Results)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36551">FHIR-36551</a>:
  change SHOULDs to SHALLs in task creation
  <a href="specification__behaviors__task_creation.html#task-creation">(Task Creation)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36553">FHIR-36553</a>:
  change from "needs to" to SHALL
  <a href="specification__behaviors__sdc_adaptive_forms.html">(SDC Adaptive Forms)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36555">FHIR-36555</a>:
  limit scope
  <a href="specification__behaviors__privacy_safety_and_security.html#privacy-safety-and-security">(Privacy, Safety and Security)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36624">FHIR-36624</a>:
  attestation concern
  <a href="use_cases.html#crd-and-dtr-workflow">(CRD and DTR Workflow)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36624">FHIR-36624</a>:
  attestation concern
  <a href="use_cases.html#crd-and-dtr-workflow">(CRD and DTR Workflow)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34121">FHIR-34121</a>:
  Provide a mechanism for Template to specify what to do when DTR ends
  <a href="use_cases.html#crd-and-dtr-workflow">(QuestionnaireResponse)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33224">FHIR-33224</a>:
  Add support for SDC Adaptive forms
  <a href="underlying_technologies.html#structured-data-capture">(Structured Data Capture)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36390">FHIR-36390</a>:
  Launch instructions need correction/clarification
  <a href="specification__cds_hooks.html#establish-patient-context">(Establish Patient Conext)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36276">FHIR-36276</a>:
  Security review of SDC Adaptive Forms in DTR
  <a href="specification__behaviors__sdc_adaptive_forms.html">(SDC Adaptive Forms)</a>
  </li>
</ul>
<ul> 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36492">FHIR-36492</a>:
  Handling updates to Questionnaire.effectivePeriod
  <a href="specification__behaviors__persisting_application_state.html#session-expiration">(Session Exploration)</a>
  </li>
</ul>



</div>
