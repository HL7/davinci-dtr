Profile: DTRSupportedPayers
Parent: List
Id: dtr-supported-Payers
Title: "DTR Supported Payers"
Description: "A listing of payer organizations currently supported by the DTR app.  The Payer Identifier used **SHALL** be the same as the ones that are returned by the [endpoint discovery mechanism](https://build.fhir.org/ig/HL7/davinci-ehrx/endpoint-discovery.html) defined in HRex."

* code 0..0
* subject 0..0 
* encounter 0..0

* entry 1..* MS
  * flag 0..0
  * deleted 0..0
  * item MS
  * item only Reference(Organization) 
  * item ^short = "Reference to the supported Organization"
  * item ^type.aggregation = #contained

* emptyReason 0..0