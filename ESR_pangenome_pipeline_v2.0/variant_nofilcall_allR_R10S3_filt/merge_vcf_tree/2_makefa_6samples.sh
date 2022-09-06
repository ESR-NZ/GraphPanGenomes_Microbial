#!/bin/bash

cd /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/merge_vcf_tree
#mv 6samples_merge_2_samlen_2vaSNPsRf0.tab 6samplesSNPs
data=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3_filt/merge_vcf_tree/6samplesSNPs
#transit colum and row
awk '{for(i=1;i<=NF;i++)a[NR,i]=$i}END{for(i=1;i<=NF;i++){for(j=1;j<=NR;j++)printf a[j,i]" ";printf "\n"}}' $data>${data}.tr 
tail -6 ${data}.tr >${data}.tr_sample
sed 's/ /\t/g' ${data}.tr_sample >${data}.tr_sample_tab
mergeID with tr_tab
perl mergefile_hash.pl 6samples_RID_IDs ${data}.tr_sample_tab  > ${data}.tr_sampleID_tab
awk -v OFS="\t" '$1=$1' ${data}.tr_sampleID_tab > ${data}.tr_sampleID_tab_1
cut -f 2,4-50000 ${data}.tr_sampleID_tab_1 >${data}_rename_tab
perl tab2fasta_6samples.pl ${data}_rename_tab >${data}_rename_tab_fa
#awk  '{gsub(" ","",$0); print;}' ${data}_rename_tab_fa >${data}.fa


