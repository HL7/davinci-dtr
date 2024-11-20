Instance: qr-context
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/qr-context"
* version = "1.0.0"
* name = "QRcontext"
* status = #active
* description = "Allows finding QuestionnaireResponses that contain information relevant to a particular appointment, encounter or order."
* jurisdiction = urn:iso:std:iso:3166#US
* code = #context
* base = #QuestionnaireResponse
* type = #reference
* expression = "QuestionnaireResponse.extension.where(url = 'http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/qr-context').value"
