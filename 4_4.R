# Name: Ananya Ambekar  
# Registration Number: 22BDS0074  

# Load necessary libraries  
library(ggplot2)  
library(dplyr)  

# Print user details  
cat("Name: Ananya Ambekar\n")  
cat("Registration Number: 22BDS0074\n\n")  

# Taking user input before proceeding  
readline("Press Enter to load the diabetes dataset...")  

# Q1: Load the Dataset  
cat("\n(i) Read the 'diabetes.csv' file into R and store it in a data frame named diabetes_data:\n")  
diabetes_data <- read.csv("C:\\Users\\Dell\\OneDrive\\Desktop\\Compiler Design\\diabetes.csv")

cat("Dataset loaded successfully!\n")  

# Q2a: Display the first 10 rows of the dataset  
cat("\n(ii.a) Display the first 10 rows of the dataset:\n")  
print(head(diabetes_data, 10))  

# Q2b: Generate summary statistics for all the variables  
cat("\n(ii.b) Generate summary statistics for all the variables:\n")  
print(summary(diabetes_data))  

# Q2c: Check the structure of the dataset  
cat("\n(ii.c) Check the structure of the dataset:\n")  
str(diabetes_data)  

# Q3a: Identify and display missing values  
cat("\n(iii.a) Identify and display missing values in the dataset:\n")  
missing_values <- colSums(is.na(diabetes_data))  
print(missing_values)  

# Q3b: Replace missing values with the median of respective columns  
cat("\n(iii.b) Replacing missing values with the median of respective columns:\n")  
diabetes_data <- diabetes_data %>% mutate(across(where(is.numeric), ~ifelse(is.na(.), median(., na.rm = TRUE), .)))  
cat("Missing values replaced!\n")  

# Q4a: Create a histogram of Glucose levels  
cat("\n(iv.a) Create a histogram to visualize the distribution of Glucose levels:\n")  
print(ggplot(diabetes_data, aes(x = Glucose)) +  
        geom_histogram(binwidth = 10, fill = "blue", color = "black") +  
        ggtitle("Distribution of Glucose Levels") +  
        xlab("Glucose") + ylab("Frequency"))  

# Q4b: Create a boxplot of BMI distribution by Outcome  
cat("\n(iv.b) Create a boxplot to compare BMI distribution between Outcome categories:\n")  
print(ggplot(diabetes_data, aes(x = as.factor(Outcome), y = BMI, fill = as.factor(Outcome))) +  
        geom_boxplot() +  
        ggtitle("BMI Distribution by Outcome") +  
        xlab("Outcome") + ylab("BMI") +  
        scale_x_discrete(labels = c("Non-Diabetic", "Diabetic")))  

# Q4c: Create a scatter plot of Insulin vs. Glucose, color-coded by Outcome  
cat("\n(iv.c) Create a scatter plot of Insulin vs. Glucose, color-coded by Outcome:\n")  
print(ggplot(diabetes_data, aes(x = Glucose, y = Insulin, color = as.factor(Outcome))) +  
        geom_point() +  
        ggtitle("Scatter Plot: Insulin vs Glucose") +  
        xlab("Glucose") + ylab("Insulin") +  
        scale_color_manual(values = c("red", "green"), labels = c("Non-Diabetic", "Diabetic")))  

# Q4d: Create a histogram of Age  
cat("\n(iv.d) Create a histogram to visualize the distribution of Age:\n")  
print(ggplot(diabetes_data, aes(x = Age)) +  
        geom_histogram(binwidth = 5, fill = "purple", color = "black") +  
        ggtitle("Distribution of Age") +  
        xlab("Age") + ylab("Frequency"))  

# Q4e: Create a boxplot of Age distribution by Outcome  
cat("\n(iv.e) Create a boxplot to compare Age distribution between Outcome categories:\n")  
print(ggplot(diabetes_data, aes(x = as.factor(Outcome), y = Age, fill = as.factor(Outcome))) +  
        geom_boxplot() +  
        ggtitle("Age Distribution by Outcome") +  
        xlab("Outcome") + ylab("Age") +  
        scale_x_discrete(labels = c("Non-Diabetic", "Diabetic")))  

# Q5a: Calculate the correlation matrix  
cat("\n(v.a) Calculate the correlation matrix for numeric variables:\n")  
cor_matrix <- cor(diabetes_data %>% select(-Outcome))  
print(cor_matrix)  

# Q5b: Identify the highest positive correlation  
cat("\n(v.b) Identify the pair of variables with the highest positive correlation:\n")  
cor_values <- as.data.frame(as.table(cor_matrix))  
cor_values <- cor_values[cor_values$Var1 != cor_values$Var2, ]  
max_correlation <- cor_values[which.max(cor_values$Freq), ]  
print(max_correlation)