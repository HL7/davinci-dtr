# davinci-dtr
This repository contains the materials to build the [HL7 Da Vinci](http://www.hl7.org/about/davinci/) Documentation Templates and Rules (DTR) Implementation Guide (IG).

The implementation guide is built with the [FHIR IG Publishing Tool](https://www.hl7.org/fhir/downloads.html) and [FHIR Shorthand](https://build.fhir.org/ig/HL7/fhir-shorthand/index.html).

Materials for this IG are being developed by the HL7 Da Vinci Project in collaboration with the HL7 Clinical Decision Support (CDS) Work Group.

## To Build
From a MacOS terminal window:`$./_genonce.sh`<br>
From a Windows terminal window:`$./_genonce.bat`

>Note: For local builds [`publisher.jar`](https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar) needs to be in the `input-cache` folder

## To View/Run Local
Launch`output/index.html`in a browser.<br> 
> Note: This assumes you are using a web server, e.g. [`Live Server`](https://github.com/ritwickdey/live-server-web-extension)

## Viewing the Implementation Guide
To view the actual IG, you can visit the [Continuous Build of the DTR IG](http://build.fhir.org/ig/HL7/davinci-dtr/index.html).

## Balloting
>This IG will be a ballot as a part of the early HL7 May 2022 ballot cycle. Interested parties should sign up for participation at the [HL7 Ballot Desktop](http://www.hl7.org/ctl.cfm?action=ballots.home).
