#!/bin/bash
input=./variant_nofilcall_allR_R10S3_filt/merge_vcf_tree/6samplesSNPs.phylip

module load iqtree2/2.0.6
iqtree2 -s $input -nt 20 -B 2000 -alrt 2000
