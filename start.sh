#!/bin/bash

MYIP=$(ip -o -4 addr show eth0 scope global | awk '{print $4;}' | cut -d/ -f 1)
echo "Starting bgp-injector with parameters (myip, peerip, asn):", $MYIP, $PEERIP, $ASN
perl bgp_simple.pl -myas $ASN -myip $MYIP -peeras $ASN -peerip $PEERIP -p myroutes.txt -holdtime 300
