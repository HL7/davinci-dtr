The Documentation Templates and Rules (DTR) application will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The information needed to obtain the required resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in [Section 4.2.1](specification__cds_hooks.html#use-of-cardlinks). That object will have the following properties:

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| filePath | OPTIONAL | *string* | The base URL to retrieve the questionnaire and related CQL resources from. If left blank the app should use a default base URL. |
| template | REQUIRED | *string* | The id of the Questionnaire for the DTR process to use for execution. |
| request | REQUIRED | *string* | A copy of the draft request resource for which documentation requirements are being gathered.  |

 The request resource created during the CRD workflow should be saved to the EMR FHIR server for retrieval by the DTR process, if possible. This might, for example, be the ServiceRequest resource that is sent in the CDS hook to the CRD server. Additionally, a tight integration between the CRD service and the DTR process should enable the DTR app to access FHIR resources received by the CRD service that are not available from the EMR's FHIR server.

### Authentication of SMART on FHIR application to payer API
Payers SHALL require the DTR process to authenticate in order to retrieve resources when PHI is exchanged. In the case that authentication is required, the following JSON structure SHALL be populated by the payer system. This JSON is based on the structure for [FHIR Authorization in CDS Hooks](https://cds-hooks.hl7.org/1.0/#fhir-resource-access).

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| access_token | REQUIRED | *string* | The OAuth 2 access token that provides access to the Payer FHIR server. |
| token_type | REQUIRED | *string* | Fixed value: `Bearer`. |
| expires_in | REQUIRED | *integer* | The lifetime of the access token in seconds. |
| scope | REQUIRED | *string* | Fixed value: `user/Questionnaire.read user/Library.read`. |
| subject | REQUIRED | *string* | The OAuth 2.0 client identifier of the DTR process, as registered with the Payer's authorization server. |

### Questionnaire
The DTR process SHALL use the URL provided in the `template` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the CQF Questionnaire profile and MAY conform to Structured Data Capture.

The Questionnaire SHALL have a `cqf-library` extension property specified when using FHIR R4. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

### CQL Rules
The DTR process SHALL use the URL provided in the `cqf-library` extension to retrieve the CQL necessary to execute the payer rules. Metadata about the rules will be represented as a FHIR Library resource. The payer SHALL provide this as a FHIR resource, such that the DTR process will be executing a FHIR read interaction on the payer's server.