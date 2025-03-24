# Load necessary library
library(dplyr)

# Print Name and Registration Number
print(paste("Name: Ananya Ambekar"))
print(paste("Reg No: 22BDS0074"))

# Take user input for table data
print("Enter number of rows: ")
n <- as.integer(readline())

# Initialize empty vectors for data collection
ID <- integer(n)
Name <- character(n)
Age <- integer(n)
Score <- numeric(n)

# Collect user input
for (i in 1:n) {
  print(paste("\nEnter details for row", i))
  ID[i] <- as.integer(readline("Enter ID: "))
  Name[i] <- readline("Enter Name: ")
  Age[i] <- as.integer(readline("Enter Age: "))
  Score[i] <- as.numeric(readline("Enter Score (Enter NA for missing values): "))
}

# Create Data Frame
df <- data.frame(ID, Name, Age, Score, stringsAsFactors = FALSE)

# Print the Question and Answer
print("Question 1: Create a data frame with the provided table data.")
print("Answer:")
print(df)

# Display the first few rows
print("Question 2: Display the first few rows of the data frame.")
print("Answer:")
print(head(df))

# Extract and display the Score column
print("Question 3: Extract and display the Score column from the data frame.")
print("Answer:")
print(df$Score)

# Filter and display rows where Score > 85
print("Question 4: Filter and display the rows where Score is greater than 85.")
print("Answer:")
print(df %>% filter(Score > 85))

# Add a Passed column (TRUE if Score >= 85, else FALSE)
df <- df %>% mutate(Passed = Score >= 85)
print("Question 5: Add a Passed column to the data frame.")
print("Answer:")
print(df)

# Calculate and display summary statistics for Age and Score
print("Question 6: Calculate and display summary statistics for Age and Score.")
print("Answer:")
print(summary(df[, c("Age", "Score")])) 

# Update Name of ID = 2 to "Robert"
df <- df %>% mutate(Name = ifelse(ID == 2, "Robert", Name))
print("Question 7: Update the Name of ID 2 to 'Robert' and display the updated data frame.")
print("Answer:")
print(df)

# Sort the data frame by Score in descending order
df_sorted <- df %>% arrange(desc(Score))
print("Question 8: Sort the data frame by Score in descending order.")
print("Answer:")
print(df_sorted)

# Replace missing values in Score column with mean Score
df$Score[is.na(df$Score)] <- mean(df$Score, na.rm = TRUE)
print("Question 9: Replace missing Score values with the mean score and display the updated data frame.")
print("Answer:")
print(df)

# Extract and display Name and Score where Age < 30
print("Question 10: Extract and display Name and Score columns for rows where Age is less than 30.")
print("Answer:")
print(df %>% filter(Age < 30) %>% select(Name, Score))
