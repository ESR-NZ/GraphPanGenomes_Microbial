#library(devtools)
#install_github("helixcn/spaa")
#library(spaa)
#install.packages("reshape")
setwd("/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pipeline/pangenome_phylogeny")


library(reshape)
library(ape)

# read in the data
dat=read.csv("4Sim1k96_distance_cut.csv",sep=",")
dat
# use reshape's cast function to change to matrix
m <- cast(dat, path.a ~ path.b)
m
# set the row names
rownames(m) <- m[,1]
# get rid of a couple of rows
m <- m[,-2]
# convert any 0s that were read in as strings to integers
m <- apply(m, 2, as.numeric )
m

# change the matrix to a distance matrix
d <- dist(m)
# do hierarchical clustering
h <- hclust(d)
# plot the dendrogram
plot(h)

# use ape's as phylo function
tree <- as.phylo(h)
# export as newick for viewing in figtree
write.tree(phy=tree, file = '4Sim.tree')