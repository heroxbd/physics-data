#!/usr/bin/env Rscript

library(reshape2)
library(ggplot2)
library(dplyr)

classes = read.csv("dataframe-practice/classes.csv")
students = read.csv("dataframe-practice/students.csv")
scores = read.csv("dataframe-practice/scores.csv")

longscores = melt(scores, id.vars="学号", measure.vars=colnames(scores)[-1], value.name = "分数", variable.name="作业")

# 每个作业的直方图
p = ggplot(longscores, aes(x=分数)) + geom_histogram()
p = p + facet_wrap(~作业)
print(p)

## merge(students, longscores)
avgscores = inner_join(students, longscores) %>% group_by(班级, 作业) %>% summarise(平均分=mean(分数))

p = ggplot(avgscores, aes(x=作业, y=平均分)) + geom_bar(stat = "identity")
p = p + facet_wrap(~班级) + aes(fill=作业) + labs(x = NULL)
print(p)
