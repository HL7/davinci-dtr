### System Actors

#### Payers
A Payer is a person or company who pays for the service of providers. The majority of payers here are also referred to as insurance companies.

#### Payer IT System
The payer IT system shall be the primary system responding to DTR queries.

#### Healthcare Provider Organization
A healthcare provider organization contains medical providers such as hospitals, doctors, etc.

#### EMR System
The Electronic Medical Record (EMR) system shall be the primary system used to initiate the DTR process. The [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) app will typically be initiated from within the EMR.

The goal of DTR is to collect clinical documentation and/or to encourage the completion of documentation that demonstrates medical necessity for ordered items, it is focused on the clinical documentation effort and not the administrative process. 

It is possible to have a process where the focus is on the interaction with the EMR via an external application(s). Examples of external systems are administrative, payment, practice management, scheduling, and other applications. 

>If information is not available to the SMART on FHIR application, then the application will need to prompt the provider to enter the missing information. Ultimately, the solution is to provide greater integration (including possibly FHIR APIs) between the EMR and other supporting applications. (Quality measures may also require this type of integration)

>If Electronic Medical Record (EMR) is used in this IG it should be considered synonymous to EMR. 

#### DTR compliant SMART on FHIR app
Within Documentation Templates and Rules (DTR), the SMART on FHIR app serves as a middleware layer easing payer and provider integrations. Specifically, the relatively low adoption of [Clinical Quality Language (CQL)](https://cql.hl7.org/STU2/) by providers and [FHIR](https://www.hl7.org/fhir/) by payers is eased through the use of a third-party "app".  This functionality will enable DTR to gather documents and templates, retrieve FHIR resources from EMRs, and run rules to reduce the time involved in the Documentation Requirements Lookup Service (DRLS) process.

### Relation to Coverage Requirements Discovery (CRD)
[Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd/2019May/) addresses the bulleted items below with some DTR overlap:

* updated coverage information
* alternative preferred/first-line/lower-cost services/products
* documents and rules related to coverage
* forms and templates
* indications of whether prior authorization is required

The CRD portion of the full workflow might be responsible for verifying with the payer that a given device request requires documentation, and then consolidating the necessary links for the DTR app to be run.  In most cases, the CRD service would return a CDS hooks card populated with a SMART launch link for the DTR app, a link to a questionnaire resource, and a device request resource ID.  While CRD may verify that documentation rules are required, it does not involve any actual authorization or validation of the rule.  The DTR app or native EMR application is responsible for taking the provided rule and checking if available EMR data satisfies the requirements, as well as allowing manual population of missing data.  

### Process Flow

This shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR App)

![CRD DTR Flow](CRD_DTR_Flow.png){:style="float: none;"}

### Oxygen Therapy Ordering Example
This shows an overview of how the SMART on FHIR App fits into the flow when ordering oxygen therapy.

1. Oxygen Therapy order triggers appropriate CDS hook.
2. It is determined that there is prior authorization required and there are forms to be filled out.
3. The SMART on FHIR App fetches CQL (rules) and a FHIR Questionnaire.
4. The engine then extracts as many answers as it can in order to formulate a FHIR QuestionnaireResponse.
5. If there is missing information, the user can manually provide it to fully populate the Questionnaire response.  Otherwise, the Questionnaire is not shown to the user unless specifically requested.
6. It then writes the FHIR QuestionnaireResponse back to Payer server and optionally to the EMR in a text format.

> Note: There is no need for the user to see the form if it can be auto-completed unless they need to approve sending the result to the payer or to "sign" the information prior to submission.  FHIR Questionnaires should indicate which items are necessary for auto-completion using the "required" property.  The application SHALL give the provider the ability, but not the requirement to review any information prior to sending it to a third party. This ability may be "turned-off" by the organization and possibly the individual provider. 

> Note: Questionnaires SHALL indicate which items are necessary using the "required" property, and the application should use that property to decide when a questionnaire has been sufficiently auto-completed.

 > If the resulting information is to be sent to a third party (e.g. payer). The DTR / SMART on FHIR App should include a step requiring the provider to grant permission to send along the information gathered in the form before sending. However this should be configurable on a site or provider basis.

Note: DTR is not intended to change orders, only to gather documentation related to a specific service and where it is incomplete, provide the ability to capture the additional documentation required.

![Process Flow Detail](Process_Flow_Detail.png){:style="float: none;"}
