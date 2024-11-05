### Must Support Guidance
This IG marks elements with the Must Support flag in its profiles. In addition to the expectations provided in the HRex section referenced above, the following additional considerations apply:  

The FHIR specification makes it clear that when profiling another profile, a MustSupport flag can be constrained further (i.e., taken from 'false' to 'true') but cannot be loosened (i.e., changed from 'true' to 'false').   
  
Da Vinci DTR implementations **SHALL** conform to the US Core IG [Must Support]({{site.data.fhir.ver.uscore6}}/general-guidance.html#must-support) Guidance where US Core IG resources are used.
  
DTR apps and EHRs that take on DTR app responsibility **SHALL** be able to render Questionnaires and QuestionnaireResponses.  Specifically, apps and EHRs acting as form fillers **SHALL** be able to display:
* `QuestionnaireResponse.questionnaire.questionnaireDisplay`/`Questionnaire.title`
* `QuestionnaireResponse.authored`
* `QuestionnaireResponse.author.resolve().name`
* `QuestionnaireResponse.source.resolve().name`
* `QuestionnaireResponse.item.text`
* `QuestionnaireResponse.item.value` - all data types
* The same for all nested items

They **SHALL** also handle all mustSupport elements within the Questionnaire profile and provide visual cues where those elements impact expected user action (e.g., required answers, need for signatures, etc.)
  
Those same systems **SHOULD** be able to display `QuestionnaireResponse.item.itemMedia`