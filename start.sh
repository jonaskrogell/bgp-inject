#!/bin/bash

MYIP=$(hostname -i)
perl bgp_simple.pl -myas $ASN -myip $MYIP -peeras $ASN -peerip $PEERIP -p myroutes.txt -holdtime 300
