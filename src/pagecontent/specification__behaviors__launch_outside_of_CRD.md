The DTR application may be launched outside of the workflow of Coverage Requirements Discovery. This is likely to be the case if a user is resuming a previous session. Depending on the context of the EHR system, the interaction with the DTR application will vary.

### When the EHR is in a patient context
When the user of the EHR is working in the context of an individual patient and the EHR system allows the launch of a SMART on FHIR application, launching of a DTR compliant application SHOULD follow the [EHR launch sequence](http://hl7.org/fhir/smart-app-launch/#ehr-launch-sequence) as described in Section 4.2.2 which will allow the DTR application to establish the patient of interest.

The DTR application will then allow the user to restore a session. The possible sessions to restore SHALL be based on the user's identity and patient that has been established. Further information on establishing user identity and sessions is available in Section 4.4.5.

When DTR applications are launched in this manner, in [Step 3 of the launch sequence](http://hl7.org/fhir/smart-app-launch/#step-3-app-exchanges-authorization-code-for-access-token), in the case where the EHR system is returning a response with an access token, the system will not provide a `template` property, which would point to a Questionnaire resource. This is an indication to the DTR application that it has been launched outside of the Coverage Requirements Discovery workflow.

### Standalone launch
DTR applications SHALL support the [Standalone launch sequence](http://hl7.org/fhir/smart%2Dapp%2Dlaunch/#standalone-launch-sequence). In this case, the DTR application SHALL establish the user's identity following the procedures in Section 4.4.5.2.

Once user identity has been established, the DTR application should allow the user to select a usage session form all of the sessions available to that particular user.