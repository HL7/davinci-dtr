//////////////////////////////
// Code Systems and Value Sets
//////////////////////////////
Alias: $local = http://hl7.org/fhir/ValueSet/

ValueSet: OriginationValueSet
Id: Origination-vs
Title: "Origination Value Set"
Description: "Codes describing the possible origination of information."

* include $local#auto "Information was auto-populated"
* include $local#auto-with-override "Information was auto-populated but overridden by a human"
* include $local#manual "Information was manually entered by a human"

* ^experimental = false