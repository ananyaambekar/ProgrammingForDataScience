# Name: Ananya Ambekar
# Registration Number: 22BDS0074

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Print user details
cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Taking user input before proceeding
readline("Press Enter to load the airquality dataset...")

# Q1: Load the airquality dataset
cat("\n(i) Load the airquality dataset:\n")
cat("Dataset loaded successfully!\n")

# Q2: Display the first few rows of the dataset
cat("\n(ii) Display the first few rows of the dataset:\n")
print(head(airquality))

# Q3: Provide summary statistics for the dataset
cat("\n(iii) Provide summary statistics for the dataset:\n")
print(summary(airquality))

# Q4: Display the structure of the dataset
cat("\n(iv) Display the structure of the dataset:\n")
str(airquality)

# Q5: Create a basic plot of Ozone levels over time
cat("\n(v) Create a basic plot of Ozone levels over time:\n")
plot(airquality$Ozone, type = "o", col = "blue",
     xlab = "Days", ylab = "Ozone Levels",
     main = "Ozone Levels Over Time")

# Q6: Handling missing data (Remove rows with missing values)
cat("\n(vi) Handling missing data (Removing rows with missing values):\n")
airquality_clean <- na.omit(airquality)
cat("Rows with missing values removed!\n")

# Q7: Display the first few rows of the cleaned dataset
cat("\n(vii) Display the first few rows of the cleaned dataset:\n")
print(head(airquality_clean))

# Q8a: Scatter Plot - Create a scatter plot of Ozone versus Temperature
cat("\n(viii.a) Create a scatter plot of Ozone versus Temperature:\n")
print(ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
        geom_point(color = "red") +
        ggtitle("Scatter Plot: Ozone vs Temperature") +
        xlab("Temperature (°F)") + ylab("Ozone Levels"))

# Q8b: Add a regression line to the scatter plot to visualize the trend
cat("\n(viii.b) Add a regression line to the scatter plot to visualize the trend:\n")
print(ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
        geom_point(color = "red") +
        geom_smooth(method = "lm", col = "blue") +
        ggtitle("Ozone vs Temperature with Regression Line") +
        xlab("Temperature (°F)") + ylab("Ozone Levels"))

# Q8c: Boxplot - Divide temperature into bins and create a boxplot of Ozone levels
cat("\n(viii.c) Creating temperature bins and boxplot of Ozone levels:\n")
airquality_clean$TempCategory <- cut(airquality_clean$Temp,
                                     breaks = c(-Inf, 59, 69, 79, 89, Inf),
                                     labels = c("Below 60°F", "60-69°F", "70-79°F", "80-89°F", "90°F and above"))

print(ggplot(airquality_clean, aes(x = TempCategory, y = Ozone, fill = TempCategory)) +
        geom_boxplot() +
        ggtitle("Boxplot of Ozone Levels for Different Temperature Bins") +
        xlab("Temperature Bins") + ylab("Ozone Levels") +
        theme(legend.position = "none"))
