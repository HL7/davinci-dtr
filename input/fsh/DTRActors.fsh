Instance: dtr-client-actor
InstanceOf: ActorDefinition
Title: "DTR Client"
Usage: #definition
* id = "dtr-client"
* url = "http://hl7.org/fhir/us/davinci-dtr/ActorDefinition/dtr-client"
* name = "DTRClientActor"
* description = "An app that communicates with a Payer's DTR Server."
* type = #system
* insert CommonActor

Instance: dtr-server-actor
InstanceOf: ActorDefinition
Title: "DTR Server"
Usage: #definition
* id = "dtr-server"
* url = "http://hl7.org/fhir/us/davinci-dtr/ActorDefinition/dtr-server"
* name = "DTRServerActor"
* description = "A Payer server that provides DTR services to a client."
* type = #system
* insert CommonActor

RuleSet: CommonActor
* status = #active
* experimental = false
* date = "2022-11-25"