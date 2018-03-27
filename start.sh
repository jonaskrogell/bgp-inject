#!/bin/bash

MYIP=$(hostname -i)
echo "Starting bgp-injector with parameters (myip, peerip, asn):", $MYIP, $PEERIP, $ASN
perl bgp_simple.pl -myas $ASN -myip $MYIP -peeras $ASN -peerip $PEERIP -p myroutes.txt -holdtime 300
