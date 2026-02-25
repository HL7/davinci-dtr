// =========================================================================================
Instance: SupportedPayers
InstanceOf: dtr-supported-Payers
Description: "An instance of Supported Payers list used in the example resources."
Usage: #example
* contained[0] = Payer1
* contained[+] = Payer2
* status = #current
* mode = #snapshot
* note.text = "The Payer systems supported by this implementation of DTR."
* entry[0].item = Reference(Payer1)
* entry[+].item = Reference(Payer2)

// =========================================================================================
Instance: Payer1
InstanceOf: Organization
Description: "An example fictitious Payer organization used in Supported Payers."
Usage: #inline
// * identifier.system = "http://www.acmeins.org"
* identifier.value = "Acmeins"
* name = "Acme Insurance"
* telecom[0].system = #phone
* telecom[=].value = "+1 555 234 3523"
* telecom[=].use = #mobile

Instance: Payer2
InstanceOf: Organization
Description: "An example fictitious Payer organization used in Supported Payers."
Usage: #inline
// * identifier.system = "http://www.gcgsal.org"
* identifier.value = "gcgsal"
* name = "GC/GS Alabama"
* telecom[0].system = #phone
* telecom[=].value = "+1 555 532 4534"
* telecom[=].use = #mobile