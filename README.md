SIGMA: A clusterability measure for scRNA-seq data
==================================================

A package to calculate clusterability in clusters of scRNA-seq data. By
applying this measure you can assess if meaningful variability is left
in clusters.

Installation
------------

``` r
# install.packages("devtools")
#devtools::install_github("Siliegia/SIGMA")
```

Example
-------

This how you can use the functions in this R package. The most important
one is sigma\_funct, which calculates the clusterability per cluster.

``` r
library(SIGMA)
library(splatter)
library(ggplot2)

#Load sample data simulated with splatter
data("splatO")

expr <- counts(splatO)
expr <- expr[rowSums(expr)>0,]

#Normalize and log-transform the data
expr.norm <- t(t(expr)/colSums(expr))*10000
expr.norm.log <- log(expr.norm + 1)

#Create toy example of a data set
test.cluster <- as.character(splatO$Group)
test.cluster[test.cluster == "Group3"] <- "Group2"
test.cluster[test.cluster == "Group4"] <- "Group2"

#Main funcion that calculates the clusterability
out <- sigma_funct(expr = expr.norm.log, clusters = test.cluster, exclude = data.frame(clsm = log(colSums(expr) + 1)))
```

    ## Calculating values for cluster  Group5 
    ## Dim:  750 148 
    ## Calculating svd ... 
    ## Scaled by:  0.986122 
    ## Calculating values for cluster  Group2 
    ## Dim:  776 308 
    ## Calculating svd ... 
    ## Scaled by:  0.9832622 
    ## Market Mode:  308 
    ## Calculating values for cluster  Group1 
    ## Dim:  685 44 
    ## Calculating svd ... 
    ## Scaled by:  0.9624504 
    ## Market Mode:  44

For ways to evaluate the results of this clusterability measure check
out the vignette Guide\_to\_sigma.