This implementation guide uses specific terminology such as SHALL, SHOULD, MAY to flag statements that have relevance for the evaluation of conformance with the guide. As well, profiles in this implementation guide make use of the [mustSupport](http://hl7.org/fhir/R4/profiling.html#mustsupport) element. Base expectations for the intepretations of these terms are set in the [FHIR core specification](http://hl7.org/fhir/R4/conformance-rules.html#conflang) and general Da Vinci-wide expectations are defined in [HRex]({{site.data.fhir.ver.hrex}}/conformance.html).


Additional conformance expectations specific to this guide are as follows:

### Conformance to this Implementation Guide
§conf-1^dtr-client,dtr-server^exchange:In order to conform to this implementation guide, in addition to adhering to any relevant 'SHALL' statements, a system **SHALL** conform to at least one of the appropriate CapabilityStatements listed here:§

* **Light DTR EHR** (for [US Core 3.1.1](CapabilityStatement-light-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-light-dtr-ehr-700.html))
* **Full DTR EHR** (for [US Core 3.1.1](CapabilityStatement-full-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-full-dtr-ehr-700.html))
* [**SMART DTR Client**](CapabilityStatement-smart-dtr-client.html)
* [**DTR Payer Service**](CapabilityStatement-dtr-payer-service.html)

### MustSupport
This IG marks elements with the Must Support flag in its profiles. In addition to the expectations provided in the HRex section referenced above, the following additional considerations apply:  

The FHIR specification makes it clear that when profiling another profile, a MustSupport flag can be constrained further (i.e., taken from 'false' to 'true') but cannot be loosened (i.e., changed from 'true' to 'false').   
  
§conf-2^dtr-client,dtr-server^exchange:Da Vinci DTR implementations **SHALL** conform to the [HRex]({{site.data.fhir.ver.hrex}}/conformance.html#mustsupport) and [US Core]({{site.data.fhir.ver.uscore7}}/must-support.html) Guidance where applicable.§
  
§conf-3^dtr-client^ui:DTR apps and EHRs that take on DTR app responsibility **SHALL** be able to render Questionnaires and QuestionnaireResponses.§ §conf-4^dtr-client^ui:DTR clients **MAY** adjust which client components expose which Questionnaire items, which Questionnaire items are exposed to which users and how those items are exposed as appropriate for the workflow so long as they retain the ability to render all `mustSupport` elements at least in some places within their client system(s).§  §conf-5?^dtr-client^ui:Specifically, apps and EHRs acting as form fillers **SHALL** be able to display:§
* `QuestionnaireResponse.questionnaire.questionnaireDisplay`/`Questionnaire.title`
* `QuestionnaireResponse.authored`
* `QuestionnaireResponse.author.resolve().name`
* `QuestionnaireResponse.source.resolve().name`
* `QuestionnaireResponse.item.text`
* `QuestionnaireResponse.item.value` - all data types
* The same for all nested items

§conf-6^dtr-client^ui:They **SHALL** also handle all mustSupport elements within the Questionnaire profile and provide visual cues where those elements impact expected user action (e.g., required answers, need for signatures, etc.)§
  
§conf-7^dtr-client^ui:Those same systems **SHOULD** be able to display `QuestionnaireResponse.item.itemMedia`§

### Interoperability Expectations
For the DTR specification to work successfully at scale, it is essential that DTR clients and servers be able to interoperate with each other without custom expectations or deviations driven by EHR-specific or payer-specific requirements. The following rules are intended to help drive such consistency:

  1. §conf-8^dtr-server^exchange:When determining Questionnaire packages, processing adaptive forms via `$next-question`, or constructing population logic, DTR services **SHALL NOT** depend on or set expectations for the inclusion of resource instances not compliant with profiles defined in this guide, HRex, or US Core.§  §conf-9^dtr-server^exchange:Similarly, they **SHALL NOT** depend on or set expectations for the inclusion of any data elements not marked as mandatory (min cardinality >= 1) or `mustSupport` in those profiles.§
   
  2. §conf-10^dtr-server^exchange:DTR servers **SHALL NOT** set expectations for systems to support Questionnaire rendering or response validation capabilities above those established in the [DTR Questionnaire profiles](artifacts.html#structures-resource-profiles) and **SHALL** accept and successfully process any Questionnaire Response returned for a Questionnaire from that DTR server that is deemed valid against the rules expressed only as `mustSupport` in the Questionnaire profile.§
   
  3. In the event a need to communicate data structures or elements not covered as required or `mustSupport` in the specification, the organization identifying the requirement are expected to submit change requests proposing adding the relevant profiles and/or `mustSupport` elements to a future version of the DTR specification. §conf-11?^dtr-client,dtr-server^business:If the proposed change is adopted and published in the DTR continuous integration build or the CI build of one of its dependencies (e.g., US Core), implementations **MAY**, by mutual agreement, pre-adopt the use of those additional profiles and/or `mustSupport` data elements and not be considered in violation of #1 or #2 above.§
   
  4. §conf-12?^dtr-client,dtr-server^exchange:Where cardinality and other constraints present in profiles allow data elements to be omitted, DTR compliant systems **SHALL NOT** treat the omission of those elements as a conformance error - i.e., DTR services are expected to return appropriate questionnaire package responses, not system level errors (e.g., HTTP 4xx errors), and DTR clients are expected to render and allow completion of forms as normal.§
   
  5. §conf-13^dtr-client,dtr-server^exchange:DTR clients and services and **SHALL** use standard DTR data elements (i.e., elements found within DTR-defined or inherited profiles and marked as mandatory or `mustSupport`) to communicate needed data if such elements are intended to convey such information.§ (If an organization believes they have a requirement for a data element not marked as `mustSupport` in the DTR or inherited profiles, they should raise the requirement for discussion on the [DTR stream](https://chat.fhir.org/#narrow/channel/197320-Da-Vinci-DTR) on chat.fhir.org.)
   
  6. §conf-14^dtr-client,dtr-server^exchange:Organizations implementing DTR **SHALL NOT** publish guidance setting expectations for where certain data elements are conveyed within DTR and inherited data structures, but **MAY** submit change requests to DTR, CRD, HRex, or US Core requesting that additional guidance be provided to implementers on data structure usage to increase consistency across implementations.§
   
This guidance does not prevent trading partners from agreeing to exchange additional information as long as the implementation does not prevent transactions compliant with the implementation guide from being appropriately processed.  §conf-15^dtr-client,dtr-server^business:Such enhancements **SHALL** be submitted as a ticket for consideration for inclusion in a future version of the implementation guide.§


### Conformance Details

<div class="new-content" markdown="1">
This section contains a table listing all the free-text conformance statements found in the IG.  This table is provided as a useful summary for implementers for the purpose of evaluating key features and to support testing.  However, reading this table alone is insufficient to understand or successfully implement the specification:

1. The table only includes conformance expectations expressed as free text.  It does not include the computable expectations represented in capability statements, profiles, value sets, etc.
2. The text text in the table only includes the 'formal' requirement.  It does not provide the contextual language around the statement that will be needed for successful explanation.  The 'id' of each statement is a hyperlink to the place it appears in the text to assist with gathering the needed context.

A few other notes:
* The ids are generally specific to the pages on which the requirements appear, but not always.  If content is moved from one page to another, the id will remain the same.
* While ids start as contiguous, as the specification is updated, it is possible some conformance statements will be removed, which will create a gap in the numbers.  This is not an error.
* Ids are not final until published in an official release.  At that point, ids will not be changed.
* It is possible for the text of a given rules to change somewhat from one release to another so long as the intention of the rule is the same.  If the intent has a significant change, the old rule will be removed and a new one added in its place.
* The actors are broken down into 'client' and 'server'.  There may be multiple systems that actually compose those logical entities which will vary from implementation.  It will be up to implementers to determine how the various conformance statements will apply to the actal systems in their architecture.
* The categorizations are general.  In practice, all 'exchange', 'ui', and 'storage' requirements are some aspect of 'processing' requirements.  The categories will give hints as to the architectural layer a requirement will apply to, but there is nothing definitive implied by the category(ies) listed.

The controls at the top of the table allow filtering the content to particular requirement subsets that may be of interest.  
<!-- As well, a computable representation (XML and JSON) of the requirements can be found [here](Requirements-fromNarrative.html). -->

</div><br/>

§§§ 

