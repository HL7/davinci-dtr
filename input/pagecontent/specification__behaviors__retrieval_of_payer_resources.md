The DTR process will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The information needed to obtain the required resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in [Section 4.2.1](specification__cds_hooks.html#use-of-cardlinks). When launched in context of CRD and a CDS Hook, that object will have the following properties:

| Field    | Optionality | Cardinality | Type  | Description |
| -------- | ----------- | ------      | -------- | ----------- |
| questionnaire | OPTIONAL    |0..*| *string* | The canonical URL of the Questionnaire(s).  Required if "response" is not adaptive.  |
| order  | OPTIONAL    |0..*| *string* | The EHR local URL or JSON encoded content of the order(s) in context.  Prefer EHR local URL when available. |
| response  | OPTIONAL    |0..*| *object* | The QuestionnaireResponse resource(s) that DTR should load data from |
| coverage  | OPTIONAL    |0..*| *string* | Local reference to relevant coverage resource(s) on EHR |

When launched without the context of a CDS Hook, but within context from an EHR, the token returned from the auth server should still include an appContext.  The token bundle is required to have a patient in context.  The appContext should have the following properties:

| Field    | Optionality | Cardinality | Type  | Description |
| -------- | ----------- | ------      | -------- | ----------- |
| order  | OPTIONAL    |0..*| *string* | Local reference to the order or claim in context. |
| response  | OPTIONAL    |0..*| *string* | Local reference to a QuestionnaireResponse stored on the EHR |

If the QuestionnaireResponse is not present, but the order is, the QuestionnaireResponse can be searched for using the order. Alternatively, the QuestionnaireResponse can be replaced by a DocumentReference on the payer server.  

If the order is not present, then it can be retrieved from the QuestionnaireResponse or DocumentReference.  

If neither is present, the user should be prompted to select a DocumentReference or QuestionnaireResponse based on the patient that is in context.

The coverage may have an extension, `endpoint`, which is the payer endpoint for retrieving CQL and Questionnaire resources.  If the extension is not present, the user should be prompted to select a payer and populate the extension with the app-known payer URL.  The app should register this information out-of-band beforehand with relevant payers.  

The request resource created during the CRD workflow should be saved to the EHR FHIR server for retrieval by the DTR process, if possible. This might, for example, be the ServiceRequest resource that is sent in the CDS hook to the CRD server. Additionally, a tight integration between the CRD service and the DTR process should enable the DTR process to access FHIR resources received by the CRD service that are not available from the EHR's FHIR server.

This IG will support the [HRex Decision point - REST searchable?](http://build.fhir.org/ig/HL7/davinci-ehrx/exchanging.html#rest-searchable) when using RESTful endpoints to get payer resources (e.g., CQL rules and templates).

### Authentication of SMART on FHIR application to payer API
Payers SHALL require the DTR process to authenticate in order to retrieve resources when PHI is exchanged, and MAY required authentication in other situations. In the case that authentication is required, the following JSON structure SHALL be populated by the payer system. This JSON is based on the structure for [FHIR Authorization in CDS Hooks](https://cds-hooks.hl7.org/1.0/#fhir-resource-access).

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| access_token | REQUIRED | *string* | The OAuth 2 access token that provides access to the payer FHIR server. |
| token_type | REQUIRED | *string* | Fixed value: `Bearer`. |
| expires_in | REQUIRED | *integer* | The lifetime of the access token in seconds. |
| scope | REQUIRED | *string* | Fixed value: `user/Questionnaire.read user/Library.read`. |
| subject | REQUIRED | *string* | The OAuth 2.0 client identifier of the DTR process, as registered with the payer's authorization server. |

### Questionnaire
The DTR process SHALL use the URL provided in the `template` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the [CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) and MAY conform to [Structured Data Capture (SDC) Advanced Rendering Profile]({{site.data.fhir.ver.hl7_fhir_uv_sdc}}rendering.html).

The Questionnaire SHALL have a `cqf-library` extension property specified. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

### CQL Rules
The DTR process SHALL use the URL provided in the `cqf-library` extension to retrieve the CQL necessary to execute the payer rules. Metadata about the rules will be represented as a FHIR Library resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server.

### Relaunch Session
The DTR app shall support usage of two new scopes to alter the launch context: `launch/request` and `launch/response`.  If the `request` scope is included when launching, the access token bundle should return with the `request` field of the `appContext` filled.  If the `response` scope is included, it should return with the `response` field of the `appContext` filled.  

At least one of the two fields `request` or `response` must be filled in order for the DTR app to successfully launch. In the case that `response` is filled but `request` is empty, the DTR process SHALL use the URL provided in the `response` property of the `appContext` to retrieve the referenced QuestionnaireResponse. The QuestionnaireResponse can be used to discover the request through the `context` extension. The app should allow the user to relaunch the deferred usage session defined by the QuestionnaireResponse. 

If the `response` field is empty, the DTR app shall check the EHR for QuestionnaireResponses and the payer system for DocumentReferences which are linked to the `request`. The QuestionnaireResponse will have all the information required to request the Questionnaire and CQL from the payer server and allow relaunch of the session with previously answered questions already filled out. [Save Context for Relaunch](specification__behaviors__persisting_application_state.html#how-dtr-saves-context-of-dtr-for-a-relaunch)
