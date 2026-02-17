Instance: DTR-ValueSet-expand
InstanceOf: OperationDefinition
Usage: #definition
* name = "DTRValuesetExpansion"
* title = "DTR Value Set Expansion"
* status = #active
* kind = #operation
* base = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"
* date = "2025-07-14T08:00:00+11:00"
* description = "The definition of a value set is used to create a simple collection of codes suitable for use for data entry or validation. §oper-4^dtr-client^exchange:The operation is called at the system level and a url **SHALL** be provided.§  §oper-5^dtr-client^exchange:Additionally, the valueset **SHALL** use the current date as the expansion date and **SHALL** include only active codes.§ An expanded value set will be returned, or an OperationOutcome with an error message. 

For more details regarding this operation, see the FHIR R4 [`$expand`](https://hl7.org/fhir/R4/operation-valueset-expand.html) operation definition."
* code = #expand
* resource = #ValueSet
* system = false
* type = true
* instance = false
* parameter[0].name = #url
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A canonical reference to a value set. The server must know the value set (e.g. it is defined explicitly in the server's value sets, or it is defined implicitly by some code system known to the server"
* parameter[=].type = #uri
//-------------------------------------------------------------------------------
// * parameter[+].name = #valueSet
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "The value set is provided directly as part of the request. Servers may choose not to accept value sets in this fashion"
// * parameter[=].type = #ValueSet
//-------------------------------------------------------------------------------
// * parameter[+].name = #valueSetVersion
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "The identifier that is used to identify a specific version of the value set to be used when generating the expansion. This is an arbitrary value managed by the value set author and is not expected to be globally unique. For example, it might be a timestamp (e.g. yyyymmdd) if a managed version is not available."
// * parameter[=].type = #string
//-------------------------------------------------------------------------------
// * parameter[+].name = #context
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "The context of the value set, so that the server can resolve this to a value set to expand. The recommended format for this URI is [Structure Definition URL]#[name or path into structure definition] e.g. http://hl7.org/fhir/StructureDefinition/observation-hspc-height-hspcheight#Observation.interpretation. Other forms may be used but are not defined. This form is only usable if the terminology server also has access to the conformance registry that the server is using, but can be used to delegate the mapping from an application context to a binding at run-time"
// * parameter[=].type = #uri
//-------------------------------------------------------------------------------
// * parameter[+].name = #contextDirection
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "If a context is provided, a context direction may also be provided. Valid values are: \n\n* 'incoming': the codes a client can use for PUT/POST operations,  and \n* 'outgoing', the codes a client might receive from the server.\n\nThe purpose is to inform the server whether to use the value set associated with the context for reading or writing purposes (note: for most elements, this is the same value set, but there are a few elements where the reading and writing value sets are different)"
// * parameter[=].type = #code
//-------------------------------------------------------------------------------
* parameter[+].name = #filter
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A text filter that is applied to restrict the codes that are returned (this is useful in a UI context). The interpretation of this is delegated to the server in order to allow to determine the most optimal search approach for the context. The server can document the way this parameter works in TerminologyCapabilities.expansion.textFilter. Typical usage of this parameter includes functionality like:\n\n* using left matching e.g. \"acut ast\"\n* allowing for wild cards such as %, &, ?\n* searching on definition as well as display(s)\n* allowing for search conditions (and / or / exclusions)\n\nText Search engines such as Lucene or Solr, long with their considerable functionality, might also be used. The optional text search might also be code system specific, and servers might have different implementations for different code systems"
* parameter[=].type = #string
//-------------------------------------------------------------------------------
// * parameter[+].name = #date
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "The date for which the expansion should be generated.  if a date is provided, it means that the server should use the value set / code system definitions as they were on the given date, or return an error if this is not possible.  Normally, the date is the current conditions (which is the default value) but under some circumstances, systems need to generate an expansion as it would have been in the past. A typical example of this would be where code selection is constrained to the set of codes that were available when the patient was treated, not when the record is being edited. Note that which date is appropriate is a matter for implementation policy."
// * parameter[=].type = #dateTime
//-------------------------------------------------------------------------------
* parameter[+].name = #offset
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Paging support - where to start if a subset is desired (default = 0). Offset is number of records (not number of pages)"
* parameter[=].type = #integer
//-------------------------------------------------------------------------------
// * parameter[+].name = #count
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Paging support - how many codes should be provided in a partial page view. Paging only applies to flat expansions - servers ignore paging if the expansion is not flat.  If count = 0, the client is asking how large the expansion is. Servers SHOULD honor this request for hierarchical expansions as well, and simply return the overall count"
// * parameter[=].type = #integer
//-------------------------------------------------------------------------------
// * parameter[+].name = #includeDesignations
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether concept designations are to be included or excluded in value set expansions"
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #designation
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "0"
// * parameter[=].max = "*"
// * parameter[=].documentation = "A [token](search.html#token) that specifies a system+code that is either a use or a language. Designations that match by language or use are included in the expansion. If no designation is specified, it is at the server discretion which designations to return"
// * parameter[=].type = #string
//-------------------------------------------------------------------------------
// * parameter[+].name = #includeDefinition
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether the value set definition is included or excluded in value set expansions"
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #activeOnly
// * parameter[=].use = #in
// * parameter[=].min = 1
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether inactive concepts are included or excluded in value set expansions. Note that if the value set explicitly specifies that inactive codes are included, this parameter can still remove them from a specific expansion, but this parameter cannot include them if the value set excludes them"
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #excludeNested
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether or not the value set expansion nests codes or not (i.e. ValueSet.expansion.contains.contains)"
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #excludeNotForUI
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether or not the value set expansion is assembled for a user interface use or not. Value sets intended for User Interface might include ['abstract' codes](codesystem.html#status) or have nested contains with items with no code or abstract = true, with the sole purpose of helping a user navigate through the list efficiently, where as a value set not generated for UI use might be flat, and only contain the selectable codes in the value set. The exact implications of 'for UI' depend on the code system, and what properties it exposes for a terminology server to use. In the FHIR Specification itself, the value set expansions are generated with excludeNotForUI = false, and the expansions used when generated schema / code etc, or performing validation, are all excludeNotForUI = true."
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #excludePostCoordinated
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Controls whether or not the value set expansion includes post coordinated codes"
// * parameter[=].type = #boolean
//-------------------------------------------------------------------------------
// * parameter[+].name = #displayLanguage
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].documentation = "Specifies the language to be used for description in the expansions i.e. the language to be used for ValueSet.expansion.contains.display"
// * parameter[=].type = #code
//-------------------------------------------------------------------------------
// * parameter[+].name = #exclude-system
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "*"
// * parameter[=].documentation = "Code system, or a particular version of a code system to be excluded from the value set expansion. The format is the same as a canonical URL: [system]|[version] - e.g. http://loinc.org|2.56"
// * parameter[=].type = #canonical
//-------------------------------------------------------------------------------
// * parameter[+].name = #system-version
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "*"
// * parameter[=].documentation = "Specifies a version to use for a system, if the value set does not specify which one to use. The format is the same as a canonical URL: [system]|[version] - e.g. http://loinc.org|2.56"
// * parameter[=].type = #canonical
//-------------------------------------------------------------------------------
// * parameter[+].name = #check-system-version
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "*"
// * parameter[=].documentation = "Edge Case: Specifies a version to use for a system. If a value set specifies a different version, an error is returned instead of the expansion. The format is the same as a canonical URL: [system]|[version] - e.g. http://loinc.org|2.56"
// * parameter[=].type = #canonical
//-------------------------------------------------------------------------------
// * parameter[+].name = #force-system-version
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "*"
// * parameter[=].documentation = "Edge Case: Specifies a version to use for a system. This parameter overrides any specified version in the value set (and any it depends on). The format is the same as a canonical URL: [system]|[version] - e.g. http://loinc.org|2.56. Note that this has obvious safety issues, in that it may result in a value set expansion giving a different list of codes that is both wrong and unsafe, and implementers should only use this capability reluctantly. It primarily exists to deal with situations where specifications have fallen into decay as time passes. If the value is override, the version used SHALL explicitly be represented in the expansion parameters"
// * parameter[=].type = #canonical
//-------------------------------------------------------------------------------
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The result of the expansion. Servers generating expansions SHOULD ensure that all the parameters that affect the contents of the expansion are recorded in the ValueSet.expansion.parameter list"
* parameter[=].type = #ValueSet
