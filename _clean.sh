#!/bin/bash
rm -rf temp/
rm -rf output/
shopt -s extglob
cd src-generated/
rm -rf !(org.hl7.fhir.igpublisher.jar)
cd ..