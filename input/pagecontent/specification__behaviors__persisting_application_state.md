Users of the Documentation Templates and Rules (DTR) application are likely to be performing many tasks to support patient care or administration of the provider organization. As such, it should be expected that users may need to halt interaction with the DTR process and resume at a later time.

The DTR process should anticipate that users may not be able to complete a full interaction between launch from a Clinical Decision Support (CDS) Hooks Card to providing a response back to the payer. It is recommended that DTR conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) applications preserve state automatically as a user interacts with it. In this manner, the user does not need to explicitly take action to save their state.

The exact mechanisms for saving state are outside the scope of this implementation guide. Having said that the following sections describe some mechanisms that a DTR process may use to establish the data necessary to store and retrieve state.

### SMART on FHIR applications and Servers
SMART on FHIR applications must be launched by a host that is accessible to the launching Electronic Medical Record (EMR) System. Once launched, a SMART on FHIR application may communicate with the host that it was initially launched from. This may be to retrieve data to assist in the functionality of the SMART on FHIR application, or it may be to record actions taken by the application user.

In the case of DTR, the SMART on FHIR application may be launched from a number of locations. A likely scenario is that the DTR conformant SMART on FHIR application will be hosted by a Payer IT system.

The DTR process may send information back to the host it was launched from to save application state. As mentioned in the previous section, the services and formats used to communicate state information are outside the scope of this implementation guide.   

### Requesting User Identity
To persist application state, the DTR process will need to know who is currently using the application. SMART on FHIR provides methods for the application to obtain this information.

#### SMART on FHIR App Launch Framework IG
Using the SMART on FHIR App Launch Framework Implementation Guide (IG), the DTR process should request [scopes for requesting identity data](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context/index.html#scopes-for-requesting-identity-data), namely `openid` and `fhirUser`. The DTR process can then retrieve the FHIR resource representing the current person and extract whatever identifiers it deems necessary for the persistance of application state.

The EMR's authorization server MUST support the openid and fhirUser scopes, due to the importance of the fhirUser element in the QuestionnaireResponse resource..

### Usage Sessions
The DTR process is initially launched in response to a Coverage Requirements Discovery request. This request is for a given set of orders for a particular patient.

The DTR process usage session binds this set of orders and patient to a particular user. When persisting application state, it is the responsibility of the DTR process to record the relationship between the orders, patient and user.

The DTR process may be launched outside the context of a Coverage Requirements Discovery (CRD) request, at which point, it must be able to restore a usage session. This will be covered in detail in [Section 4.4.8](specification__behaviors__launch_outside_of_CRD.html) - Launch outside of CRD

#### Visibility of Usage Sessions to Other Users
Depending on workflows within an organization, it may be desirable for one user to start a usage session, but for it to be completed by another user. Rules for which users of a DTR process should be authorized to see information on a particular set of patients are outside the scope of this implementation guide.

The SMART on FHIR App Launch Framework IG and FHIR specification provide methods for discovering information about the user and how that user fits into the provider organization. With this information, the DTR process, possibly consulting with the Payer and Provider IT systems, can decide which usage sessions to expose to a given user.

As an example, the DTR process may retrieve a Practitioner resource by retrieving the URL supplied in the `fhirUser` claim. The DTR process may then query the CareTeam or PractitionerRole resources to determine their relationship to other staff in the provider organization and determine if their usage sessions should also be made available.

Furthermore, the notion of workflows and multiple users could get extended to work queues. The EMR could maintain a list of in progress FHIR Questionnaires and store a reference to each of these within the EMR for the clinicians and other employees within the organization to continue working on. There could be built in mechanisms to assign FHIR Tasks for the work to the queues of other employees. Specific details surrounding this type of work queue implementation are out of the scope of this IG.

### Session Expiration
While a user may need to suspend interaction with the DTR process, there may be a limit on the amount of time that a set of documentation templates and rules is valid. For example, it is unreasonable to resume the DTR process for an order that was started five years in the past.

Payers SHOULD use the `Questionnaire.effectivePeriod` element to describe the period over which the documentation templates and rules are valid. The DTR process SHALL NOT allow completion of a usage session if the current time has exceeded the end of the `effectivePeriod`.