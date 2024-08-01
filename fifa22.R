#install.packages("rvest")
#install.packages("dplyr")

library(rvest)
library(dplyr)

link = "https://www.fifaindex.com/teams/fifa22/"
page = read_html(link)

Club = page %>% html_nodes("td+ td .link-team") %>% html_text()

Leauge = page %>% html_nodes(".link-league") %>% html_text()

Attack = page %>% html_nodes("td:nth-child(4) .rating") %>% html_text()

Midfield = page %>% html_nodes("td:nth-child(5) .rating") %>% html_text()

Defence = page %>% html_nodes("td:nth-child(6) .rating") %>% html_text()

Overall = page %>% html_nodes("td:nth-child(7) .rating") %>% html_text()

FIFA22 = data.frame(Club, Leauge,Attack,Midfield,Defence,Overall, stringsAsFactors = FALSE)

write.csv(FIFA22, "fifa22.csv")



