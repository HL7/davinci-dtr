### Comparing CQL Execution Results to Questionnaire
While Structured Data Capture provides methods for Questionnaire (form) population, this implementation guide relies on the approach that has been created within [Clinical Reasoning Module](http://hl7.org/fhir/R4/clinicalreasoning-module.html) of the FHIR specification. The [Documentation Template](http://hl7.org/fhir/R4/clinicalreasoning-knowledge-artifact-representation.html#documentation-template) concept is a good fit for the use case being addressed by this implementation guide.

As an example, given the following Clinical Quality Language (CQL) fragment:

```
define "Age": AgeInYears()
```

This will create a CQL expression named `Age`. The expression can then be used to populate an `item` within a Questionnaire. The following JSON fragment represents the portion of the Questionnaire that can be populated from the CQL:

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

Using the `cqf-expresion` extension, the `item` SHALL refer to the named expression in the CQL rules that contains the desired information.

### Generation of QuestionnaireResponse
The Documentation Templates and Rules (DTR) application is responsible for iterating through all of the `Questionnaire.item` elements and checking the `cqf-expression` for values to populate a QuestionnaireResponse. The DTR application SHALL create a QuestionnaireResponse resource. For each `Questionnaire.item`, there SHALL be a corresponding `QuestionnaireResponse.item`. When the `cqf-expression` is not `null`, the value of the expression SHALL be used as the answer in the QuestionnaireResponse. The following JSON fragment shows an example representation of `item` in the QuestionnaireResponse based on the example above.

```
{
  "linkId": "age",
  "answer": {
    "valueQuantity": {"value": 65, "unit": "a", "system": "http://unitsofmeasure.org"}
  }
}
```

For each `Questionnaire.item` with a `null` value for the `cqf-expression`, user input will be required to obtain the desired information, which is described in [Section 4.4.4](specification__behaviors__requesting_additional_information_from_the_user.html).
