Through interactions with the DTR process, a user may be prompted with a question that leads to the discovery of a needed action for the desired treatment to proceed. For example, a healthcare provider may be preparing an order for a Continuous Positive Airway Pressure (CPAP) device. In this example, the payer requires that the provider conduct a sleep study that shows a diagnosis of obstructive sleep apnea. While using the DTR process, it prompts the provider that the CQL/Questionnaire execution was unable to find a sleep study in the Electronic Health Record (EHR) system for the patient. 

The provider can confirm that the sleep study has not yet been conducted and generate a task for office staff to schedule a sleep study directly in the questionnaire interface. Alternatively, the provider could attest that the sleep study was performed or is already scheduled to be performed, either at this provider or another provider. Attestation by the provider can prevent duplicate tests in the case that the patient's electronic record is incomplete.

The ability to create tasks or todos is outside of the scope of DTR and should be supported by the EHR implementation. 

The questionnaire SHALL be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire SHALL be preserved.

The questionnaire SHOULD be able to suspend completion until all tasks are completed. How the application is suspended is left to the implementer, but the state of the questionnaire SHOULD be preserved. 



