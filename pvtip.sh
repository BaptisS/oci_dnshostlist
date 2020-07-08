#!/bin/bash

subname=$(oci network subnet get --subnet-id $1)
#echo $subname | jq -r '.data[] | ."subnet-domain-name"' >> $1.txt
subnetname=$(echo $subname | jq -r '.[] | ."subnet-domain-name"')

pvtip=$(oci network private-ip list --subnet-id $1)
#echo $pvtip | jq '[.data[] | {hostname: ."hostname-label", ipaddr: ."ip-address", subnetid: ."subnet-id"}]' >> $1.txt

finlist=$(echo $pvtip | jq '[.data[] | {hostname: ."hostname-label", ipaddr: ."ip-address", subnetid: ."subnet-id"}]')
echo $finlist | jq -r --arg subnetname "$subnetname" '.[] | "\(.hostname)\t\($subnetname)\t\(.ipaddr)"' >> VCN.txt
