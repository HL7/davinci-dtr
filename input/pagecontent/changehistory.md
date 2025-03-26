<p><b>The following issues have been addressed since publication of Release 2.1.0:</b></p>
<ul>
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49339">FHIR-49399</a>:
  No guidance or constraint on QuestionnaireResponse Bundle that only one QuestionnaireResponse is allowed
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49343">FHIR-49343</a>:
  Narrative guidance for QR Bundle needs to change 'will' to 'SHALL'
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49639">FHIR-49639</a>:
  'Questionnaire for adaptive form Search' profile should prevent including questions
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49724">FHIR-49724</a>:
  DTR Adaptive form parent should be DTR Questionnaire
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49729">FHIR-49729</a>:
  Consider making supportLink 0..1
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49730">FHIR-49730</a>:
  Why is itemOptionalDisplay no longer prohibited?
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49836">FHIR-49836</a>:
  Conformance requirements on subjective qualifications is inappropriate
  </li> 


  <!-- 
  
  <li>
  <a href="">FHIR-</a>:
  words
  </li> 
  
  -->





  <li>
  <a href="https://jira.hl7.org/browse/FHIR-49699">FHIR-49699</a>:
  Mismatched requirements between operation $next-question and QuestionnaireResponse.item
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-50013">FHIR-50013</a>:
  Requirement for support of $log-questionnaire-errors operation is inconsistent 
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-50020">FHIR-50020</a>:
  Section on Storing QuestionnaireResponses contains contradictory guidance  
  </li>
</ul>
</div>

### Release 2.1.0
<p><b>The following issues are addressed resulting from the STU Update Comment period review:</b></p>
<ul>
    <li>
  <a href="https://jira.hl7.org/browse/FHIR-46554">FHIR-46554</a>:
   Include questionnaire details in the example
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46646">FHIR-46646</a>:
   Conformance requirement on subjective determination
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46750">FHIR-46750</a>:
   Clarify that CQL expectations are for app/EHR, not payer
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46754">FHIR-46754</a>:
   $questionnaire-package narrative and DTRQuestionnairePackageBundle do not align.
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-47250">FHIR-47250</a>:
   Clarify adaptive architecture
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-47706">FHIR-47706</a>:
   Add support for US Core 7
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-47995">FHIR-47995</a>:
   Must Support guidance section should be moved from Specification page to a 'Conformance Expectations' page
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48314">FHIR-48314</a>:
   providers need a way to indicate if they want pre-emptive prior auth as part of adaptive forms
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48487">FHIR-48487</a>:
   Replace EHR with Provider HIT
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48488">FHIR-48488</a>:
   Ambiguous SHALL on resource support requirement
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48490">FHIR-48490</a>:
   $questionnaire-response output parameter name inconsistency
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48494">FHIR-48494</a>:
   Include CMS requirements
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48495">FHIR-48495</a>:
   CMS enforcement discretion comes out of nowhere
  </li> 

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48499">FHIR-48499</a>:
   add or staff to better capture people who populate
  </li> 

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48501">FHIR-48501</a>:
   Change SHOULD to SHALL
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48504">FHIR-48504</a>:
   Questionnaire-package Bundle Example not updated to only have one questionnaire
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48506">FHIR-48506</a>:
   SHOULD have CQL logic
  </li>
 
   <li>
  <a href="https://jira.hl7.org/browse/FHIR-48508">FHIR-48508</a>:
   change conformance language for the retrieving launch context
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48510">FHIR-48510</a>:
   suggest adding "including appeals"
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48511">FHIR-48511</a>:
   Change SHOULD to SHALL
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48513">FHIR-48513</a>:
   No examples of Questionnaire Package Bundles with a QuestionnaireResponse
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48515">FHIR-48515</a>:
   Explain Reasoning behind the difference in Questionnaire Adaptive extension cardinality
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48516">FHIR-48516</a>:
   Clarify QuestionnaireResponse contained Questionnaire Requirements for adaptive questionnaires
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48517">FHIR-48517</a>:
   Library and ValueSet Caching requirements for DTR Apps and Full EHRs
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48518">FHIR-48518</a>:
   Are there required DTR client responses to an added coverage-information extension?
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48519">FHIR-48519</a>:
   Clarify whether FHIRPath is allowed in pre-population expressions
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48520">FHIR-48520</a>:
   Clarify use of PH Alternate Expression Extension
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48521">FHIR-48521</a>:
   Determining support for payer questionnaires
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48523">FHIR-48523</a>:
   Is the "Retrieving Launch Context Information" informational?
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48524">FHIR-48524</a>:
   Constraining Queries example clarification
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48686">FHIR-48686</a>:
   Profile $next-question (or create a new operation) so there's an actual use for the DTR adaptive questionnaire profile
  </li> 

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48694">FHIR-48694</a>:
   Clarify ValueSet and $expand Guidance
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48703">FHIR-48703</a>:
   Coverage context search parameter inconsistencies
  </li> 

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48728">FHIR-48728</a>:
   Inconsitency between contexts in CRD and DTR
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-48744">FHIR-48744</a>:
   Align endpoint discovery language w/ CRD
  </li>

