#!/bin/bash

cd openmrs-distro-referenceapplication

mvn clean install -DskipTests -U
if [ -d ~/.OpenMRS/modules ];
then
    rm ~/.OpenMRS/modules/*
else
    mkdir -p ~/.OpenMRS/modules
fi
cp package/target/distro/*.omod ~/.OpenMRS/modules
echo Done copying omods to modules folder

cd ..