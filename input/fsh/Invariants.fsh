/*****************************************************************************************************/
Invariant: dtrq-1
Description: "Non-group items must have the cqf-expression extension"
Severity: #error
Expression: "type = 'group' or extension.url = 'http://hl7.org/fhir/StructureDefinition/cqf-expression'"

/*****************************************************************************************************/
Invariant:  dtr-1
Description: "Either an Order or a Questionnaire, or both, SHALL be present"
Severity:   #error
Expression: "Parameters.parameter.exists(name='order') or Parameters.parameter.exists(name='questionnaire')"

/*****************************************************************************************************/
Invariant:  dtrx-1
Description: "If source is 'override' or 'manual' then an author SHALL be supplied, otherwise author is prohibited."
Severity:   #error
Expression: "extension.exists(url = 'source' and value != 'auto') and extension.exists(url = 'author')"