cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Load necessary libraries
library(dplyr)
library(pscl)

data("presidentialElections")

# Selecting Columns
selected_data <- presidentialElections %>% select(year, demVote)
print(selected_data)

# Filtering Rows
colorado_2008 <- presidentialElections %>% filter(year == 2008 & state == "Colorado")
print(colorado_2008)

# Mutating Columns
mutated_data <- presidentialElections %>% mutate(
  other_parties_vote = 100 - demVote,
  abs_vote_difference = abs(demVote - other_parties_vote)
)
print(mutated_data)

# Arranging Rows
sorted_data <- presidentialElections %>% arrange(desc(year), desc(demVote))
print(sorted_data)

# Summarizing Data
summary_stats <- presidentialElections %>% summarize(
  mean_dem_vote = mean(demVote, na.rm = TRUE),
  mean_other_parties_vote = mean(100 - demVote, na.rm = TRUE)
)
print(summary_stats)

# Custom Summarization Function
furthest_from_50 <- function(x) {
  return(x[which.max(abs(x - 50))])
}

biggest_landslide <- presidentialElections %>% summarize(
  largest_deviation = furthest_from_50(demVote)
)
print(biggest_landslide)

# Pipe Operator to Find the State with Highest Democratic Vote in 2008
highest_dem_vote_2008 <- presidentialElections %>%
  filter(year == 2008) %>%
  arrange(desc(demVote)) %>%
  slice(1) %>%
  select(state, demVote)

print(highest_dem_vote_2008)