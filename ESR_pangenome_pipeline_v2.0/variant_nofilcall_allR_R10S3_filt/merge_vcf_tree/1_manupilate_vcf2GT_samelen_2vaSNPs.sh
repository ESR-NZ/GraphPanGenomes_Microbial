#!/bin/bash

#s path in the IDs
#s vcf.gz in the IDs  before following process 

module load bcftools/1.8
module load vcftools/0.1.16



input=./variant_nofilcall_allR_R10S3_filt/merge_vcf_tree

for data in 6samples_merge_2.vcf 


do 
x=$(basename $data .vcf)

echo ${x}


head -24 $input/${x}.vcf > ${x}_head24


#get the snps, mnp with same length 

awk -F "\t" 'length($4) == length($5) {print }' $input/${x}.vcf > ${x}_samelen.vcf 
 
awk -F "\t" 'length($4) != length($5) {print }' $input/${x}.vcf > ${x}_nosamelen_nohead.vcf


awk -F "\t" 'length($4)==1 && length($5)==3 {print }' ${x}_nosamelen_nohead.vcf >${x}_nosamelen_nohead_2vaSNPs.vcf


#cat ${x}_head22 >${x}_Nosamelen_head.vcf
#cat ${x}_osamelen_nohead_2vaSNPs.vcf >> ${x}_Nosamelen_2vaSNPS_head.vcf 

grep -vE '#' ${x}_samelen.vcf > ${x}_samelen_nohead.vcf

cat ${x}_samelen_nohead.vcf ${x}_nosamelen_nohead_2vaSNPs.vcf |sort -k2 -n > ${x}_samlen_2vaSNPs.vcf 
cat ${x}_head24 >${x}_samlen_2vaSNPs_head.vcf 
cat ${x}_samlen_2vaSNPs.vcf >>${x}_samlen_2vaSNPs_head.vcf  



#bcftools view ${x}_samelen.vcf -Oz -o $input/${x}_samelen.vcf.gz
#bcftools view ${x}_Nosamelen_2vaSNPS_head.vcf -Oz -o $input/${x}_Nosamelen_2vaSNPS_head.vcf.gz

#bcftools merge --force-samples $input/${x}_samelen.vcf.gz $input/${x}_Nosamelen_2vaSNPS_head.vcf.gz >${x}_samlen_2vaSNPs.vcf


done 

sed 's/.\/.:.:.:.:.:.:.:./0/g' ${x}_samlen_2vaSNPs_head.vcf | sed 's/1\/1:/1:/g' |sed 's/2\/2:/2:/g' > ${x}_samlen_2vaSNPsRf0.vcf

gzip -c ${x}_samlen_2vaSNPsRf0.vcf > ${x}_samlen_2vaSNPsRf0.vcf.gz

zcat ${x}_samlen_2vaSNPsRf0.vcf.gz | vcf-to-tab | sed 's|/||g' > ${x}_samlen_2vaSNPsRf0.tab

 
