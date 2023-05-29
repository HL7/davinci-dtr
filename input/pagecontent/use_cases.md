### System Actors
DTR Fundamentally supports four different system actors:

> **1. Light DTR EHRs**  
> EHR systems which leverage a SMART app to manage data capture and rules execution, but which must be able to launch the SMART app, respond to app queries, and store the final documentation results
>
> **2. Full DTR EHRs**  
> EHR systems which manage DTR data capture and execution directly and also allow the rules to access other data and store final documentation results
>
> **3. DTR Smart Apps**  
> SMART on FHIR applications that take context from an EHR, retrieve questionnaires and rule sets from a DTR Payer server, render the Questionnaires and capture data, and store the results on payer and/or EHR systems 
>
> **4. DTR Payer Servers**  
> Responds to operations requesting Questionnaires, serve as a temporary repository for in-progress QuestionnaireResponses, and (optionally) help in the processing of adaptive questionnaires.  In this specification, payer rules are [CQL statements](https://cql.hl7.org//) used in a provider context to facilitate meeting documentation requirements.   
>

### EHR System
The goal of DTR is to collect clinical documentation and/or to encourage the completion of documentation that demonstrates medical necessity for ordered items or services. The completion of documentation for ordered items or services are required by payers for prior authorization or other coverage requirements.  This information gathering is done in conjunction with the Electronic Health Record (EHR) system.

It is possible to have a process where the focus is on the interaction with the EHR and an external application. Examples of external systems are administrative, payment, practice management, scheduling, and other applications.

If information required to complete the Questionnaire is not available to the SMART on FHIR application, then the application will need to prompt the provider to enter the missing information. Ultimately, the solution is to provide greater integration between the EHR and other supporting applications(e.g., Quality measures may also require this type of integration)

> Electronic Health Record (EHR) is used in this IG and can be considered equivalent to Electronic Medical Record (EMR) or a Practice Management System (PMS).

#### DTR Compliant SMART on FHIR app
Within DTR, the SMART on FHIR app (or equivalent native EHR app) serves as a middleware layer easing payer and provider integrations. This functionality enables DTR to gather Questionnaire resources, retrieve FHIR resources from EHRs, and run rules (CQL) to reduce the time involved in looking up documentation requirements.

### Relation to Coverage Requirements Discovery (CRD)
The [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/) service portion of the workflow is responsible for verifying with the payer that a given item, certain medications, procedure or other service requires documentation and/or Prior Authorization. It then provides the necessary links for the app to be launched and run. In most cases, the CRD service will return a CDS card populated with an app launch link for the DTR process, a link to a resource, and a DeviceRequest, MedicationRequest, or ServiceRequest resource ID. The app launch link can be used in a user interface in order to launch the app. While CRD may verify that documentation and/or prior authorization is required, it does not manage completion of documentation, prior authorization, or validation of rules.

The DTR process is responsible for accessing Questionnaire resources and rules (CQL), then prepopulating the questionnaire with EHR data and finally checking if the available EHR data satisfies requirements, as well as allowing for the manual population of any missing data.

#### Home Oxygen Therapy Ordering - DTR Workflow Details
This example shows an overview of how the DTR SMART on FHIR app (or equivalent native EHR app) fits into a workflow when ordering Home Oxygen Therapy. 
   
1. It is determined that documentation and/or prior authorization is required for coverage.
2. The DTR SMART App (or equivalent native app) is launched from the CDS card. 
3. The DTR SMART on FHIR app (or equivalent native EHR app) fetches CQL (rules) and a FHIR Questionnaire from the payer server.
4. The engine then extracts as many answers as it can in order to pre-populate a FHIR QuestionnaireResponse with FHIR-based EHR data.
5. If there is missing information, the user can manually provide it to fully populate the QuestionnaireResponse. If the QuestionnaireResponse is fully populated, the Questionnaire is not shown to the user unless specifically requested.
6. It then writes the FHIR QuestionnaireResponse back to the EHR server.

![Process Flow Detail](DTR_Example_Workflow.png){:style="float: none;"}

#### Relation to Clinical Data Exchange (CDex)

The [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) IG specifies the use of DTR to [request attachments using questionnaires](https://hl7.org/fhir/us/davinci-cdex/requesting-attachments-questionnaire.html).

#### CRD and DTR Workflow
The graphic shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR app or equivalent native EHR app).

Note: This workflow is just one example used to help illustrate the CRD and DTR APIs. It is expected that a supplemental guide will be produced moving forward to 
help implementers with more concrete examples.
 
As an example, a clinician might order, “Home Oxygen Therapy”
* Arrows 1-4 represent the workflow processing to determine if there are documentation and/or prior authorization requirements (CRD)
  * The EHR would allow for the ordering of a DME (Durable Medical Equipment) device “Home Oxygen Therapy” (arrow 1).
  * The EHR would then compose a FHIR based message to be used when calling the CDS Service (CRD) (arrow 2).
  * CRD then retrieves information from a repository to determine if there are documentation and/or prior authorization requirements for a requested device, service, or medication. The repository API and repository are shown in the Payer box. (repository API arrow and arrow 3).
  * In this scenario a response is sent back to the EHR/clinician in the form of a CDS card (arrow 4), indicating there are documentation requirements.
	
* Arrows 4 and 5 represent the workflow processing to populate the template/questionnaire (DTR)   
  * In the CDS Hooks card, there may be a link that allows the clinician to launch the DTR SMART on FHIR app (or equivalent native EHR app) shown in the DTR Process area.
  * DTR will retrieve the appropriate Questionnaire(s) and rule(s) from the repository via a repository API.
  * The clinician would click the SMART app/DTR (or equivalent native EHR app) link which pre-populates a FHIR based Questionnaire with data from the EHR.
  * In the event information is known to be available but does not currently exist in the EHR, the clinician could attest the data in question exists.
  * The clinician populates the fields that were not populated with data from the EHR. When the documentation is complete (or partially complete) the clinician would save the QuestionnaireResponse. DTR writes the FHIR based QuestionnaireResponse to the EHR. At this point the QuestionnaireResponse could also be sent to any ancillary service.
  * In the event the QuestionnaireResponse was incomplete, a Task could be created to allow for the QuestionnaireResponse to be completed at a later time. The QuestionnaireResponse itself could also be used to relaunch an incomplete session.

![CRD DTR Flow](CRD_DTR_Flow.png){:style="float: none;"}
