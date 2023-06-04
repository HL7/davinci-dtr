Extension: PayerEndpoint
Id: endpoint
Description: "This extension contains the endpoint for payer services."
* value[x] ^short = "THe URL of the payer endpoint."
* value[x] ^definition = "This contains the canonical url for the payer endpoint, for retrieval of payer resources like the Questionnaire and CQL."
* value[x] only url
* value[x] 1..1

/**************************************************************************************************************/
Alias: $dtr-coverage = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-coverage-r4
Alias: $dtr-devicerequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-devicerequest
Alias: $dtr-medicationrequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-medicationrequest
Alias: $dtr-nutritionorder = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-nutritionorder
Alias: $dtr-servicerequest = http://hl7.org/fhir/us/davinci-dtr/StructureDefinition/dtr-servicerequest

Extension: Context
Id: context
Description: "This extension contains a DTR launch context connected with a QuestionnaireResponse."
* value[x] ^short = "THe launch context connected with a QuestionnaireResponse."
* value[x] ^definition = "This contains the reference to a coverage or 'order' that is tied to the QuestionnaireResponse"
* value[x] 1..
* value[x] only Reference($dtr-coverage or $dtr-devicerequest or $dtr-medicationrequest or $dtr-nutritionorder or $dtr-servicerequest)