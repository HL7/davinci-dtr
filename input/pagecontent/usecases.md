<link rel="stylesheet" type="text/css" href="formatting.css" />

### CRD and DTR Workflow
The graphic below shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR app or equivalent native EHR app).

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> <!-- Note Text Here -->
 This workflow is just one example used to help illustrate the CRD and DTR APIs. It is expected that a supplemental guide will be produced moving forward to help implementers with more concrete examples.
      </td></tr>
  </table>
</div><br>
  
As an example, a clinician might order, “Home Oxygen Therapy”:

<!-- ![CRD DTR Flow](CRD_DTR_Flow.png){:style="float: none;width:849px;height:307px"} -->
[![CRD DTR Flow](CRD_DTR_Flow.png){:style="float: none; width:764px;height:276px; margin-left:35px; display: block;"}](CRD_DTR_Flow.png "View Image Larger")

* Arrows **1** - **4** represent the workflow processing to determine if there are documentation and/or prior authorization requirements (CRD):  

  * The EHR would allow for the ordering of a DME (Durable Medical Equipment) device “Home Oxygen Therapy” (arrow 1).
  * The EHR would then compose a CDS Hook call containing or referencing FHIR resources to be used when calling the CDS Service (CRD) (arrow 2).
  * CRD then, optionally, retrieves additional information from a repository to help determine if there are documentation and/or prior authorization requirements for a requested device, service, or medication. The repository API and repository are shown in the Payer box. (repository API arrow and arrow 3).
  * In this scenario a response is sent back to the EHR/clinician in the form of a CDS system action (arrow 4), annotating a FHIR resource with an extension indicating there are documentation requirements.<br><br>
	
* Arrows **4** - **6** represent the workflow processing to populate the template/questionnaire (DTR):  

  * User launches DTR based on the indication provided by CRD.
  * DTR will retrieve the appropriate Questionnaire(s) and rule(s) from the repository via a repository API.
  * The clinician would launch the SMART app/DTR (or equivalent native EHR app) which pre-populates one or more FHIR based Questionnaire(s) with data from the EHR.
  * In the event data is known to be available but does not exist in the EHR the clinician could attest to the data in question.
  * The clinician or designated staff member populates the fields that were not populated with data from the EHR and possibly adjusts pre-populated elements. When the documentation is complete (or partially complete) the clinician or designated staff member would save the QuestionnaireResponse. DTR writes the FHIR based QuestionnaireResponse to the EHR. At this point the QuestionnaireResponse could also be sent to any ancillary service.
  * In the event the QuestionnaireResponse was incomplete, DTR could be launched at a future time with a context of the in-progress QuestionnaireResponse or associated order/resource and the process continued.

### EHR System
The completion of documentation for ordered items or services is required by payers for prior authorization, claims submission, to support downstream providers in managing claims processes, to document medical necessity and/or for other coverage-related requirements.  This information gathering is done in conjunction with the Electronic Health Record (EHR) system, ideally automatically extracting information from the EHR and eliminating the need for the end user to search for and/or transcribe information that already exists.

If information required to complete the Questionnaire is not available to the DTR solution from the EHR in a computably discoverable way, then the application will prompt the provider to enter the missing information. 

### Relation to Coverage Requirements Discovery (CRD)
The [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/) service portion of the Burden Reduction workflow is responsible for verifying with the payer whether the product or service being ordered, or for which an appointment or encounter is being created is covered, requires documentation, and/or needs prior authorization. In most cases, the CRD service will return a system action annotating the relevant order/appointment/etc. with an extension containing the payer’s assessment and noting any documentation needs – potentially including specific Questionnaires and even partially populated draft QuestionnaireResponses that can be used in gathering that data. While CRD may verify that documentation and/or prior authorization is required, it does not manage completion of documentation, prior authorization, or validation of rules.  The ‘doc-needed’ coverage-information extension component in CRD communicates the need to launch DTR – including the most appropriate type of user to launch it.

The DTR process is responsible for accessing Questionnaire resources and rules (CQL), then pre-populating the questionnaire with EHR data and finally checking if the combination of pre-populated and manually-entered data satisfies requirements.

#### Home Oxygen Therapy Ordering - DTR Workflow Details
This example shows an overview of how the DTR SMART App (or equivalent native EHR app) fits into a workflow when ordering Home Oxygen Therapy. 
   
1. It is determined that documentation and/or prior authorization is required for coverage.
2. The DTR SMART App (or equivalent native EHR app) is launched from the  EHR based on the need being flagged by a CDS system action. 
3. The DTR SMART App (or equivalent native EHR app) fetches CQL (rules) and a FHIR Questionnaire from the payer server.
4. The engine then extracts as many answers as it can from the EHR to pre-populate a FHIR QuestionnaireResponse with FHIR-based EHR data.
5. If there is missing information, the user can manually provide it to fully populate the QuestionnaireResponse. If the QuestionnaireResponse is fully populated, the Questionnaire is not shown to the user unless specifically requested, in which case the user can review and potentially update pre-populated answers.
6. The DTR app/EHR function then writes the FHIR QuestionnaireResponse back to the EHR server.

![Process Flow Detail](DTR_Example_Workflow.png){:style="float: none;"}

### Relation to Clinical Data Exchange (CDex)  

DTR can be invoked for purposes other than specific Burden Reduction use-cases, specifically the guidance provided within the [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) Implementation Guide.  CDex specifies the use of DTR to [request attachments using questionnaires](https://hl7.org/fhir/us/davinci-cdex/requesting-attachments-questionnaire.html).  

CDex supports the launch of DTR to gather documentation through the [CDex Task Data Request Profile](http://build.fhir.org/ig/HL7/davinci-ecdx/StructureDefinition-cdex-task-data-request.html), which provides these necessary properties:
- The [`questionnaire` Task.input](http://build.fhir.org/ig/HL7/davinci-ecdx/StructureDefinition-cdex-task-data-request-definitions.html#diff_Task.input:questionnaire) reference - Communicates to the provider a URL of a data request FHIR Questionnaire  
- The [`data-request-questionnaire` Task.code](http://build.fhir.org/ig/HL7/davinci-ecdx/ValueSet-cdex-data-request-task-code.html) - Indicates the provider system uses DTR to complete the Questionnaire referenced in the `questionnaire` input parameter.  
<br>

See the Task Input sequence [here](http://build.fhir.org/ig/HL7/davinci-ecdx/task-based-approach.html#using-questionnaire-as-task-input).
