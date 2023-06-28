//////////////////////////////
// Code Systems and Value Sets
//////////////////////////////

CodeSystem: OriginCodeSystem
Id: Origin-cs
Title: "Information Origin Code System"
Description: "Codes describing the possible origination of information."
* #auto "Information was auto-populated"
* ^caseSensitive = true
* ^experimental = false

* #override "Information was auto-populated but overridden by a human"
* ^caseSensitive = false
* ^experimental = false

* #manual "Information was manually entered by a human"
* ^caseSensitive = false
* ^experimental = false


Alias: $local = http://hl7.org/fhir/ValueSet/Origin-vs

ValueSet: OriginValueSet
Id: Origin-vs
Title: "Information Origin Value Set"
Description: "Codes describing the possible origination of information."

* include codes from system OriginCodeSystem
* ^experimental = false

// * include $local#auto "Information was auto-populated"
// * include $local#override "Information was auto-populated but overridden by a human"
// * include $local#manual "Information was manually entered by a human"

