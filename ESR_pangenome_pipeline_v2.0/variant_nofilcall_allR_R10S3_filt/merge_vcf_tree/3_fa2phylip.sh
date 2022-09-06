#!/bin/bash

data=./variant_nofilcall_allR_R10S3_filt/merge_vcf_tree/6samplesSNPs

awk  '{gsub(" ","",$0); print;}' ${data}_rename_tab_fa >${data}.fa


perl convertAlignment.pl -i ${data}.fa -o ${data}.phylip -f phylip

#$raxml -s  ${x}.phylip  -m GTRGAMMA -n raxml.out

#$raxml -T 6 -f a -p 12345  -s ${x}.phylip  -x 12345   -m GTRGAMMA -n raxml.out

#$raxml -T 6  -f a  -p 12345 -s ${x}.phylip -x 12345 -# 100 -m  GTRGAMMA -n  ${x}.raxml_bt10.out
