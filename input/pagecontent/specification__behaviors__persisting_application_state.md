Users of the DTR process are likely to be performing many tasks to support patient care or administration of the provider organization. As such, it should be expected that users may need to halt interaction with the DTR process and resume it at a later time.

The DTR process should anticipate that users may not always be able to complete a full interaction between launching from a CDS Hooks Card to providing a response back to the payer. It is recommended that DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) (or native) applications preserve state automatically as a user interacts with it. In this manner, the user does not need to explicitly take action to save their state.

### How DTR Saves Context of DTR for a Relaunch

<br>
At any point prior to completion the app should be able to save the session, and then relaunch it later. If an EHR system performs DTR functionality internally, it may save session information however it likes. Guidance below does not apply in this scenario. 

Providers may go days to weeks before completing questionnaires and may go many months to a year before completing paperwork and Prior Authorization ot claim submission. Therefore, the time span between the creation of a Questionnaire to the completion of QuestionnaireResponse should be accounted for accordingly.

Context for the DTR app is made up of the QuestionnaireResponse, the Questionnaire, the prepopulation CQL and its supporting files, the order(s), the coverage, and the patient. The QuestionnaireResponse resource contains a reference to the patient in the `subject` field, and the order(s) and coverage in the `context` extension. From the coverage and order, the DTR app can determine the payer and retrieve the CQL, Questionnaire, and other files from a standard endpoint on the payer server.  

If the DTR app receives a QuestionnaireResponse resource in the app context, it SHALL reload the session information from that QuestionnaireResponse using its associated order and coverage.  If the DTR app does not receive a QuestionnaireResponse, it SHALL first search the EHR for QuestionnaireResponses associated with the order included in the app context.  Depending on the result of the search, the app will either offer an option to reload context from a found QuestionnaireResponse or launch normally and create a new QuestionnaireResponse.

The EHR should be able to associate orders with the QuestionnaireResponses they pertain to by linking their FHIR IDs internally. This means that even if the ID of an order changes, the EHR should be capable of updating the QuestionnaireResponse to reference the new ID. This way, even if DTR receives the updated orders, it will still be able to search the EHR for the associated QuestionnaireResponse.  

The EHR is responsible for storing and updating the QuestionnaireResponse, as well as providing the user a way to choose sessions to relaunch. Additionally, the app context may need to be altered by the EHR to include relevant QuestionnaireResponses.  

The contents of the extension can be sent to the payer server using the [questionnaire-for-order operation](http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order).  The payer server SHALL return a Questionnaire upon receiving a valid coverage and order.

For EHRs that cannot support this protocol, the data will be stored on the payer server in a DocumentReference resource. Data stored in this way SHALL only be available for supporting the DTR workflow. Additionally, the DocumentReference may only be accessed by the app which created them. Smart apps and payer systems should be registered such that the payer system can establish identity of the smart app prior to granting access to the DocumentReference. When registering, the DTR app should be given a shared client secret and a public key, which can be used to prove its identity.

The following information should be contained inside the DocumentReference: 

| Element | Description |
| ----- | ----------- |
| DocumentReference.subject.reference | EHR Patient URL|
| DocumentReference.subject.identifier | Payer member identifier|
| DocumentReference.author | Provider organization reference|
| DocumentReference.date | Current date |
| DocumentReference.meta.lastUpdated | Date of last change|
| DocumentReference.content.attachment | PDF containing the QuestionnaireResponse |
{: .grid } 

The PDF may also include prior authorization information, if appropriate. Information in the PDF is not machine readable, and association with the order or prior authorization request must be done by hand. 

When launched with context of the organization, patient, and user, the app should display a list of open or “in-progress” QuestionnaireResponses or DocumentReferences for the user to select from, scoped to the patient that is in context. The DTR app should check both the EHR and the payer server for stored sessions.  The QuestionnaireResponses on the EHR and the DocumentReferences on the payer server have reference to the order which they are linked to, which can be used to search for the correct resource.  

When launched in standalone mode, the app should provide the user the option to select which payer and patient they would like to search for open sessions against.   

Since a patient won’t be in context, the app will need to provide a selection of patients that the user can choose from. But this would be from the EHR, currently. Another option would be to let the user select which payer they want and then select a patient from the saved DocumentReferences.
 
The DTR app SHALL only be scoped to one patient and be prohibited from accessing resources aside from the ones the EHR has authorized it to gain access to. The payer system SHALL only provide DocumentReferences for usage by the DTR app if it is scoped to a specific patient. The DTR app should not be allowed to query all in-progress QuestionnaireResponses without specifying a patient to limit the search.  

The system responsible for saving the sessions should prune old sessions by checking the date on the DocumentReference resource. The system can decide how long to wait before deleting an old session. The DocumentReference SHALL be deleted if the QuestionnaireResponse is saved to the EHR and the session finishes. 

#### SMART App Launch Framework IG
Using the SMART App Launch Framework IG, the DTR process should request [scopes for requesting identity data](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context/index.html#scopes-for-requesting-identity-data), namely `openid` and `fhirUser`. The DTR process can then retrieve the FHIR resource representing the current person and extract whatever identifiers it deems necessary for the persistance of application state.

The EHR's authorization server MUST support the `openid` and `fhirUser` scopes, due to the importance of the `fhirUser` element in the QuestionnaireResponse resource.

### Resuming Work in Progress
In order to resume a work in progress that has been persisted, there are three basic requirements:
- The user must be from the same organization
- The user must have authority to access the patient (i.e. launch from patient context)
- The user must have authority to use DTR

#### Visibility of Usage Sessions to Other Users
 
The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) and FHIR specification provide methods for discovering information about the user and how that user fits into the provider organization. With this information, the DTR process, possibly consulting with the payer and provider IT systems, can decide which usage sessions to expose to a given user.

As an example, the DTR process may retrieve a Practitioner resource by retrieving the URL supplied in the `fhirUser` claim. The DTR process may then query the CareTeam or PractitionerRole resources to determine their relationship to other staff in the provider organization and determine if their usage sessions should also be made available.

Furthermore, the notion of workflows and multiple users could get extended to work queues. The EHR could maintain a list of in progress FHIR Questionnaires and store a reference to each of these within the EHR for the clinicians and other employees within the organization to continue working on. There could be built in mechanisms to assign FHIR Tasks for the work to the queues of other employees. Specific details surrounding this type of work queue implementation are out of the scope for this IG.

### Session Expiration
While a user may need to suspend interaction with the DTR process, there may be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started five years in the past.

Payers SHOULD use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid. The DTR process SHALL NOT allow completion of a usage session if the current time has exceeded the end of the `effectivePeriod`.