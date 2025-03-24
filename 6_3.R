# Load necessary library
library(RSQLite)

# Create a connection to an in-memory SQLite database
conn <- dbConnect(SQLite(), ":memory:")

# Create the courses table
dbExecute(conn, "CREATE TABLE courses (
    CourseID INTEGER,
    CourseName TEXT,
    StudentsEnrolled INTEGER,
    CourseFee INTEGER
)")

# Take user input for course data
cat("Enter number of courses to add: ")
num_courses <- as.integer(readline())

for (i in 1:num_courses) {
  cat("\nEnter details for Course", i, "\n")
  course_id <- as.integer(readline("Course ID: "))
  course_name <- readline("Course Name: ")
  students_enrolled <- as.integer(readline("Students Enrolled: "))
  course_fee <- as.integer(readline("Course Fee ($): "))
  
  query <- sprintf("INSERT INTO courses VALUES (%d, '%s', %d, %d)", 
                   course_id, course_name, students_enrolled, course_fee)
  dbExecute(conn, query)
}

# Print Name and ID
cat("\nAnanya Ambekar\n22BDS0074\n\n")

# Question i)
cat("Q(i): Identify all courses where more than 50 students are enrolled.\n")
query1 <- "SELECT * FROM courses WHERE StudentsEnrolled > 50"
result1 <- dbGetQuery(conn, query1)
print(result1)

# Question ii)
cat("\nQ(ii): Select only the Course Name and Course Fee columns from the table.\n")
query2 <- "SELECT CourseName, CourseFee FROM courses"
result2 <- dbGetQuery(conn, query2)
print(result2)

# Question iii)
cat("\nQ(iii): Count how many courses have 50 or fewer students enrolled.\n")
query3 <- "SELECT COUNT(*) AS CourseCount FROM courses WHERE StudentsEnrolled <= 50"
result3 <- dbGetQuery(conn, query3)
print(result3)

# Question iv)
cat("\nQ(iv): Retrieve the Course ID and Course Name of the course with the highest fee.\n")
query4 <- "SELECT CourseID, CourseName FROM courses ORDER BY CourseFee DESC LIMIT 1"
result4 <- dbGetQuery(conn, query4)
print(result4)

# Question v)
cat("\nQ(v): Increase the fees for all courses by 5% and display the updated fees.\n")
dbExecute(conn, "UPDATE courses SET CourseFee = CourseFee * 1.05")
query5 <- "SELECT CourseID, CourseName, CourseFee FROM courses"
result5 <- dbGetQuery(conn, query5)
print(result5)

# Close connection
dbDisconnect(conn)
