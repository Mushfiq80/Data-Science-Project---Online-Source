library(rvest)
library(dplyr)

link2 = "https://www.fifaindex.com/teams/fifa21_486/"
page2 = read_html(link2)

Club = page2 %>% html_nodes("td+ td .link-team") %>% html_text()

Leauge = page2 %>% html_nodes(".link-league") %>% html_text()

Attack = page2 %>% html_nodes("td:nth-child(4) .rating") %>% html_text()

Midfield = page2 %>% html_nodes("td:nth-child(5) .rating") %>% html_text()

Defence = page2 %>% html_nodes("td:nth-child(6) .rating") %>% html_text()

Overall = page2 %>% html_nodes("td:nth-child(7) .rating") %>% html_text()

FIFA21 = data.frame(Club, Leauge,Attack,Midfield,Defence,Overall, stringsAsFactors = FALSE)

write.csv(FIFA21, "fifa21.csv")

