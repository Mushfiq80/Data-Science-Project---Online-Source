library(tidyverse)
fifa21 <- read.csv("fifa21.csv");
fifa21;

#Data Discreatization
# France Ligue = 1
# England Premier League = 2
# Germany . Bundesliga = 3
# Spain Primera División = 4
# Italy Serie A = 5
# Holland Eredivisie = 6
# Portugal Primeira Liga = 7

class(fifa21$Leauge)
fifa21$Leauge[fifa21$Leauge=="Ligue 1 Uber Eats"] <- "1"
fifa21$Leauge[fifa21$Leauge=="Premier League"] <- "2"
fifa21$Leauge[fifa21$Leauge=="Bundesliga"] <- "3"
fifa21$Leauge[fifa21$Leauge=="LaLiga Santander"] <- "4"
fifa21$Leauge[fifa21$Leauge=="Serie A TIM"] <- "5"
fifa21$Leauge[fifa21$Leauge=="Eredivisie"] <- "6"
fifa21$Leauge[fifa21$Leauge=="Liga NOS"] <- "7"
#mode
x1 <- c(fifa21$Overall)
my_mode <- function(x) {                     
  unique_x <- unique(x)
  tabulate_x <- tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}
my_mode(x1)
summary(fifa21)
#Histogram
hist(fifa21$Overall)
hist(fifa21$Attack)
hist(fifa21$Defence)
hist(fifa21$Midfield)

data21=data.frame(fifa21$Overall)
str(data21)
#install.packages("ggplot2")
library(ggplot2)
ggplot(data21, aes(fifa21$Club, fifa21$Overall))+
  geom_point(size = 3)