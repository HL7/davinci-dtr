Guidance and conformance expectations around privacy and security are provided by all three specifications this implementation guide relies on. Implementers SHALL be familiar with and adhere to any security and privacy rules defined by:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/specification/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)

It should be noted that there are multiple actors with potential access to patient information. The implementation and deployment of these actors will have an impact on if and when patient information is transmitted from a provider organization to a payer organization.

Some SMART on FHIR applications are browser based, such as those conforming to the [public app profile](http://hl7.org/fhir/smart-app-launch/#use-the-public-app-profile-if-your-app-is-unable-to-protect-a-client_secret). In this scenario, patient information is communicated from the EHR system to the DTR application through the EHR's FHIR endpoint. In this case, unless the DTR application takes explict actions to send the information back to the payer organization, it will reside only in the provider organization.

Other SMART on FHIR applications are server based, such as those conforming to the [confidential app profile](http://hl7.org/fhir/smart-app-launch/#use-the-confidential-app--profile-if-your-app-is-able-to-protect-a-client_secret). In this case, patient data will be requested by the server hosting the DTR application. This may be external to the provider organization.

> Note to ballot comments
>
> This is an area the project is explicitly seeking comments on. Thoughts on the whether
> EHR systems should be required to support specific SMART on FHIR application profiles
> or comments on restrictions that should be applied to what payer organizations may do
> with any received patient information are welcome.