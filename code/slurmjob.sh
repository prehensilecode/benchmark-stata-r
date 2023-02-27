#!/bin/bash
#SBATCH --licenses=stata48:1
#SBATCH --cpus-per-task=48
#SBATCH --mem=180G
#SBATCH --time=1:00:00

# Benchmark R & Stata

module load R/4.2.2
module load stata/mp48/17

# R options to make sure it doesn't try to read .RData from this directory

# copy scripts to $TMP
/bin/cp -f *.R *.do $TMP
cd $TMP

# generate data
R --no-save --no-restore-data --quiet CMD BATCH 1-generate-datasets.R

# do the computations in R
R --no-save --no-restore-data --quiet CMD BATCH 2-benchmark-r.R

# do the computations in Stata
export STATATMP=$TMP
stata-mp -s do 3-benchmark-stata.do

# make the plots
R --no-save --no-restore-data --quiet CMD BATCH 4-graph.R

# move script outputs and plots back, overwriting existing
/bin/cp -f *.Rout *.smcl $SLURM_SUBMIT_DIR
/bin/cp -f *.png *.svg $SLURM_SUBMIT_DIR

