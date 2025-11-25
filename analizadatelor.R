setwd("C:\\AD")
library(factoextra)
library(FactoMineR)
library(ggplot2)
library(corrplot)
library(openxlsx)
X <- (read.xlsx("eurostat.xlsx", sheet = "Data",colNames = T, rowNames = T) |> cor() |> scale())
# round(princomp(X)$loadings,3)
# remosummary(princomp(X), cor = T, scores = T)
eurostat <- princomp(X)
colnames(eurostat$scores)[1] <- "ocupation"
colnames(eurostat$scores)[2] <- "fertility"
View(eurostat$scores)
# PCA(X, scale.unit = 'true', ncp = 15)$ind$coord
# PCA(X, scale.unit = 'true', ncp = 15)$svd$V