### Use of Card.links
One entry point into the DTR application is launching from a [CDS Hooks Card](https://cds-hooks.hl7.org/ballots/2018May/specification/1.0/#card-attributes). When a payer wishes to offer an entry into a DTR application as a part of a CDS Hooks response, the Payer IT system SHALL return a `Card` object with at least one `Link` object populated in the `Card.links` property. The `Link` object SHALL hava a `type` property set to `smart`. The `Link` object SHALL have a `url` property set to the launch URL of the DTR application.

A payer may secure endpoints from which the DTR application will retrieve additional artifacts to support execution. If the payer does require authentication, then the Payer IT system SHALL provide the authentication information through the `appContext` property of the `Link` object. The `appContext` property SHALL contain escaped JSON. The structure of this JSON is described in Section 4.1.1 - Authentication of SMART on FHIR application to payer API.

### Establish Patient Context
When the DTR application is being launched from a CDS Hooks Card Link, the EHR system and DTR application will follow the procedures established by the [SMART Application Launch Framework Implementation Guide Release 1.0.0](http://hl7.org/fhir/smart-app-launch). The EHR and DTR application SHALL follow the [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence). 

In [Step 1 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-1-app-asks-for-authorization), the DTR application SHALL request the `patient/Patient.read` scope. The DTR application MAY request other scopes to retrieve FHIR resources to use in order to evaluate payer rules. The DTR application MAY also request the `openid` and `fhirUser` scopes to establish a user session. Greater detail on this can be found in Section 5.2. Requesting User Identity.

In [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system SHALL also provide a patient property set to the identifier of the patient that is the subject of this interaction.

For cases where the DTR application is being launched outside the context of Coverage Requirements Discovery workflow, please see Section 4.4.8.
