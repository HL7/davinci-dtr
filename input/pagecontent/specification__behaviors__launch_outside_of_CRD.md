The Documentation Templates and Rules (DTR) application may be launched outside of the workflow of Coverage Requirements Discovery. This is likely to be the case if a user is resuming a previous session. Depending on the context of the Electronic Medical Record (EMR) system, the interaction with the DTR process will vary.

### When the EMR is in a patient context
When the user of the EMR is working in the context of an individual patient and the EMR system allows the launch of a [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) application, launching of a DTR compliant application SHOULD follow the [EMR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence) as described in Section 4.2.2 which will allow the DTR process to establish the patient of interest. When the user of the EMR is not working in the context of an individual patient and the EMR system allows the launch of a SMART on FHIR application, the DTR process should allow the user to select a usage session from all of the sessions available.

The DTR process will then allow the user to restore a session. The possible sessions to restore SHALL be based on the user's identity and patient that has been established. Further information on establishing user identity and sessions is available in Section 4.4.5.

When DTR processs are launched in this manner, in [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EMR system is returning a response with an access token, the system will not provide a `template` property, which would point to a Questionnaire resource. This is an indication to the DTR process that it has been launched outside of the Coverage Requirements Discovery workflow.

### Standalone launch
DTR processs SHALL support the [Standalone launch sequence](http://hl7.org/fhir/smart%2Dapp%2Dlaunch/#standalone-launch-sequence). In this case, the DTR process SHALL establish the user's identity following the procedures in Section 4.4.5.2.

Once user identity has been established, the DTR process should allow the user to select a usage session from all of the sessions available to that particular user.