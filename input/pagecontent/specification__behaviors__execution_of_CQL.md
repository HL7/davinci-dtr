### Retrieval of patient FHIR resources to supply to CQL execution engine
The application's execution engine determines which FHIR resources to retrieve by analyzing the Clinical Quality Language (CQL). The SMART on FHIR application SHALL be provided with a token that allows it to access relevant information for the patient in question. Depending on user permissions the app may not have all data. The app dev should consider the possibility that access to some data may be restricted or prohibited(and access restrictions my happen silently (i.e. indistinguishable absent data). The app's CQL execution engine SHOULD attempt to constrain queries as much as possible to reduce data transfer, however it MAY retrieve more data than is necessary (for example, if the CQL logic filters for medications meeting certain conditions, it is acceptable if the engine retrieves all medications for the patient, even if a more constrained query was possible).

As discussed in the Execution Results section below, it's possible not every CQL statement will be executed (for example if some questions are only relevant given certain answers to prior questions). In order to reduce data transfers and increase overall speed, data MAY be fetched as needed. However, the application's execution engine MAY be implemented using a different strategy (for example by doing bulk fetches before starting execution).

The app's execution engine determines which FHIR resources to retrieve by analyzing the CQL. The SMART on FHIR application SHALL be provided with a token that allows it to access relevant information for the patient in question. Depending on user permissions the app may not have all data. The app dev should consider the possibility that access to some data may be restricted or prohibited and that access restrictions my happen silently (i.e. indistinguishable absent data).

### Engine Execution

The FHIR Library containing/referencing a CQL logic file can reference other needed CQL files (e.g. helper libraries) using the `relatedArtifact` field and a `RelatedArtifact` with a `type` of `depends-on`. The engine SHALL make available to the execution context all such referenced CQL libraries. If the questionnaire has multiple `cqf-library` fields, then any `valueExpression` must specify the library name as well as the statement name as follows: `"LibraryName".statementName`.

It is likely that different versions of CQL will need to be created for different FHIR versions, as the same information could be in a different resource. The SMART on FHIR application will have access to the FHIR endpoint, it should check the version and then retrieve the package that has been created for the correct FHIR version.

Consideration must also be made regarding the CQL version.

#### Behavior when receiving malformed CQL
 If the CQL is malformed (is not syntactically correct) in any way, the app's execution engine SHALL not attempt any execution of the malformed CQL, SHALL log the error, and the user SHALL be notified with an appropriate on-screen message indicating that population did not occur and they SHALL be allowed to enter the information manually either now or at a later time. The application SHOULD log failures and ensure the maintainer of the CQL/Questionnaire package is notified. 

In an effort to notify the appropriate party or maintainer that  the CQL/Questionnaire is malformed, the application developer SHOULD use FHIR resource OperationOutcome.  The details property of the OperationOutcome should use `MSG_BAD_SYNTAX` to indicated syntactical errors.

>Since we will use the standard that if the CQL cannot be executed by the application's CQL engine in the SMART on FHIR app or in the capable EMR then it is considered a CQL failure (the CQL author should be taking into account the capability of the app's CQL engine in designing their CQL for execution).

#### Behavior when encountering execution errors
If any errors are encountered during execution, the application's engine SHALL not attempt any further execution, and the user SHALL be notified with an appropriate on screen error message. The application SHALL log failures and ensure the maintainer of the CQL/Questionnaire package is notified. The user should have the option to complete the Questionnaire if possible despite the error.

Note that a query for data that returns no results is never considered a failure.

### Execution Results

The flow of execution of the CQL will be determined by the associated questionnaire. The application will proceed through the questionnaire, and for any question that is associated with the result of a CQL statement, that specific CQL statement will be executed. The app's engine will use result caching so that each statement should be executed either zero or one time.