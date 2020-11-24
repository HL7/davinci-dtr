Guidance and conformance expectations around privacy and security are provided by all three specifications this IG relies on. Implementers SHALL be familiar with and adhere to any security and privacy rules defined by:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch Framework](http://www.hl7.org/fhir/smart-app-launch)
* Da Vinci HRex: [Privacy and Security](http://build.fhir.org/ig/HL7/davinci-ehrx/security.html)

The DTR / SMART on FHIR application will have access to the scope of data authorized by the organization as appropriate for use by the app, and accessible to the user. This scope granted my provide the  SMART on FHIR application  access to more data than is needed for the specific situation. For example, if Observation.read capabilities are needed, the app will have access to all observations for that patient.

Any EHR with SMART on FHIR support should be prepared to deal with the implications of providing a client with the scopes they request. For example, EHRs SHOULD limit FHIR search capabilities for clients, requiring a patient ID in any search query to ensure the client can only access resources related to that patient.

When meeting the DTR / SMART on FHIR app requirements using a distinct app (i.e. not within the EHR), the app SHALL have a distinct client id for when it’s being invoked purely as a mechanism to supplement EHR data vs. when it is being invoked to share data back to the payer.

Note: CRD and DTR are designed to function without use case Prior Authorization Support (PAS). For example, to augment the documentation of medical necessity. Since not all orders require Prior Authorization some only require documentation therefore not all QuestionnaireResponses will need to be sent to a payer or PAS service.

This will allow the scopes to be different depending on whether data is expected to flow to the payer. It will also allow the EHR to appropriately audit data accesses where data will flow external to the EHR. Additionally, there is a requirement that the data passed to a payer SHALL also be stored in the EHR where it can be audited for appropriate use.

It is under the control of the SMART on FHIR app or the capable EHR, based on the API access scope, what information is accessible to be included in the QuestionnaireResponse. The SMART on FHIR app cannot be responsible for informing the user that the information exists in the patient’s record but is inaccessible to the application. This may differ depending on whether it is a native EHR application or a third-party application.

Payer systems SHALL use information received during execution of DTR solely for the purpose for which the documentation template was created (typically processing of a specific claim or prior authorization request) and SHALL NOT use information received over the DTR interfaces for any additional purposes other than audit.



