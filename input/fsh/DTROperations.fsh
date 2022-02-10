Instance: DTRQuestionnaireOperation
InstanceOf: OperationDefinition
Description: "This operation is used to qet the Questionnaire for a given order. This will also include the Library/CQL, and value set(s)."
Usage: #definition

* id = "Questionnaire-for-Order"
* url = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order"
* name = "Questionnaire-for-Order"
* title = "Get Questionnaire for given order"
* status = #draft
* kind = #operation
* code = #Questionnaire-for-Order
* base = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/Questionnaire-for-Order"

// Coverage
* resource = #Coverage
* system = false
* type = true
* instance = false
* parameter[0].name = #resource
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "Coverage resource instance."
* parameter[0].type = #Resource

// Order
* resource = #Any 
* system = false
* type = true
* instance = false
* parameter[1].name = #resource
* parameter[1].use = #in
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "Order resource instance. e.g., DeviceRequest, ServiceRequest, MedicationRequest, or other..."
* parameter[1].type = #Resource

// return
* resource = #Bundle
* system = false
* type = true
* instance = false
* parameter[2].name = #return
* parameter[2].use = #out
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].documentation = "A bundle with Questionnaire, Library/CQL, and value set(s). (Note: This could be a searchable Adaptive Questionnaire that just provides the next-question operation URL.)"
* parameter[2].type = #Bundle



