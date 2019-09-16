#!/usr/bin/env Rscript
require(plyr)

args <- commandArgs(trailingOnly=TRUE)
p1 <- read.csv(args[2])
p2 <- read.csv(args[3])
ta <- read.csv(args[4])
ta$加分 <- 5

f1 <- setdiff(p1$学号, p2$学号) # 只选了 (1) 的同学
s1 <- p1[p1$学号 %in% f1,]

s1 <- merge(s1, ta, by="学号", all.x=TRUE)
s1[is.na(s1)]  <- 0

measure <- data.frame(level=c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "F"),
                     score=c(105, 98, 92, 87, 82, 78, 75, 71, 68, 65, 60, 0))

s1$等级 <- laply(s1$总分+s1$加分, function(sc) as.character(measure$level[min(which(measure$score < sc))]))

s2 <- merge(p1, p2, by=c("学号", "姓名"))
s2 <- merge(s2, ta, by="学号", all.x=TRUE)
s2[is.na(s2)]  <- 0

s2$等级 <- laply((s2$总分.x+s2$总分.y)/2 + s2$加分, function(sc) as.character(measure$level[min(which(measure$score < sc))]))

comments <- read.csv(args[5])
s1 <- merge(s1, comments, by="学号", all.x=TRUE)
s2 <- merge(s2, comments, by="学号", all.x=TRUE)

print(sprintf("(1) 的 A+ 比例: %f", (sum(s1$等级=="A+") + sum(s2$等级=="A+")) / (nrow(s1)+nrow(s2))))
print(sprintf("(2) 的 A+ 比例: %f", sum(s2$等级=="A+") / nrow(s2)))

out_fields <- c("学号", "等级", "评语")
write.csv(rbind(s1[out_fields], s2[out_fields]), 
                args[1], row.names=FALSE, fileEncoding="UTF-8")
write.csv(s2[out_fields], sub("e1", "e2", args[1]), row.names=FALSE, fileEncoding="UTF-8")
