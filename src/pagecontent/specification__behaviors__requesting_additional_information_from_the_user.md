While the goal of DTR is to gather all of the necessary information to satisfy payer rule and documentation requirements, this is not possible in all cases. When the execution of CQL is unable to obtain the required data, it is necessary to prompt the user for input.

### Questionnaire Rendering
The DTR application will need to collect information from the user for `item`s in the Questionnaire where the following conditions are met:
* The `cqf-expression` for the `item` evaluates to `null`
* If the `item` has an `enableWhen` property, the conditions for the statements: `operator` and `answer[x]` evaluate to `true`.

Payers should note that the ordering of `item` elements in a Questionnaire resource is considered to be relevant by the FHIR specification. The DTR application SHALL prompt users for `item`s in the order that they appear in the Questionnaire resource. Payers should also take note of the order of `item`s when making use of the `enableWhen` property. An `item` may only use `enableWhen` if it can obtain an answer from a previous question.

When `item`s meet the conditions stated above, they SHALL be presented to the user for their input.

#### Structured Data Capture
Payers may have requirements on how questions are presented to users. To allow for this, payers MAY supply Questionnaire resources that conform to the [Advanced Rendering Questionnaire Profile](http://build.fhir.org/ig/HL7/sdc/sdc-questionnaire-render.html) as definded in Structure Data Capture. The DTR application SHALL use the `rendering-style` and `rendering-xhtml` properties provided if the `rendering-styleSensitive` extension property is `true`. If the `rendering-styleSensitive` extension property is not present or `false` the DTR application SHOULD use `rendering-style` and `rendering-xhtml` properties.

#### Rendering Questionnaire items without specified styles
Payers are not required to provide Questionnaires that conform to the Advanced Rendering Questionnaire Profile. When a Questionnaire is provided that does not conform to this profile, it is at the discretion of the DTR application to chose a reasonable presentation of the questions that require user input.

### Provider Attestation
There may be cases where the CQL provided by a payer was unable to locate information on a patient that is present in the EHR system. This may be due to the information existing in unstructured notes where it is not able to be easily retrieved by CQL, or it may be in a location that the CQL did not expect. To reduce the burden on the users of the application, DTR provides a mechanism for the user to attest that the information exists in the patient's record, without specifying the exact value or location of the information.

The DTR application SHALL include a mechanism to allow a user to attest the the answer to the presented question exists in the patient's record. This mechanism MAY be an HTML `input` element with the `type` set to `button` or it may be an `a` element. The behavior of these elements SHALL be to record the user's attestation that the information is present in the patient's record.

**TODO** Specify wording for the button and associated help

When a user provides an attestation, the DTR application SHALL record that in the corresponding QuestionnaireResponse.item. In this case, the DTR application SHALL create an `answer` property on the `item`. The `answer` SHALL have a `valueCoding` that is set to the **TODO** value from the attestation value set. The `item` will also have an `author` extension property which will reference the `fhirUser` provided to the DTR application.

#### Attestation Value Set
### Recording Responses
#### QuestionnaireResponse
#### Separating user provided information from CQL retrieved information
