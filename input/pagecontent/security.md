Guidance and conformance expectations around privacy and security are provided by all three specifications this implementation guide relies on. §sec-1^dtr-client,dtr-server:Implementers **SHALL** adhere to any security and privacy rules defined by:§
* FHIR Core: [Security & Privacy Module]({{site.data.fhir.path}}secpriv-module.html), [Security Principles]({{site.data.fhir.path}}security.html) and [Implementer's Checklist]({{site.data.fhir.path}}safety.html)
* HRex: [Privacy & Security]({{site.data.fhir.ver.hrex}}/security.html)
* SMART on FHIR: [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)

### DTR-specific considerations
Any DTR SMART on FHIR application will have access to the scope of data authorized by the organization as appropriate for use by the app, accessible to the user, and potentially as authorized by the user. §sec-2^dtr-client,dtr-server:This scope granted **MAY** provide the SMART on FHIR application access to more data than is needed for the specific situation.§  For example, if Observation.read capabilities are needed, the app will have access to all observations for that patient. §sec-3^dtr-server:For compliance with HIPAA Minimum Necessary, the CQL included in payer-defined Questionnaires **SHALL** limit requests for information from the EHR's API to only items that are relevant to the documentation requirements for which DTR was launched (e.g., documentation requirements for a service that does require prior authorization).§

§sec-4^dtr-server:Compliant Questionnaires **SHALL NOT** include hidden or read-only questions where the data is populated from the EHR.§  §sec-5^dtr-client:DTR Clients **SHALL** appropriately manage access to data that is sensitive per policy and regulatory requirements when responding to queries from a DTR app.§  §sec-6^dtr-client:Providers **SHOULD** ask the patient if they want to share the information with the payer prior to manually populating it in any QuestionnaireResponses.§

§sec-7^dtr-client:Any EHR with SMART on FHIR support **SHOULD** be prepared to deal with the implications of providing a client with the scopes they request.§  §sec-8^dtr-client:For example, EHRs **SHALL** limit FHIR search capabilities for clients, requiring a patient ID in any search query to ensure the client can only access resources related to that patient.§  It is important for implementers to be aware that data is going to be auto-populated that could be considered sensitive - so there will likely be a need for a human to review and confirm that the information is appropriate to be shared, and be able to remove it without risk of it being put back if they wish. §sec-9^dtr-client:Also, the app **MAY** not have access to certain data for retrieval because of security considerations.§

§sec-10^dtr-server:Payer systems **SHALL** use information received during execution of the DTR [`$questionnaire-package`](OperationDefinition-questionnaire-package.html) operation solely for the purpose of satisfying the operation invoked, for audit, and to satisfy metric reporting needs.§

§sec-11^dtr-server:If a payer uses adaptive forms to gather information, the payer **SHALL NOT** persist or use the information shared as part of the [`$next-question`](http://hl7.org/fhir/uv/sdc/STU3/OperationDefinition-Questionnaire-next-question.html) operation for any purpose other than:§
* Responding to the operation.
* Retention of the fully completed QuestionnaireResponse to support a coverage determination made as part of the Questionnaire completion process.
* Internal audit and metric calculation.
