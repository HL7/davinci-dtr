The DTR application will need to retrieve resources from a payer IT system to operate properly. This application will need to obtain a FHIR Questionnaire and associated CQL rules in order to execute. The information needed to obtain the needed resources will be provided as escaped JSON in the `appContext` property. That object will have the following properties:

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| fhirAuthorization | OPTIONAL | *object* | A structure holding an OAuth 2.0 bearer access token granting the DTR Application access to payer FHIR resources, along with supplemental information relating to the token. |
| template | REQUIRED | *string* | The URL of the Questionnaire for the DTR application to use for execution. |

### Authentication of SMART on FHIR application to payer API
Payers may require the DTR application to authenticate in order to retrieve resources. In the case that authentication is required, . This JSON is based on the structure for [FHIR Authorization in CDS Hooks](https://cds-hooks.hl7.org/ballots/2018May/specification/1.0/#fhir-resource-access).

| Field | Optionality | Type | Description |
| ----- | ----------- | ---- | ----------- |
| access_token | REQUIRED | *string* | This is the OAuth 2 access token that provides access to the Payer FHIR server. |
| token_type | REQUIRED | *string* | Fixed value: `Bearer`. |
| expires_in | REQUIRED | *integer* | The lifetime in seconds of the access token. |
| scope | REQUIRED | *string* | Fixed value: `user/Questionnaire.read user/Library.read`. |
| subject | REQUIRED | *string* | The OAuth 2.0 client identifier of the DTR application, as registered with the Payer's authorization server. |

### Questionnaire
The DTR application SHALL use the URL provided in the `template` property of the `appContext` to retrieve a Questionnaire resource. The payer SHALL provide this as a FHIR resource, such that the DTR application will be executing a FHIR read interaction on the payer's server. The returned Questionnaire resource SHALL conform to the CQF Questionnaire profile and MAY conform to Structured Data Capture.

The Questionnaire SHALL have a `cqf-library` extension property specified. That property SHALL provide the location of one or more CQL libraries needed to execute the payer rules.

### CQL Rules
The rules will be represented as a FHIR Library resource. 