# GraphPanGenomes_Microbial
Microbial genomics pipeline to build and analyse genome graphs
First version of best practice pipeline for use of graph genomes in microbial genomics, which include 
1) Use whole genomes as input for constructing pangenome graph, in which the variation graph data model describes the all versus all alignment of many sequences 
2) Manipulate the graph, such as annotation, visualization and extracting  subregions
3) Map short reads to graph, get Gam files
4) Call variants using the Gam files either for known ones as genotying or for novel variants. 

The variants called from graph based gam files can be used for further analysis as variants called based on single linear reference.
