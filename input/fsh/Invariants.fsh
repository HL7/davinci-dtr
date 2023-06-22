/*****************************************************************************************************/
Invariant: dtrq-1
Description: "Non-group items must have the cqf-expression extension"
Severity: #error
Expression: "type = 'group' or extension.url = 'http://hl7.org/fhir/StructureDefinition/cqf-expression'"

/*****************************************************************************************************/

Invariant:  dtr-1
Description: "Either an Order or a Questionnaire, or both, SHALL be present"
Severity:   #error
Expression: "parameter[order].exists() or parameter[questionnaire].exists()"
