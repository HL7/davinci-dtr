### DTR Questionnaire
The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules. This implementation guide uses the
[CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) from the [FHIR Clinical Reasoning Module](http://hl7.org/fhir/R4/clinicalreasoning-module.html). This profile is applied to provide a linkage between the information needs expressed in the Questionnaire and the rules and queries provided by the Payer in CQL.

Payers MAY also supply Questionnaire resources that conform to the [SDC Advanced Rendering Profile](http://build.fhir.org/ig/HL7/sdc/sdc-questionnaire-render.html) to control how information requests will ultimately be presented to users.

DTR conformant SMART on FHIR applications SHALL support both the CQF-Questionnaire and SDC Advanced Rendering Profiles.

* [DTR Questionnaire FHIR R4](dtr-questionnaire-r4.html) - [Example](home-o2-questionnaire.html)
* [DTR Questionnaire FHIR STU3](STU3/dtr-questionnaire-stu3.html)

### DTR QuestionnaireResponse
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR application by the user.

* [DTR QuestionnaireResponse FHIR R4](dtr-questionnaireresponse-r4.html)
* [DTR QuestionnaireResponse FHIR STU3](STU3/dtr-questionnaireresponse-stu3.html)

### DTR Task
The task resource is used to capture a request for additional actions that arise from the flow of DTR. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements.

* [DTR Task FHIR R4](dtr-task-r4.html)
* [DTR Task FHIR STU3](STU3/dtr-task-stu3.html)