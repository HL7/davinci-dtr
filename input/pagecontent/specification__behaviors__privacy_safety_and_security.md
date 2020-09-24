Guidance and conformance expectations around privacy and security are provided by all three specifications this implementation guide relies on. Implementers SHALL be familiar with and adhere to any security and privacy rules defined by:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)

If the Documentation Templates and Rules (DTR) / SMART on FHIR application is executed using an app, the app will have access to data authorized by the organization as appropriate for use by the app, and accessible to the user. Note that, especially if a common SMART on FHIR app is used to deal with multiple prior auth decision types, and even if that is not the case, it is highly likely that the app will have the ability to pull much more data than is needed. For example, if Observation.read capabilities are needed, the app will be able to pull Observations beyond what is actually needed for the prior auth.

Any EMR with SMART on FHIR support should be prepared to deal with the implications of providing a client with the scopes they request. For example, EMRs can severely limit FHIR search capabilities for clients, requiring a patient ID in any search query to ensure the client can only access resources related to that patient.

When meeting the DTR / SMART on FHIR App requirements using a distinct app (i.e. not within the EMR), the App SHALL have a distinct client id for when it's being invoked purely as a mechanism to supplement EMR data vs. when it is being invoked to potentially share data back to the payer.

>Note: CRD and DTR are designed to function without use case Prior Auth Support (PAS). For example, to augment the documentation of medical necessity. Since not all orders require Prior Auth some only require documentation therefore not all QuestionnaireResponses will need to be sent to a payer or PAS service.

This will allow the scopes to be different depending on whether data might flow to the payer. It will also allow the EMR to appropriately audit data accesses where data might flow external to the EMR.
Additionally, there is a requirement that the data passed to a payer SHALL also be stored in the EMR where it can be audited for appropriate use.

It should be noted that there are multiple actors with potential access to patient information. The implementation and deployment of these actors will have an impact on if and when patient information is transmitted from a provider organization to a payer organization.

It is under the control of the SMART on FHIR app or the capable EMR, based on the API access scope, what information is accessible to be included in the QuestionnaireResponse. The SMART on FHIR app cannot be responsible for informing the user that the information exists in the patient's record but is inaccessible to the application. This may differ depending on whether it is a native EMR application or a third-party application.

Data retrieved by the SMART app from the provider's FHIR server may or may not be shared with or kept by the payer. Depending upon the SMART app's architecture, patient information obtained by the SMART app may or may not leave the provider's network.

Providers should carefully evaluate SMART apps conforming to the DTR IG to evaluate risk. In this case, patient data will be requested by the server hosting the DTR process. This may be external to the provider organization.

Payer systems SHALL use information received solely for purpose for which the documentation template was created (typically processing of a specific claim or prior authorization request) and SHALL NOT use information received over the DTR interfaces for any additional purposes other than audit.


