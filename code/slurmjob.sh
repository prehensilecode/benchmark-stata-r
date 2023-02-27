#!/bin/bash
#SBATCH --licenses=stata48:1
#SBATCH --cpus-per-task=48
#SBATCH --mem=180G
#SBATCH --time=1:00:00

# Benchmark R & Stata

module load R/4.2.2
module load stata/mp48/17

# Set R tmp directory
echo "TMP = $TMP" > .Renviron

# generate data
R --no-save --no-restore-data --quiet CMD BATCH 1-generate-datasets.r

# do the computations in R
R --no-save --no-restore-data --quiet CMD BATCH 2-benchmark-r.r

# do the computations in Stata
export STATATMP=$TMP
stata-mp -s do 3-benchmark-stata.do

# make the plots
R --no-save --no-restore-data --quiet CMD BATCH 4-graph.r

# cleanup
/bin/rm -f .RData .Renviron

