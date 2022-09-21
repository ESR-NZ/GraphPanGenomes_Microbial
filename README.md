# GraphPanGenomes_Microbial
Microbial genomics pipeline to build and analyse genome graphs
First version of best practice pipeline for use of graph genomes in microbial genomics, which include 
1) Use whole genomes as input for constructing pangenome graph, in which the variation graph data model describes the all versus all alignment of many sequences 
2) Manipulate the graph, such as annotation, visualization and extracting  subregions
3) Map short reads to graph, get Gam files
4) Call variants using the Gam files either for known ones as genotying or for novel variants. 
The variants called from graph based gam files can be used for further analysis as variants called based on single linear reference.

Softwares used in this pipeline 
1) circlator version 1.5.5, https://github.com/sanger-pathogens/circlator, resets the start point of a circular genomes. 
2) Mash version 2.1, https://github.com/marbl/Mash/releases, calculates the distance for the genomes, which can be used as a guide for the similary -p for building the Pangenome graph. 
3) samtools version 1.9, https://github.com/samtools/samtools. 
4) pggb version 0.4.0, https://github.com/pangenome/pggb, for pangenome graph building based on all versus all alignment of sequences. 
5) pgge https://github.com/pangenome/pgge, measures the reconstruction accuracy of a pangenome graph (in the variation graph model). Its goal is to give guidance in finding the best pangenome graph construction tool for a given input data and task. 
6) odgi version 0.6.2, https://github.com/pangenome/odgi, provides a set of tools ranging from graph building, manipulation, layouting, over graph statistics to graph visualization and gene annotation lift overs https://github.com/pangenome/odgi 
7) vg from version 1.41.0, https://github.com/vgteam/vg, provides computational methods for creating and manipulating of genome variation graphs.
8) gfaestus, https://github.com/chfi/gfaestus, to view the graphs in 2D 
9) vcftools, https://github.com/vcftools/vcftools
10) bcftools, https://github.com/samtools/bcftools
11) minigraph-cactus pipeline for comparision:https://github.com/ComparativeGenomicsToolkit/cactus, https://github.com/ComparativeGenomicsToolkit/cactus/blob/master/doc/pangenome.md
12) iqtree, https://github.com/iqtree/iqtree2, for phylogeny reconstruction 
