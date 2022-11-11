### General Adaptive Form Support

[SDC Adaptive Forms](http://build.fhir.org/ig/HL7/sdc/adaptive.html) define an alternative way to dynamically interact with the user. DTR support for adaptive forms helps in the following scenarios:

1. Support for complex decision trees without the need for the Questionnaire and rules (CQL) to cover all the possibilities. This is enabled by supporting the request for a small number of questions (and the ability to prepopulate the questions from the EHR), returning the results to the Payer to "prune" the decision tree, and repeat the process until complete.

2. Allowing the payer to only expose the relevant guideline logic for the clinical situation at hand.

3. Support for complex logic that depends on information available to the payer (e.g., prior auth services) to be part of the decision logic to evaluate the medical necessity and appropriateness of the planned service.

4. Enabling the potential for a final response from the payer including prior authorization information as part of the interactive exchange. 

5. Provide flexibility to EHR venders to adopt DTR. The adaptive form can be used as an alternative to more complex SDC form behavior, e.g., enableWhen.

6. Supports both payer side prior authorization and the ability to request specific additional information as part of the PAS exchange process.

The DTR app SHALL support loading and rendering the adaptive form developed by the payer following the SDC adaptive form workflow. If there is CQL embedded in the questionnaire or the associated library, the DTR app should be able to execute the CQL based on the questions loaded in the questionnaire. For performance, the DTR application may save the results of prior execution of the CQL where it is the same for addressing the current question(s).

<blockquote class="stu-note">
<p>
Note: At this time SMART Web Messaging is in a draft status. Therefore implementing Adaptive Forms and Prior Authorization as described below is not required to be conformant with this IG.</p>
</blockquote>

#### Adaptive Forms and Prior Authorization

When a prior authorization comes back while using an Adaptive Form, the SMART app SHALL:
1. Store the ClaimResponse on the EHR with a simple create, and 

2. Update the "in-memory" request (e.g., ServiceRequest) to have a supportingInfo reference to the ClaimResponse. This is done using [SMART Web Messaging](http://hl7.org/fhir/uv/smart-web-messaging/2020Sep/). 
