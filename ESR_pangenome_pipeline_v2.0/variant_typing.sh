#!/bin/bash

module load vg/1.41.0

data_gam=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/map2graph/*vgmap_4Sim.gam
input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/map2graph
output=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/variant_typing
graph_xg=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.xg
snarls_file=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/vg_deconstruct/4Sim_1k96_256.xg.snarls



#compute snarls
#vg snarls $graph_xg >$snarls_file

for f in $data_gam
do

x=$(basename $f vgmap_4Sim.gam)
echo ${x}


#Calculate the surpport reads ingoring mapping and base quality <5
vg pack -t 48 -x $graph_xg -g $input/${x}vgmap_4Sim.gam -Q 5 -o $output/${x}vgmap_Sim4_256_aln.pack

#call variant using the same coordinates and including reference calls (for following compare)
vg call -t 60 -m 3,10 $graph_xg -k $output/${x}vgmap_Sim4_256_aln.pack -r $snarls_file  >$output/${x}vgmap_Sim4_256_aln.pack_R10S3.vcf

done

