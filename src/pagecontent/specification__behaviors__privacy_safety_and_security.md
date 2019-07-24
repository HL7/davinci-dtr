Guidance and conformance expectations around privacy and security are provided by all three specifications this implementation guide relies on. Implementers SHALL be familiar with and adhere to any security and privacy rules defined by:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)

If the Documentation Templates and Rules (DTR) / Substitutable Medical Applications, Reusable Technologies (SMART) on FHIR application is executed using an app, the app will only have access to data specifically authorized by the organization as appropriate for use.

When meeting the DTR / SMART on FHIR application requirements using a distinct app (i.e. not within the  Electronic Health Record (EHR)), the app SHALL have a distinct client id for when it's being invoked purely as a mechanism to supplement EHR data vs. when it's being invoked to potentially share data back to the payer.

This will allow the scopes to be different depending on whether data might flow to the payer. It will also allow the EHR to appropriately audit data accesses where data might flow external to the EHR.
As well, there is a requirement that the data passed to a payer SHALL also be stored in the EHR where it can be audited for appropriate use.

It should be noted that there are multiple actors with potential access to patient information. The implementation and deployment of these actors will have an impact on if and when patient information is transmitted from a provider organization to a payer organization.

It is the under control of the SMART on FHIR app or the capable EHR, based on the API access scope, what information is accessible to be included in the questionnaireResponse. The SMART on FHIR app cannot be responsible for informing the user that the information exists is inaccessible to the application. This may differ depending on whether it is a native EHR application or a third-party application.

Data retrieved by the SMART app from the provider's FHIR server may or may not be shared with, kept by the payer. Depending upon the SMART app's architecture, patient information obtained by the SMART app may or may not leave the provider's network. 

Providers should carefully evaluate SMART apps conforming to the DTR IG to evaluate risk. In this case, patient data will be requested by the server hosting the DTR application. This may be external to the provider organization.

Payer systems SHALL use information received solely for purpose for which the documentation template was created (typically processing of a specific claim or prior authorization request) and SHALL NOT use information received over the DTR interfaces for any additional purposes other than audit.
