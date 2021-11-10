
<blockquote class="stu-note">
<p>
Note: How DTR passes information to PAS, PAO or other exchange IG is tentative because it has not been voted on yet. For more details regarding the status see: <a href="https://jira.hl7.org/browse/FHIR-33226">FHIR-33226</a></p>
</blockquote>
<br>
### How DTR passes information to PAS, PAO or other exchanges

The DTR application shall save the QuestionnaireResponse to the EHR upon completion (see section Persisting Results). The next step after completing the Questionnaire may include sending a Claim to a PAS [(Prior Auth Support)](http://build.fhir.org/ig/HL7/davinci-pas/) server for or an Order to PAO [(Post-Acute Orders)](http://build.fhir.org/ig/HL7/dme-orders/) for ordering. Specifications on required resources can be found in the Implementation Guides for each of those use cases.  
 
The QuestionnaireResponse may include groups (items with specific linkIds) that contain references to resources to include. These may be attachments needed by either PAS or PAO. 
 
#### Prior Authorization Support (PAS) 
The PAS Bundle linkId should be used for attached bundles containing resources needed for PAS. All of the referenced resources needed for PAS shall be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Claim sent to PAS. If the ClaimResponse has already been received from a PAS request, this shall be stored in the QuestionnaireResponse with a reference to it in the items list as well. 
 
#### Post-Acute Orders (PAO) 
The PAO Bundle linkId should be used for attached bundles containing resourced needed for Post-Acute Orders. All the referenced resources needed for PAO shall be stored as contained resources within the QuestionnaireResponse for easier reference. These resources should include the resources collected by DTR to complete the QuestionnaireResponse, as well as the Order sent to PAO. If a response has already been received from a PAO request, this shall be stored in the QuestionnaireResponse with a reference to it in the items list as well. 

#### Updating the Order

<blockquote class="stu-note">
<p>
Note: At this time <a href="http://hl7.org/fhir/uv/smart-web-messaging/2020Sep/">SMART Web Messaging</a> is at draft status. Therefore implementing the "Updating the Order" functionality as described below is not required to be conformant with this IG.</p>
</blockquote>

DTR implementations using a SMART on FHIR application SHALL support [SMART Web Messaging](http://hl7.org/fhir/uv/smart-web-messaging/2020Sep/) for updating the relevant order. After storing the completed QuestionnaireResponse, SMART Web Messaging will be used to ask the EHR to update the order to add the QuestionnaireResponse as a ‘supportingInfo’ link. DTR implementations not relying on SMART on FHIR but instead using a native application SHALL support similar functionality. 

