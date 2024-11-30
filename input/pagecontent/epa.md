The current versions of the [CRD](https://build.fhir.org/ig/HL7/davinci-crd/), DTR, [PAS](http://build.fhir.org/ig/HL7/davinci-pas/), and [CDex](http://build.fhir.org/ig/HL7/davinci-ecdx/) IGs support for the electronic Prior Authorization (ePA) workflow only focuses on the interactions between the provider Health Information Technology (HIT) in total and the payer HIT in total, not the necessary interactions among the respective HIT solutions that make up the provider and payer HIT environment that will need to participate in the ePA workflow.  

Given the varying combinations of HIT components that may be required to support prior authorization, ONC may consider a certification process where certified software can use generic (or generically referenced) relied-upon software to meet certain requirements and can clearly specify the capabilities they rely on without the need to assert each permutation of relied-upon software with which they support the ePA workflow. Further guidance is needed for the interactions necessary within each of the provider and payer HIT configurations based on the functions/roles of those HIT solutions, and requires the relied upon software approach using predictable, standards-based capabilities to participate in an ePA workflow and for HIT that provides full support for ePA workflow through its certified HIT.  

The following drawing demonstrates the DTR Workflow exchanges between an integrated provider HIT environment and an integrated payer HIT environment in the upper portion.  The lower portion of the DTR workflow drawing represents the potential for electronic Prior Authorization (ePA) coordinator functionality to play a role between the provider HIT and the payer HIT.  It should be noted that the exchanges between the provider HIT (including any ePA) and the payer HIT (including any ePA) will replicate all the defined exchanges between provider and payer (represented by the green and orange arrows).  The red and purple arrows are representative of information exchange between the Provider ePA and the Provider systems (red arrows) or the information exchange between the Payer ePA and the Payer systems (purple arrows).

The Questionnaire Request and Response arrows represent both the “Questionnaire package” operation and the “next question” operation as both will involve similar components.

[![DTR Workflow Image](ePA1.png){:style="float: none; width:890px;height:547px; margin-left: auto; margin-right: auto;display: block;"}](ePA1.png "View Image Larger")

The following drawing provides additional detail regarding the exchanges between a Provider ePA Coordinator, multiple Provider HIT systems and the payer.  The boxes below the workflow drawing indicate the activities of the various components.  
From left to right: 
1. The Provider HIT systems
2. The Provider ePA coordinator
3. The Payer HIT
   
The numbered workflow in the Provider ePA Coordinator indicates the inputs from the example Provider HIT systems that are involved in creating the exchanges between the Provider HIT and the exchanges with the Payer. This includes:
1.	Information required for authentication with the payer where required
2.	Ability to request the Questionnaire package
3.	Processing the Questionnaire
4.	Storing the QuestionnaireResponse (including the QR Bundle)

[![Provider ePA Coordinator detail](ePA2.png){:style="float: none; width:962px;height:523px; margin-left: auto; margin-right: auto;display: block;"}](ePA2.png "View Image Larger")

The following graphic and associated table provides an example of the type of interactions that will need to be supported between an ePA coordinator and the various Provider HIT components.  
  
These interactions include:
1.	Initiating the DTR exchange with context
2.	Providing access to the patient record via a FHIR API
3.	Retrieving context information
4.	Retrieving required and allowed clinical and administrative information
5.	Storing the QuestionnaireResponse / Bundle with references to resources 

The table briefly describes each action along with:
- Provider systems impacted
- Provider API requirements
- ePA Coordinator API requirements
- Comments regarding each transaction 

--

[![Provider ePA Coordinator detail](ePA3.png){:style="float: none; width:930px;height:552px; margin-left: auto; margin-right: auto;display: block;"}](ePA3.png "View Image Larger")

The above graphics and descriptions outline the relevant interactions that will be further documented in subsequent releases of the IG as implementations of various combinations of HIT further inform the specifications.
