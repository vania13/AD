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

#tema 1
colnames(eurostat$scores)[1] <- "ocupation"
colnames(eurostat$scores)[2] <- "fertility"
View(eurostat$scores)

#tema 2
captured <- eurostat$loadings[, 1:3]^2*100 |> round(digits=3)
captured <- cbind(captured, rowSums(captured))
colnames(captured)[1:4] = c("Ocupation","Fertility","Residual","Total")
View(captured)

# PCA(X, scale.unit = 'true', ncp = 15)$ind$coord
# PCA(X, scale.unit = 'true', ncp = 15)$svd$V