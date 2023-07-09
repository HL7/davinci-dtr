<!-- ============ Formatting ===================================== -->
<style>
.pbox{
    background-color: rgb(230, 230, 210, 0.3); 
    border-style: solid; 
    border-width: thin;  
    padding: 10px; 
    border-radius: 10px; 
    border-color: gainsboro;
 }

.notebox{
    background-color: rgb(240, 248, 255, 0.7); 
    border-left: double silver;
    border-radius: 5px; 
    padding-left: 15px; 
    padding-top: 10px;
 }

  table, th, td 
  {
    border: 1px solid gainsboro; 
  }
  th {
    background: ivory; 
    padding-left: 3px;
    padding-right: 3px;
  }
</style>
<!-- ============================================================== -->

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

<div markdown="1" class="notebox">
 <b><span style="color:maroon;">NOTE:</span></b>&nbsp;&nbsp;The term Electronic Health Record (EHR) is used in this IG and can be considered equivalent to Electronic Medical Record (EMR) or a Practice Management System (PMS).
</div>

#### EHR and DTR Initiation
The current [CRD](https://build.fhir.org/ig/HL7/davinci-crd/), DTR, [PAS](http://build.fhir.org/ig/HL7/davinci-pas/), and [CDex](http://build.fhir.org/ig/HL7/davinci-ecdx/) supporting the ePA workflow only focuses on the interactions between the provider HIT in total and the payer HIT in total, not the necessary interactions among the respective HIT solutions that make up the provider and payer HIT environment that need to participate in the ePA workflow.

[ONC](https://www.healthit.gov/) should support certification where certified software can use generic (or generically referenced) relied-upon software to meet certain requirements and can clearly specify the capabilities they rely on without the need to assert each permutation of relied-upon software with which they support the ePA workflow.  Further guidance is needed for the interactions necessary within each of the provider and payer HIT configurations based on the functions/roles of those HIT solutions, and requires the relied upon software approach using predictable, standards-based capabilities to participate in an ePA workflow and for HIT that provides full support for ePA workflow through its certified HIT. 

<div markdown="1" class="stu-note">
<br>
This community requests that Da Vinci seek adequate financial support to accelerate the process described here.
</div>


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

CDex supports the launch of DTR to gather documentation through the [CDex Task Data Request Profile](http://build.fhir.org/ig/HL7/davinci-ecdx/StructureDefinition-cdex-task-data-request.html), which provides these necessary properties:
- The [`questionnaire` Task.input](http://build.fhir.org/ig/HL7/davinci-ecdx/StructureDefinition-cdex-task-data-request-definitions.html#diff_Task.input:questionnaire) reference - Communicates to the provider a URL of a data request FHIR Questionnaire  
- The [`data-request-questionnaire` Task.code](http://build.fhir.org/ig/HL7/davinci-ecdx/ValueSet-cdex-data-request-task-code.html) - Indicates the provider system uses DTR to complete the Questionnaire referenced in the `questionnaire` input parameter.  
<br>

**Questionnaire as Task Input Sequence Diagram**
[![CDex To DTR](http://build.fhir.org/ig/HL7/davinci-ecdx/taskbased-task-Q-summary.svg){:style="float: none;width:980px;height:560px"}](http://build.fhir.org/ig/HL7/davinci-ecdx/task-based-approach.html#using-questionnaire-as-task-input "Opens CDex Implementation Guide")


**Using DTR to Complete the Questionnaire**  
[![CDex To DTR](http://build.fhir.org/ig/HL7/davinci-ecdx/taskbased-task-Q-sequencediagram.svg){:style="float: none;width:400px;height:800px"}](http://build.fhir.org/ig/HL7/davinci-ecdx/taskbased-task-Q-sequencediagram.svg "View Image Larger")
