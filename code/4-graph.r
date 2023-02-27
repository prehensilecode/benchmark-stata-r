library(data.table)
library(tidyr)
library(stringr) 
library(ggplot2) 
library(scales)
library(svglite)
library(stringr)


datadir <- Sys.getenv("TMP")
DT = fread(file.path(datadir, "resultR1e7.csv"))
DT2 = fread(file.path(datadir, "resultStata1e7.csv"))
setnames(DT, "result", "R")
DT[, Stata := DT2[["result"]]]

DT[, value := Stata / R]
DT[, language := "Stata"]
setDT(DT)

nproc <- Sys.getenv("SLURM_CPUS_PER_TASK")

ylabel <- str_glue("Time spent in Stata (relative to time in R) using {nproc} CPU cores")
DT[, command := factor(command, levels=rev(unique(command)))]
image = ggplot(DT,aes(x=command,y=value, fill = "red", width=0.2)) + geom_bar(position=position_dodge(width=0.2), stat="identity")+ coord_flip() + scale_fill_discrete(breaks=c("Stata","R")) + ylab(ylabel) +  scale_y_log10(breaks = c(0.1, 1, 10, 100), labels = c("0.1", "1", "10", "100"))

# save to this directory
ggsave("1e7.svg", image)
ggsave("1e7.png", image)
