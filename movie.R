library(rvest)
library(dplyr)

link = "https://www.imdb.com/chart/top/"
page = read_html(link)

Name = page %>% html_nodes(".titleColumn a") %>% html_text()
View(Name)

Year = page %>% html_nodes(".secondaryInfo") %>% html_text()

rating = page %>% html_nodes("strong") %>% html_text()

imdb = data.frame(Name,Year, rating, stringsAsFactors = FALSE)

write.csv(imdb, "imdb.csv")
