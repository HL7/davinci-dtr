<link rel="stylesheet" type="text/css" href="formatting.css" />

### Overview
This Implementation Guide (IG) is one of four HL7 Da Vinci IGs ([CRD](https://build.fhir.org/ig/HL7/davinci-crd/), DTR, [PAS](http://build.fhir.org/ig/HL7/davinci-pas/), and [CDex](http://build.fhir.org/ig/HL7/davinci-ecdx/)) that are designed to address the challenges of automating the exchange of information between a provider and the responsible payer to determine coverage of services, items, and referrals. These IGs standardize the exchange of information required to automate the Prior Authorization (PA) process. 

Each guide supports a specific set of functions and exchanges required to determine payer coverage for specific services, items, and referrals.

To maximize the value of these IGs, it is imperative that each IG is integrated into clinical workflow at the appropriate point and that all of exchanges required by each IG are fully supported by all the participants (providers, intermediaries, and payers). 

Each of these IGs recommends a set of metrics that may be collected by each implementation to facilitate the evaluation of adoption, functionality, processes, and improved outcomes. While there is currently no requirement to aggregate these metrics, it is reasonable to believe that, in the future, interested entities (providers, payers, regulators, quality organization, certification agencies, states, etc.) will ask for these metrics to evaluate the ongoing automation of the supported processes and exchanges. While this guide will not require these metrics to be captured in this release, the authors strongly suggest each implementation should do so with the expectation that collection and dissemination of these metrics may become a requirement (**SHALL**) in future versions of these IGs.

### Suggested Metrics
The following table defines a set of metrics with a short name, purpose, conformance, stakeholder, and collection/calculation instructions that represent what the project group designing this IG felt would be both reasonably collectable and useful in evaluating implementations of this IG. These measures are based on the [metric data model logical model](StructureDefinition-DTRMetricData.html) also published in this IG. 

<table style="vertical-align: middle;">
  <tr>
    <th>Number</th>
    <th style="width: 140px; vertical-align: middle;">Metric</th>
    <th style="width: 125px; vertical-align: middle;">Metric Type</th>
    <th style="width: 140px; vertical-align: middle;">Stakeholder</th>  
    <th style="vertical-align: middle;">Calculation Example</th>  
  </tr>
  <tr>
    <td style="vertical-align: middle;">1</td>
    <td style="vertical-align: middle;">Volume / % of from CRD, standalone, CDex  launch</td>
    <td style="vertical-align: middle;">Adoption Process</td>
    <td style="vertical-align: middle;">Provider or App Vendor/Provisioner</td>   
    <td style="vertical-align: middle;">Repeat for each launch mode as %mode:
For volume: 
DTRMetricData.where(launchMode = %mode and exists(action.where(actionDetail=’launch’ and httpResponse=200))).count() 
For %, divide volume above by: DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200))).count()
express as percentage
    </td>   
  </tr>
  <tr>
    <td style="vertical-align: middle;">2</td>
    <td style="vertical-align: middle;">% as standard questionnaire or adaptive forms</td>
    <td style="vertical-align: middle;">Adoption Process</td>
    <td style="vertical-align: middle;">Payer DTR app</td>   
    <td style="vertical-align: middle;">For adaptive forms: DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.where(adaptive).count()
divide by
DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.count()
express as percentage
    </td>   
  </tr>
  <tr>
    <td style="vertical-align: middle;">3</td>
    <td style="vertical-align: middle;">% reviewed prior to completion</td>
    <td style="vertical-align: middle;">Process</td>
    <td style="vertical-align: middle;">Provider or App Vendor/Provisioner</td>   
    <td style="vertical-align: middle;">DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.where(reviewPrior).count()
divide by
DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.count()
express as percentage
    </td>   
  </tr>
  <tr>
    <td style="vertical-align: middle;">4</td>
    <td style="vertical-align: middle;">% of questions auto populated</td>
    <td style="vertical-align: middle;">Process</td>
    <td style="vertical-align: middle;">Both</td>   
    <td style="vertical-align: middle;">DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.autoPopulated.aggregate($this + $total, 0)
divide by
DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.enabled.aggregate($this + $total, 0)
express as percentage
    </td>   
  </tr>
  <tr>
    <td style="vertical-align: middle;">5</td>
    <td style="vertical-align: middle;">% of auto populated question changed</td>
    <td style="vertical-align: middle;">Process</td>
    <td style="vertical-align: middle;">Both</td>   
    <td style="vertical-align: middle;">DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.roleInteraction.where(roleAction=’overrid’).count.aggregate($this + $total,0)
divide by 
DTRMetricData.where(exists(action.where(actionDetail=’launch’ and httpResponse=200)))
.questionnaire.autoPopulated.aggregate($this + $total,0)
express as percentage
    </td>   
  </tr>
  <tr>
    <td style="vertical-align: middle;">6</td>
    <td style="vertical-align: middle;">Average Time to complete</td>
    <td style="vertical-align: middle;">Process</td>
    <td style="vertical-align: middle;">Both</td>   
    <td style="vertical-align: middle;">DTRMetricData.where(launchMode = %mode and exists(action.where(actionDetail=’launch’ and httpResponse=200))).elapsedTime.aggregate($this + $total, 0) 
divide by
DTRMetricData.where(launchMode = %mode and exists(action.where(actionDetail=’launch’ and httpResponse=200))).count()
    </td>   
  </tr>
</table>
  
<br>