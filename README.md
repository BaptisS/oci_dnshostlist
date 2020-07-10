# oci_dnshostlist
oci_dnshostlist

This script helps creation of a single dns hostname list including all instances provisionned accross multiple VCNs. 

1- Sign-in to the OCI console using an user account with read permission over 'network-family' components in desired compartments. 


2- Start a ClousShell Instance. 

![PMScreens](https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pics/StartCloudsh.JPG)


3- Create a file named ***‘'vcnlist.txt'’*** containing the list of desired VCNs OCID and their respective compartments OCID. 

![PMScreens](https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pics/cloudsh.JPG)

```
vi vcnlist.txt
```

Fill the file with your VCN list in the form below : 

'VCN1 OCID'<space>'Compartment1 OCID' 
'VCN2 OCID'<space>'Compartment1 OCID' 
'VCN3 OCID'<space>'Compartment2 OCID' 
  
  
![PMScreens](https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/pics/vcnlist.txt.JPG)

Save and Exit file editor. 

```
[esc] :wq!
```



4- Copy/paste the following commands :  


```
rm -f vcnhostlist.sh
wget https://raw.githubusercontent.com/BaptisS/oci_dnshostlist/master/vcnhostlist.sh
chmod +x vcnhostlist.sh
./vcnhostlist.sh


```
