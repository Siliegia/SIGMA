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
