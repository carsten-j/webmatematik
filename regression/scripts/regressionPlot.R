# load libraries
library(rgl)
library(car)
# set working directory
setwd("~/Projects/webmatematik")
# prepare data
tbl <- read.csv("regression/data/dataR.csv")
# extract data
byggeomkostninger <- tbl$byggeomkostninger
rente <- tbl$rente
prisindeks <- tbl$prisindeks
# create interactive 3D plot - this requires X11 to be installed
scatter3d(byggeomkostninger, prisindeks,rente,
          surface=TRUE, 
          point.col="blue",
          sphere.size=0.5,
          residuals=TRUE, 
          fit="linear",
          neg.res.col="red", 
          pos.res.col="green",
          revolutions = 2)

rgl.snapshot("ch17.4.png", fmt = "png")
