### Downloads
* The full [DTR Implementation Guide](full-ig.zip)
* FHIR R4 DTR Resource Definitions [(JSON)](definitions.json.zip) [(XML)](definitions.xml.zip) [(TTL)](definitions.ttl.zip)
* FHIR R4 DTR Profile Examples [(JSON)](examples.json.zip) [(XML)](examples.xml.zip) [(TTL)](examples.ttl.zip)
* FHIR R4 DTR [Validator Pack](validator-hl7.fhir.us.davinci-dtr.pack)

#### Package File
The following package file includes an NPM  (Node Package Manager) package file used by many of the FHIR tools. It contains all the value sets, profiles, extensions, list of pages and URLs in the implementation guide (IG), etc. defined as part of this version of the IG. This file should be the first choice whenever generating any implementation artifacts since it contains all of the rules about what makes the profiles valid. Implementers will still need to be familiar with the content of the specification and profiles that apply to make a conformant implementation. See the overview on validating <a href="http://hl7.org/fhir/R4/validation.html">FHIR profiles and resources</a>:

* [Package](package.tgz)
* [Clinical Quality Language (CQL)](https://hl7.org/fhir/uv/sdc/STU3/full-ig.zip) specification
* [SMART on FHIR](http://www.hl7.org/fhir/smart-app-launch/full-ig.zip) specification

#### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

<!-- #### Dependency Table

{% include dependency-table.xhtml %}

#### Globals Table

{% include globals-table.xhtml %}

#### IP Statements

{% include ip-statements.xhtml %} -->
