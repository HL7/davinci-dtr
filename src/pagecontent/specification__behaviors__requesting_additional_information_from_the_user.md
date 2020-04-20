While the goal of DTR is to automatically gather all of the necessary information to satisfy payer rules and documentation requirements without interrupting the user with a CDS Hooks card or SMART app, this is not possible in all cases. When the execution of Clinical Quality Language (CQL) is unable to obtain the required data, it is necessary to prompt the user for input.

### Questionnaire Rendering
The DTR application will need to collect information from the user for `item`s in the Questionnaire where the following conditions are met:
* The `cqf-expression` for the `item` evaluates to `null`
* If the `item` has an `enableWhen` property, the conditions for the statements: `operator` and `answer[x]` evaluate to `true`.

Payers should note that the ordering of `item` elements in a Questionnaire resource is considered to be relevant by the FHIR specification. The DTR application SHALL prompt users for `item`s in the order that they appear in the Questionnaire resource. Payers should also take note of the order of `item`s when making use of the `enableWhen` property. An item may only use enableWhen if it can obtain an answer from a previously answered question.

When `item`s meet the conditions stated above, they SHALL be presented to the user for their input.

#### Structured Data Capture
Payers may have requirements on how questions are presented to users. To allow for this, payers MAY supply Questionnaire resources that conform to the [Advanced Rendering Questionnaire Profile](http://hl7.org/fhir/uv/sdc/2019May/sdc-questionnaire-render.html) as defined in Structure Data Capture.

The purpose of this extension is to indicate that it is not SAFE to render the form if the styles indicated in the questionnaire are not followed. If the system is not capable of rendering the form as the questionnaire dictates, then it cannot display the form.  Note the use of this flag should be extremely rare in DTR applications.

If the `rendering-styleSensitive` extension property is not present or `false` the DTR application SHOULD use `rendering-style` and `rendering-xhtml` properties.

#### Rendering Questionnaire items without specified styles
Payers are not required to provide Questionnaires that conform to the Advanced Rendering Questionnaire Profile. When a Questionnaire is provided that does not conform to this profile, it is at the discretion of the DTR application to chose a reasonable presentation of the questions that require user input. The DTR application SHALL use the appropriate input mechanism depending on the `item.type`. Additionally, when working with a FHIR R4 Questionnaire, the DTR application SHALL support `item.answerValueSet` , `item.answerOption` and `item.initial` if provided.

#### Rendering multiple items
This implementation guide does not place any requirements on the DTR application to display multiple `Questionnaire.item`s to a user at a time or only a single `item`.  Implementers should decide which method of displaying questions makes the most sense within their own workflow.  We encourage questionnaire designs that minimize the number of questions that are necessary to view/complete (e.g. if an answer obviates the need to complete a section, then the section should not appear for completion, unless local workflow(s) determine a need for editing or review).

### Provider Attestation
There may be cases where the CQL provided by a payer was unable to locate information on a patient that is present in the Electronic Medical Record (EMR) system. This may be due to the information existing in unstructured notes where it is not able to be easily retrieved by CQL, or it may be in a location that the CQL did not expect. To reduce the burden on the users of the application, DTR provides a mechanism for the user to attest that the information exists in the patient’s record, without specifying the exact value or location of the information. This will not require the user to reenter the "missing" information.

The DTR application SHALL include a mechanism to allow a user to attest the answer to the presented question exists in the patient's record. This mechanism MAY be an HTML `input` element with the `type` set to `button` or it may be an `a` element. The behavior of these elements SHALL be to record the user's attestation that the information is present in the patient's record.

When a user provides an attestation, the DTR application SHALL record that in the corresponding QuestionnaireResponse.item. In this case, the DTR application SHALL create an `answer` property on the `item`. The `answer` SHALL have a `valueCoding` that is set to the SNOMED CT code `410515003`, known present. The `item` will also have an `author` extension property which will reference the `fhirUser` provided to the DTR application.

>If information is privacy restricted, then we must assume that this information should be treated as if it does not exist. In this case the provider SHOULD verify with the patient if they want to share the information with the payer.

### Recording Responses
The DTR application SHALL take input from the user and record the provided information. As with provider attestation, the DTR application SHALL record that in the corresponding QuestionnaireResponse.item. In this case, the DTR application SHALL create an `answer` property on the `item`. The `answer` SHALL have an appropriate `value[x]` depending on the corresponding `type` in the `Questionnaire.item`. Again, similar to attestations, the `item` will have an `author` extension property which will reference the `fhirUser` provided to the DTR application.

#### QuestionnaireResponse
The DTR application SHALL create a QuestionnaireResponse resource based on all of the information collected. Given the following JSON fragment representing a `Questionnaire.item`:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/cqf-expression",
      "valueExpression": {
        "language": "text/cql",
        "expression": "Age"
      }
    }
  ],
  "linkId": "age",
  "code": [
    {
      "system": "http://loinc.org",
      "code": "30525-0"
    }
  ],
  "text": "What is the patient's age?",
  "type": "quantity"
}
```

The following `QuestionnaireResponse.item` JSON fragment would be created assuming that the patient's age is 65 years old and that this information was gathered through CQL execution.

```
{
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```

If the value was supplied by the user, the `author` extension property will be set. The following `QuestionnaireResponse.item` JSON fragment provides an example of this:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/questionnaireresponse-author",
      "valueReference": {
        "reference": "http://exampleprovider.org/fhir/Practitioner/1234"
      }
    }
  ],
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```

Finally, if the user did not supply a value, but provided an attestation that the information exists in the patient's record, it would be represented by the following  `QuestionnaireResponse.item` JSON fragment:

```
{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/questionnaireresponse-author",
      "valueReference": {
        "reference": "http://exampleprovider.org/fhir/Practitioner/1234"
      }
    }
  ],
  "linkId": "age",
  "answer": {
    "valueCoding": {
      "system": "http://snomed.info/sct", "code": "410515003"
    }
  }
}
```

#### Separating user provided information from CQL retrieved information
For information systems processing a QuestionnnaireResponse generated by the DTR application, any `QuestionnaireResponse.item` with the `author` extension property populated was created by some form of user input. If the `author` property is not present, then the information was gathered through the execution of CQL.
