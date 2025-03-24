cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Load necessary libraries
library(dplyr)
library(pscl)
library(gapminder)
library(tidyr)
library(ggplot2)

data("presidentialElections")
data("gapminder")

# Q5) Analyzing Global Development Data Using dplyr
cat("Q5) Analyzing Global Development Data Using dplyr\n\n")

# 1. Selecting Columns
cat("1. Selecting Columns\n")
gapminder_selected <- gapminder %>% select(country, year, gdpPercap)
print(gapminder_selected)

# 2. Filtering Rows
cat("2. Filtering Rows\n")
gapminder_asia_2007 <- gapminder %>% filter(year == 2007 & continent == "Asia")
print(gapminder_asia_2007)


# 3. Mutating Columns
cat("3. Mutating Columns\n")
gapminder_mutated <- gapminder %>% mutate(
  gdp_million = gdpPercap * pop / 1e6,
  gdp_growth = ifelse(year == 2007, (gdpPercap - lag(gdpPercap, order_by = year)) / lag(gdpPercap, order_by = year) * 100, NA)
)
print(gapminder_mutated)

# 4. Arranging Rows
cat("4. Arranging Rows\n")
gapminder_sorted <- gapminder %>% arrange(desc(gdpPercap), country)
print(gapminder_sorted)


# 5. Summarizing Data
cat("5. Summarizing Data\n")
gapminder_summary <- gapminder %>% summarize(
  mean_gdpPercap = mean(gdpPercap, na.rm = TRUE),
  total_pop = sum(pop, na.rm = TRUE)
)
print(gapminder_summary)

# 6. Custom Summarization
cat("6. Custom Summarization\n")
gdp_rank <- function(x) {
  return(rank(-x, ties.method = "first"))
}

gapminder_ranked <- gapminder %>% group_by(country) %>%
  summarize(highest_rank = first(gdp_rank(gdpPercap)))
print(gapminder_ranked)

# 7. Pipe Operator
cat("7. Pipe Operator\n")
highest_gdp_continent <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(avg_gdpPercap = mean(gdpPercap, na.rm = TRUE)) %>%
  arrange(desc(avg_gdpPercap)) %>%
  slice(1)

print(highest_gdp_continent)


# End of Analysis
cat("Analysis Completed Successfully!\n")
