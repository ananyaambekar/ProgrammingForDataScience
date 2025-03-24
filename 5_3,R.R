cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Load necessary libraries
library(dplyr)
library(ggplot2)  # Contains the diamonds dataset

# Load diamonds dataset
data(diamonds)

# Question 1
cat("1. Which diamond cut has the highest number of diamonds with a price above $5000?\n")
highest_price_cut <- diamonds %>%
  filter(price > 5000) %>%  # Consider only diamonds priced above $5000
  group_by(cut) %>%  # Group by cut type
  summarise(count = n()) %>%  # Count number of diamonds
  arrange(desc(count)) %>%  # Sort in descending order
  slice(1)  # Get the top cut

print(highest_price_cut)

# Question 2
cat("2. On average, which diamond clarity results in the lightest diamonds?\n")
lightest_clarity <- diamonds %>%
  group_by(clarity) %>%  # Group by clarity
  summarise(avg_weight = mean(carat, na.rm = TRUE)) %>%  # Calculate average weight
  arrange(avg_weight) %>%  # Sort in ascending order (lightest first)
  slice(1)  # Get the lightest clarity

print(lightest_clarity)

# Question 3
cat("3. In which month of the year do diamonds tend to have the highest average price?\n")
cat("(Hypothetical Scenario: Assuming a time-based column existed.)\n")

# Creating a hypothetical dataset with a month column
diamonds$month <- sample(1:12, nrow(diamonds), replace = TRUE)  # Random month assignment

highest_price_month <- diamonds %>%
  group_by(month) %>%  # Group by month
  summarise(avg_price = mean(price, na.rm = TRUE)) %>%  # Calculate average price
  arrange(desc(avg_price)) %>%  # Sort in descending order
  slice(1)  # Get the top month

print(highest_price_month)