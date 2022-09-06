#!/bin/bash

module load vg/1.41.0

data_gam=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/map2graph/*vgmap_4Sim.gam
input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3
output=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_eachpath_R10S3


#graph_vg=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.vg
#graph_xg=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.xg

#compute snarls
#vg snarls $graph_xg >$output/${graph_xg}.snarls

for f in $data_gam
do 

x=$(basename $f vgmap_4Sim.gam)
echo ${x}


#in order to also consider novel variants from the reads, use the augmented graph and gam (as created in the "Augmentation" example using vg augment -A)
#Augment augment the graph with all variation from the GAM, saving to aug.vg
### augment the graph with all variation from the GAM except 
### that implied by soft clips, saving to aug.vg
### *aug-gam contains the same reads as aln.gam but mapped to aug.vg

#vg augment -t 48 $graph_vg $input/${x}vgmap_4Sim.gam -A $output/${x}nofilt_aug.gam >$output/${x}nofilt_aug.vg

#index the augmented graph
#vg index -t 48 $output/${x}nofilt_aug.vg -x $output/${x}nofilt_aug.xg

## Compute the read support from the augmented gam (ignoring qualitiy < 5
#vg pack -t 48 -x $output/${x}nofilt_aug.xg -g $output/${x}nofilt_aug.gam  -Q 5 -o $output/${x}nofilt_aug.pack


#call variant
#vg call -t 48 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug.pack >$output/${x}nofilt_aug.pack.vcf



#call 
#call variant ingore 0/0
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p NC_neisseria  -k $input/${x}nofilt_aug_allR.pack  >$output/${x}nofilt_aug_allR.pack_R10S3_NC_neisseria.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim1_3k  -k $input/${x}nofilt_aug_allR.pack  >$output/${x}nofilt_aug_allR.pack_R10S3_Sim1_3K.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim2_4k  -k $input/${x}nofilt_aug_allR.pack  >$output/${x}nofilt_aug_allR.pack_R10S3_Sim2_4k.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim3_5k  -k $input/${x}nofilt_aug_allR.pack  >$output/${x}nofilt_aug_allR.pack_R10S3_Sim3_5k.vcf


#call variant including 0/0
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p NC_neisseria  -k $input/${x}nofilt_aug_allR.pack  -a >$output/${x}nofilt_aug_allR_snarls.pack_R10S3_NC_neisseria.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim1_3k  -k $input/${x}nofilt_aug_allR.pack -a >$output/${x}nofilt_aug_allR_snarls.pack_R10S3_Sim1_3k.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim2_4k  -k $input/${x}nofilt_aug_allR.pack  -a >$output/${x}nofilt_aug_allR_snarls.pack_R10S3_Sim2_4k.vcf
vg call -t 60 -m 3,10 $input/${x}nofilt_aug.xg -p Sim3_5k  -k $input/${x}nofilt_aug_allR.pack -a >$output/${x}nofilt_aug_allR_snarls.pack_R10S3_Sim3_5k.vcf
done 
