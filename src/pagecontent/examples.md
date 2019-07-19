### DTR Questionnaire Examples
The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules.

* [DTR Questionnaire Home Oxygen Therapy Example FHIR R4](home-o2-questionnaire.html)
* [DTR Questionnaire Home Oxygen Therapy Example FHIR STU3](home-o2-questionnaire-stu3.html)

### DTR QuestionnaireResponse
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR application by the user.

* [DTR QuestionnaireResponse Example FHIR R4](home-o2-questionnaireresponse.html)
* [DTR QuestionnaireResponse Example FHIR STU3](home-o2-questionnaireresponse-stu3.html)

### DTR Task
The task resource is used to capture a request for additional actions that arise from the flow of DTR. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements.

* [DTR Task FHIR R4](dtr-task-r4.html)
* [DTR Task FHIR STU3](STU3/dtr-task-stu3.html)

### DTR CQL
The CQL resource is used to query the Electronic Health Record (EHR) FHIR server to prepopulate the DTR Questionnaire.
* [DTR CQL Prepopulation Example](resources__home-o2-prepopulation.html)