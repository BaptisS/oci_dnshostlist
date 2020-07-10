#!/bin/bash

#compocid=
#vcnid=

#rm -f pvtip.sh
#wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pvtip.sh
#chmod +x pvtip.sh 

vcnsub=$(oci network subnet list --compartment-id $2 --vcn-id $1)

sublist=$(echo $vcnsub | jq -r '.data[] | ."id"') 
for sub in $sublist; do ./pvtip.sh $sub ; done
