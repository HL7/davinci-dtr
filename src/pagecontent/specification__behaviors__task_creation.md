Through interactions with the Documentation Templates and Rules (DTR) application, a user may be prompted with a question that leads to the discovery of a needed action for the desired treatment to proceed. For example, a healthcare provider may be preparing an order for a Continuous Positive Airway Pressure (CPAP) device. In this example, the payer requires that the provider conduct a sleep study that shows a diagnosis of obstructive sleep apnea. While using the DTR application, it prompts the provider that the CQL execution was unable to find a sleep study in the Electronic Medical Record (EMR) system for the patient. 

The provider can confirm that the sleep study has not yet been conducted and generate a task for office staff to schedule a sleep study directly in the questionnaire interface.  Alternatively, the provider could attest that the sleep study was performed or is already scheduled to be performed, either at this provider or another provider.  Attestation by the provider can prevent duplicate tests in the case that the patient's electronic record is incomplete.

To facilitate this, the DTR application should allow users to create tasks. The details of the task should be represented by a FHIR Task resource. The DTR application should communicate the task information to the EMR system using the FHIR create interaction.  The task resource is meant to act as a "todo" item for the clinician or their staff, not substitute an actual order.

The DTR application should attempt to prepopulate as much of the Task resource as it can based on the context of the application. `Task.description` may draw from the text available in the currently active `Questionnaire.item.text`.

The questionnaire should be able to suspend completion until all tasks are completed.  How the application is suspended is left to the implementer, but the state of the questionnaire should be preserved.  The DTR application launches with a unique `state` id, which could be used to preserve state until the questionnaire resumes.

> Note to ballot commenters
>
> This area of the project is explicitly seeking comments. Thoughts on the ability
> of EMR systems to accept Task resources as well as feedback on the constraints that
> should be placed on the task resource are welcome. 
> The ability for a clinician to delegate work is absolutely critical-- not just for the type of appointment 
> scheduling mentioned ont his page, but also for the actual form/questionnaire completion itself. 
> If this feature of the IG is actually used to move work from clinicians to other users, it will be 
> fleshed out and mandated. 
> 
> The ability for a clinician to delegate work is absolutely critical -- not just for the type of appointment scheduling mentioned on this page, but also for the actual form/questionnaire completion itself. If this feature of the IG is actually used to move work from clinicians to other users, it should be fleshed out and mandated. (Note: It may not be possible to mandate in this version of the IG. So consider using SHOULD not SHALL. Pursue further testing at Connectathons and in practice before mandating.)
