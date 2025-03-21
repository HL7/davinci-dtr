### Downloads
* This full [DTR Implementation Guide](full-ig.zip)
* FHIR R4 DTR Resource Definitions [(JSON)](definitions.json.zip) [(XML)](definitions.xml.zip) [(TTL)](definitions.ttl.zip)
* FHIR R4 DTR Profile Examples [(JSON)](examples.json.zip) [(XML)](examples.xml.zip) [(TTL)](examples.ttl.zip)
* FHIR R4 DTR [Validator Pack](validator-hl7.fhir.us.davinci-dtr.pack)
* The full [FHIR R4 core]({{site.data.fhir.path}}fhir-spec.zip) specifications and other [FHIR core downloads]({{site.data.fhir.path}}downloads.html)
* A [validator](https://fhir.github.io/latest-ig-validator/org.hl7.fhir.validator.jar) that can be used to check FHIR resource instance validity and [instructions on how to use it](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)

#### Package File
The following package file includes an NPM  (Node Package Manager) package file used by many of the FHIR tools. It contains all the value sets, profiles, extensions, list of pages and URLs in the implementation guide (IG), etc. defined as part of this version of the IG. This file should be the first choice whenever generating any implementation artifacts since it contains all of the rules about what makes the profiles valid. Implementers will still need to be familiar with the content of the specification and profiles that apply to make a conformant implementation. 

See the overview on validating <a href="http://hl7.org/fhir/R4/validation.html">FHIR profiles and resources</a>:

* [Package](package.tgz)
* [Clinical Quality Language (CQL)](https://hl7.org/fhir/uv/sdc/STU3/full-ig.zip) specification
* [SMART on FHIR](http://www.hl7.org/fhir/smart-app-launch/full-ig.zip) specification

#### Cross Version Analysis

{% include cross-version-analysis.xhtml %}
