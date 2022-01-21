The DTR process will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The information needed to obtain the required resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in [Section 4.2.1](specification__cds_hooks.html#use-of-cardlinks). That object will have the following properties:

| Field    | Optionality | Type     | Description |
| -------- | ----------- | -------- | ----------- |
| filePath | OPTIONAL    | *string* | The base URL used to retrieve the questionnaire and related CQL resources. If left blank the app should use a default base URL. |
| template | OPTIONAL    | *string* | The canonical URL of the Questionnaire for the DTR process to use for execution. |
| request  | OPTIONAL    | *string* | The canonical URL of or copy of the draft request resource for which documentation requirements are being gathered.  |
| response  | OPTIONAL    | *string* | The canonical URL of the QuestionnaireResponse representing the session which should be relaunched  |

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
The DTR process SHALL use the URL provided in the `template` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the [CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) and MAY conform to [Structured Data Capture (SDC) Advanced Rendering Profile](http://hl7.org/fhir/uv/sdc/2019May/rendering.html).

The Questionnaire SHALL have a `cqf-library` extension property specified. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

### CQL Rules
The DTR process SHALL use the URL provided in the `cqf-library` extension to retrieve the CQL necessary to execute the payer rules. Metadata about the rules will be represented as a FHIR Library resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server.

### Relaunch Session
The DTR app shall support usage of two new scopes to alter the launch context: `launch/request` and `launch/response`.  If the `request` scope is included when launching, the access token bundle should return with the `request` field of the `appContext` filled.  If the `request` scope is included, it should return with the `response` field of the `appContext` filled.  

At least one of the two fields `request` or `response` must be filled in order for the DTR app to successfully launch. In the case that `response` is filled but `request` is empty, the DTR process SHALL use the URL provided in the `response` property of the `appContext` to retrieve the referenced QuestionnaireResponse. The QuestionnaireResponse can be used to discover the request through the `context` extension. The app should allow the user to relaunch the deferred usage session defined by the QuestionnaireResponse. 

If the `response` field is empty, the DTR app shall check the EHR for QuestionnaireResponses and the payer system for DocumentReferences which are linked to the `request`. The QuestionnaireResponse will have all the information required to request the Questionnaire and CQL from the payer server and allow relaunch of the session with previously answered questions already filled out.
