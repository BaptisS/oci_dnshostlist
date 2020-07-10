# oci_dnshostlist
oci_dnshostlist

```
compocid=
vcnid=

rm -f pvtip.sh
wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pvtip.sh
chmod +x pvtip.sh 

vcnsub=$(oci network subnet list --compartment-id $compocid --vcn-id $vcnid)

sublist=$(echo $vcnsub | jq -r '.data[] | ."id"') 
for sub in $sublist; do ./pvtip.sh $sub ; done

```

---------------------------------------------------------------------
Using a VCN List file (vcnlist.txt) as source. ['vcnid compartmentid'] 

```
rm -f vcnhostlist.sh
wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/vcnhostlist.sh
chmod +x vcnhostlist.sh
./vcnhostlist.sh

```
