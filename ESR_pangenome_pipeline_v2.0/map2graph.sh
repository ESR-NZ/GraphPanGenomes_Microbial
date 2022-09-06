#!/bin/bash
module load vg/1.41.0

data=./NGS_data/*_2k_5_2k_2k.wgsim_er0.005.R1.fq.gz
input_folder=./NGS_data
output=./map2graph
index=./vg_deconstruct/4Sim_1k96_256.gcsa
basename=./vg_deconstruct/4Sim_1k96_256

for f in $data
do
x=$(basename $f _2k_5_2k_2k.wgsim_er0.005.R1.fq.gz)
echo ${x}

read1=${x}_2k_5_2k_2k.wgsim_er0.005.R1.fq.gz
read2=$(echo $read1|sed 's/_2k_5_2k_2k.wgsim_er0.005.R1.fq.gz/_2k_5_2k_2k.wgsim_er0.005.R2.fq.gz/')

echo $read2
vg map -t 20  -d $basename -g $index  -f $input_folder/$read1 -f $input_folder/$read2 -N $x  > $output/${x}vgmap_4Sim.gam
vg stats -a  $output/${x}vgmap_4Sim.gam  >$output/${x}vgmap_4Sim_stats

done 
