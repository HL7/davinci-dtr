Users of the DTR process are likely to be performing many tasks to support patient care or administration of the provider organization. As such, it should be expected that users may need to halt interaction with the DTR process and resume it at a later time.

The DTR process should anticipate that users may not always be able to complete a full interaction between launching from a CDS Hooks Card to providing a response back to the payer. It is recommended that DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) (or native) applications preserve state automatically as a user interacts with it. In this manner, the user does not need to explicitly take action to save their state.

### How DTR Saves Context of DTR for a Relaunch

<blockquote class="stu-note">
<p>
Note: How DTR Saves Context of DTR for a Relaunch is tentative because it has not been voted on yet. For more details regarding the status see: 
<a href="https://jira.hl7.org/browse/FHIR-34291">FHIR-34291</a>, and 
<a href="https://jira.hl7.org/browse/FHIR-34128">FHIR-34128</a>, and 
<a href="https://jira.hl7.org/browse/FHIR-34121">FHIR-34121</a>
</p>
</blockquote>
<br>
At any point prior to completion the app should be able to save the session, and then relaunch it later. If an EHR system performs DTR functionality internally, it may save session information however it likes. Guidance below does not apply in this scenario. 

Context for the DTR app is made up of the QuestionnaireResponse, the Questionnaire, the prepopulation CQL and its supporting files, the order(s), the coverage, and the patient. The QuestionnaireResponse resource contains a reference to the patient in the `subject` field, and the order(s) and coverage in the `context` extension. From the coverage and order, the DTR app can determine the payer and retrieve the CQL, Questionnaire, and other files from a standard endpoint on the payer server.  

If the DTR app receives a QuestionnaireResponse resource in the app context, it shall reload the session information from that QuestionnaireResponse using its associated order and coverage.  If the DTR app does not receive a QuestionnaireResponse, it shall first search the EHR for QuestionnaireResponses associated with the order included in the app context.  Depending on the result of the search, the app will either offer an option to reload context from a found QuestionnaireResponse or launch normally and create a new QuestionnaireResponse.

The EHR should be able to associate orders with the QuestionnaireResponses they pertain to by linking their FHIR IDs internally. This means that even if the ID of an order changes, the EHR should be capable of updating the QuestionnaireResponse to reference the new ID. This way, even if DTR receives the updated orders, it will still be able to search the EHR for the associated QuestionnaireResponse.  

The EHR is responsible for storing and updating the QuestionnaireResponse, as well as providing the user a way to choose sessions to relaunch. Additionally, the app context may need to be altered by the EHR to include relevant QuestionnaireResponses.  

For EHRs that cannot support this protocol, the data will be stored on the payer server in a DocumentReference resource. Data stored in this way shall only be available for supporting the DTR workflow. Additionally, the DocumentReference may only be accessed by the app which created them. Smart apps and payer systems should be registered such that the payer system can establish identity of the smart app prior to granting access to the DocumentReference. When registering, the DTR app should be given a shared client secret and a public key, which can be used to prove its identity.

The following information should be contained inside the DocumentReference: 
    DocumentReference.subject.reference -         EHR Patient URL
    DocumentReference.subject.identifier -        Payer member identifier
    DocumentReference.author -                    Provider organization reference
    DocumentReference.date -                      Current date
    DocumentReference.meta.lastUpdated -          Date of last change
    DocumentReference.content.attachment -        PDF containing the QuestionnaireResponse 

The PDF may also include prior authorization information, if appropriate. Information in the PDF is not machine readable, and association with the order or prior authorization request must be done by hand. 

<blockquote class="stu-note">
<p>
Note: It’s not clear if the DTR app is saving its context to a single payer which is responsible for maintaining the app, or it is saving it to any payer server it wants to that uses that app. How the DTR server gains access to the payer server is an open question right now. But is just a black box. It doesn’t particularly matter how it gets done. 

We welcome feedback on how this process should or could work.</p>
</blockquote>
<br>
When launched with context of the organization, patient, and user, the app should display a list of open or “in-progress” QuestionnaireResponses or DocumentReferences for the user to select from, scoped to the patient that is in context. The DTR app should check both the EHR and the payer server for stored sessions.  The QuestionnaireResponses on the EHR and the DocumentReferences on the payer server have reference to the order which they are linked to, which can be used to search for the correct resource.  

