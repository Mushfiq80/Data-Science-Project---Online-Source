library(tidyverse)
fifa22 <- read.csv("fifa22.csv");
fifa22;

#Data Reduction
fifa22$Leauge <- gsub("[(1)]","",fifa22$Leauge)
view(fifa22)

#Data Discreatization
# France Ligue = 1
# England Premier League = 2
# Germany . Bundesliga = 3
# Spain Primera División = 4
# Italy Serie A = 5
# Holland Eredivisie = 6
# Portugal Primeira Liga = 7

class(fifa22$Leauge)
fifa22$Leauge[fifa22$Leauge=="France Ligue  "] <- "1"
fifa22$Leauge[fifa22$Leauge=="England Premier League "] <- "2"
fifa22$Leauge[fifa22$Leauge=="Germany . Bundesliga "] <- "3"
fifa22$Leauge[fifa22$Leauge=="Spain Primera División "] <- "4"
fifa22$Leauge[fifa22$Leauge=="Italy Serie A "] <- "5"
fifa22$Leauge[fifa22$Leauge=="Holland Eredivisie "] <- "6"
fifa22$Leauge[fifa22$Leauge=="Portugal Primeira Liga "] <- "7"

#mode
x2 <- c(fifa22$Overall)
my_mode <- function(x) {                     
  unique_x <- unique(x)
  tabulate_x <- tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}
my_mode(x2)
#Histogram
hist(fifa22$Overall)
hist(fifa22$Attack)
hist(fifa22$Defence)
hist(fifa22$Midfield)

#ggplot visualize
data22=data.frame(fifa22$Overall) 
str(data22)
#install.packages("ggplot2")
library(ggplot2)
ggplot(data22, aes(fifa22$Club, fifa22$Overall))+
  geom_point(size = 3)
