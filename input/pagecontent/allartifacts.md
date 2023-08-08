Compliance with this implementation guide requires compliance with several profiles, extensions, and value sets.  This page provides an overview of where these artifacts can be found.

The FHIR artifacts used by DTR are organized according to whether the content was developed as part of the US Core implementation guides or are specific to this DTR implementation guide.

As a result, there are 2 different lists of artifacts - one for this Da Vinci implementation guide and one for the US Core implementation guide.

### Artifact Lists
<table>
  <tr>
    <td><a href="artifacts.html">DTR-Specific Artifacts</a></td>
  </tr>
  <tr>
    <td><a href="http://hl7.org/fhir/us/core/STU3.1.1/">US Core IG</a></td>
  </tr>
</table>

Additional information about the use of these artifacts, Coverage Requirements Discovery (DTR), and the use of US Core can be found in the [Foundational section](foundation.html#profiles).

These FHIR artifacts define the clinical data that can be provided by DTR Clients when invoking CDS hooks, queried (or retrieved using [prefetch](foundation.html#prefetch)) from DTR Clients by DTR Servers and/or returned to client systems by hook services within [cards](cards.html).

The artifacts are of four types:

* [Profiles]({{site.data.fhir.path}}profiling.html) constrain FHIR resources to reflect DTR requirements
* [Extensions]({{site.data.fhir.path}}extensibility.html) define additional data elements that can be conveyed as part of a resource
* [Code Systems]({{site.data.fhir.path}}codesystem.html) define terminologies to be used in one or more of the profiles
* [Value Sets]({{site.data.fhir.path}}valueset.html) define the specific subsets of both DTR-defined and other code systems that must be (or are recommended to be) used within one or more profile elements
