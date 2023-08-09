### Overview
This Implementation Guide (IG) is one of 4 HL7 Da Vinci IGs that are designed to address the challenges of automating the exchange of information between a provider and the responsible payer to determine coverage of services, items, and referrals. In particular, these IGs standardize the exchange of information required to automate the Prior Authorization (PA) process. 

The specific IGs are:
1.	[Coverage Requirements Discovery (CRD)](https://build.fhir.org/ig/HL7/davinci-crd/)
2.	Documentation Templates and Rules (DTR)
3.	[Prior Authorization Support (PAS)](http://build.fhir.org/ig/HL7/davinci-pas/)
4.	[Clinical Documentation Exchange (CDex)](http://build.fhir.org/ig/HL7/davinci-ecdx/)

Each guide supports a specific set of functions and exchanges required to determine payer coverage for specific services, items, and referrals.

To maximize the value of these IGs, it is imperative that each IG is integrated into clinical workflow at the appropriate point and all of the exchanges required by each IG are fully supported by all of the participants (providers, intermediaries, and payers). 

Each of these IGs recommends a set of metrics that **SHOULD** or **MAY** be collected by each of the implementations to facilitate the evaluation of adoption, functionality, processes, and improved outcomes. While there is currently no requirement to aggregate these metrics, it is reasonable to believe that in the future interested entities (providers, payers, regulators, quality organization, certification agencies, states, etc.) will ask for these metrics to evaluate the ongoing automation of the supported processes / exchanges. While this guide will not require these metrics to be captured in this release, the authors strongly suggest each implementation should do so with the expectation that collection and dissemination of these metrics may become a requirement (**SHALL**) in future version of these IGs.

### Metric Examples
The following table defines a set of metrics with a short name, purpose, conformance, stakeholder, and collection/calculation instructions (based on the Metric Data model below). 

<style>
  table, th, td 
  {
    border: 1px solid gainsboro; 
  }
  th {
    background: ivory; 
    padding-left: 3px;
    padding-right: 3px;
  }
  th, td {
    text-align: center;
    vertical-align: middle;
  }
</style>

<table>
  <tr>
    <th></th>
    <th style="width: 140px;">Metric</th>
    <th style="width: 125px;">Metric Type</th>
    <th style="width: 140px;">Stakeholder</th>  
    <th>Calculation Example</th>  
  </tr>
  <tr>
    <td>1</td>
    <td>Volume / % of from CRD, standalone, CDex  launch</td>
    <td>Adoption Process</td>
    <td>Provider or App Vendor/Provisioner</td>   
    <td>Example for CRD launch
for volume, count where 
DTRMetricData.launchMode = "crd" 
for %, divide by count of
DTRMetricData where DTRMetricData.action.httpResponse contains "200"
express as percentage
    </td>   
  </tr>
  <tr>
    <td>2</td>
    <td>% as standard questionnaire or adaptive forms</td>
    <td>Adoption Process</td>
    <td>Payer DTR app</td>   
    <td>Example for adaptive forms
 count where 
DTRMetricData.questionnaire.adaptive is True
 divide by count of
DTRMetricData where DTRMetricData.action.httpResponse contains "200"
express as percentage
    </td>   
  </tr>
  <tr>
    <td>3</td>
    <td>% reviewed prior to completion</td>
    <td>Process</td>
    <td>Provider or App Vendor/Provisioner</td>   
    <td> count where 
DTRMetricData.questionnaire.reviewPrior is True
 divide by count of
DTRMetricData where DTRMetricData.action.httpResponse contains "200"
express as percentage
Note: if DTRMetricData.questionnaire occurs more than one time then count once for each occurance
    </td>   
  </tr>
  <tr>
    <td>4</td>
    <td>% of questions auto populated</td>
    <td>Process</td>
    <td>Both</td>   
    <td>sum 
DTRMetricData.questionnaire.autopopulated
 divide by sum of
DTRMetricData.questionnaire.enabledQuestions
express as percentage
Note: if DTRMetricData.questionnaire occurs more than one time then sum each occurance
    </td>   
  </tr>
  <tr>
    <td>5</td>
    <td>% of auto populated question changed</td>
    <td>Process</td>
    <td>Both</td>   
    <td>sum
DTRMetricData.questionnaire.roleinteraction.count where
DTRMetricData.questionnaire.roleinteraction.roleaction = "apmod"
 divide by sum of
DTRMetricData.questionnaire.autopopulated
express as percentage
Note: if DTRMetricData.questionnaire occurs more than one time then count once for each occurance
    </td>   
  </tr>
  <tr>
    <td>6</td>
    <td>Average Time to complete</td>
    <td>Process</td>
    <td>Both</td>   
    <td>sum
DTRMetricData.elapsedTime
divide by count of
DTRMetricData where DTRMetricData.action.httpResponse contains "200"
express as percentage
    </td>   
  </tr>
</table>

### Metric Data Model
This is a [Logical Model](StructureDefinition-DTRMetricData.html) of the information that **SHOULD** be collected and maintained for each DTR transaction.  While the implementer may choose any internal storage format that is appropriate for their system, the information collected should ultimately be mapped to the information model below.  This will allow a metrics (see the table above as an example) to be represented in terms of the Metric Data Model to provide consistent responses to metric requirements from the various interested parties (providers, payers, regulators, quality organization, certification agencies, states, etc.) by each of the participants in the DTR exchanges.
<br>