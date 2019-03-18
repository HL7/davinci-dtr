### System Actors

#### Payers
A Payer is a person or company who pays for the service of providers. The majority of payers here are also referred to as insurance companies.

#### Payer IT System
The payer IT system is an innovative approach introduced to revolutionize the accounting processes and maintenance of payment records. These systems were introduced as a result of the growing need to meet time-to-market requirements, maintain smooth communication between payers and providers, and minimize administrative costs.

#### Healthcare Provider Organization
A healthcare provider organization contains medical providers such as hospitals, doctors, etc. 

#### EHR System
The Electronic Health Record (EHR) system shall be the primary system used to initiate the DTR process. The SMART in FHIR app will typically be initiated from within the EHR.   

#### DTR compliant SMART on FHIR app
Within DTR the SMART on FHIR app is considered a key component because of the inherent nature of SMART on FHIR apps, namely the ability call into backend systems such as payers using [CDS Hooks](https://cds-hooks.hl7.org) as well as the ability to run rules such as [CQL](https://cql.hl7.org/STU2/). This functionality will enable DTR to gather documents and templates as well as run rules to reduce the time involved in the Documentation Requirements Lookup Service (DRLS) process.

#### Users (clinicians and office staff)
Users or Providers are challenged to deal with the diversity of administrative and clinical requirements that impact documenting the need for treatment and selecting the appropriate best path for care. The current environment is made more complex by the large number of payer-based requirements that must be met to document that covered services and devices are medically necessary and appropriate.

The goal of this use case is to reduce user or provider burden and simplify processes by establishing electronic versions of administrative and clinical requirements that can become part of the providers daily workflow. 

### Relation to CRD
[CRD](http://build.fhir.org/ig/HL7/davinci-crd/) addresses the bulleted items below with some DTR overlap:

* updated coverage information 
* alternative preferred/first-line/lower-cost services/products 
* documents and rules related to coverage 
* forms and templates 
* indications of whether prior authorization is required

DTR differs from CRD mostly in its ability to run rules and auto fill forms and templates.  

### Process Flow 

This shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR App)

![CRD DTR Flow](CRD_DTR_Flow.png){:width="100%"}

### Oxygen Therapy Ordering Example
This shows a high-level overview of CRD and DTR (DTR is the SMART on FHIR App)

1. Oxygen Therapy is ordered via the (order-review) hook
2. It is determined that there is prior authorization required and there are forms to be filled out.
3. The SMART on FHIR App fetches CQL (rules) and a FHIR Questionnaire 
4. The engine then extracts the answers in order to formulate a FHIR Questionnaire response
5. It then writes the FHIR Questionnaire response back to Payer server and optionally to the EHR in a text format.

![Process Flow Detail](Process_Flow_Detail.png){:width="100%"}
