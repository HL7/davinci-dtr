<link rel="stylesheet" type="text/css" href="formatting.css" />

### Overview
When creating orders, booking appointments, admitting patients, etc. there is often an expectation that certain types of documentation are captured that will subsequently be used for payer processing.  This might be information needed for determining prior authorization (or even whether prior authorization is necessary), for inclusion as part of a claims submission, or even for retention as documentation of 'medical necessity' in the event of a future audit.  Each payer has rules for what documentation is necessary and in what form it needs to exist.  Failure to capture appropriate documentation or represent it in the correct manner can delay the processing of authorization requests and claims, result in denial of requests, or result in other penalties or hardships for both the provider and their patients.

The Da Vinci Documentation Templates and Rules (DTR) implementation guide provides a mechanism for payers to express their documentation requirements computably in a way that allows clinicians and other EHR users to navigate and quickly specify the needed information in a context-specific way.  The guide allows rules to be written in a way that supports automatically extracting existing EHR information for review/confirmation and adjusting the information prompted for based on what data is already known or entered, minimizing impact on provider time, while expediting subsequent payer interactions.

DTR leverages FHIR [Questionnaires](http://hl7.org/fhir/R4/questionnaire.html) combined with embedded [CQL](https://cql.hl7.org/) logic and associated [value sets](artifacts.html#terminology-value-sets) to retrieve existing information, prompt for additional relevant information, and manage the logic process of determining which questions need to be answered (and what answer choices are relevant).  The function of rendering these Questionnaires and capturing the information in patient-specific QuestionnaireResponses can occur either through [SMART on FHIR applications](http://hl7.org/fhir/smart-app-launch/index.html) or through functionality embedded directly into the EHR.

### Expected Systems
This Implementation Guide has expectations defined for four types of systems that can be involved (with corresponding Capability Statements):
* [DTR Payer Service](CapabilityStatement-dtr-payer-service.html):  
  Payer systems that provide questionnaires to DTR clients supporting server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.
* [DTR SMART Client](CapabilityStatement-dtr-smart-client.html):  
  Clients support retrieving and editing QuestionnaireResponse and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations.
* [Full DTR EHR](CapabilityStatement-full-dtr-ehr.html):  
  EHRs that manage the form filling functions of DTR internally supporting client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.
* [Light DTR EHR](CapabilityStatement-light-dtr-ehr.html):  
  SMART on FHIR application that handles the form filling function of DTR, requiring the server to provide access to the specified resources to allow such an app to retrieve and edit QuestionnaireResponses and related resources.

<div markdown="1" class="notebox">
  <table style="border: none; margin-bottom: 0px;">
    <tr><td style="width: 72px; border: none"><img src="Note.png" style="float: left; width:18px; height:18px; margin: 0px;">&nbsp;<b><span style="color:maroon;">NOTE:</span></b></td>
      <td style="border: none"> <!-- Note Text Here -->
 The term Electronic Health Record (EHR) is used in this IG and can be considered equivalent to Electronic Medical Record (EMR) or a Practice Management System (PMS) for the purposes of the contained content.
      </td></tr>
  </table>
</div><br>

### Boundaries and Relationships
This IG is a companion to the Da Vinci [Coverage Requirements Discovery (CRD)](https://build.fhir.org/ig/HL7/davinci-crd/), [Prior Authorization Support (PAS)](http://build.fhir.org/ig/HL7/davinci-pas/), and [Clinical Data Exchange (CDex)](https://hl7.org/fhir/us/davinci-cdex/index.html) IGs.  CRD allows a provider to be alerted that DTR is relevant for a particular order/appointment/etc. and optionally allows that provider to directly launch DTR (either as a SMART application or embedded EHR functionality), or hand off to back office staff for additional processing.  PAS allows the information returned by DTR to be packaged as part of a FHIR-based prior authorization request.  DTR functions in the 'middle' of these two IGs to capture the needed documentation.  CDex allows a payer to solicit additional information from a clinical system in a variety of circumstances.  One of the mechanisms it supports is asking for a user to fill out a particular form, or an unspecified set of forms associated with a tracking id.  DTR provides the mechanism to allow the user to fill out such forms.

While designed to work with these other IGs, DTR can be implemented stand-alone.  Further details on the relationships between these three implementation guides can be found [here](usecases.html#da-vinci-burden-reduction).

A fourth Da Vinci IG that is relevant to DTR is the [Health Record Exchange (HRex)](http://hl7.org/fhir/us/davinci-hrex/STU1/) implementation guide, which defines a number of shared profiles and other shared content used across Da Vincie IGs - including this one.

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

{% include dependency-table-short.xhtml %}

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
        In turn, DTR relies on the various EHR FHIR interfaces that comply with the <a href="http://hl7.org/fhir/us/core/STU3.1.1/index.html">US Core implementation guide</a>.  These interfaces allow the CQL embedded in Questionnaires to retrieve data from the EHR to help populate answers and/or to guide what questions are necessary. 
    </li>
    <br>
    <li>
       Because the DTR functionality is expected, at least in the early stages, to be performed by <a href="http://hl7.org/fhir/smart-app-launch/index.html">SMART on FHIR</a> systems, this implementation guide also provides explicit guidance around the use of SMART launch to manage DTR functionality.
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