# FIFA Club Ratings Analysis Using Web Scraping

## Project Overview
This project involves analyzing football club ratings data scraped from the "FIFA Index" website. The analysis compares ratings from the 2021 and 2022 editions of the top 30 clubs worldwide. The datasets include:
- Club names
- League names
- Ratings for Attack, Midfield, Defense, and Overall performance

### Key Steps:
1. **Data Collection**: Scraping data from the website using the SelectorGadget tool and `rvest` in RStudio.
2. **Data Preprocessing**: Cleaning, transforming, and preparing data for analysis.
3. **Descriptive Statistics**: Calculating mean, median, mode, variance, standard deviation, quartiles, and interquartile ranges.
4. **Data Visualization**: Generating histograms and scatter plots to visualize trends and insights.

---

## Data Sources
Data was scraped from the following links:
- [FIFA 22 Teams](https://www.fifaindex.com/teams/fifa22/)
- [FIFA 21 Teams](https://www.fifaindex.com/teams/fifa21_486/)

---

## Technologies Used
- **R Language**
- **SelectorGadget** for scraping data
- **R Libraries**: `rvest`, `dplyr`, `ggplot2`
- **Data Storage**: CSV files

---

## Project Workflow
### 1. Data Scraping
Using the `rvest` library in R, data was scraped for attributes like Club name, League, Attack, Midfield, Defense, and Overall ratings.

#### Example Code (FIFA 22):
```R
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

FIFA22 = data.frame(Club, Leauge, Attack, Midfield, Defence, Overall, stringsAsFactors = FALSE)
write.csv(FIFA22, "fifa22.csv")
```

---

### 2. Data Preprocessing
The datasets were cleaned and processed using the following steps:
- **Data Cleaning**: Handling missing values, noisy data, and outliers.
- **Data Transformation**: Categorizing clubs into classes (e.g., "S" for super, "A" for excellent).
- **Data Reduction**: Removing unnecessary data entries.
- **Data Integration**: Standardizing league names.

#### Example Code:
Handling Missing Data:
```R
meanAs <- mean(fifa22$Attack, na.rm = TRUE)
fifa22[is.na(fifa22$Attack), "Attack"] <- meanAs
```
Categorizing Clubs:
```R
for(i in 1:nrow(fifa22)){
  if(fifa22$Overall[i] > 86){
    fifa22$Type[i] <- "S"
  } else if(fifa22$Overall[i] > 82){
    fifa22$Type[i] <- "A"
  } else if(fifa22$Overall[i] > 80){
    fifa22$Type[i] <- "B"
  } else {
    fifa22$Type[i] <- "C"
  }
}
```

---

### 3. Descriptive Statistics
The following metrics were calculated:
- **Mean**: Average rating for attributes.
- **Median**: Middle value of the ratings.
- **Mode**: Most frequently occurring rating value.
- **Variance & Standard Deviation**: Measuring data spread.
- **Range & Interquartile Range**: Understanding rating distribution.

#### Example Code:
Calculating Mode:
```R
my_mode <- function(x) {
  unique_x <- unique(x)
  tabulate_x <- tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}
my_mode(fifa22$Overall)
```

---

### 4. Data Visualization
#### Histograms:
Histograms for Attack, Defense, Midfield, and Overall ratings were generated to show rating distributions.
```R
hist(fifa22$Overall)
hist(fifa22$Attack)
hist(fifa22$Defence)
hist(fifa22$Midfield)
```

#### Scatter Plot:
Scatter plots were created using `ggplot2` to visualize rating trends.
```R
library(ggplot2)

ggplot(fifa22, aes(Club, Overall)) +
  geom_point(size = 3)
```

---

## Insights & Findings
1. **FIFA 22**:
   - Most clubs had overall ratings between 79-82.
   - Defensive ratings showed significant focus, with lower emphasis on attack.
2. **FIFA 21**:
   - Ratings were more balanced across all positions.
   - Attack ratings were higher on average compared to FIFA 22.

---

## Conclusion
This project highlights how web scraping and data analysis can provide meaningful insights into football club performance. R and its libraries made the process efficient, enabling data scientists to extract, preprocess, and visualize data effectively.

---

## How to Run the Project
1. Clone the repository.
2. Install required R packages: `rvest`, `dplyr`, `ggplot2`.
3. Run the scraping scripts to generate datasets.
4. Execute data analysis and visualization scripts in RStudio.

---

## Project Structure
```
|-- README.md
|-- fifa21.csv
|-- fifa22.csv
|-- scraping_script_fifa21.R
|-- scraping_script_fifa22.R
|-- data_analysis.R
|-- visualizations.R
