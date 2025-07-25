<link rel="stylesheet" type="text/css" href="formatting.css" />

<blockquote class="note-to-balloters">
  <p>
  The Da Vinci Burden Reduction team is considering updating this specification to reference the newest version of Structured Data Capture (SDC), which has made a number of clarifications to the handling of Clinical Quality Language (CQL) and expectations around population that we think will help with interoperability.  We are asking for the opinion of balloters on the value of making that change.
  </p>  

  <p>
  <b>IMPORTANT:</b> The scope of this ballot is limited to the new changes incorporated (see <a href="changehistory.html">Change Log</a>) and to feedback open issues identified in this guide (see <a href="issues.html">Open Issues</a>). While feedback can always be submitted against any content in the specification at any time, votes submitted against content that is outside the official scope of the ballot may be deemed 'not related' and therefore not able to support negative votes.
  </p>
</blockquote>

<blockquote class="stu-note">
<p>
This specification is currently published as a Standard for Trial Use (STU).  Feedback is welcome and may be submitted through the <a href="https://jira.hl7.org/secure/CreateIssueDetails!init.jspa?pid=10405&issuetype=10600&customfield_11302=FHIR-us-davinci-dtr">FHIR change tracker</a> for this specification.  Individuals interested in participating in Documentation Templates and Rules, or other HL7 Da Vinci projects, can find information about Da Vinci <a href="http://www.hl7.org/about/davinci">here</a>.
</p>
</blockquote>

### Introduction
When creating orders, booking appointments, admitting patients, etc. there is often an expectation that certain types of documentation are captured that will subsequently be used for payer processing.  This might be information needed for determining prior authorization (or whether prior authorization is even necessary), for inclusion as part of a claims submission, or even for retention as documentation of 'medical necessity' in the event of a future audit.  Each payer has rules for what documentation is necessary and in what form it needs to exist.  Failure to capture appropriate documentation or represent it in the correct manner can delay the processing of authorization requests and claims, result in denial of requests, or result in other penalties or hardships for both the provider and their patients.

The Da Vinci Documentation Templates and Rules (DTR) implementation guide provides a mechanism for payers to express their documentation requirements computably in a way that allows clinicians and other EHR users to navigate and quickly specify the needed information in a context-specific way.  The guide allows rules to be written in a way that supports automatically extracting existing EHR information for review and/or confirmation and adjusting the information prompted for based on what data is already known or entered, minimizing impact on provider time, while expediting subsequent payer interactions.

