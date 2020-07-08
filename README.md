# oci_dnshostlist
oci_dnshostlist

'''
compocid=
vcnid=

wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pvtip.sh
chmod +x pvtip.sh 

vcnsub=$(oci network subnet list --compartment-id $compocid --vcn-id $vcnid)

sublist=$(echo $vcnsub | jq -r '.data[] | ."id"') 
for sub in $sublist; do ./pvtip.sh $sub ; done

'''

