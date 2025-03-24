# Load necessary libraries
library(ggplot2)
library(dplyr)

# Print Name and ID
cat("Ananya Ambekar\n22BDS0074\n\n")

# Load the mtcars dataset
data(mtcars)

# Convert 'cyl' and 'gear' to factors for better visualization
mtcars$cyl <- factor(mtcars$cyl, labels = c("4 Cyl", "6 Cyl", "8 Cyl"))
mtcars$gear <- factor(mtcars$gear)

# 1. Boxplot - Distribution of MPG by Cylinder Count
cat("Q6.1: Boxplot Comparing MPG for Different Cylinders\n")
box_plot <- ggplot(mtcars, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "MPG Distribution Across Different Cylinders",
       x = "Number of Cylinders",
       y = "Miles Per Gallon (mpg)") +
  theme_minimal()
print(box_plot)  # Display the plot

# 2. Scatter Plot - Relationship Between HP and MPG
cat("\nQ6.2: Scatter Plot of HP vs MPG with Regression Line\n")
scatter_plot <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue", size = 2) +
  geom_smooth(method = "lm", col = "red") +  # Add regression line
  labs(title = "Horsepower vs MPG",
       x = "Horsepower (hp)",
       y = "Miles Per Gallon (mpg)") +
  theme_minimal()
print(scatter_plot)  # Display the plot

# 3. Facet Grid Plot - MPG vs Weight for Different Gear Types
cat("\nQ6.3: Facet Grid Plot of MPG vs Weight for Different Gear Types\n")
facet_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "green", size = 2) +
  facet_wrap(~ gear) +
  labs(title = "MPG vs Weight for Different Gear Types",
       x = "Weight (1000 lbs)",
       y = "Miles Per Gallon (mpg)") +
  theme_minimal()
print(facet_plot)  # Display the plot
