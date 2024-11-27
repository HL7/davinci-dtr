<link rel="stylesheet" type="text/css" href="formatting.css" />

### Underlying Technologies
This guide is based on the HL7 FHIR standard, the US Core [3.1.1]({{site.data.fhir.ver.uscore3}}) and [6.1]({{site.data.fhir.ver.uscore6}}) Implementation Guides, as well as the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch/index.html), [Clinical Quality Language (CQL)](http://cql.hl7.org/N1/), and [Structured Data Capture (SDC)](http://hl7.org/fhir/uv/sdc/STU3/) specifications which build additional capabilities on top of FHIR. This architecture is intended to maximize the number of provider systems that conform to this guide, as well as to allow for easy growth and extensibility of system capabilities in the future.

Implementers of this specification therefore need to understand some basic information about these specifications.

#### FHIR
This IG uses terminology, notations, and design principles that are specific to FHIR. It's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read the following prior to reading the rest of this IG.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html) or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html) (as applicable)
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This IG supports the [R4](http://hl7.org/fhir/R4/index.html) version of the FHIR standard.

This IG leverages and builds on the US Core [3.1.1]({{site.data.fhir.ver.uscore3}}) and [6.1]({{site.data.fhir.ver.uscore6}}) IGs defined by HL7 for sharing human EHR data in the US.  Implementers need to familiarize themselves with the profiles in US Core, as well as the underlying [Structured Data Capture (SDC)](https://hl7.org/fhir/uv/sdc/STU3/index.html) profiles being used. 

<table style="border: none;">
  <tr>
    <td style="border: none;"><b>FHIR Version:</b></td>
    <td style="border: none;"><a href="https://hl7.org/fhir/R4/">FHIR R4 (4.0.1)</a></td>
  </tr>
  <tr>
    <td style="border: none;"><b>US Core:</b></td>
    <td style="border: none;"><a href="{{site.data.fhir.ver.uscore7}}">Release 7.0</a></td>
  </tr>
  <tr>
    <td style="border: none;"/>
    <td style="border: none;"><a href="{{site.data.fhir.ver.uscore6}}">Release 6.1</a></td>
  </tr>
  <tr>
    <td style="border: none;"/>
    <td style="border: none;"><a href="{{site.data.fhir.ver.uscore3}}">Release 3.1.1</a></td>
  </tr>
  <tr>
    <td style="border: none;"><b>Profiles:</b></td>
    <td style="border: none;"><a href="StructureDefinition-dtr-std-questionnaire.html">Standard Questionnaire</a></td>
  </tr>
  <tr>
    <td style="border: none;"/>
    <td style="border: none;"><a href="StructureDefinition-dtr-questionnaire-adapt.html">Adaptive Questionnaire</a></td>
  </tr>
  <tr>
    <td style="border: none;"/>
    <td style="border: none;"><a href="StructureDefinition-dtr-questionnaireresponse.html">QuestionnaireResponse</a></td>
  </tr>
  <tr>
    <td style="border: none;"/>
    <td style="border: none;"><a href="https://hl7.org/fhir/us/davinci-pas/StructureDefinition-profile-task.html">Task (PAS)</a></td>
  </tr>
</table>
<br>
Other resources may also be accessed as part of the CQL rules.
  
#### US Core Implementation Guide
Implementers will need the knowledge of US Core [3.1.1]({{site.data.fhir.ver.uscore3}}) and [6.1]({{site.data.fhir.ver.uscore6}}) IGs to access information for pre-population via CQL calls to *21st Century* compliant FHIR APIs. Some of the implementations will need to support US Core requirements.  (Refer to the [CapabilityStatements](artifacts.html#behavior-capability-statements).)   

#### SMART on FHIR and Native Applications
Guidance is being provided to allow DTR functionality to be invoked outside of regular EHR clinical workflows using a SMART on FHIR app or an EHR-based "Native" app to provide a consistent way of evaluating payer rules and documentation requirements across EHR implementations. As such client implementers creating a SMART App will also need to be familiar with the [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) specification. (Payer implementers only need to be familiar with the SMART on FHIR specification if they plan to develop SMART apps for launch by CDS Hooks or other purposes.)  

In some cases, staff may wish to invoke DTR in a "what-if" scenario based on recommendations/plans for an upcoming visit.  Such recommendations might be from decision support (such as ImmunizationRecommendation or a CarePlan with an intent of 'proposed') or from standard protocols (e.g., "this patient is due for a pap smear").  In such cases, the EHR can support automated generation of 'draft' requests based on the descision support or protocol resources and use them when invoking DTR.

#### CQL 
[Clinical Quality Language (CQL)](http://cql.hl7.org/N1/) is used to query the Electronic Health Record (EHR) FHIR server to pre-populate the DTR Questionnaire and may also be used to guide which questions need to be answered.  DTR Servers will need to construct Questionnaires containing CQL references and CQL libraries that perform the necessary logic.  DTR clients will need to be able to execute the proved CQL.

### Architectural approach
This IG leverages several architectural to FHIR data exchange:
* RESTful access from SMART app to EHR data and storage of QuestionnaireResponses
* Operation for next question
* Operation to retrieve the Questionnaire packages from payers
* Operation to submit errors related to the Questionnaire packages retrieved
  
The choice of using REST to access and store data from the SMART app is driven by the SMART on FHIR architecture.
  
The choice of using operations for `$next-question` for adaptive forms was made by the SDC implementation guide.
  
The decision tree navigation in the [HRex Approaches to Exchanging Data decision tree](https://hl7.org/fhir/us/davinci-hrex/STU1.1/exchanging.html) that led to these approaches where decisions needed to be made as part of DTR are as follows:  

Access to payer Questionnaire package -
* Data retrieval is initiated by the consumer (SMART app/EHR).
* The app/EHR will have a direct connection to the payer – there is required to be a single defined endpoint for the payer.  Any routing will be behind the scenes.
* No human intervention in return of data.
* CDS Hooks doesn’t make sense given that the calls aren’t really decision support for a user action.
* Data is not necessarily pre-existing.  The questionnaire *could* be assembled on the fly based on context.
* There’s no need for routing. This isn’t a standard message or operation. This must be synchronous.  In the end, choose the ‘lighter’ approach which is an operation.
  
Reporting of Questionnaire issues - 
* Data sharing is initiated by a data source (EHR or app that has found the Questionnaire issue).
* The transmission of the data isn’t configured by the payer – polling or subscription wouldn’t really work.
* The app/EHR will have a direct connection to the payer – there is required to be a single defined endpoint for the payer.  Any routing will be behind the scenes.
* The data source doesn’t control how (or if) the reported error is stored.
