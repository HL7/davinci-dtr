### DTR Questionnaire Examples
The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules.

* [DTR Questionnaire Home Oxygen Therapy Example FHIR R4](Questionnaire-home-o2-questionnaire.html)

### DTR QuestionnaireResponse
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR process by the user.

* [DTR QuestionnaireResponse Example FHIR R4](QuestionnaireResponse-home-o2-questionnaireresponse.html)

### DTR Task
The task resource is used to capture a request for additional actions that arise from the DTR flow. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements.

* [DTR Task Example R4](Task-blood-gass-panel-task-r4.html)

### DTR CQL
The CQL resource is used to query the Electronic Health Record (EHR) FHIR server to prepopulate the DTR Questionnaire.
* [DTR CQL Prepopulation Example](resources__home-o2-prepopulation.html)