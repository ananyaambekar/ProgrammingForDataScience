# Name: Ananya Ambekar
# Registration Number: 22BDS0074
print(paste("Name: Ananya Ambekar"))
print(paste("Reg No: 22BDS0074"))

# Load necessary library
library(dplyr)

# Taking user input for dataset
cat("Enter data (ID, Name, Age, Gender, Score) one by one:\n")
n <- as.integer(readline("Enter number of records: "))
id <- numeric(n)
name <- character(n)
age <- numeric(n)
gender <- character(n)
score <- numeric(n)

for (i in 1:n) {
  cat(paste("Record", i, "\n"))
  id[i] <- as.integer(readline("ID: "))
  name[i] <- readline("Name: ")
  age[i] <- as.integer(readline("Age: "))
  gender[i] <- readline("Gender (M/F): ")
  score[i] <- as.numeric(readline("Score: "))
}

# Create data frame
data <- data.frame(ID = id, Name = name, Age = age, Gender = gender, Score = score)

# Display first few rows
cat("\n(i) Display the first few rows of the data frame:\n")
print(head(data))

# Extract Score column
cat("\n(ii) Extract and display the Score column:\n")
print(data$Score)

# Filter rows where Score > 85
cat("\n(iii) Filter and display the rows where the Score is greater than 85:\n")
high_score <- filter(data, Score > 85)
print(high_score)

# Add 'Passed' column
data$Passed <- data$Score >= 85
cat("\n(iv) Add a new column 'Passed' to the data frame:\n")
print(data)

# Summary statistics
cat("\n(v) Calculate and display the summary statistics for Age and Score:\n")
print(summary(data[, c("Age", "Score")]))

# Update Name where ID == 2
cat("\n(vi) Update the Name of the row where ID is 2 to 'Robert':\n")
data$Name[data$ID == 2] <- "Robert"
print(data)

# Sort data by Score (descending)
cat("\n(vii) Sort the data frame by Score in descending order:\n")
sorted_data <- arrange(data, desc(Score))
print(sorted_data)

# Handle missing values in Score column
cat("\n(viii) Replace missing values in Score column with mean Score:\n")
data$Score[is.na(data$Score)] <- mean(data$Score, na.rm = TRUE)
print(data)

# Extract Name and Score for Age < 30
cat("\n(ix) Extract Name and Score where Age < 30:\n")
filtered_data <- select(filter(data, Age < 30), Name, Score)
print(filtered_data)
