<link rel="stylesheet" type="text/css" href="formatting.css" />

As implementers get closer to the regulatory deadline, new voices have been joining the project calls and submitting feedback via Jira that call into question some of the foundational assumptions made in the implementation guides.  The project has been holding special calls to discuss a number of these issues, looping in a larger portion of the community to engage in the discussion.  However, at the time the content of this specification was being prepared for ballot, resolution had not yet been reached on most of the topics.  Postponing the ballot until these topics were landed would mean the updated specification that corrects a number of errors in the original specification and makes other useful clarificaitons and enhancements to the specification would be released too late to be useful to most implementers working to meet the CMS January 2027 regulatory deadline.  For this reason, the ballot will be occurring while these issues are still unresolved.

However, there remains a possibility that some of these issues could be addressed before final publication of the balloted specification.  To ensure balloters have an opportunity to evaluate the potential options and to express their opinion on the issues, they are laid out here.  If you are uncomfortable with any of the candidate resolutions to any of the issues laid out here, feel free to vote negative on the issue(s) in question.  You can consider withdrawing your negative votes when final resolutions are landed, provided you are comfortable with the resolution.

**NOTE 1:** It is unlikely that all of these issues will be addressed in the DTR 2.2.0 release, and it's possible that there will be no changes to the specification from any of these issues and that they will either be deferred to some future (possibly post 2026) release, or they might be closed by the submitter or otherwise resolved with no change.  

**NOTE 2:** If there is a resolution to one or more of these issues that involves making a change to the specification that is substantively different than any of the proposed dispositions, there will be an announced public review period of the specification with the proposed change applied to give the community an opportunity to evaluate and provide feedback on the new option prior to publication.

### Expectations for interoperability

There has been discussion about the use of 'supplemental' guides and general interoperability expectations for DTR implementations.  This has manifested in the following ticket:

* [FHIR-50465](https://jira.hl7.org/browse/FHIR-50465) - Need guidance on supplemental guides

#### Assessment and Discussion
  * If requirements can vary between communication partners in a manner that requires software to be written differently based on which system is being connected to, it will be impossible to scale interoperability to ensure that all clinical systems can talk to all payers
  * Some implementers have expressed an intention to only support interoperability with a limited set of 'large volume' partners based on this scaling issue.  This will result in an inbalance in the marketplace where large volume partners will have interoperability capabilities not available to smaller organizations and may impede the ability of smaller payers to meet metrics, as well as disadvantaging patients with such coverage
  * There is concern that strict interoperability requirements may mean that requirements discovered late in the process will not be able to be met without breaking conformance, which could create a no-win situation where either metrics can't be met because compliance prohibits successful interoperability, or successful interoperability results in non-compliance.


#### Options
Potential resolutions of these issues:
  * Leave the specifications loose like they are, meaning that implementations can impose additional requirements necessitating code changes for interoperability with that partner.
  * Tighten the specifications to prohibit requiring data elements beyond the specification or other otherwise not properly handling conformant instances, while still allowing exceptions where interoperability requirements have been approved through a change request and continuous-integration build update process.

