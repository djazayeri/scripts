#!/bin/bash

echo "Which module do you want to build?"
echo "1 = referenceapplication"
echo "2 = referencemetadata"
echo "3 = emrapi"
echo "4 = coreapps"
echo "5 = uicommons"
echo "6 = webservices.rest"
read number

case $number in
    1 ) module="referenceapplication" ;;
    2 ) module="referencemetadata" ;;
    3 ) module="emrapi" ;;
    4 ) module="coreapps" ;;
    5 ) module="uicommons" ;;
    6 ) module="webservices.rest" ;;
    * )	module="$number" ;;
esac

echo "Building $module"

cd openmrs-module-$module
mvn clean install -DskipTests

rm ~/.OpenMRS/modules/$module-*.omod
cp omod/target/$module-*.omod ~/.OpenMRS/modules

cd ..