Instance: DTRQuestionnaireOperation
InstanceOf: OperationDefinition
Description: "This operation is used to qet the Questionnaire for a given order. This will also include the Library/CQL, and value set(s)."
Usage: #definition

* id = "Questionnaire-for-Order"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order"
* name = "QuestionnaireForOrder"
* title = "Get Questionnaire for given order"
* status = #draft
* kind = #operation
* code = #Questionnaire-for-Order
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order"

* resource = #Patient
* system = false
* type = true
* instance = true

// in
* parameter[0].name = #coverage
* parameter[=].use = #in
* parameter[=].documentation = "One or more Coverage resource instances. (Note: This could also be de-identified)"
* parameter[=].type = #Coverage
* parameter[=].min = 1
* parameter[=].max = "*"

* parameter[+].name = #order
* parameter[=].use = #in
* parameter[=].documentation = "One or more Order resource instances. e.g., DeviceRequest, ServiceRequest, MedicationRequest, ... Encounter, Appointment, or prior-auth Claim, etc. (Note: This could also be de-identified)"
* parameter[=].type = #Any
* parameter[=].min = 1
* parameter[=].max = "*"

// return
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "1 or more bundles each with a Questionnaire, Library/CQL, and value set(s). (Note: This could be a searchable Adaptive Questionnaire that just provides the next-question operation URL.)"
* parameter[=].type = #Bundle