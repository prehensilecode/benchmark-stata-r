# Benchmarks

## Results
This page compares the speed of R and Stata for typical data analysis. Instructions are runned on randomly generated datasets of with 10 millions observations. I try to use the fastest command available in each language. In particular, I use [gtools](https://github.com/mcaceresb/stata-gtools) in Stata. I use [data.table](https://github.com/Rdatatable/data.table), [fst](https://github.com/fstpackage/fst), and [fixest](https://github.com/lrberge/fixest/) in R.


<img class = "img-responsive"  src="/output/1e7.svg" />


## Code

All the code below can be downloaded in the code folder in the repository.
The dataset is generated in R using the file [1-generate-datasets.R](code/1-generate-datasets.R).
The R code is in the file [2-benchmark-r.R](code/2-benchmark-r.R).
The Stata code is in the file [3-benchmark-stata.do](code/3-benchmark-stata.do).


## Session Info 

The machine used for this benchmark has two (2) 
[Intel® Xeon® Platinum 8268 CPU @ 2.90GHz 24-core](https://www.intel.com/content/www/us/en/products/sku/192481/intel-xeon-platinum-8268-processor-35-75m-cache-2-90-ghz/specifications.html) writing and reading data from local SSD storage.


The Stata version is Stata 17 MP with 48 cores.  The R session info is 
````R
R version 4.2.2 (2022-10-31)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Red Hat Enterprise Linux 8.1 (Ootpa)

Matrix products: default
BLAS/LAPACK: /ifs/opt/intel/2020/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin/libmkl_rt.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C
 [9] LC_ADDRESS=C               LC_TELEPHONE=C
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

other attached packages:
[1] fstcore_0.9.14    ggplot2_3.4.1     fst_0.9.8         statar_0.7.4
[5] fixest_0.11.1     data.table_1.14.8

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.10         Formula_1.2-5       magrittr_2.0.3
 [4] tidyselect_1.2.0    munsell_0.5.0       colorspace_2.1-0
 [7] lattice_0.20-45     R6_2.5.1            rlang_1.0.6
[10] fansi_1.0.4         dplyr_1.1.0         parallel_4.2.2
[13] grid_4.2.2          gtable_0.3.1        nlme_3.1-160
[16] utf8_1.2.3          cli_3.6.0           withr_2.5.0
[19] tibble_3.1.8        lifecycle_1.0.3     numDeriv_2016.8-1.1
[22] vctrs_0.5.2         glue_1.6.2          sandwich_3.0-2
[25] compiler_4.2.2      dreamerr_1.2.3      pillar_1.8.1
[28] generics_0.1.3      scales_1.2.1        pkgconfig_2.0.3
[31] zoo_1.8-11
````
