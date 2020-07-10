#!/bin/bash

#compocid=
#vcnid=
#Input is taken from vcnlist.txt file from current directory ('vcnid compartmentid')

rm -f pvtip.sh
wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pvtip.sh
chmod +x pvtip.sh 

while read -r arg_1 arg_2 ; do
    echo "${arg_1} ${arg_2}"
    vcnsub=$(oci network subnet list --compartment-id ${arg_2} --vcn-id ${arg_1})
    sublist=$(echo $vcnsub | jq -r '.data[] | ."id"') 
    for sub in $sublist; do ./pvtip.sh $sub ; done
done < vcnlist.txt
cp vcn_dnshost.txt vcn_dnshost_full.txt
sed -i '/null/d' vcn_dnshost.txt
echo 'DNS host list populated in vcn_dnshost.txt'
cat vcn_dnshost.txt
