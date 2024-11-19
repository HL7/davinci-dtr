<link rel="stylesheet" type="text/css" href="formatting.css" />

Compliance with this implementation guide requires compliance with several profiles, extensions, and value sets.  This page provides an overview of where these artifacts can be found.

The FHIR artifacts used by DTR are organized according to whether the content was developed as part of the US Core implementation guides or are specific to this DTR implementation guide.  As a result, there are 2 different lists of artifacts - one for this *Da Vinci implementation guide* and one for the *US Core implementation guide*.

### Artifact Lists
<table style="border: none;">
  <tr>
    <td style="border: none;"/><td style="border: none;"><a href="artifacts.html">DTR-Specific Artifacts</a></td>
  </tr>
  <tr>
    <td style="border: none;"/><td style="border: none;"><a href="{{site.data.fhir.ver.uscore7}}">US Core 7.0.0 artifacts</a></td>
  </tr>
  <tr>
    <td style="border: none;"/><td style="border: none;"><a href="{{site.data.fhir.ver.uscore6}}">US Core 6.1.0 artifacts</a></td>
  </tr>
  <tr>
    <td style="border: none;"/><td style="border: none;"><a href="{{site.data.fhir.ver.uscore3}}">US Core 3.1.1 artifacts</a></td>
  </tr>
</table>

These FHIR artifacts define the data that can be utilized by DTR Apps when executing CQL, SMART on FHIR, or queries from Payers by means of operations.  (e.g., `Questionnaire`, `QuestionnaireResponse`, `$questionnaire-package`, etc.)

<div markdown="1" class="pbox">
The artifacts are of four types:

* [Profiles]({{site.data.fhir.path}}profiling.html) constrain FHIR resources to reflect DTR requirements
* [Extensions]({{site.data.fhir.path}}extensibility.html) define additional data elements that can be conveyed as part of a resource
* [Code Systems]({{site.data.fhir.path}}codesystem.html) define terminologies to be used in one or more of the profiles
* [Value Sets]({{site.data.fhir.path}}valueset.html) define the specific subsets of both DTR-defined and other code systems that must be (or are recommended to be) used within one or more profile elements
</div>
<br>

For this implementation guide, Must Support means conformance to both the [US Core]({{site.data.fhir.ver.uscore3}}) guidance, as well as the [HRex Implementation Guide](http://build.fhir.org/ig/HL7/davinci-ehrx/) (See this guide's [US Core Implementation Guide](background.html#us-core-implementation-guide) background)