</ul>


### Release 2.1.0-preview
<p><b>The following issues are addressed in preparation for this STU Update:</b></p>
<ul>
  <li>
    <i> Multiple changes have been incorporated to provide support for both US Core 3.1.1 and 6.1 </i>
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-44930">FHIR-44930</a>:
  extra period breaks out a requirement in section 7.10.2 of the formal spec
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-45010">FHIR-45010</a>:
  Why does OperationOutcome repeat
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46288">FHIR-46288</a>:
  Identifying the minimum resource read access ought to be SHALL instead of 'will'
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-45945">FHIR-45945</a>:
  Clarify links to base FHIR resources in Background section
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-45075">FHIR-45075</a>:
  DTR should not point to CDS Hook security guide
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-44929">FHIR-44929</a>:
  Ambiguity within the formal specification on use of SMART on FHIR Backend Services
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-42809">FHIR-42809</a>:
  allowing linking to a portal rather than building out a questionnaire is not in line with regulation, legislation, or even the spirit of IG
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-45020">FHIR-45020</a>:
  $questionnaire-package Operation Definition incorrectly states to return warning in outer Bundle
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46627">FHIR-46627</a>:
  Include Burden Reduction common narrative for Enforcement Discretion
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46569">FHIR-46569</a>:
  Use EHR rather than EMR throughout
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46525">FHIR-46525</a>:
  Discrepancy in DTR Package output definition
  </li>
      
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-44789">FHIR-44789</a>:
  Can DTR be satisfied by a pre-existing QR?
  </li>
      
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-45967">FHIR-45967</a>:
  questionnaire-package bundle needs to allow for QuestionnaireResponses
  </li>
      
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46441">FHIR-46441</a>:
  Add endpoint discovery expectations
  </li>
      
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46285">FHIR-46285</a>:
  Need to formalize expectation around use of 'questionnaire-adaptive' extension
  </li>
      
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-46002">FHIR-46002</a>:
  Provide guidance on how to transmit FHIR resources to Adaptive Questionnaires
  </li>
</ul>

<div markdown="1">

### Release 2.0.1 
<p><b>The following issues are addressed in this technical correction:</b></p>
<ul>
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-43030">FHIR-43030</a>:
  Information Origin Extension challenged to be supported by SMART
  </li>
</ul>
</div>

