Guidance and conformance expectations around privacy and security are provided by all three specifications this implementation guide relies on. Implementers SHALL be familiar with and adhere to any security and privacy rules defined by:

* FHIR core: [Security & Privacy module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* CDS Hooks: [Security & Safety](https://cds-hooks.hl7.org/specification/1.0/#security-and-safety)
* SMART on FHIR: [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)

In addition to these, this implementation guide imposes the following additional rules:

* EHR systems are the final arbiters of what data can be shared with payer systems.  They MAY filter or withhold any resources or data elements necessary to support their obligations as health data custodians, including legal, policy and patient consent-based restrictions.  However, client systems withholding information take on the responsibility of ensuring coverage requirements are met, even if discovery is no longer possible through the interfaces provided by this implementation guide.