#!/bin/bash

module load bcftools/1.8

input_data=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/*nofilt_aug_allR.pack_PASS_head_GT11.vcf 
input_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/
output_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/merge_vcf_tree

for f in $input_data

do 

x=$(basename $f nofilt_aug_allR.pack_PASS_head_GT11.vcf)

echo ${x}

cut -f 1-10 $input_folder/${x}nofilt_aug_allR.pack_PASS_head_GT11.vcf > $input_folder/${x}.vcf



bcftools view $input_folder/${x}.vcf  -Oz -o $input_folder/${x}.vcf.gz
bcftools index $input_folder/${x}.vcf.gz
done

bcftools merge --force-samples  $input_folder/*.vcf.gz > $output_folder/6samples_merge.vcf



