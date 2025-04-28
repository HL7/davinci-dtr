Instance: DTR-Questionnaire-next-question
InstanceOf: OperationDefinition
Usage: #definition
* name = "DTRNextQuestion"
* title = "DTR Next Question Operation"
* status = #active
* kind = #operation
* description = "The Next Question operation is used for *adaptive questionnaires*.  For specific details, see the [SDC Next Question operation](http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question)."
* code = #next-question
* base = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question"
* comment = "To return a calculated score for the questionnaire or group of items, the service may return a `readOnly` question with the score value in the corresponding QuestionnaireResponse.item.  The extension `questionnaire-hidden` can be included on the Questionnaire.item to indicate to the client that it should not be displayed to the end user"
* resource = #Questionnaire
* system = false
* type = true
* instance = false

* inputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-next-question-input-parameters"
* outputProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-next-question-output-parameters"

* parameter[0].type = #Resource
* parameter[=].name = #questionnaire-response-in
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Parameters
* parameter[=].documentation = "The [DTR QuestionnaireResponse Profile](StructureDefinition-dtr-questionnaireresponse.html) of the QuestionnaireResponse resource with a *contained* Questionnaire.  When invoking the operation for the first time, neither the QuestionnaireResponse nor the contained Questionnaire will have any items, as no questions are yet known.  In subsequent calls, the QuestionnaireResponse will include answers to all required questions asked so far and the contained Questionnaire will remain the same as provided back from the operation in the preceding response."

* parameter[+].type = #Resource
* parameter[=].name = #questionnaire-response-out
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Parameters
* parameter[=].documentation = "The [DTR QuestionnaireResponse Profile](StructureDefinition-dtr-questionnaireresponse.html) of the QuestionnaireResponse resource with a *contained* Questionnaire.  The Server updates the QuestionnaireResponse's contained Questionnaire by appending with the next question or questions ittems and any score or instruction items and returns the QuestionnaireResponse (with all answers completed thus far plus any calculated scores) as this parameter.  When the questionnaire is complete, the Server updates the status of the QuestionnaireResponse resource parameter to `complete`."
