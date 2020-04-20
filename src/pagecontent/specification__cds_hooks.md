### Use of Card.links
One entry point into the Documentation Templates and Rules (DTR) application is launching from a [Clinical Decision Support (CDS) Hooks Card](https://cds-hooks.hl7.org/1.0/#card-attributes). 

DTR applications SHALL, to the extent possible, capture and return information that is relevant to the specific use case.

 As a part of a CDS Hooks response, if there is a need for further information then the Payer IT system SHALL return a Card object with at least one Link object populated in the Card.links property. Otherwise no Link object would be provided. The Link object SHALL have a type property set to smart. The Link object SHALL have a URL property set to the launch URL of the DTR application.

A payer may secure endpoints from which the DTR application will retrieve additional artifacts to support execution. If the payer does require authentication, the DTR app requests an OAuth token using SMART backend services and then uses that second access token to authenticate against the payer FHIR server.

### Establish Patient Context
When the DTR application is being launched from a CDS Hooks Card Link, the Electronic Medical Record (EMR) system and DTR application will follow the procedures established by the [SMART Application Launch Framework Implementation Guide Release 1.0.0](http://hl7.org/fhir/smart-app-launch). The EMR and DTR application SHALL follow the [EMR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence). 

In [Step 1 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-1-app-asks-for-authorization), the DTR application SHALL request the `patient/Patient.read` scope. The DTR application MAY request other scopes to retrieve FHIR resources to use in order to evaluate payer rules. The DTR application MAY also request the `openid` and `fhirUser` scopes to establish a user session. Greater detail on this can be found in [Section 4.4.5.2](specification__behaviors__persisting_application_state.html#requesting-user-identity) - Requesting User Identity.

In [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EMR system is returning a response with an access token, the system SHALL also provide a patient property set to the identifier of the patient that is the subject of this interaction.

For cases where the DTR application is being launched outside the context of Coverage Requirements Discovery workflow, please see [Section 4.4.8](specification__behaviors__launch_outside_of_CRD.html).
