<div class="new-content" markdown="1">
Some of the implementation expectations related to DTR are not conformance expectations that relate to the specification itself, but rather business practices that will need to be in place within and amongst the organizations that implement the specification.  This section describes considerations that should be taken into account as part of establishing such agreements and practices, whether done on a site-by-site basis, or as part of a network organization.

### Guidelines for estimated time to complete a DTR questionnaire
#### Assumptions:
1.	Patient information is available and provided
2.	Ordering provider information is available and provided
3.	Orders are available and provided

#### Guidelines for timing:
1.	Auto: questions that will normally be completed by pre-population via 21st Century FHIR APIs required by current EHR certification or equivalent EHR capability and (average review time of 5 seconds each)
2.	Yes/No: yes/no question (average answer time of 5 seconds each)
3.	Picklist: questions  that will normally not be pre-populated, SHOULD be answered 90% of the time from a predefined picklist supported by typeahead for long lists and allows for occasional text entries (average answer time of 5 seconds each)
4.	Text: questions that require textual answers
    * Simple condition (“Asthma”): ~3–5 seconds
    * Multiple or complex conditions (“Type 2 diabetes with neuropathy”): ~15–25 seconds
    * Multiple lines (8-15 seconds per lime)
5.	Att: Attestation could Yes/No, Picklist, Text
6.	SHOULD be clinical questions but may include administrative questions if necessary to select appropriate clinical questions.
7.	May have additional questions as long as they are clearly indicated as administrative and the option to suspend after the above questions are completed


### Additional Considerations
* The 'SHOULD' conformance requirement [spc-1](specification.html#spc-1) is likely to become a 'SHALL' in a future release of this specification.
</div>
