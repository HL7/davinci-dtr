### DTR Questionnaire
The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules. This implementation guide uses the
[CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) from the [FHIR Clinical Reasoning Module](http://hl7.org/fhir/R4/clinicalreasoning-module.html). This profile is applied to provide a linkage between the information needs expressed in the Questionnaire and the rules and queries provided by the Payer in Clinical Quality Language (CQL).

Payers MAY also supply Questionnaire resources that conform to the [Structured Data Capture (SDC) Advanced Rendering Profile](http://hl7.org/fhir/uv/sdc/2019May/rendering.html) to control how information requests will ultimately be presented to users.

Documentation Templates and Rules (DTR) conformant [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) applications SHALL support both the CQF-Questionnaire and SDC Advanced Rendering Profiles.'

Note that elements with example bindings or missing bindings will not be used.

* [DTR Questionnaire FHIR R4](StructureDefinition-dtr-questionnaire-r4.html) - [Example](Questionnaire-home-o2-questionnaire.html)

### DTR QuestionnaireResponse
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR process by the user.

* [DTR QuestionnaireResponse FHIR R4](StructureDefinition-dtr-questionnaireresponse-r4.html) - [Example](QuestionnaireResponse-home-o2-questionnaireresponse.html)

### DTR Task
The task resource is used to capture a request for additional actions that arise from the flow of DTR. This may be a request for more information from the patient or a desire to schedule a follow up treatment in order to satisfy documentation requirements.

* [DTR Task FHIR R4](StructureDefinition-dtr-task-r4.html) - [Example](Task-blood-gass-panel-task-r4.html)

### DTR CQL
The CQL resource is used to query the Electronic Medical Record (EMR) FHIR server to prepopulate the DTR Questionnaire.
* [DTR CQL Prepolulation](specification__cql.html) - [Example](resources__home-o2-prepopulation.html)