DTR leverages FHIR [Questionnaires](http://hl7.org/fhir/R4/questionnaire.html) combined with embedded [CQL](http://cql.hl7.org/N1/) logic and associated [value sets](artifacts.html#terminology-value-sets) to retrieve existing information, prompt for additional relevant information, and manage the logic process of determining which questions need to be answered (and what answer choices are relevant).  The function of rendering these Questionnaires and capturing the information in patient-specific QuestionnaireResponses can occur either through [SMART on FHIR applications](http://hl7.org/fhir/smart-app-launch/index.html) or through functionality embedded directly into the EHR.

### CMS Enforcement Discretion
One of the options available with DTR is to interact dynamically with the payer to formulate the questions being asked of the user, and potentially providing additional information back from the payer system - including coverage information via the [Coverage Information extension](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html).

On Feb 28, 2024, the Office of Burden Reduction and Health Informatics (OBRHI) National Standards Group (NSG) announced an [enforcement discretion](https://www.cms.gov/files/document/discretion-x12-278-enforcement-guidance-letter-remediated-2024-02-28.pdf) that they would not enforce the requirement to use the X12 278 for prior authorization if the covered entities were using the FHIR-based Prior Authorization API as described in the CMS Interoperability and Prior Authorization final rule ([CMS-0057-F](https://www.cms.gov/newsroom/fact-sheets/cms-interoperability-and-prior-authorization-final-rule-cms-0057-f)). This allows the payer to return a prior authorization number for use in the X12 837 in coverage extension of the CRD and DTR IGs or as part of the 'all FHIR' exchange of the Prior Authorization Response Bundle in the PAS IG. 

For DTR, this specifically means that `satisfied-pa-id` in the [Coverage Information extension](https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-ext-coverage-information.html) can be used as an X12 prior authorization number.

### Expected Systems
This Implementation Guide has expectations defined for four types of systems that can be involved (with corresponding Capability Statements):
* **Light DTR EHR** (for [US Core 3.1.1](CapabilityStatement-light-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-light-dtr-ehr-700.html)):  
  SMART on FHIR-enabled EHR that handles the form filling function of DTR, requiring the server to provide access to the specified resources to allow such an app to retrieve and edit QuestionnaireResponses and related resources.
    
* **Full DTR EHR** (for [US Core 3.1.1](CapabilityStatement-full-dtr-ehr-311.html) / [US Core 6.1/7.0](CapabilityStatement-full-dtr-ehr-700.html)):  
  EHRs that manage the form filling functions of DTR internally supporting client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.
    
*  [**SMART DTR Client**](CapabilityStatement-smart-dtr-client.html):  
  Clients support retrieving and editing QuestionnaireResponse and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations.
    
*  [**DTR Payer Service**](CapabilityStatement-dtr-payer-service.html):  
  Payer systems that provide questionnaires to DTR clients supporting server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.

[![ExpectedSystems](Actors.png){:style="float: none;width:766px;height:271px"}](Actors.png "Expected Systems")
  
<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
 The term Electronic Health Record (EHR) is used in this Implementation Guide and can be considered equivalent to Electronic Medical Record (EMR) or a Practice Management System (PMS) for the purposes of the contained content.  The term EHR includes in its scope any certified HIT that performs the described burden reduction exchanges and/or processing as part of its capabilities.
      </td></tr>
  </table>
</div><br>

### Boundaries and Relationships
This IG is a companion to the Da Vinci [Coverage Requirements Discovery (CRD)](https://build.fhir.org/ig/HL7/davinci-crd/), [Prior Authorization Support (PAS)](http://build.fhir.org/ig/HL7/davinci-pas/), and [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) IGs.  CRD allows a provider to be alerted that DTR is relevant for a particular order/appointment/etc. and optionally allows that provider to directly launch DTR (either as a SMART application or embedded EHR functionality), or hand off to back office staff for additional processing.  PAS allows the information returned by DTR to be packaged as part of a FHIR-based prior authorization request.  DTR functions in the 'middle' of these two IGs to capture the needed documentation.  CDex allows a payer to solicit additional information from a clinical system in a variety of circumstances.  One of the mechanisms it supports is asking for a user to fill out a particular form, or an unspecified set of forms associated with a tracking id.  DTR provides the mechanism to allow the user to fill out such forms.

While designed to work with these other IGs, DTR can be implemented stand-alone.  Further details on the relationships between these three implementation guides can be found [here](burden.html#da-vinci-burden-reduction).  

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> 
  <a href="https://www.cms.gov/priorities/key-initiatives/burden-reduction/interoperability/policies-and-regulations/cms-interoperability-and-prior-authorization-final-rule-cms-0057-f">CMS 0057-F</a> sets out functionality requirements for prior authorization and recommends implementation of all 3 guides by covered systems to provide such functionality. There is an expectation that future versions of these implementation guides would become mandatory in future regulations.
      </td></tr>
  </table>
</div><br>
A fourth Da Vinci IG that is relevant to DTR is the [Health Record Exchange (HRex)](https://hl7.org/fhir/us/davinci-hrex/STU1.1/security.html) implementation guide, which defines a number of shared profiles and other shared content used across Da Vincie IGs - including this one.

### Content and Organization
The IG is organized into the following sections:

* [Use Cases and Overview](usecases.html) Provides examples of how this specification can be used by provider and payer organizations.
* [Technical Background](background.html) Describes the underlying technologies this specification builds upon that readers should be familiar with before reading the rest of the IG.
* [ePA Coordinators](epa.html) Provides information regarding the interactions necessary to participate in an ePA workflow.
* [Formal Specification](specification.html) Provides the technical conformance details for the specification.
* [Privacy, Security, and Safety](security.html) Describes guidance and conformance expectations around privacy and security this IG relies on.
* [DTR Metrics](metrics.html) Provides guidance on capturing formal metrics to help evaluate and potentially benchmark DTR implementations.
* [Artifacts](allartifacts.html) Introduces and provides links to the FHIR profiles, operations, extensions, as well as examples.
* [Credits](credits.html) Identifies the individuals and organizations involved in developing this IG.
* [Change History](changehistory.html) Documents the changes that have been made to this IG in its different releases and pointers to the discussion that drove those changes.
   
### Dependencies
This guide is based on the FHIR R4 specification that is mandated for use in the U.S. as well as the [Clinical Quality Language (CQL) N1](http://cql.hl7.org/N1/) release specification. It also leverages the SMART on FHIR specification for non-native DTR Apps.

In addition, this guide also relies on a number of parent implementation guides:

{% include dependency-table-nontech.xhtml %}

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.
This guide also depends on several non-Da Vinci specifications:

<div markdown="1" class="pbox">
<ul>
    <li>
        DTR leverages profiles and capabilities defined in the <a href="http://hl7.org/fhir/uv/sdc/STU3/">Structured Data Capture (SDC)</a> implementation guide to define the forms used to gather information, how they're displayed, flow control logic, and mechanisms to automatically populate answers.  It also describes how to support <a href="specification.html#adaptive-form-considerations">Adaptive Forms</a>.  The general capabilities of the SDC guide are further constrained in DTR to reflect the capabilities that payers can count on EHRs and/or DTR smart applications to have for managing forms - and thus the constraints that need to be adhered to by payers when defining the questionnaires to be used.
        <br><br>
        Within the SDC Questionnaires, the logic that handles population and occasionally the flow control of forms is written using <a href="http://cql.hl7.org/N1/">Clinical Quality Language (CQL)</a>.  This is a language specifically designed to encode decision support logic.  It can operate against data structures independent of their syntax (e.g., XML or JSON).  It is heavily used throughout the FHIR decision support community.
    </li>
    <br>
    <li>
        In turn, DTR relies on the various EHR FHIR interfaces that comply with the US Core implementation guide <a href="{{site.data.fhir.ver.uscore7}}">7.0</a>, <a href="{{site.data.fhir.ver.uscore6}}">6.1</a>, and <a href="{{site.data.fhir.ver.uscore3}}">3.1.1</a> releases.  These interfaces allow the CQL embedded in Questionnaires to retrieve data from the EHR to help populate answers and/or to guide what questions are necessary. 
    </li>
    <br>
    <li>
       Because the DTR functionality is expected, at least in the early stages, to be performed by <a href="http://hl7.org/fhir/smart-app-launch/index.html">SMART on FHIR</a> systems, this implementation guide also provides explicit guidance around the use of SMART Launch to manage DTR functionality.
    </li>
</ul>
</div>
<br>

### Intellectual Property Considerations
This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html#license). The license page also describes rules for the use of the FHIR name and logo.

<div markdown="1" class="pbox">

{% include ip-statements.xhtml %}

</div>
<br>