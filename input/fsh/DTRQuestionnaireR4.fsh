/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/

Profile:        DTRQuestionnaire
Parent:         CQF-Questionnaire
Id:             dtr-questionnaire-r4
Title:          "DTR Questionnaire R4"
Description:    "The Questionnaire resource is used to represent the information needs that a payer has to satisfy for their documentation requirements and/or rules."

* ^meta.versionId = "7"
* ^meta.lastUpdated = "2019-03-08T17:01:59.000+00:00"
* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The Questionnaire resource is used to represent the information needs that a payer has to satisfy their documentation requirements and/or rules.</p></div>"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-12-23T02:27:35+00:00"

* extension 1..*
//// NOTE: temporarily commented this line to avoid this erroneous compiler error:
//// "Sushi: error Type constraint on extension would eliminate all types on slice Questionnaire.extension:library"
//// Once the compiler bug is fixed, will need to uncomment the line
//* extension only $CQFLIB
* extension ^base.path = "DomainResource.extension"
* extension ^base.min = 0
* extension ^base.max = "*"

* status 1..1

* experimental 0..0

* date 1..1

* contact 1..*

* item 1..*
* item obeys dtrq-1
* item.extension 0..1
* item.extension only $CQFEXP
* item.extension ^base.path = "Questionnaire.item.extension"
* item.extension ^base.min = 0
* item.extension ^base.max = "*"
