cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Load necessary libraries
library(dplyr)

data(mtcars)  # Load mtcars dataset

# Question 1
cat("1. Which car model has the highest horsepower (hp)?\n")
highest_hp_car <- mtcars %>%
  mutate(model = rownames(mtcars)) %>%  # Add car model names
  arrange(desc(hp)) %>%  # Sort by horsepower in descending order
  slice(1)  # Get the car with the highest horsepower

print(highest_hp_car[, c("model", "hp")])

# Question 2
cat("2. On average, which car model achieves the best fuel efficiency (mpg)?\n")
best_mpg_car <- mtcars %>%
  mutate(model = rownames(mtcars)) %>%  # Add car model names
  arrange(desc(mpg)) %>%  # Sort by mpg in descending order
  slice(1)  # Get the most fuel-efficient car

print(best_mpg_car[, c("model", "mpg")])

# Question 3
cat("3. In which number of cylinders (cyl) category do cars tend to have the highest average weight (wt)?\n")
heaviest_cyl_category <- mtcars %>%
  group_by(cyl) %>%  # Group by number of cylinders
  summarise(avg_weight = mean(wt, na.rm = TRUE)) %>%  # Calculate average weight
  arrange(desc(avg_weight)) %>%  # Sort in descending order
  slice(1)  # Get the heaviest cylinder category

print(heaviest_cyl_category)
