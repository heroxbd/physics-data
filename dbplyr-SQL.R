#!/usr/bin/env Rscript

library(dplyr)
library(dbplyr)
library(DBI)
library(RSQLite)

con = dbConnect(SQLite(), dbname = "dataframe-practice/people.db")
classes = tbl(con, "classes")
students = tbl(con, "students")
longscores = tbl(con, "longscores")

classes %>% filter(院系=='物理')

avgscores = inner_join(students, longscores) %>%
    group_by(班级, 作业) %>%
    summarise(平均分=mean(分数))

sql_render(avgscores)
