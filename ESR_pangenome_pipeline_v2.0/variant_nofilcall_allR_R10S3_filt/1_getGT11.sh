#!/bin/bash 
#module load python/3.8.10
module load vcftools/0.1.16

cd /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt 

input_data=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/*nofilt_aug_allR.pack.vcf
input_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt
output_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt

for f in $input_data

do

x=$(basename $f nofilt_aug_allR.pack.vcf)

echo ${x}


head -20 ${x}nofilt_aug_allR.pack.vcf >${x}nofilt_aug_allR.pack.vcf_head

awk '$7=="PASS"' ${x}nofilt_aug_allR.pack.vcf >${x}nofilt_aug_allR.pack_PASS.vcf
echo ${x} PASS >>${x}_stats
wc -l ${x}nofilt_aug_allR.pack_PASS.vcf >>${x}_stats 


cat ${x}nofilt_aug_allR.pack.vcf_head >${x}nofilt_aug_allR.pack_PASS_head.vcf
cat ${x}nofilt_aug_allR.pack_PASS.vcf >>${x}nofilt_aug_allR.pack_PASS_head.vcf

vcftools --extract-FORMAT-info GT --vcf ${x}nofilt_aug_allR.pack_PASS_head.vcf --out ${x}nofilt_aug_allR.pack_PASS_head

sed '1d' ${x}nofilt_aug_allR.pack_PASS_head.GT.FORMAT >${x}nofilt_aug_allR.pack_PASS_head.GT1

paste ${x}nofilt_aug_allR.pack_PASS.vcf ${x}nofilt_aug_allR.pack_PASS_head.GT1 > ${x}nofilt_aug_allR.pack_PASS_nohead.GT1

awk '$NF=="1/1"' ${x}nofilt_aug_allR.pack_PASS_nohead.GT1 >${x}nofilt_aug_allR.pack_PASS_nohead_GT11.vcf
echo ${x} PASS GT11 >>${x}_stats 
wc -l ${x}nofilt_aug_allR.pack_PASS_nohead_GT11.vcf >> ${x}_stats 

awk '$NF!="1/1"' ${x}nofilt_aug_allR.pack_PASS_nohead.GT1 >${x}nofilt_aug_allR.pack_GTerror.vcf
wc -l ${x}nofilt_aug_allR.pack_GTerror.vcf >> ${x}_stats 

cat ${x}nofilt_aug_allR.pack.vcf_head >${x}nofilt_aug_allR.pack_PASS_head_GT11.vcf
cat ${x}nofilt_aug_allR.pack_PASS_nohead_GT11.vcf >>${x}nofilt_aug_allR.pack_PASS_head_GT11.vcf 

cat ${x}nofilt_aug_allR.pack.vcf_head >${x}nofilt_aug_allR.pack_PASS_head_GTerror.vcf
cat ${x}nofilt_aug_allR.pack_GTerror.vcf >>${x}nofilt_aug_allR.pack_PASS_head_GTerror.vcf


rm ${x}nofilt_aug_allR.pack.vcf_head ${x}nofilt_aug_allR.pack_PASS.vcf ${x}nofilt_aug_allR.pack_PASS_nohead_GT11.vcf ${x}nofilt_aug_allR.pack_PASS_nohead.GT1 ${x}nofilt_aug_allR.pack_PASS_head.vcf ${x}nofilt_aug_allR.pack_PASS_head.GT.FORMAT ${x}nofilt_aug_allR.pack_PASS_head.GT1 ${x}nofilt_aug_allR.pack_GTerror.vcf 

done


