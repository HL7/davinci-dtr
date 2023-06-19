Instance: dtr-context
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/core/SearchParameter/dtr-context"
* version = "1.0.0"
* name = "DTRcontext"
* status = #active
* description = "Returns order(s) with a context extension matching the specified order."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #context
* base = #QuestionnaireResponse
* type = #reference
* expression = "QuestionnaireResponse.extension.where(url = 'http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-context').extension.value"
