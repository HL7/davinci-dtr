/**************************************************************************************************************************************************/
Instance: dtr-payer-service-311
InstanceOf: CapabilityStatement
Title: "DTR Payer Service USCDI 1"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service-311"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">DTR Payer Service</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service-311</code></li><li><b>Implementation Guide Version:</b> 2.1.0-preview</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2024-08-02</li><li><b>Published by:</b> HL7 International / Clinical Decision Support</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients for USCDI 1 (US-Core 3.1.1). Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- Imports --><h3 class=\"no_toc\" id=\"should_css\">Include And Support Everything In The Following CapabilityStatements:</h3><ul><li><a href=\"http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|3.1.1\">US Core Server CapabilityStatement</a></li></ul><!-- REST Behavior --><h3 id=\"behavior\">FHIR Server RESTful Capabilities</h3><p>A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx\">HRex implementation guide</a>.</p><p><strong>Summary of Server Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"OperationDefinition-questionnaire-package.html\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHOULD</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "DTRPayerService"
* title = "DTR Payer Service"
* status = #active
* experimental = false
* date = "2024-08-02"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients for USCDI 1 (US-Core 3.1.1). Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|3.1.1"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx\">HRex implementation guide</a>."

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

/**************************************************************************************************************************************************/
Instance: dtr-payer-service-610
InstanceOf: CapabilityStatement
Title: "DTR Payer Service USCDI 3"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service-610"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">DTR Payer Service</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/dtr-payer-service-610</code></li><li><b>Implementation Guide Version:</b> 2.1.0-preview</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2024-08-02</li><li><b>Published by:</b> HL7 International / Clinical Decision Support</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients for USCDI 3 (US-Core 6.1). Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- Imports --><h3 class=\"no_toc\" id=\"should_css\">Include And Support Everything In The Following CapabilityStatements:</h3><ul><li><a href=\"http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|6.1.0\">US Core Server CapabilityStatement</a></li></ul><!-- REST Behavior --><h3 id=\"behavior\">FHIR Server RESTful Capabilities</h3><p>A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx\">HRex implementation guide</a>.</p><p><strong>Summary of Server Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"OperationDefinition-questionnaire-package.html\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHOULD</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
* text.status = #generated
* version = "1.1.0-ballot"
* name = "DTRPayerService"
* title = "DTR Payer Service"
* status = #active
* experimental = false
* date = "2024-08-02"
* publisher = "HL7 Clinical Decision Support Work Group"
* contact.name = "HL7 Clinical Decision Support Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/dss"
* description = "This statement defines the expected capabilities of payer systems that provide questionnaires to DTR clients for USCDI 3 (US-Core 6.1). Such systems need only support server capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|6.1.0"
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "A DTR Payer service provides a service endpoint for DTR apps and full EHRs to connect to"
* rest.security.description = "Implementations **SHALL** meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx\">HRex implementation guide</a>."

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
