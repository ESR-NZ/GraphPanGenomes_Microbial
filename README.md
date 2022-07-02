# GraphPanGenomes_Microbial
Microbial genomics pipeline to build and analyse genome graphs
this pipeline is 
1) using whole genomes as input for constructing Pangenome graph, which encoded in the variation graph data model describe the all versus all alignment of many sequences 
2) manupilate the graph, such as annotation, visulaition and extract subregions
3) mapping short reads to graph, get Gam files
4) call variant using the Gam files either using genotying or including novel variants
The variants called from graph based gam files can be used for further standard analysis as variants called agaist single linear refs.
