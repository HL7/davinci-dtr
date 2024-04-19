/**************************************************************************************************************/
Instance: light-dtr-ehr
InstanceOf: CapabilityStatement
Title: "Light DTR EHR"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/light-dtr-ehr"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">Light DTR EHR</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/light-dtr-ehr</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of EHRs that rely on a SMART on FHIR application to handle the form filling function of DTR. This requires the server to provide access to the specified resources to allow such an app to retrieve and edit QuestionnaireResponses and related resources.</p><!-- Imports --><h3 class=\"no_toc\" id=\"should_css\">Include And Support Everything In The Following CapabilityStatements:</h3><ul><li><a href=\"http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server\">US Core Server CapabilityStatement</a></li></ul><!-- REST Behavior --><h3 id=\"behavior\">FHIR Server RESTful Capabilities</h3><p>EHR systems which leverage a SMART app to manage data capture and rules execution, but which must be able to launch the SMART app.</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><h3 class=\"no_toc\" id=\"resource--details\">RESTful Capabilities by Resource/Profile:</h3><p><strong>Summary</strong></p><p><i>&#x2666; = <b>SHALL</b> expectation</i>;<i>&#x22C4; = <b>SHOULD</b> expectation</i>;<i>&#x25BF; = <b>MAY</b> expectation</i>;</p><table class=\"grid\"><thead><tr><th>Resource Type</th><th>Supported Interactions</th><th>Supported Profiles</th><th>Supported Searches</th><th>Supported <code>_includes</code></th><th>Supported <code>_revincludes</code></th><th>Supported Operations</th></tr></thead><tbody><tr><td><a href=\"#coverage\"><span style=\"white-space: nowrap;\">Coverage</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">create<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">update<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">search-type<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage\">Coverage</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td><span style=\"white-space: nowrap;\">context<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">patient<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#encounter\"><span style=\"white-space: nowrap;\">Encounter</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#devicerequest\"><span style=\"white-space: nowrap;\">DeviceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#medicationrequest\"><span style=\"white-space: nowrap;\">MedicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">MedicationRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#nutritionorder\"><span style=\"white-space: nowrap;\">NutritionOrder</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">NutritionOrder</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#communicationrequest\"><span style=\"white-space: nowrap;\">CommunicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CommunicationRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#servicerequest\"><span style=\"white-space: nowrap;\">ServiceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">ServiceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#visionprescription\"><span style=\"white-space: nowrap;\">VisionPrescription</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#task\"><span style=\"white-space: nowrap;\">Task</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHOULD\"><sup>&#x22C4;</sup></span>, </span><span style=\"white-space: nowrap;\">create<span title=\"SHOULD\"><sup>&#x22C4;</sup></span>, </span><span style=\"white-space: nowrap;\">update<span title=\"SHOULD\"><sup>&#x22C4;</sup></span></span></td><!-- Supported Profiles --><td></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr></tbody></table><!-- Resource Details --><h4 class=\"no_toc\" id=\"coverage\">Coverage</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage\">Coverage</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>, <code>create</code>, <code>update</code>, <code>search-type</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Server <strong>SHALL</strong> be capable of creating a Coverage resource using:<code class=\"highlighter-rouge\">POST [base]/Coverage/[id]{?_format=[mime-type]}</code></li><li>A Server <strong>SHALL</strong> be capable of updating an existing Coverage resource using:<code class=\"highlighter-rouge\">PUT [base]/Coverage/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHALL</strong> be capable of returning a Coverage resource using:<code class=\"highlighter-rouge\">GET [base]/Coverage/[id]</code></li><li>A Server <strong>SHALL</strong> be capable of returning resources matching a search query using:<code class=\"highlighter-rouge\">GET [base]/Coverage/[id]{?[parameters]{&amp;_format=[mime-type]}}</code></li></ul><!-- Only included search parameters that are not MAY or there is no conformance requirement included --><p>Search Parameter Summary:</p><table class=\"grid\"><thead><tr><th>Conformance</th><th>Parameter</th><th>Type</th><th>Example</th></tr></thead><tbody><tr><td><strong>SHALL</strong></td><td><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">context</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/Coverage?context=[type]/[id]</code></td></tr><tr><td><strong>SHALL</strong></td><td><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">patient</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/Coverage?patient=[type]/[id]</code></td></tr></tbody></table><div><p>Search Parameter Requirements (When Used Alone or in Combination):</p><ul><li><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">context</a> (reference):<p>Allows retrieving QuestionnaireResponse for a context</p></li><li><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">patient</a> (reference):<p>Allows retrieving QuestionnaireResponse for a patient</p></li></ul></div><h4 class=\"no_toc\" id=\"encounter\">Encounter</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning an Encounter resource using:<code class=\"highlighter-rouge\">GET [base]/Encounter/[id]</code></li></ul><h4 class=\"no_toc\" id=\"devicerequest\">DeviceRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a DeviceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/DeviceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"medicationrequest\">MedicationRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">MedicationRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a MedicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/MedicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"nutritionorder\">NutritionOrder</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">NutritionOrder</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a NutritionOrder resource using:<code class=\"highlighter-rouge\">GET [base]/NutritionOrder/[id]</code></li></ul><h4 class=\"no_toc\" id=\"communicationrequest\">CommunicationRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CommunicationRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a CommunicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/CommunicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"servicerequest\">ServiceRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">ServiceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a ServiceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/ServiceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"visionprescription\">VisionPrescription</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a VisionPrescription resource using:<code class=\"highlighter-rouge\">GET [base]/VisionPrescription/[id]</code></li></ul><h4 class=\"no_toc\" id=\"task\">Task</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Profile Interaction Summary:</p><ul><li><strong>SHOULD</strong> support <code>read</code>, <code>create</code>, <code>update</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of creating a Task resource using:<code class=\"highlighter-rouge\">POST [base]/Task/[id]{?_format=[mime-type]}</code></li><li>A Server <strong>SHOULD</strong> be capable of updating an existing Task resource using:<code class=\"highlighter-rouge\">PUT [base]/Task/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Server <strong>SHOULD</strong> be capable of returning a Task resource using:<code class=\"highlighter-rouge\">GET [base]/Task/[id]</code></li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "LightDTREHR"
* title = "Light DTR EHR"
* status = #active
* experimental = false
* date = "2023-08-31"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of EHRs that rely on a SMART on FHIR application to handle the form filling function of DTR. This requires the server to provide access to the specified resources to allow such an app to retrieve and edit QuestionnaireResponses and related resources."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "EHR systems which leverage a SMART app to manage data capture and rules execution, but which must be able to launch the SMART app."
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[https://build.fhir.org/ig/HL7/davinci-ehrx/|HRex implementation guide]]."

* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "context"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a context"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a patient"

* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #Encounter
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #CommunicationRequest
* rest.resource[=].supportedProfile = $CRDCommunicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = $CRDServiceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #VisionPrescription
* rest.resource[=].supportedProfile = $CRDVisionPrescription
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHOULD
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #Task
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHOULD
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHOULD
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHOULD
* rest.resource[=].interaction[=].code = #update


/**************************************************************************************************************/
Instance: full-dtr-ehr
InstanceOf: CapabilityStatement
Title: "Full DTR EHR"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">Full DTR EHR</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of EHRs that manage the form filling functions of DTR internally. Such EHRs need only support client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- REST Behavior --><h3 id=\"behavior\">FHIR Client RESTful Capabilities</h3><p>A DTR Native Client provides an EHR-based application</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><p><strong>Summary of Client Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "FullDTREHR"
* title = "Full DTR EHR"
* status = #active
* experimental = false
* date = "2023-08-31"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of EHRs that manage the form filling functions of DTR internally. Such EHRs need only support client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "A DTR Native Client provides an EHR-based application"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[https://build.fhir.org/ig/HL7/davinci-ehrx/|HRex implementation guide]]."

// Operations
* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "questionnaire-package"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "expand"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "next-question"
* rest.operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question"

/**************************************************************************************************************/
Instance: dtr-payer-service
InstanceOf: CapabilityStatement
Title: "DTR Payer Service"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">DTR Payer Service</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients. Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- REST Behavior --><h3 id=\"behavior\">FHIR Server RESTful Capabilities</h3><p>A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><p><strong>Summary of Server Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHOULD</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "DTRPayerService"
* title = "DTR Payer Service"
* status = #active
* experimental = false
* date = "2023-08-31"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients. Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[https://build.fhir.org/ig/HL7/davinci-ehrx/|HRex implementation guide]]."

// Operations
* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "questionnaire-package"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "expand"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHOULD
* rest.operation[=].name = "next-question"
* rest.operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question"

/**************************************************************************************************************/
Instance: dtr-smart-client
InstanceOf: CapabilityStatement
Title: "DTR SMART Client"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-smart-client"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">DTR SMART on FHIR Client</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-smart-client</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of DTR SMART on FHIR applications. Such apps require client support for retrieving and editing QuestionnaireResponse resources and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- Imports --><h3 class=\"no_toc\" id=\"should_css\">Include And Support Everything In The Following CapabilityStatements:</h3><ul><li><a href=\"http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client\">US Core Client CapabilityStatement</a></li></ul><!-- REST Behavior --><h3 id=\"behavior\">FHIR Client RESTful Capabilities</h3><p>A DTR SMART on FHIR Client provides an application conforming to the SMART on FHIR specification and related requirements declared in this Implementation Guide.</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><p><strong>Summary of Client Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul><h3 class=\"no_toc\" id=\"resource--details\">RESTful Capabilities by Resource/Profile:</h3><p><strong>Summary</strong></p><p><i>&#x2666; = <b>SHALL</b> expectation</i>;<i>&#x22C4; = <b>SHOULD</b> expectation</i>;<i>&#x25BF; = <b>MAY</b> expectation</i>;</p><table class=\"grid\"><thead><tr><th>Resource Type</th><th>Supported Interactions</th><th>Supported Profiles</th><th>Supported Searches</th><th>Supported <code>_includes</code></th><th>Supported <code>_revincludes</code></th><th>Supported Operations</th></tr></thead><tbody><tr><td><a href=\"#coverage\"><span style=\"white-space: nowrap;\">Coverage</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">create<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">update<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">search-type<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage\">Coverage</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td><span style=\"white-space: nowrap;\">context<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">patient<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#encounter\"><span style=\"white-space: nowrap;\">Encounter</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#devicerequest\"><span style=\"white-space: nowrap;\">DeviceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#medicationrequest\"><span style=\"white-space: nowrap;\">MedicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">MedicationRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#nutritionorder\"><span style=\"white-space: nowrap;\">NutritionOrder</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">NutritionOrder</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#communicationrequest\"><span style=\"white-space: nowrap;\">CommunicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CommunicationRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#servicerequest\"><span style=\"white-space: nowrap;\">ServiceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">ServiceRequest</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#visionprescription\"><span style=\"white-space: nowrap;\">VisionPrescription</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><span style=\"white-space: nowrap;\"><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></span></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#task\"><span style=\"white-space: nowrap;\">Task</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">create<span title=\"SHALL\"><sup>&#x2666;</sup></span>, </span><span style=\"white-space: nowrap;\">update<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr></tbody></table><!-- Resource Details --><h4 class=\"no_toc\" id=\"coverage\">Coverage</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-coverage\">Coverage</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>, <code>create</code>, <code>update</code>, <code>search-type</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of posting a Coverage resource using:<code class=\"highlighter-rouge\">POST [base]/Coverage/[id]{?_format=[mime-type]}</code></li><li>A Client <strong>SHALL</strong> be capable of putting an existing Coverage resource using:<code class=\"highlighter-rouge\">PUT [base]/Coverage/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a Coverage resource using:<code class=\"highlighter-rouge\">GET [base]/Coverage/[id]</code></li><li>A Client <strong>SHALL</strong> be capable of fetching resources matching a search query using:<code class=\"highlighter-rouge\">GET [base]/Coverage/[id]{?[parameters]{&amp;_format=[mime-type]}}</code></li></ul><!-- Only included search parameters that are not MAY or there is no conformance requirement included --><p>Search Parameter Summary:</p><table class=\"grid\"><thead><tr><th>Conformance</th><th>Parameter</th><th>Type</th><th>Example</th></tr></thead><tbody><tr><td><strong>SHALL</strong></td><td><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">context</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/Coverage?context=[type]/[id]</code></td></tr><tr><td><strong>SHALL</strong></td><td><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">patient</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/Coverage?patient=[type]/[id]</code></td></tr></tbody></table><div><p>Search Parameter Requirements (When Used Alone or in Combination):</p><ul><li><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">context</a> (reference):<p>Allows retrieving QuestionnaireResponse for a context</p></li><li><a href=\"http://hl7.org/fhir/R4/coverage.html#search\">patient</a> (reference):<p>Allows retrieving QuestionnaireResponse for a patient</p></li></ul></div><h4 class=\"no_toc\" id=\"encounter\">Encounter</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching an Encounter resource using:<code class=\"highlighter-rouge\">GET [base]/Encounter/[id]</code></li></ul><h4 class=\"no_toc\" id=\"devicerequest\">DeviceRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">DeviceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a DeviceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/DeviceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"medicationrequest\">MedicationRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">MedicationRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a MedicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/MedicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"nutritionorder\">NutritionOrder</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">NutritionOrder</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a NutritionOrder resource using:<code class=\"highlighter-rouge\">GET [base]/NutritionOrder/[id]</code></li></ul><h4 class=\"no_toc\" id=\"communicationrequest\">CommunicationRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CommunicationRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a CommunicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/CommunicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"servicerequest\">ServiceRequest</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">ServiceRequest</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a ServiceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/ServiceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"visionprescription\">VisionPrescription</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a VisionPrescription resource using:<code class=\"highlighter-rouge\">GET [base]/VisionPrescription/[id]</code></li></ul><h4 class=\"no_toc\" id=\"task\">Task</h4><p>Conformance Expectation:<strong>(conformance expectation undefined)</strong></p><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>, <code>create</code>, <code>update</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of posting a Task resource using:<code class=\"highlighter-rouge\">POST [base]/Task/[id]{?_format=[mime-type]}</code></li><li>A Client <strong>SHALL</strong> be capable of putting an existing Task resource using:<code class=\"highlighter-rouge\">PUT [base]/Task/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a Task resource using:<code class=\"highlighter-rouge\">GET [base]/Task/[id]</code></li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "DTRSmartClient"
* title = "DTR SMART on FHIR Client"
* status = #active
* experimental = false
* date = "2023-08-31"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of DTR SMART on FHIR applications. Such apps require client support for retrieving and editing QuestionnaireResponse resources and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "A DTR SMART on FHIR Client provides an application conforming to the SMART on FHIR specification and related requirements declared in this Implementation Guide."
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [[https://build.fhir.org/ig/HL7/davinci-ehrx/|HRex implementation guide]]."


* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-questionnaireresponse"
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "context"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/dtr-context"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a context"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a patient"

* rest.resource[0].type = #Coverage
* rest.resource[=].supportedProfile = $CRDCoverage
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #Encounter
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #DeviceRequest
* rest.resource[=].supportedProfile = $CRDDeviceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile = $CRDMedicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #NutritionOrder
* rest.resource[=].supportedProfile = $CRDNutritionOrder
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #CommunicationRequest
* rest.resource[=].supportedProfile = $CRDCommunicationRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = $CRDServiceRequest
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #VisionPrescription
* rest.resource[=].supportedProfile = $CRDVisionPrescription
* rest.resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction.extension.valueCode = #SHALL
* rest.resource[=].interaction.code = #read

* rest.resource[+].type = #Task
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #update

// Operations
* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "questionnaire-package"
* rest.operation[=].definition = "http://hl7.org/fhir/us/davinci-dtr/OperationDefinition/questionnaire-package"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "expand"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"

* rest.operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.operation[=].extension.valueCode = #SHALL
* rest.operation[=].name = "next-question"
* rest.operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question"