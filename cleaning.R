library(tidyverse)



Data <- read.csv("imdb.csv");
Data$Year <- gsub("[()]","",Data$Year)
