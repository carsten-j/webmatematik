library(rgl)
setwd("~/Projects/webmatematik")

tbl <- read.csv("dataR.csv")

byggeomkostninger <- tbl$byggeomkostninger
rente <- tbl$rente
prisindeks <- tbl$prisindeks

plot3d(byggeomkostninger, rente, prisindeks,
       type = "s", size = 1.25, col = "blue", 
       fit="linear", surface = TRUE, pos.res.col="red", neg.res.col="green")

out=lm(prisindeks~byggeomkostninger+rente)
b0=out$coefficients[1]
b1=out$coefficients[2]
b2=out$coefficients[3]
planes3d(b1,b2,-1,b0,alpha=0.5,col="light grey")