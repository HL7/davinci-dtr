<link rel="stylesheet" type="text/css" href="formatting.css" />

#### Populating Actions
The following table provides more detail about how information is to be populated from different system perspectives:
  
<table border="1">
  <tr>
    <th>Action</th>
    <th>Systems</th>
    <th>ELement</th>
    <th>Notes</th>    
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>launch</code></td>
    <td rowspan="4">All</td>
    <td>requestTime</td>  
    <td>Start of the DTR session (earliest time of all actions)</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>End of DTR session (latest time of all actions)</td>
  </tr>
  <tr>
    <td>httpResponse / issue</td>
    <td>Failure of DTR process prior to completion or successful storage of QuestionnaireResponse for continuation</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>When request for questionnaire package was initiated (Full EHR or SMART App) or was received (Payer)</td>
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>qpackage</code></td>
    <td rowspan="4">Full EHR, SMART App, Payer</td>
    <td>requestTime</td>  
    <td>When request for questionnaire package was initiated (Full EHR or SMART App) or was received (Payer)</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>When response to questionnaire package operation was returned (Payer) or received (Full EHR or SMART App)</td>
  </tr>
  <tr>
    <td>httpResponse / issue</td>
    <td>Result of operation, including any warnings.</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>The questionnaire(s) returned, if any</td>
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>mrquery</code></td>
    <td rowspan="4">Light EHR, SMART App</td>
    <td>requestTime</td>  
    <td>When the request for medical record data was initiated (SMART app) or received (Light EHR)</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>When the response to the medical record query was returned (Light EHR) or received (SMART app)</td>
  </tr>
  <tr>
    <td>httpResponse / issue</td>
    <td>Result of query operation, including any warnings</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>The questionnaire(s) whose CQL drove the need for the query</td>
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>userresponse</code></td>
    <td rowspan="4">Full EHR, SMART App</td>
    <td>requestTime</td>  
    <td>When the UI became available to the end user to provide responses</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>When the user activated a control returning control to the application (to save the form, to get another question, to close the app, etc.)</td>
  </tr>
  <tr>
    <td>httpResponse / issue</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>The questionnaire the user was interacting with</td>
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>nextq</code></td>
    <td rowspan="4">Full EHR, SMART App, Payer</td>
    <td>requestTime</td>  
    <td>When the $next-question call was initiated (Full EHR or SMART App) or received (Payer)</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>When the response to the $next-question call was provided (Payer) or received (Full EHR or SMART App)</td>
  </tr>
  <tr>
    <td>httpResponse</td>
    <td>The response from the $next-question call</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>The canonical for the adaptive form being completed (NOT the contained questionnaire)</td>
  </tr>
  <!-- ************************************** -->
  <tr>
    <td rowspan="4"><code>storeqr</code></td>
    <td rowspan="4">Light EHR, SMART App</td>
    <td>requestTime</td>  
    <td>When the request to store a QuestionnaireResponse was initiated (SMART App) or received (Light EHR)</td> 
  </tr>
  <tr>
    <td>responseTime</td>
    <td>When the response to the Questionnaire storage request was returned (Light EHR) or received (SMART App)</td>
  </tr>
  <tr>
    <td>httpResponse / issue</td>
    <td>The response from the attempt to store the Questionnaire Response.</td>
  </tr>
  <tr>
    <td>questionnaire</td>
    <td>The Questionnaire whose response was being stored</td>
  </tr>
</table><br>