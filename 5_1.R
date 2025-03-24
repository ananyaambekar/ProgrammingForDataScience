cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

install.packages("dplyr")
install.packages("nycflights13")
# Load necessary libraries
library(dplyr)
library(nycflights13)

# Question 1
cat("1. Which airline has the highest number of delayed departures?\n")
most_delayed_airline <- flights %>%
  filter(dep_delay > 0) %>%  # Consider only delayed flights
  group_by(carrier) %>%  # Group by airline
  summarise(delayed_flights = n()) %>%  # Count the number of delayed flights
  arrange(desc(delayed_flights)) %>%  # Sort in descending order
  slice(1)  # Get the top airline

print(most_delayed_airline)


# Question 2
cat("2. On average, to which airport do flights arrive most early?\n")
most_early_airport <- flights %>%
  filter(!is.na(arr_delay)) %>%  # Exclude missing values
  group_by(dest) %>%  # Group by destination airport
  summarise(avg_arrival_early = mean(arr_delay, na.rm = TRUE)) %>%  # Calculate average arrival delay
  arrange(avg_arrival_early) %>%  # Sort in ascending order (earliest arrivals first)
  slice(1)  # Get the top destination

print(most_early_airport)


# Question 3
cat("3. In which month do flights tend to have the longest delays?\n")
longest_delay_month <- flights %>%
  filter(!is.na(dep_delay)) %>%  # Exclude missing values
  group_by(month) %>%  # Group by month
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%  # Calculate average departure delay
  arrange(desc(avg_dep_delay)) %>%  # Sort in descending order
  slice(1)  # Get the top month

print(longest_delay_month)


