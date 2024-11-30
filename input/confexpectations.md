This implementation guide uses specific terminology such as SHALL, SHOULD, MAY to flag statements that have relevance for the evaluation of conformance with the guide. As well, profiles in this implementation guide make use of the [mustSupport](http://hl7.org/fhir/R4/profiling.html#mustsupport) element. Base expectations for the intepretations of these terms are set in the [FHIR core specification](http://hl7.org/fhir/R4/conformance-rules.html#conflang) and general Da Vinci-wide expectations are defined in [HRex]({{site.data.fhir.ver.hrex}}conformance.html).

Additional conformance expectations specific to this guide are as follows:

### Conformance to this IG
In order to conform to this implementation guide, in addition to adhering to any relevant 'SHALL' statements, a system **SHALL** conform to at least one of the appropriate CapabilityStatements listed here:

* **Light DTR EHR** (for [US Core 3.1.1](CapabilityStatement-light-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-light-dtr-ehr-610.html)):  
* **Full DTR EHR** (for [US Core 3.1.1](CapabilityStatement-full-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-full-dtr-ehr-610.html)):  
* **SMART DTR Client** (for [US Core 3.1.1](CapabilityStatement-smart-dtr-client-311.html) / [US Core 6.1/7.0](CapabilityStatement-smart-dtr-client-610.html)): 
* **DTR Payer Service** (for [US Core 3.1.1](CapabilityStatement-dtr-payer-service-311.html) / [US Core 6.1/7.0](CapabilityStatement-dtr-payer-service-610.html)):  


### MustSupport
This IG marks elements with the Must Support flag in its profiles. In addition to the expectations provided in the HRex section referenced above, the following additional considerations apply:  

The FHIR specification makes it clear that when profiling another profile, a MustSupport flag can be constrained further (i.e., taken from 'false' to 'true') but cannot be loosened (i.e., changed from 'true' to 'false').   
  
Da Vinci DTR implementations **SHALL** conform to the [HRex]({{site.data.fhir.ver.hrex}}conformance.html#mustsupport) and [US Core]({{site.data.fhir.ver.uscore7}}must-support.html) Guidance where applicable.
  
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