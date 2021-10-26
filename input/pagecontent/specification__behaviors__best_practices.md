<blockquote class="stu-note">
<p>
Note: Best Practices is tentative because it has not been voted on yet. For more details regarding the status see: <a href="https://jira.hl7.org/browse/FHIR-34077">FHIR-34077</a>
</p>
</blockquote>
<br>
### The use of OIDs

If OIDs are used they SHALL be prefixed with urn:oid: per the [OID primitive datatype definition](https://www.hl7.org/fhir/datatypes.html#oid).

### Referencing value sets in Questionnaires

When remote value sets are referenced in Questionnaires, full URLs are recommended. If you are using local value sets a relative path is recommended. 

Note: Expanding a large value set at run time, may slow down your DTR app. In other words having your value set already expanded could give the user a better client side experience.  

### Questionnaires and expressions

When referencing expressions in libraries such as a CQL library, the name of the library should be included.  

e.g., "expression": "\\"LowerLimbProsthesis\\".PhysicalExaminationType"

In this example above LowerLimbProsthesis is the library name and PhysicalExaminationType is the expression name.

### FHIR Library and included CQL

When developing FHIR Libraries that depend on CQL content, the content element SHALL include the data element. Note: The use of the data element requires it to contain a base-64 encoded string per the attachment specification.  

For example, see the below snippet from a FHIR Library:

![FHIR Librbrary snippet](FHIR_Library_snippet.png){:style="float: none;"}

Note: Although the use of url in the content element is valid, using data element should be more interoperable.