When launched in standalone mode, the app should provide the user the option to select which payer and patient they would like to search for open sessions against.   

Since a patient won’t be in context, the app will need to provide a selection of patients that the user can choose from. But this would be from the EHR, currently. Another option would be to let the user select which payer they want and then select a patient from the saved DocumentReferences.
 
The DTR app shall only be scoped to one patient and be prohibited from accessing resources aside from the ones the EHR has authorized it to gain access to. The payer system shall only provide DocumentReferences for usage by the DTR app if it is scoped to a specific patient. The DTR app should not be allowed to query all in-progress QuestionnaireResponses without specifying a patient to limit the search.  

The system responsible for saving the sessions should prune old sessions by checking the date on the DocumentReference resource. The system can decide how long to wait before deleting an old session. The DocumentReference shall be deleted if the QuestionnaireResponse is saved to the EHR and the session finishes. 

### SMART on FHIR applications and Servers
SMART on FHIR applications must be launched by a host that is accessible to the launching Electronic Health Record (EHR) System. Once launched, a SMART on FHIR application may communicate with the host that it was initially launched from. This may be to retrieve data to assist in the functionality of the SMART on FHIR application, or it may be to record actions taken by the application user.

In the case of DTR, the SMART on FHIR application may be launched from a number of locations. A likely scenario is that the DTR conformant SMART on FHIR application will be hosted by a payer IT system.

The DTR process may send information back to the host it was launched from in order to save application state. As mentioned in the previous section, the services and formats used to communicate state information are outside the scope of this IG.   

### Requesting User Identity
To persist application state, the DTR process will need to know who is currently using the application. SMART on FHIR provides methods for the application to obtain this information.

#### SMART App Launch Framework IG
Using the SMART App Launch Framework IG, the DTR process should request [scopes for requesting identity data](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context/index.html#scopes-for-requesting-identity-data), namely `openid` and `fhirUser`. The DTR process can then retrieve the FHIR resource representing the current person and extract whatever identifiers it deems necessary for the persistance of application state.

The EHR's authorization server MUST support the `openid` and `fhirUser` scopes, due to the importance of the `fhirUser` element in the QuestionnaireResponse resource.

### Usage Sessions
The DTR process MAY be initially launched in response to a Coverage Requirements Discovery (CRD) request. CRD is launched in response to a provider's request for a given set of orders for a particular patient.

The DTR process usage session binds this set of orders and patient to a particular user. When persisting application state, it is the responsibility of the DTR process to record the relationship between the orders, patient, and user.

The DTR process may be launched outside the context of a CRD request, at which point, it must be able to restore a usage session. This will be covered in detail in [Section 4.4.8](specification__behaviors__launch_outside_of_CRD.html) - Launch outside of CRD

#### Visibility of Usage Sessions to Other Users
Depending on workflows within an organization, it may be desirable for one user to start a usage session, but for it to be completed by another user. Rules for which users of a DTR process should be authorized to see information on a particular set of patients are outside the scope of this IG.
 
The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) and FHIR specification provide methods for discovering information about the user and how that user fits into the provider organization. With this information, the DTR process, possibly consulting with the payer and provider IT systems, can decide which usage sessions to expose to a given user.

As an example, the DTR process may retrieve a Practitioner resource by retrieving the URL supplied in the `fhirUser` claim. The DTR process may then query the CareTeam or PractitionerRole resources to determine their relationship to other staff in the provider organization and determine if their usage sessions should also be made available.

Furthermore, the notion of workflows and multiple users could get extended to work queues. The EHR could maintain a list of in progress FHIR Questionnaires and store a reference to each of these within the EHR for the clinicians and other employees within the organization to continue working on. There could be built in mechanisms to assign FHIR Tasks for the work to the queues of other employees. Specific details surrounding this type of work queue implementation are out of the scope for this IG.

### Session Expiration
While a user may need to suspend interaction with the DTR process, there may be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started five years in the past.

Payers SHOULD use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid. The DTR process SHALL NOT allow completion of a usage session if the current time has exceeded the end of the `effectivePeriod`.