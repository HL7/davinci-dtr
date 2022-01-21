The DTR process may be launched outside of the workflow of Coverage Requirements Discovery. This is likely to be the case if a user is resuming a previous session. Depending on the context of the Electronic Health Record (EHR) system, the interaction with the DTR process will vary.

### Launch Context
The launch context, which comes to the DTR app through the access token bundle, can be used to include necessary information when launching. When launched outside the context of CRD, the DTR app should add the `launch/order` scope, to indicate that the EHR should include the order currently in context when it returns an access token.  The EHR should provide a local reference, which the DTR app can use to retrieve the request, from which it can relaunch the associated usage session. The requests shall have an identifier, with type "placer", which remains consistent over the resources lifetime and can be used to search for them despite changes to their `id`.  

### When the EHR is in a patient context
When the user of the EHR is working in the context of an individual patient and the EHR system allows the launch of a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) application, launching of a DTR compliant application SHOULD follow the [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence) as described in [Section 4.2.2](specification__cds_hooks.html#establish-patient-context) which will allow the DTR process to establish the patient of interest. When the user of the EHR is not working in the context of an individual patient and the EHR system allows the launch of a SMART on FHIR application, the DTR process should allow the user to select a usage session from all of the sessions available.

The DTR process will then allow the user to restore a session. The possible sessions to restore SHALL be based on the user's identity and patient that has been established. Further information on establishing user identity and sessions is available in [Section 4.4.5](specification__behaviors__persisting_application_state.html).

When DTR processes are launched in this manner, in [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system will not provide a `template` property, which would point to a Questionnaire resource. This is an indication to the DTR process that it has been launched outside of the Coverage Requirements Discovery workflow.

### Standalone launch
DTR process SHALL support the [Standalone launch sequence](http://hl7.org/fhir/smart%2Dapp%2Dlaunch/#standalone-launch-sequence). In this case, the DTR process SHALL establish the user's identity following the procedures in [Section 4.4.5.2](specification__behaviors__persisting_application_state.html#requesting-user-identity).

Once user identity has been established, the DTR process should allow the user to select a usage session from all of the sessions available to that particular user.

