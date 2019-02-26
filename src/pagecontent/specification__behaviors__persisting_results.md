When the DTR application has collected all of the necessary information, it must persist the results of the data collection. This implementation guide describes two methods for saving the collected information: a text block in the EHR System and a QuestionnaireResponse.

### Text Block
Many EHR Systems do not currently support writing a QuestionnaireResponse into a FHIR server. However, The US Core IG now includes a [DocumentReference Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-new-us-core-documentreference.html), which allows clients, like the DTR application, to write notes into the EHR System's FHIR server. The following section describes how the QuestionnaireResponse that is generated through the processes described in Section 4.4.3 and Section 4.4.4 can be transformed into text such that it may be persisted as a note in the EHR system.

#### QuestionnaireResponse transformation process
The DTR application SHALL support transforming a DTR-QuestionnaireResponse resource into a markdown document. The markdown shall be conformat to [GitHub Flavored Markdown](https://github.github.com/gfm/) to remain consistent with other uses of markdown in FHIR specifications.

The markdown SHALL start with the following line:

```
# Generated Documentation to Support Item/Service
```

This SHALL be followed by the following information:

```
Payer: PAYER_NAME
Desired Item/Service: DESIRED_ITEM_OR_SERVICE
Date: DATE
```

The DTR application SHALL replace `PAYER_NAME`, `DESIRED_ITEM_OR_SERVICE` and `DATE` with the appropriate information. This SHALL be followed with a markdown table described below:

```
| Item | Answer |
| ---- | ------ |
| QUESTIONNAIRE_ITEM_TEXT | QUESTIONNAIRERESPONSE_ITEM_ANSWER |
```

For each `QuestionnaireResponse.item` where the `author` extension is present and the answer is not an attestation as described in Section 4.4.4.2, the DTR application SHALL generate a table row. The `QUESTIONNAIRE_ITEM_TEXT` shall be replaced with the appropriate `Questionnaire.item.text` and the `QUESTIONNAIRERESPONSE_ITEM_ANSWER` shall be replaced with the appropriate `QuestionnaireResponse.item.answer.value[x]`.

This table SHALL be followed with the following text:

```
All other necessary information was discovered in the patient's records or attested to be present.
```

The DTR application SHALL create a DocumentReference resource with this information that conforms to the US Core DocumentReference profile. The generated markdown SHALL be recorded in `DocumentReference.content.attachment.data`.

#### Interaction with EHR API
### QuestionnaireResponse
#### Interaction with Payer API
