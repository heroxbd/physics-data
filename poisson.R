#!/usr/bin/env Rscript
library(rhdf5)
library(dplyr)

PE = h5read("lm-examples/r10500.h5", "PETruth")
PEc = group_by(PE, EventID, ChannelID) %>% summarise(count=n())

pmtdata = read.table("lm-examples/pmtdata.csv", header=FALSE, col.names=c("ChannelID", "type", "QE"))

pmt = PEc %>% left_join(pmtdata)
# 查看平均计数
pmt %>% group_by(type) %>% summarise(avg_count=mean(count))

glm.pmt = glm(count ~ type - 1, poisson(), pmt)
exp(coef(glm.pmt))

glm2.pmt = glm(count ~ QE, poisson(link = "log"), pmt)
