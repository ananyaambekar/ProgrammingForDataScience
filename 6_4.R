# Load necessary libraries
library(ggplot2)
library(GGally)

# Print Name and ID
cat("Ananya Ambekar\n22BDS0074\n\n")

# Load the iris dataset
data(iris)

# 1. Scatter Plot
cat("Q4.1: Scatter Plot of Sepal.Length vs Sepal.Width\n")
scatter_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Scatter Plot: Sepal Length vs Sepal Width",
       x = "Sepal Length",
       y = "Sepal Width",
       color = "Species") +
  theme_minimal()
print(scatter_plot)  # Explicitly print the plot

# 2. Pairwise Plot
cat("\nQ4.2: Pairwise Plot of Numerical Variables in Iris Dataset\n")
pairwise_plot <- ggpairs(iris, aes(color = Species, alpha = 0.6))
print(pairwise_plot)  # Explicitly print the plot

# 3. Histogram
cat("\nQ4.3: Histogram of Petal.Length\n")
histogram_plot <- ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Petal Length",
       x = "Petal Length",
       y = "Frequency") +
  theme_minimal()
print(histogram_plot)  # Explicitly print the plot
