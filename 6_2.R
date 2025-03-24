# R script to perform SQL queries on sales data
# Name: Ananya Ambekar
# Registration Number: 22BDS0074

cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")
# Load required library
library(RSQLite)

# Create an in-memory SQLite database
conn <- dbConnect(SQLite(), ":memory:")

# Take user input for sales data
num_products <- as.integer(readline("Enter the number of products: "))
product_id <- numeric(num_products)
product_name <- character(num_products)
units_sold <- numeric(num_products)
price <- numeric(num_products)

for (i in 1:num_products) {
  cat("Enter details for product", i, "\n")
  product_id[i] <- as.integer(readline("Product ID: "))
  product_name[i] <- readline("Product Name: ")
  units_sold[i] <- as.integer(readline("Units Sold: "))
  price[i] <- as.numeric(readline("Price: "))
}

# Create Sales table
sales_data <- data.frame(
  Product_ID = product_id,
  Name = product_name,
  Units_Sold = units_sold,
  Price = price
)

# Write data to the database
dbWriteTable(conn, "Sales", sales_data, row.names = FALSE)

# Function to execute and print SQL queries
display_query <- function(query, message) {
  result <- dbGetQuery(conn, query)
  cat("\n", message, "\n")
  print(result)
}

# 1. Find all products where the units sold are greater than 150
query1 <- "SELECT * FROM Sales WHERE Units_Sold > 150"
display_query(query1, "Products with units sold greater than 150:")

# 2. Select only the Name and Price columns from the table
query2 <- "SELECT Name, Price FROM Sales"
display_query(query2, "Selected columns (Name, Price):")

# 3. Count how many products have sold less than or equal to 100 units
query3 <- "SELECT COUNT(*) AS Product_Count FROM Sales WHERE Units_Sold <= 100"
display_query(query3, "Number of products with <= 100 units sold:")

# 4. Retrieve the Product ID and Name of the product with the highest price
query4 <- "SELECT Product_ID, Name FROM Sales ORDER BY Price DESC LIMIT 1"
display_query(query4, "Product with the highest price:")

# 5. Update the prices of all products by increasing them by 10%
dbExecute(conn, "UPDATE Sales SET Price = Price * 1.1")
query5 <- "SELECT Name, Price FROM Sales"
display_query(query5, "Updated prices after 10% increase:")

# Close the database connection
dbDisconnect(conn)
