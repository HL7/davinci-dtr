<link rel="stylesheet" type="text/css" href="formatting.css" />

### Da Vinci
{% include davinci.md %}

### The Da Vinci DTR project
This standard aims to streamline the process of collecting patient documentation required by health insurance payers for purposes like prior authorization and claims processing. It enables payers to express their documentation requirements in a computable format using FHIR Questionnaires, allowing providers to easily gather and submit necessary information.

The standard automates data collection by leveraging [Clinical Quality Language](https://build.fhir.org/ig/HL7/cql) (CQL) to extract existing patient data from EHRs, reducing manual entry and errors. It supports both pre-defined questionnaires and adaptive forms that adjust based on user responses.

Key features include the use of FHIR Questionnaires for defining documentation requirements, CQL for data extraction and logic implementation, and [SMART on FHIR](https://build.fhir.org/ig/HL7/smart-app-launch) integration for seamless EHR compatibility.

This approach benefits providers by reducing administrative burden, payers by standardizing documentation requirements, and patients by potentially expediting access to care. It also creates opportunities for EHR vendors and app developers to integrate documentation functionality into their systems.  The standard aligns with [US Core](https://build.fhir.org/ig/HL7/US-Core) Implementation Guides and addresses HIPAA privacy regulations by emphasizing limited data access for specific documentation needs.

Further details about the project, including minutes of meetings can be found on the [DTR project Confluence](https://confluence.hl7.org/pages/viewpage.action?pageId=21857604) page

### Credits
<div markdown="1" class="pbox">
<br>
<b>Technical Lead and Primary Author:</b>  
<ul>
    <li>Jeff Brown (Lantana Consulting Group)</li>
</ul>
<br>
<b>Da Vinci Project Coordination and Core Team:</b> 
<ul>
    <li>Robert Dieterle (EnableCare, LLC)</li>
    <li>Viet Nguyen (Stratametrics, LLC)</li>
    <li>Crystal Kallem (Point of Care Partners)</li>
    <li>Vanessa Candelora (Point of Care Partners)</li>
    <li>Jocelyn Keegan (Point of Care Partners)</li>
    <li>Dana Marcelonis (Point of Care Partners)</li>
</ul>
<br/>
<b>Technical Support and Guidance:</b> 
<ul>
    <li>Lloyd McKenzie (Dogwood Consulting)</li>
</ul>
<br>
<b>Da Vinci Member Leadership Provided by:</b> 
<ul>
    <li>Mike Gould (ZeOmega)</li>
    <li>Rajesh Godavarthi (MCG)</li>
    <li>Anna Taylor (MultiCare Connected Care)</li>
    <li>David DeGandi (Cambia)</li>
    <li>Craig Knier (Change Healthcare)</li>
</ul>
<br>
<b>Special Thanks...</b>
<br>To the numerous Da Vinci members and community who have participated on conference calls, provided reviews and feedback, supported sample data gathering, reference implementation development, and testing including, but not limited to:
<ul>
    <li>Larry Decelles, Andy Gregorowicz, Cole Springate-Combs, Pat LaRocque, Keeyan Ghoreshi, Yolanda Liu, Robi Scalfani (The MITRE Corporation) </li>
    <li>Kyle Johnsen, Spencer Utley, Fred Switzer, and Matt Varghese (Epic)</li>
    <li>Sreekanth Puram (Mettle Solutions)</li>
    <li>Celine Lefebvre, Heather McComas (AMA)</li>
    <li>Anup Mahansaria, Peni Moxim, Mariel Brechner (Evernorth)</li>
    <li>Carie Hammond and Ryan Moehrke (AEGIS)</li>
    <li>Brian Poteet (Edifecs)</li>
    <li>James Bound (Cognizant)</li>
    <li>Hans Buitendijk (Oracle)</li>
    <li>Richard Abercrombie (Palmetto GBA)</li>
    <li>Tom Kakanowski, Brenin Rhodes, David Chisholm (Smile Digital Health)</li>
    <li>Chris Cioffi (Elevance Health)</li>
    <li>Rob Brull, Brian Lind (Infor)</li>
    <li>Balaji Narayanan (Onyx)</li>
    <li>Joshua Lamb (Optum)</li>
    <li>Rachel Foerster (CAQH CORE)</li>
    <li>Sreenivas Reddy Mallipeddi (MCG)</li>
    <li>Rick Geimer (Lantana Consulting Group)</li>
</ul>
</div>

This IG was developed under the auspices of the Clinical Decision Support work group.

----
If you are interested in participating in the DTR project and Da Vinci: information about our calls, minutes of past discussions, and other information can be found on our [HL7 Da Vinci Confluence page]( https://confluence.hl7.org/display/DVP/Da+Vinci+Use+Cases).

