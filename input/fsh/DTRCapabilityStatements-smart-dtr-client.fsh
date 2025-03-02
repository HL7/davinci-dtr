Instance: smart-dtr-client
InstanceOf: CapabilityStatement
Title: "SMART DTR Client"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/smart-dtr-client"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">SMART on FHIR DTR Client</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/smart-dtr-client</code></li><li><b>Implementation Guide Version:</b> 2.1.0-preview</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2024-08-02</li><li><b>Published by:</b> HL7 International / Clinical Decision Support</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of DTR SMART on FHIR applications . Such apps require client support for retrieving and editing QuestionnaireResponse resources and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- REST Behavior --><h3 id=\"behavior\">FHIR Client RESTful Capabilities</h3><p>A SMART on FHIR DTR Client provides an application conforming to the SMART on FHIR specification and related requirements declared in this Implementation Guide.</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx\">HRex implementation guide</a>.</p><p><strong>Summary of Client Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"OperationDefinition-questionnaire-package.html\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul><h3 class=\"no_toc\" id=\"resource--details\">RESTful Capabilities by Resource/Profile:</h3><p><strong>Summary</strong></p><p><i>&#x2666; = <b>SHALL</b> expectation</i>;<i>&#x22C4; = <b>SHOULD</b> expectation</i>;<i>&#x25BF; = <b>MAY</b> expectation</i>;</p><table class=\"grid\"><thead><tr><th>Resource Type</th><th>Supported Interactions</th><th>Supported Profiles</th><th>Supported Searches</th><th>Supported <code>_includes</code></th><th>Supported <code>_revincludes</code></th><th>Supported Operations</th></tr></thead><tbody><tr><td><a href=\"#questionnaireresponse\"><span style=\"white-space: nowrap;\">QuestionnaireResponse</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">create<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">update<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">search-type<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"StructureDefinition-dtr-questionnaireresponse.html\">DTR Questionnaire Response</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td><span style=\"white-space: nowrap;\">context<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">patient<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#encounter\"><span style=\"white-space: nowrap;\">Encounter</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-profile-encounter.html\">CRD Encounter</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#devicerequest\"><span style=\"white-space: nowrap;\">DeviceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">CRD Device Request</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#medicationrequest\"><span style=\"white-space: nowrap;\">MedicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">CRD Medication Request</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#nutritionorder\"><span style=\"white-space: nowrap;\">NutritionOrder</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">CRD Nutrition Order</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#communicationrequest\"><span style=\"white-space: nowrap;\">CommunicationRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CRD Communication Request</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#servicerequest\"><span style=\"white-space: nowrap;\">ServiceRequest</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">CRD Service Request</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#visionprescription\"><span style=\"white-space: nowrap;\">VisionPrescription</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr><tr><td><a href=\"#task\"><span style=\"white-space: nowrap;\">Task</span></a></td><td><span style=\"white-space: nowrap;\">read<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">create<span title=\"SHALL\"><sup>&#x2666;</sup></span></span>, <span style=\"white-space: nowrap;\">update<span title=\"SHALL\"><sup>&#x2666;</sup></span></span></td><!-- Supported Profiles --><td><a href=\"http://hl7.org/fhir/us/davinci-pas/StructureDefinition/profile-task\">PAS Task Profile</a></td><!-- Supported Searches will need to do some sort of mapping instead of join to get the expectations printed out --><td></td><!-- Supported _includes --><td></td><!-- Supported _revincludes --><td><!----></td><!-- Supported Operations --><td></td></tr></tbody></table><!-- Resource Details --><h4 class=\"no_toc\" id=\"questionnaireresponse\">QuestionnaireResponse</h4><p>Supported Profiles:</p><ul><li><a href=\"StructureDefinition-dtr-questionnaireresponse.html\">DTR Questionnaire Response</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>, <code>create</code>, <code>update</code>, <code>search-type</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of posting a QuestionnaireResponse resource using:<code class=\"highlighter-rouge\">POST [base]/QuestionnaireResponse/[id]{?_format=[mime-type]}</code></li><li>A Client <strong>SHALL</strong> be capable of putting an existing QuestionnaireResponse resource using:<code class=\"highlighter-rouge\">PUT [base]/QuestionnaireResponse/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a QuestionnaireResponse resource using:<code class=\"highlighter-rouge\">GET [base]/QuestionnaireResponse/[id]</code></li><li>A Client <strong>SHALL</strong> be capable of fetching resources matching a search query using:<code class=\"highlighter-rouge\">GET [base]/QuestionnaireResponse/[id]{?[parameters]{&amp;_format=[mime-type]}}</code></li></ul><!-- Only included search parameters that are not MAY or there is no conformance requirement included --><p>Search Parameter Summary:</p><table class=\"grid\"><thead><tr><th style=\"white-space: nowrap;\">Conformance</th><th>Parameter</th><th>Type</th><th>Example</th></tr></thead><tbody><tr><td><strong>SHALL</strong></td><td><a href=\"SearchParameter-qr-context.html\">context</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/QuestionnaireResponse?context=[type]/[id]</code></td></tr><tr><td><strong>SHALL</strong></td><td><a href=\"SearchParameter-qr-context.html\">patient</a></td><td>reference</td><td><code class=\"highlighter-rouge\">GET [base]/QuestionnaireResponse?patient=[type]/[id]</code></td></tr></tbody></table><div><p>Search Parameter Requirements (When Used Alone or in Combination):</p><ul><li><a href=\"SearchParameter-qr-context.html\">context</a> (reference):<p>Allows retrieving QuestionnaireResponse for a context</p></li><li><a href=\"SearchParameter-qr-context.html\">patient</a> (reference):<p>Allows retrieving QuestionnaireResponse for a patient</p></li></ul></div><h4 class=\"no_toc\" id=\"encounter\">Encounter</h4><p>Supported Profiles:</p><ul><li><a href=\"https://build.fhir.org/ig/HL7/davinci-crd/StructureDefinition-profile-encounter.html\">CRD Encounter</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching an Encounter resource using:<code class=\"highlighter-rouge\">GET [base]/Encounter/[id]</code></li></ul><h4 class=\"no_toc\" id=\"devicerequest\">DeviceRequest</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-devicerequest\">CRD Device Request</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a DeviceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/DeviceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"medicationrequest\">MedicationRequest</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-medicationrequest\">CRD Medication Request</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a MedicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/MedicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"nutritionorder\">NutritionOrder</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-nutritionorder\">CRD Nutrition Order</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a NutritionOrder resource using:<code class=\"highlighter-rouge\">GET [base]/NutritionOrder/[id]</code></li></ul><h4 class=\"no_toc\" id=\"communicationrequest\">CommunicationRequest</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-communicationrequest\">CRD Communication Request</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a CommunicationRequest resource using:<code class=\"highlighter-rouge\">GET [base]/CommunicationRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"servicerequest\">ServiceRequest</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-servicerequest\">CRD Service Request</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a ServiceRequest resource using:<code class=\"highlighter-rouge\">GET [base]/ServiceRequest/[id]</code></li></ul><h4 class=\"no_toc\" id=\"visionprescription\">VisionPrescription</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-visionprescription\">CRD Vision Prescription</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>.</li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a VisionPrescription resource using:<code class=\"highlighter-rouge\">GET [base]/VisionPrescription/[id]</code></li></ul><h4 class=\"no_toc\" id=\"task\">Task</h4><p>Supported Profiles:</p><ul><li><a href=\"http://hl7.org/fhir/us/davinci-pas/StructureDefinition/profile-task\">PAS Task Profile</a></li></ul><p>Profile Interaction Summary:</p><ul><li><strong>SHALL</strong> support <code>read</code>, <code>create</code>, <code>update</code>.</li></ul><p>Modify Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of posting a Task resource using:<code class=\"highlighter-rouge\">POST [base]/Task/[id]{?_format=[mime-type]}</code></li><li>A Client <strong>SHALL</strong> be capable of putting an existing Task resource using:<code class=\"highlighter-rouge\">PUT [base]/Task/[id]{?_format=[mime-type]}</code></li></ul><p>Fetch and Search Criteria:</p><ul><li>A Client <strong>SHALL</strong> be capable of fetching a Task resource using:<code class=\"highlighter-rouge\">GET [base]/Task/[id]</code></li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "DTRSmartClient"
* title = "SMART on FHIR DTR Client"
* status = #active
* experimental = false
* date = "2024-08-02"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of DTR SMART on FHIR applications. Such apps require client support for retrieving and editing QuestionnaireResponse resources and related resources, as well as client support for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client|7.0.0"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "A SMART on FHIR DTR Client provides an application conforming to the SMART on FHIR specification and related requirements declared in this Implementation Guide."
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the [HRex implementation guide](https://build.fhir.org/ig/HL7/davinci-ehrx)."
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
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/davinci-dtr/SearchParameter/qr-context"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a context"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponse for a patient"

* rest.resource[+].type = #Encounter
* rest.resource[=].supportedProfile = $CRDEncounter
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
* rest.resource[=].supportedProfile = $PASTask
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
