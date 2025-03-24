# Name: Ananya Ambekar
# Registration Number: 22BDS0074

# Load necessary library
library(dplyr)

# Print user details
cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Taking user input for the number of students
cat("Let's create a dataset of students!\n")
n <- as.integer(readline("Enter the number of students: "))

# Initialize vectors to store data
student_id <- numeric(n)
name <- character(n)
age <- numeric(n)
gender <- character(n)
gpa <- numeric(n)

# Loop to take student details as input
for (i in 1:n) {
  cat(paste("\nEnter details for Student", i, ":\n"))
  student_id[i] <- as.integer(readline("Student ID: "))
  name[i] <- readline("Name: ")
  age[i] <- as.integer(readline("Age: "))
  gender[i] <- readline("Gender (M/F): ")
  gpa[i] <- as.numeric(readline("GPA: "))
}

# Create the data frame
students <- data.frame(StudentID = student_id, Name = name, Age = age, Gender = gender, GPA = gpa)

# Q1: Create a data frame with the provided table data
cat("\n(i) Create a data frame with the provided table data:\n")
print(students)

# Q2: Calculate the mean GPA of all students
mean_gpa <- mean(students$GPA, na.rm = TRUE)
cat("\n(ii) Calculate the mean GPA of all students:\n")
cat("Mean GPA:", mean_gpa, "\n")

# Q3: Create two separate data frames: one for male students and one for female students
male_students <- filter(students, Gender == "M")
female_students <- filter(students, Gender == "F")

cat("\n(iii) Create two separate data frames: one for male students and one for female students:\n")
cat("Male Students:\n")
print(male_students)
cat("Female Students:\n")
print(female_students)

# Q4: Add a new column named Classification to classify students as "High" if their GPA is 3.5 or above, and "Low" otherwise
students$Classification <- ifelse(students$GPA >= 3.5, "High", "Low")
cat("\n(iv) Add a new column named Classification to classify students as 'High' if their GPA is 3.5 or above, and 'Low' otherwise:\n")
print(students)

# Q5: Identify the student with the highest age and display their Name, Age, and GPA
oldest_student <- students[which.max(students$Age), ]
cat("\n(v) Identify the student with the highest age and display their Name, Age, and GPA:\n")
print(oldest_student)

# Q6: Remove duplicate entries based on Name, keeping only the first occurrence
students <- students[!duplicated(students$Name), ]
cat("\n(vi) Remove duplicate entries based on Name, keeping only the first occurrence:\n")
print(students)

# Q7: Count and display the number of male and female students
num_males <- sum(students$Gender == "M")
num_females <- sum(students$Gender == "F")
cat("\n(vii) Count and display the number of male and female students:\n")
cat("Number of Male Students:", num_males, "\n")
cat("Number of Female Students:", num_females, "\n")

# Q8: Create a summary table that shows the average GPA for each gender. Replace missing GPA values with median GPA and display the updated data frame.
median_gpa <- median(students$GPA, na.rm = TRUE)
students$GPA[is.na(students$GPA)] <- median_gpa

summary_table <- students %>%
  group_by(Gender) %>%
  summarise(Average_GPA = mean(GPA, na.rm = TRUE))

cat("\n(viii) Create a summary table that shows the average GPA for each gender. Suppose some students have missing GPA values. Replace these missing values with the median GPA and display the updated data frame:\n")
print(summary_table)
cat("\nUpdated Data Frame:\n")
print(students)
