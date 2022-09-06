#!/bin/bash

module load vg/1.41.0
cd /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3

data_gam=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/map2graph/*vgmap_4Sim.gam
input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/map2graph
output=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_nofilcall_allR_R10S3
graph_vg=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.vg
graph_xg=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.xg


#compute snarls
#vg snarls $graph_xg >$output/${graph_xg}.snarls

for f in $data_gam
do 

x=$(basename $f vgmap_4Sim.gam)
echo ${x}


#Augment augment the graph with all variation from the GAM, saving to aug.vg
### augment the graph with all variation from the GAM 
### that implied by soft clips, saving to aug.vg
### *aug-gam contains the same reads as aln.gam but mapped to aug.vg

vg augment -t 48 $graph_vg $input/${x}vgmap_4Sim.gam -A $output/${x}nofilt_aug.gam >$output/${x}nofilt_aug.vg

#index the augmented graph
vg index -t 48 $output/${x}nofilt_aug.vg -x $output/${x}nofilt_aug.xg

## Compute the all read support from the augmented gam (ignoring qualitiy < 5)
vg pack -t 48 -x $output/${x}nofilt_aug.xg -g $output/${x}nofilt_aug.gam  -Q 5 -o $output/${x}nofilt_aug_allR.pack

#call variant
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug_allR.pack >$output/${x}nofilt_aug_allR.pack.vcf

#call variant snarl using the same coordinate
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug_allR.pack -a >$output/${x}nofilt_aug_allR.pack_snarls.vcf

done 
