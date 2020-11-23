Through interactions with the DTR process, a user may be prompted with a question that leads to the discovery of a needed action for the desired treatment to proceed. For example, a healthcare provider may be preparing an order for a Continuous Positive Airway Pressure (CPAP) device. In this example, the payer requires that the provider conduct a sleep study that shows a diagnosis of obstructive sleep apnea. While using the DTR process, it prompts the provider that the CQL/Questionnaire execution was unable to find a sleep study in the Electronic Health Record (EHR) system for the patient. 

The provider can confirm that the sleep study has not yet been conducted and generate a task for office staff to schedule a sleep study directly in the questionnaire interface. Alternatively, the provider could attest that the sleep study was performed or is already scheduled to be performed, either at this provider or another provider. Attestation by the provider can prevent duplicate tests in the case that the patient's electronic record is incomplete.

The provider SHOULD have the option to continue with the order directly and deal with the completion of the questionnaire as a separate task or suspend the order and complete both as part of the task execution. 

When a questionnaire is suspended the application SHOULD give the user the ability to restart the DTR process (e.g., execute all rules and questionnaire). If this is done, the implementer SHOULD implement a mechanism to copy any user entered data to the new version without reentry.

To facilitate this, the DTR process SHOULD allow users to create tasks. The details of the task SHOULD be represented by a FHIR `Task` resource. The DTR process SHOULD communicate the task information to the EHR system using the FHIR create interaction. The `Task` resource is meant to act as a "TODO" item for the clinician or their staff, not substitute an actual order. The ability to create tasks is one way the clinician or their staff can delegate tasks but SHOULD not be considered the only way to delegate tasks. How the task workflow is managed is left to the implementer.  

The DTR process SHOULD attempt to prepopulate as much of the `Task` resource as it can based on the context of the application. `Task.description` may draw from the text available in the currently active `Questionnaire.item.text`.

The questionnaire SHOULD be able to suspend completion until all tasks are completed.  How the application is suspended is left to the implementer, but the state of the questionnaire SHOULD be preserved. The DTR process launches with a unique `launch id`, which could be used to preserve state until the questionnaire resumes.



