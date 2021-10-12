The table below is guidance that SHOULD be used when using values sets and code systems in DTR. This can also be considered a best practice.

<table border="1">
  <tr>
    <th></th>
    <th>CQL and Questionnaire terminology usage</th>
    <th>Comment</th>    
  </tr>
  <tr>
    <td>1</td>
    <td>No value set, embed the codes. </td>
    <td>This is OK if there is no need to reuse the codes. </td>   
  </tr>
  <tr>
    <td>2</td>
    <td>Pass a value set in the package with the expansion already in place. </td>
    <td>You've got the value set in-line with an expansion if the set of the codes is reasonably small. So, no need for a terminology service. </td>    
  </tr>
  <tr>
    <td>3</td>
    <td>Pass value set in place, but recipient needs to run the expansion or ask a terminology server to do the expansion. </td>
    <td>You've got a composed value set, but no expansion (probably because the value set is too large to embed/expand inline). So, you need to ask a terminology service to find out what the set of codes are. By providing the filters to limit the size of codes returned for the value sets. 
    </td>    
  </tr>
  <tr>
    <td>4</td>
    <td>Value set reference and recipient need to retrieve the value set and run expand or invoke a terminology server somewhere else to run the expansion. </td>
    <td>You don't have the value set (e.g., probably because of licensing issues) - you need to look for it on a registry/terminology server, resolve the canonical URL to retrieve it, then cache the value set(s) if allowed by the code system(s). Also, once you get the value set, you might still need to expand it like scenario (3) above. </td>    
  </tr>
</table>

Note: According to the [ValueSet Identification](https://www.hl7.org/fhir/valueset.html#ident), it is common practice to copy (cache) value sets locally, most references to value sets use the canonical URL. 
 