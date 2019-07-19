The Documentation Templates and Rules (DTR) application will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated Clinical Quality Language (CQL) logic files in order to execute. The information needed to obtain the needed resources will be provided as escaped JSON in the `appContext` property of the Clinical Decision Support (CDS) Hooks Card Link object, as described in Section 4.2.1. That object will have the following properties:

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| fhirAuthorization | OPTIONAL | *object* | A structure holding an OAuth 2.0 bearer access token granting the DTR Application access to payer FHIR resources, along with supplemental information relating to the token. |
| template | REQUIRED | *string* | The URL of the Questionnaire for the DTR application to use for execution. |
| request | REQUIRED | *string* | The URL of the request resource for which documentation requirements are being gathered. |

### Authentication of SMART on FHIR application to payer API
Payers may require the DTR application to authenticate in order to retrieve resources. In the case that authentication is required, the following JSON structure SHALL be populated by the payer system. This JSON is based on the structure for [FHIR Authorization in CDS Hooks](https://cds-hooks.hl7.org/ballots/2018May/specification/1.0/#fhir-resource-access).

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| access_token | REQUIRED | *string* | The OAuth 2 access token that provides access to the Payer FHIR server. |
| token_type | REQUIRED | *string* | Fixed value: `Bearer`. |
| expires_in | REQUIRED | *integer* | The lifetime of the access token in seconds. |
| scope | REQUIRED | *string* | Fixed value: `user/Questionnaire.read user/Library.read`. |
| subject | REQUIRED | *string* | The OAuth 2.0 client identifier of the DTR application, as registered with the Payer's authorization server. |

### Questionnaire
The DTR application SHALL use the URL provided in the `template` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR application will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the CQF Questionnaire profile and MAY conform to Structured Data Capture.

The Questionnaire SHALL have a `cqf-library` extension property specified when using FHIR R4. When using FHIR STU3, The Questionnaire SHALL have a `cqif-library` extension property specified. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

### CQL Rules
The DTR application SHALL use the URL provided in the `cqf-library` or `cqif-library` extension to retrieve the CQL necessary to execute the payer rules. Metadata about the rules will be represented as a FHIR Library resource. The payer SHALL provide this as a FHIR resource, such that the DTR application will be executing a FHIR read interaction on the payer's server.