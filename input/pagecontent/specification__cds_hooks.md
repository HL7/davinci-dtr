### Use of Card.links
One entry point into the DTR process is launching from a [Clinical Decision Support (CDS) Hooks Card](https://cds-hooks.hl7.org/1.0/#card-attributes). 

Details of the DTR launch process from CRD can be found [here](https://build.fhir.org/ig/HL7/davinci-crd/hooks.html#launch-smart-application)

### Establish Patient Context
When the DTR process is being launched from a CDS card Link, the Electronic Health Record (EHR) system and DTR process will follow the procedures established by the [SMART App Launch Framework](http://hl7.org/fhir/smart-app-launch). More specifically the EHR and DTR process SHALL follow the SMART App Launch Framework [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence). 

In [Step 1 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-1-app-asks-for-authorization), the DTR process SHALL request the `patient/Patient.read` scope. DTR apps are expected to be technically able to run against any EHR and work with any payer.  However, for a DTR app to be used, it needs to be trusted appropriately manage access to personal health information by the EHRs and payers.  EHRs will choose which DTR apps they will trust and support.  Similarly, all DTR apps must be registered with the payer systems with which they communicate.  This registration process will ensure the following:

- The DTR app is 'trusted' by the payer to deal with patient-identifiable data
- The DTR app knows the relevant endpoints to use to access Questionnaires, DocumentReferences and other relevant information
- The DTR app has a shared secret allowing secure access to the payer endpoints

Even after an application has been successfully registered, payers and EHRs SHOULD monitor the application behavior and MAY suspend an application's access if it is suspected of malicious behavior. The app will need to ask for scope sufficient to execute any CQL that the payer may provide as part of the questionnaires."  provide link to the payer registration section and add to payer registration that: "the payer should indicate the scopes required by their questionnaires.

In [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system SHALL also provide a patient property set to the subject patient identifier of this interaction.

For cases where the DTR process is being launched outside the context of Coverage Requirements Discovery workflow, please see [Section 4.4.8](specification__behaviors__launch_outside_of_CRD.html).
