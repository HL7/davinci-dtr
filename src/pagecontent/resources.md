### DTR Questionnaire
The Questionnaire resource is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules. This implementation guide uses the 
[CQF-Questionnaire Profile](http://hl7.org/fhir/R4/cqf-questionnaire.html) from the [FHIR Clinical Reasoning Module](http://hl7.org/fhir/R4/clinicalreasoning-module.html). This profile is applied to provide a linkage between the information needs expressed in the Questionnaire and the rules and queries provided by the Payer in CQL.

Payers MAY also supply Questionnaire resources that conform to the [SDC Advanced Rendering Profile](http://build.fhir.org/ig/HL7/sdc/sdc-questionnaire-render.html) to control how information requests will ultimately be presented to users. 

DTR conformant SMART on FHIR applications SHALL support both the CQF-Questionnaire and SDC Advanced Rendering Profiles.

[DTR Questionnaire FHIR STU3](dtr-questionnaire-stu3.html)

| element | cardinality | description |
| ------- | ----------- | ----------- |
| cqf-library | 1..* | References to CQL representing payer rules |
| status | 1..1 | Must be `active` |
| experimental | 0..0 | Eliminate |
| contact | 1..* | Payer contact|
| date | 1..1 | Date that the Questionnaire last changed |
| item | 1..* | There must be at least one item |
| item.text | 1..1 | Every item must have text |
| item.cqf-expression | 1..1 | Each item must be linked back to CQL |
| item.cqf-expression.valueExpression | 1..1 | Each item must be linked back to CQL |

### DTR QuestionnaireResponse
The QuestionnaireResponse resource is used to represent a response to the Questionnaire presented by the payer. This profile uses the [author extension](http://www.hl7.org/implement/standards/fhir/extension-questionnaireresponse-author.html) when items are based on information input into the DTR application by the user.

**TODO** - Generate the actual structure definitions

| element | cardinality | description |
| ------- | ----------- | ----------- |
| basedOn | 0..0 | Eliminate |
| partOf | 0..0 | Eliminate |
| questionnaire | 1..1 | The payer Questionnaire |
| subject | 1..1 | Change to Reference(Patient) |
| item | 1..* | There must be at least one item |
| item.questionnaireresponse-author | 0..* | SHALL be populated if the response is based on user input |

### Profile of Task
TBD
