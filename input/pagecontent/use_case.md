### System Actors

#### Payers
A Payer is a person or company who pays for the service of providers. The majority of payers here are also referred to as insurance companies.

#### Payer IT System
The payer IT system shall be the primary system responding to DTR queries.

#### Healthcare Provider Organization
A healthcare provider organization contains medical providers such as hospitals, doctors, etc.

#### EMR System
The Electronic Medical Record (EMR) system shall be the primary system used to initiate the DTR process. The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) app will typically be initiated from within the EMR.

The goal of DTR is to collect clinical documentation and/or to encourage the completion of documentation that demonstrates medical necessity for ordered items, it is focused on the clinical documentation effort and not the administrative process. 

It is possible to have a process where the focus is on the interaction with the EMR via an external application(s). Examples of external systems are administrative, payment, practice management, scheduling, and other applications. 

>If information is not available to the SMART on FHIR application, then the application will need to prompt the provider to enter the missing information. Ultimately, the solution is to provide greater integration (including possibly FHIR APIs) between the EMR and other supporting applications. (e.g. Quality measures may also require this type of integration)

>Also, if and when Electronic Medical Record (EMR) is used in this IG it should be considered synonymous to Electronic Health Record (EHR). 

#### DTR compliant SMART on FHIR app
Within Documentation Templates and Rules (DTR), the SMART on FHIR app (or equivalent native EHR app) serves as a middleware layer easing payer and provider integrations. Specifically, the relatively low adoption of [CQL](https://cql.hl7.org//) and [FHIR](https://www.hl7.org/fhir/) by payers and providers can be eased through the use of a third-party "app". This functionality will enable DTR to gather documents and templates, retrieve FHIR resources from EMRs, and run rules to reduce the time involved in looking up documentation requirements.

### Relation to Coverage Requirements Discovery (CRD)
The [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/2019May/) service portion of the workflow is responsible for verifying with the payer a given item, medication, procedure or other service requires documentation and/or Prior Auth. It then consolidates the necessary links for the app to be launched and run. In most cases, the CRD service will return a CDS hooks card populated with an app launch link for the DTR app, a link to a resource, and a DeviceRequest, MedicationRequest, or ServiceRequest resource ID. The app launch link can be used in a user interface in order to launch the app. While CRD may verify that documentation is required, it does not involve any actual authorization or validation of the rule(s). 

The DTR app or native EMR app is responsible for taking the provided rules and checking if the available EMR data satisfies the requirements, as well as allowing manual population of missing data.  

### CRD and DTR Workflow

This shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR App or native App)

Note: This workflow is just one example used to help illustrate the DRLS APIs. It is expected that a supplemental guide will be produced moving forward to help implementers with more concrete examples. 
 
As an example, a DME nurse might order, “Home Oxygen Therapy” 

1. The first 3 light blue rectangles shown, are used to determine if there are documentation and/or Prior Auth requirements for coverage.
2. The EHR would allow for the ordering of “Home Oxygen Therapy”. The EHR would then compose a FHIR based message to be used when calling the “Coverage Requirements Discovery” (CRD) API (shown in the 3rd light blue box).
3. CRD then runs rules retrieved from a repository to determine if there are documentation and/or Prior Auth requirements for coverage. The API and repository are shown in the light brown areas. In this scenario a response is sent back to the EHR/DME nurse in the form of a CDS Hooks card, saying there are “documentation requirements”. 
4. In the CDS Hooks card there is a link that will allow the DME nurse to launch the “Documentation, Templates and Rules” (DTR) Smart App (or native App) shown in the salmon colored area. DTR will retrieve the appropriate questionnaire(s) and rule(s) from the same repository used for CRD.
Assuming the DME nurse wants to fill out the required documentation. The DME nurse would click the SMART App/DTR (or native App) link which pre-populates a FHIR based Questionnaire with data from the EHR. In the event data is known to be available but does not yet exist in the EHR the DME nurse could attest the data in question exists in the EHR.
5. Then the DME nurse would manually populate the fields that did not get pre-populated. When the documentation is complete (or partially complete) the DME nurse would save the QuestionnaireResponse. DRLS would then write the FHIR based QuestionnaireResponse back to the EHR. At this point the QuestionnaireResponse could also be sent to any ancillary service. In the event the QuestionnaireResponse was incomplete a Task could be created to allow for the QuestionnaireResponse to be completed at a later time. 

![CRD DTR Flow](CRD_DTR_Flow.png){:style="float: none;"}

### Home Oxygen Therapy Ordering Example
This example shows an overview of how the DTR SMART App (or native App) fits into a workflow when ordering Home Oxygen Therapy. 
   
1. It is determined that documentation and/or prior authorization is required for coverage and there are Questionnaire(s) to be filled out.
2. After the DTR SMART App (or native App) is launched from the CDS hook card.
3. The DTR SMART App (or native App) fetches CQL (rules) and a FHIR Questionnaire from the Payer Server.
4. The engine then extracts as many answers as it can in order to pre-populate a FHIR QuestionnaireResponse with FHIR-based EHR data.
5. If there is missing information, the user can manually provide it to fully populate the QuestionnaireResponse. Otherwise, the Questionnaire is not shown to the user unless specifically requested.
6. It then writes the FHIR QuestionnaireResponse back to EHR server and optionally to the Payer.

> There is no need for the user to see the questionnaire if it can be auto completed unless they need to approve sending the result to the payer or to "sign" the information prior to submission. The application SHALL give the provider the ability, but not the requirement to review any information prior to sending it to a third party. This ability may be "turned-off" by the organization and possibly the individual provider. 

> Questionnaires SHALL indicate which items are necessary using the "required" property, and the application should use that property to decide when a questionnaire has been sufficiently auto completed.

 > If the resulting information is to be sent to a third party (e.g. payer). The DTR / SMART on FHIR App should include a step requiring the provider to grant permission to send along the information gathered in the questionnaire before sending. However, this should be configurable on a site or provider basis.

>If the resulting information is to be sent to a third party (e.g. payer) see section [Section 4.4.5.1](specification__behaviors__persisting_application_state.html#smart-on-fhir-applications-and-servers)

>DTR is not intended to change orders, only to gather documentation related to a specific service and where it is incomplete, provide the ability to capture the additional required documentation. 

![Process Flow Detail](DTR_Example_Workflow.png){:style="float: none;"}
