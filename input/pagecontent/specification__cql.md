This specification uses [Clinical Quality Language (CQL)](https://cql.hl7.org) for the expression of payer rules. By using CQL, this specification allows payers to query for patient information to verify that the patient's condition meets the requirements related to coverage of a particular treatment.

Payers should construct CQL to gather information needed and test expected conditions about a patient. The DTR process will provide the CQL access to FHIR resources for the patient in question. This CQL will be executed and the resulting information will be made available for further use by the DTR process. Mainly, this information will be used to populate a Questionnaire that is also supplied by the payer.

One of the core purposes of this specification is to automate the retrieval of documentation required by the payer in a manner that reduces provider burden. Authors of DTR questionnaires SHOULD include CQL to auto-populate the questionnaire as much as possible. Due to differences in workflows or information systems, clinical information may be represented in different FHIR resources or with different codes or code systems. Therefore, payer CQL may have to examine different resources or use value sets to find patient information. It is preferable to have more extensive CQL or value sets than require a user to input values that the rules were unable to find.

In general CQL SHALL be used when pre-populating anything exposed in the FHIR based patient data access API (The 21st Century Cures Act API).

### Guidance on Structure of CQL Logic
Like many other programming languages, CQL allows for statements to be nested within conditional logic. This creates instances where some statements may not be executed due to a prior condition being met. This behavior should be used intentionally by payers creating CQL.

Data retrieval is highly dependent on the *enableWhen* attribute/element:

1. Questionnaires should be designed with appropriate use of *enableWhen* such that questions are only displayed when needed.

2. CQL logic should be partitioned to be specific to groups/questions/etc. when doing so will allow it to be more efficient - though consideration should also be given to whether performing significant data gathering at the outset (even if the data is unneeded) will produce a more positive experience than intermittent data retrieval 'on demand', when such retrieval may introduce user-interface delays

This pattern of logic structure is referred to by several names, including *eager quitting*, *early return* or, *short circuiting*. The goal is to avoid the execution of statements if they will not be relevant given other information available to the logic. This is done to streamline workflow and allow the user to focus on relevant input fields.

As an example, a payer may have a set of rules or specific information that must be gathered on a patient only if they have diabetes. This information may be gathered through a series of CQL statements. When constructing this CQL for DTR, these statements should be nested in conditionals to first check if the patient has diabetes before checking for information dependent on that condition.

### Expression Naming Conventions
CQL allows for the gathering of information through the use of `define` statements. These statements are given an identifier. When CQL execution is complete, a context will be created where these identifiers are populated with the results of the statement execution.

DTR makes use of the identifier names within the CQL. The DTR process will examine the payer supplied Questionnaire resource. 

* This resource SHALL conform to the [CQF Questionnaire Profile](http://hl7.org/fhir/R4/cqf.html) 
  *  The DTR process will examine each `Questionnaire.item` to find a `valueExpression` 

  * Resources are retrieved from the EHR FHIR server with RESTful queries and CQL is executed to extract relevant information
  * Values extracted from the FHIR resources are assigned identifier strings and the DTR process will then use these statement identifiers to retrieve a value from the CQL execution 
  
>The resulting value is used to satisfy documentation requirements. If the value is `null`, the user will be prompted to supply a value

### CQL Constraints
CQL for use in DTR SHALL have a `context` of `Patient`.  Within the Questionnaire, CQL SHALL follow SDC rules for determining context.  Specifically, CQL definitions and variables defined on ancestor elements or preceding expression extensions within the same Questionnaire item are 'in scope' for referencing in descendant/following expressions.

CQL must be version [CQL STU2](https://cql.hl7.org/STU2/index.html) or later.