### System Actors
DTR Fundamentally supports four different system actors:

1. **Light DTR EHRs**  
EHR systems which leverage a SMART app to manage data capture and rules execution, but which must be able to launch the SMART app, respond to app queries, and store the final documentation results  

2. **Full DTR EHRs**  
EHR systems which manage DTR data capture and execution directly and also allow the rules to access other data and store final documentation results  

3. **DTR Smart Apps**  
SMART on FHIR applications that take context from an EHR, retrieve questionnaires and rule sets from a DTR Payer server, render the Questionnaires and capture data, and store the results on payer and/or EHR systems  

4. **DTR Payer Servers**  
Responds to operations requesting Questionnaires, serve as a temporary repository for in-progress QuestionnaireResponses, and (optionally) help in the processing of adaptive questionnaires.  In this specification, payer rules are [CQL statements](https://cql.hl7.org//) used in a provider context to facilitate meeting documentation requirements.   

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

If the resulting information is to be sent to a third party (e.g., payer), the DTR SMART on FHIR App (or equivalent native app) **SHALL** include a configurable step to allow the provider to review and grant permission to send the information gathered in the QuestionnaireResponse before sending.


### Relation to Clinical Data Exchange (CDex)  

DTR can be invoked for purposes other than specific Burden Reduction use-cases, specifically the guidance provided within the [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) Implementation Guide.  CDex specifies the use of DTR to [request attachments using questionnaires](https://hl7.org/fhir/us/davinci-cdex/requesting-attachments-questionnaire.html).

[![CDex To DTR](CDexDTR.png){:style="float: none;"}](http://build.fhir.org/ig/HL7/davinci-ecdx/task-based-approach.html#using-da-vinci-dtr-to-complete-the-questionnaire "CDex - Using Da Vinci DTR to Complete the Questionnaire")
