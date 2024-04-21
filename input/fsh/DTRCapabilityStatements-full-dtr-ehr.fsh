/**************************************************************************************************************************************************/
Instance: full-dtr-ehr-311
InstanceOf: CapabilityStatement
Title: "Full DTR EHR USCDI 1"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr-311"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">Full DTR EHR</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr-311</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of EHRs that manage the form filling functions of DTR internally. Such EHRs need only support client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- REST Behavior --><h3 id=\"behavior\">FHIR Client RESTful Capabilities</h3><p>A DTR Native Client provides an EHR-based application</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><p><strong>Summary of Client Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"https://hl7.org/fhir/us/davinci-dtr/STU2/OperationDefinition-questionnaire-package.html\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
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
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client|3.1.1"
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

/**************************************************************************************************************************************************/
Instance: full-dtr-ehr-610
InstanceOf: CapabilityStatement
Title: "Full DTR EHR USCDI 3"
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr-610"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">Full DTR EHR</h2><ul><li><b>Official URL:</b><code>http://hl7.org/fhir/us/davinci-dtr/CapabilityStatement/full-dtr-ehr-610</code></li><li><b>Implementation Guide Version:</b> 1.1.0-ci-build</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats: </b>JSON</li><li><b>Published:</b> 2023-08-31</li><li><b>Published by:</b> HL7 Clinical Decision Support Work Group</li><li><b>Status:</b> Active</li></ul><p>This statement defines the expected capabilities of EHRs that manage the form filling functions of DTR internally. Such EHRs need only support client capabilities for the Questionnaire Package, ValueSet Expand, and Next Question operations.</p><!-- REST Behavior --><h3 id=\"behavior\">FHIR Client RESTful Capabilities</h3><p>A DTR Native Client provides an EHR-based application</p><p id=\"security\"><strong>Security:</strong></p><p>Implementations <strong>SHALL</strong> meet the general security requirements documented in the <a href=\"https://build.fhir.org/ig/HL7/davinci-ehrx/\">HRex implementation guide</a>.</p><p><strong>Summary of Client Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"https://hl7.org/fhir/us/davinci-dtr/STU2/OperationDefinition-questionnaire-package.html\"><code>$questionnaire-package</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/OperationDefinition/ValueSet-expand\"><code>$expand</code></a> operation.</li><li><strong>SHALL</strong> support the <a href=\"http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-next-question\"><code>$next-question</code></a> operation.</li></ul></div>"
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
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client|6.1.0"
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
