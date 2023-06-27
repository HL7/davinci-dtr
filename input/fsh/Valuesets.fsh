//////////////////////////////
// Code Systems and Value Sets
//////////////////////////////
Alias: $local = http://hl7.org/fhir/ValueSet/

ValueSet: OriginValueSet
Id: Origin-vs
Title: "Origin Value Set"
Description: "Codes describing the possible origination of information."

* include $local#auto "Information was auto-populated"
* include $local#override "Information was auto-populated but overridden by a human"
* include $local#manual "Information was manually entered by a human"

* ^experimental = false