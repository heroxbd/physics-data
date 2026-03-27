#!/usr/bin/env Rscript

books = read.csv("lm-examples/books.csv", row.names=1)
pdf("books.pdf")
plot(weight~volume, books)
dev.off()

lm.books = lm(weight~volume, books)
summary(lm.books)

model.matrix(weight ~ volume, books)

lm2.books = lm(weight ~ volume + cover, books)
summary(lm2.books)

lm3.books = lm(weight ~ volume + cover - 1, books)
summary(lm3.books)

mm3 = model.matrix(weight ~ volume + cover - 1, books)
weight = books$weight
mm4 = mm3[, -3]

lm4.books = lm(weight ~ mm4 + 0)
summary(lm4.books)

lm5.books = lm(weight ~ volume + area - 1, books)
summary(lm5.books)
AIC(lm5.books)

lm6.books = lm(weight ~ volume + area, books)
summary(lm6.books)
AIC(lm6.books)

books2 = rbind(data.frame(weight=2, volume=2, area=0, cover="nb"), books)
model.matrix(weight ~ cover - 1, books2)

books3 = cbind(books2, lang = c("arb", "arb", "zh", "zh", "eng", "zh", "arb", "eng", "arb", "zh", "zh", "eng", "eng", "arb", "eng", "zh"))
model.matrix(weight ~ cover + lang - 1, books3)
model.matrix(weight ~ cover + lang, books3)
