/*****************************************************************************************************/
Invariant: dtrq-1
Description: "Non-group items must have the cqf-expression extension"
Severity: #error
Expression: "type = 'group' or extension.url = 'http://hl7.org/fhir/StructureDefinition/cqf-expression'"

/*****************************************************************************************************/
Invariant: dtrq-2
Description: "if item type is 'choice' or 'open-choice', then it should have either the answerOption, answerValueSet, or answerExpression extension"
Severity: #warning
Expression: "(type='choice' or type='open-choice') implies answerOption.exists() or answerValueSet.exists() or extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression').exists()"

/*****************************************************************************************************/
Invariant: dtrq-3
Description: "if item type is Quantity, then it should have either the unitOption or unitValueSet extension"
Severity: #warning
Expression: "(type='quantity') implies extension.where(url='http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption').exists() or extension.where(url='http://hl7.org/fhir/StructureDefinition/questionnaire-unitValueSet').exists()"

/*****************************************************************************************************/
Invariant: dtrq-4
Description: "if item type is Reference, then it must have a referenceResource extension"
Severity: #error
Expression: "(type='reference') implies extension.where(url='http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource').exists()"

/*****************************************************************************************************/
Invariant: dtrq-5
Description: "if item type is Reference, then it should have a candidateExpression extension"
Severity: #warning
Expression: "(type='reference') implies extension.where(url='http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression').exists()"

/*****************************************************************************************************/
Invariant:  dtrq-6
Description: "If audience is 'clinical' or 'patient' then estimatedCompletionTime must contain clinicalTime."
Severity:   #error
Expression: "extension.exists(url = 'http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/questionnaireAudience' and (value = 'clinical' or value = 'patient')) and extension.exists(url = 'http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/estimated-completion-time') implies extension.where(url = 'http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/estimated-completion-time').extension.where(url = 'clinicalTime').exists()"

/*****************************************************************************************************/
Invariant:  dtr-1
Description: "At least one of 'order', 'questionnaire' and 'context' SHALL be present"
Severity:   #error
Expression: "parameter.exists(name='order' or name='questionnaire' or name='context')"

/*****************************************************************************************************/
Invariant:  dtrx-1
Description: "If source is 'override' or 'manual' then an author SHALL be supplied, otherwise author is prohibited."
Severity:   #error
// Expression: "extension.exists(url = 'source' and value = 'auto') != extension.exists(url = 'author')"
Expression: "extension.exists(url = 'source' and (value = 'auto-client' or value = 'auto-server')) != extension.exists(url = 'author')"

/*****************************************************************************************************/
Invariant:  dtrb-1
Description: "The first resource in bundle must be a Questionnaire."
Severity:   #error
Expression: "entry.first().resource.is(Questionnaire)"

/*****************************************************************************************************/
Invariant:  dtrb-2
Description: "The first resource in bundle must be a QuestionnaireResponse."
Severity:   #error
Expression: "entry.first().resource.is(QuestionnaireResponse)"

/*****************************************************************************************************/
Invariant: dtrl-1
Description: "if source is not 'payer-src', then providerId and groupId are required"
Severity: #error
Expression: "(source!='payer-src') implies (providerId.exists() and groupId.exists())"