### Release 2.0.0
<p><b>The following issues are addressed resulting from this ballot:</b></p>
<ul>
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-24714">FHIR-24714</a>:
  This is a security risk as described in the last ballot. - DTR #60
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33328">FHIR-33328</a>:
  Need clarification of what the DTR Task page is actually for
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36117">FHIR-36117</a>:
  DTR Document Reference R4 Resource Profile Inappropriately Marks Elements As Must Support
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36220">FHIR-36220</a>:
  CQL execution errors in an automated process should not require an end user to be notified
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36225">FHIR-36225</a>:
  statement doesn't quite make sense
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36227">FHIR-36227</a>:
  fix link (& therefore normative requirement) to DTR Questionnaire, instead of base CQF questionnaire
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36228">FHIR-36228</a>:
  Need clearer expectations around reusing and refreshing the QuestionnaireResponse
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36355">FHIR-36355</a>:
  Refactor the overview
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36371">FHIR-36371</a>:
  Clarify 'required' documentation
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36378">FHIR-36378</a>:
  Clarify CQL version expectations
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36481">FHIR-36481</a>:
  STU note should go away
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36484">FHIR-36484</a>:
  Remove SMART on FHIR applications and servers section
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36489">FHIR-36489</a>:
  Requesting user identity stuff belongs in section on launch
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36522">FHIR-36522</a>:
  add to sentence 
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36523">FHIR-36523</a>:
  change SHOULD to SHALL
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36525">FHIR-36525</a>:
  Change MAY to SHALL
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36528">FHIR-36528</a>:
  it is essential that payers create extensive CQL for payer rule automation
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36529">FHIR-36529</a>:
  Change MAY to SHOULD
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36530">FHIR-36530</a>:
  refine verbiage 
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36532">FHIR-36532</a>:
  Operation needs a detailed description
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36139">FHIR-36139</a>:
  More clarity around how UM Payer multi party arrangements are handled
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36148">FHIR-36148</a>:
  no template property is defined in appContext, and questionnaire is OPTIONAL
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36150">FHIR-36150</a>:
  is a CRD server the same as a payer API?
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36433">FHIR-36433</a>:
  Should be guidance about the use of versioning
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36439">FHIR-36439</a>:
  Why do we mandate the use of library?
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36445">FHIR-36445</a>:
  Caching guidance needs to be clarified
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36538">FHIR-36538</a>:
  DTR Questionnaire should be removed
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36542">FHIR-36542</a>:
  Context extension needs more definition
   </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36548">FHIR-36548</a>:
  add guidance to value set
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36549">FHIR-36549</a>:
  relaunch for other users
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36550">FHIR-36550</a>:
  Add SHALL save DTR response in EMR to beginning of section
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36551">FHIR-36551</a>:
  change SHOULDs to SHALLs in task creation
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36553">FHIR-36553</a>:
  change from "needs to" to SHALL
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36555">FHIR-36555</a>:
  limit scope
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36624">FHIR-36624</a>:
  attestation concern
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34121">FHIR-34121</a>:
  Provide a mechanism for Template to specify what to do when DTR ends
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33224">FHIR-33224</a>:
  Add support for SDC Adaptive forms
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36276">FHIR-36276</a>:
  Security review of SDC Adaptive Forms in DTR
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36492">FHIR-36492</a>:
  Handling updates to Questionnaire.effectivePeriod
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36478">FHIR-36478</a>:
  SDC questionnaire responses will always have a Questionnaire url somewhere
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36527">FHIR-36527</a>:
  refine language 
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36483">FHIR-36483</a>:
  Need to clarify pruning expectations
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36390">FHIR-36390</a>:
  Launch instructions need correction/clarification
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36491">FHIR-36491</a>:
  Drop section on "usage sessions"
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36385">FHIR-36385</a>:
  No guidance on CRD
   </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-40438">FHIR-40438</a>:
  Section on DTR use of US Core has link which points to general US Core page instead of 3.1.1
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-24581">FHIR-24581</a>:
  Identify the subject extension. - DTR #15
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36151">FHIR-36151</a>:
  Again, DTR <-> Payer should use SMART backend services
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36365">FHIR-36365</a>:
  Downloads should be a separate page
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36394">FHIR-36394</a>:
  CQL logic guidance is misleading
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36367">FHIR-36367</a>:
  Talk about DTR before you talk about CRD
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-40549">FHIR-40549</a>:
  Guidance regarding the Endpoint for adaptive form next question
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36470">FHIR-36470</a>:
  Fix guidance on saving state
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36434">FHIR-36434</a>:
  Revamp endpoint description a bit
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36369">FHIR-36369</a>:
  Payer
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36376">FHIR-36376</a>:
  Fix wording on SDC
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36374">FHIR-36374</a>:
  Should be no conformance rules around CDS Hooks or CRD
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36377">FHIR-36377</a>:
  Clarify language on CQL
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36435">FHIR-36435</a>:
  Remove CRD paragraph
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36362">FHIR-36362</a>:
  "CQL and FHIR Questionnaires SHALL be required" is unclear
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-39504">FHIR-39504</a>:
  Add guidance on endpoint discovery/configuration
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36539">FHIR-36539</a>:
  DTR QuestionnaireResponse should be based on SDC
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36395">FHIR-36395</a>:
  Context needs to talk about hierarchy of expression too.
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36380">FHIR-36380</a>:
  Why is change history wrapped in an STU note?
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36386">FHIR-36386</a>:
  DTR to payer security doesn't belong in CRD links section
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-38837">FHIR-38837</a>:
  Specific issues related to sensitive or patient restricted information
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36138">FHIR-36138</a>:
  Clarify what information is in scope for FHIR CQL support
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36430">FHIR-36430</a>:
  Clarify expectations on missing context
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36300">FHIR-36300</a>:
  Who is responsible for provision of the token
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36482">FHIR-36482</a>:
  Patient must always be in context
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-21006">FHIR-21006</a>:
  DTR should point to SDC, not CQIF Questionnaire
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36479">FHIR-36479</a>:
  Provide proper details on authentication
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36392">FHIR-36392</a>:
  Guidance on CQL isn't quite right
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36379">FHIR-36379</a>:
  Spec *MUST* use mustSupport in its profiles
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36384">FHIR-36384</a>:
  "Profiles" page doesn't really make sense as a page
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36382">FHIR-36382</a>:
  Formal specification page should be revamped
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36447">FHIR-36447</a>:
  Guidance on handling Questionnaire is insufficient
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36364">FHIR-36364</a>:
  Home page should appear on the menu
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36465">FHIR-36465</a>:
  DTR is repeating guidance better covered in SDC
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36360">FHIR-36360</a>:
  Conformance statements don't belong on the home page
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36368">FHIR-36368</a>:
  Conformance language doesn't belong on use-case page
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36410">FHIR-36410</a>:
  Title and content don't jive
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36356">FHIR-36356</a>:
  Adjust note to implementers
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-37949">FHIR-37949</a>:
  Remove all notion of storing work-in-progress on payer
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-40421">FHIR-40421</a>:
  Guidance on this page needs to be rewritten
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36450">FHIR-36450</a>:
  Goal is overstated and user input always required
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36476">FHIR-36476</a>:
  Refactor relaunch documentation
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36349">FHIR-36349</a>:
  Split menu into background and spec
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36149">FHIR-36149</a>:
  appContext should be a black box to EHR, use SMART launch param's instead
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36440">FHIR-36440</a>:
  Remove the 'relaunch' section
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36517">FHIR-36517</a>:
  Clarification on Tasks
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36531">FHIR-36531</a>:
  Change SHOULD to SHALL and delete the MAY sentence that follows
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36146">FHIR-36146</a>:
  Clarify that DTR app should authenticate to payer with SMART Backend Services
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36441">FHIR-36441</a>:
  Remove FHIR version discussion
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36298">FHIR-36298</a>:
  CRD linking to website versus a DTR solution
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36429">FHIR-36429</a>:
  No appContext on stand-alone launch
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36547">FHIR-36547</a>:
  data SHOULD NOT be stored on the payer server
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36540">FHIR-36540</a>:
  Improve description of SDC Questionnaire profile
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36383">FHIR-36383</a>:
  Are you using SDC or CQF?
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36361">FHIR-36361</a>:
  Provenance expectations need more clarity
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36507">FHIR-36507</a>:
  Correct and re-organize this section
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36533">FHIR-36533</a>:
  Issues with lack of guidance on storage
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36129">FHIR-36129</a>:
  Initial DTR Launches should not be restricted to CDS Hooks Cards within the CRD workflow.
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36988">FHIR-36988</a>:
  Not clear where to get Requester Organization when creating PAS request
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36366">FHIR-36366</a>:
  Actors are unclear and in wrong place
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36438">FHIR-36438</a>:
  Questionnaire guidance is incorrect
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36537">FHIR-36537</a>:
  DocumentReference profile isn't sufficient
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36253">FHIR-36253</a>:
  DTR Spec needs a way to pass a questionnaire / response across organizations
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34151">FHIR-34151</a>:
  Need an ability for DTR to store prior authorization
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-39443">FHIR-39443</a>:
  Add expectations about terminology mapping
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36119">FHIR-36119</a>:
  DTR SDC Questionnaire For Adaptive Form Profile Inappropriately Marks Elements As Must Support
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36373">FHIR-36373</a>:
  Clarify US Core expectations
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36299">FHIR-36299</a>:
  Mapping CQLs to PA criteria
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36466">FHIR-36466</a>:
  Provider Attestation guidance needs fixing
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34103">FHIR-34103</a>:
  Clarify minimum Questionnaire capabilities
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-33226">FHIR-33226</a>:
  Formalize how DTR passes information to PAS, PAO or other exchange IG
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36219">FHIR-36219</a>:
  The CDS Hooks Card Link object should not require a DTR launch URL
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36004">FHIR-36004</a>:
  Change to use the CRD unsolicited prior auth profile
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36467">FHIR-36467</a>:
  Need a section on privacy/security
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36346">FHIR-36346</a>:
  Add 'support' menu item
  </li>
   
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36118">FHIR-36118</a>:
  DTR SDC Questionnaire Profile Inappropriately Marks Elements As Must Support
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36370">FHIR-36370</a>:
  Clarify expectations on QR approval
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36372">FHIR-36372</a>:
  Do we need a CRD & DTR section here?
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36393">FHIR-36393</a>:
  Page names are overly long
  </li>
    
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36432">FHIR-36432</a>:
  Are DTR Questionnaire valuesets pre-expanded?
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36524">FHIR-36524</a>:
  remove references to manual alternatives/solutions that do not leverage the specs
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34291">FHIR-34291</a>:
  Deferring and relaunching DTR App
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-37270">FHIR-37270</a>:
  Access Token must not be included in appContext
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36443">FHIR-36443</a>:
  How does an app notify the payer system
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36520">FHIR-36520</a>:
  Change operation invocation
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36391">FHIR-36391</a>:
  Need more launch details
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-39492">FHIR-39492</a>:
  Allow DTR to be used from CDex
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36543">FHIR-36543</a>:
  Need a search parameter for new context extension
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36534">FHIR-36534</a>:
  Correct operation adaptive expectations
  </li>
 
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-40605">FHIR-40605</a>:
  Update Questionnaire package operation per discussions
  </li>
  
  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36431">FHIR-36431</a>:
  Inconsistency in how value sets & libraries are returned
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36625">FHIR-36625</a>:
  please clarify data access by payer
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-34128">FHIR-34128</a>:
  Allow passing 'order' context when launching DTR
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36436">FHIR-36436</a>:
  Do better job of explaining HRex decision points
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36468">FHIR-36468</a>:
  What's the point of distinguishing CQL vs. human-authored?
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36535">FHIR-36535</a>:
  We need examples for operation inputs and outputs
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36437">FHIR-36437</a>:
  Revamp payer authorization language
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36455">FHIR-36455</a>:
  Utilization of CQL
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36375">FHIR-36375</a>:
  Loosen rules on SMART
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36359">FHIR-36359</a>:
  Need CapabilityStatements
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36331">FHIR-36331</a>:
  Revamp expectations around launch parameters
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36192">FHIR-36192</a>:
  Include CRD questionnaire workflow, not just prior auth questionnaire
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36412">FHIR-36412</a>:
  Need more guidance on CDS Hooks launch
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36544">FHIR-36544</a>:
  Examples are incomplete and have extras
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36409">FHIR-36409</a>:
  EHR and DTR initiation
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-36411">FHIR-36411</a>:
  Organize interactions along likely HIT modules
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-41557">FHIR-41557</a>:
  Guidance on Referenced resources missing
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-41576">FHIR-41576</a>:
  Prohibit alternate use of 'next-question' data
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-41168">FHIR-41168</a>:
  "How DTR Passes Information" page is no longer accurate
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-40421">FHIR-40421</a>:
  Guidance on this page needs to be rewritten
  </li>

  <li>
  <a href="https://jira.hl7.org/browse/FHIR-41854">FHIR-41854</a>:
  DTR needs to be re-organized quite a bit
   </li>

 </ul>
