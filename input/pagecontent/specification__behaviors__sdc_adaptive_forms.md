<blockquote class="stu-note">
<p>
Note: SDC Adaptive forms support is tentative because it has not been voted on yet. For more details regarding the status see: <a href="https://jira.hl7.org/browse/FHIR-33224">FHIR-33224</a>
</p>
</blockquote>
<br>
[SDC Adaptive forms](http://build.fhir.org/ig/HL7/sdc/adaptive.html) defines an alternative way to dynamically interact with the user. DTR support for adaptive forms would help in the following scenarios:

1. Support for complex decision trees without the need for the Questionnaire and rules (CQL) to cover all the possibilities. This is enabled by supporting the request for a small number of questions (and the ability to prepopulate the questions from the EHR), returning the results to the Payer to "prune" the decision tree, and repeat the process until complete.

2. Allowing the payer to only expose the relevant guideline logic for the clinical situation at hand.

3. Support for complex logic that depends on information available to the payer (e.g., prior services) to be part of the decision logic to evaluate the medical necessity and appropriateness of the planned service.

4. Enabling the potential for a final response from the payer including prior authorization information as part of the interactive exchange. 

5. Provide flexibility to EHR venders to adopt DTR. The adaptive form can be used as an alternative to more complex SDC form behavior, e.g., enableWhen.

6. Supports both payer side prior authorization and the ability to request specific additional information as part of the PAS exchange process.

The DTR app SHALL support loading and rendering the adaptive form developed by the payer following the SDC adaptive form workflow. If there is CQL embedded in the questionnaire or the associated library, the DTR app should be able to execute the CQL based on the questions loaded in the questionnaire.
For performance, the DTR application may save the results of prior execution of the CQL where it is the same for addressing the current question(s).
