cat("Name: Ananya Ambekar\n")
cat("Registration Number: 22BDS0074\n\n")

# Load necessary libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# Load the dataset (assuming it's named 'education_data')
education_data <- read.csv("education_data.csv")

# Q6) TIDYR in Action: Exploring Educational Statistics
cat("Q6) TIDYR in Action: Exploring Educational Statistics\n\n")

# 1. Compare Each Country's Educational Expenditure in 1990 and 2014
cat("1. Comparing Educational Expenditure in 1990 and 2014\n")
edu_expenditure <- education_data %>% 
  filter(Indicator == "Government expenditure on education, total (% of GDP)" & Year %in% c(1990, 2014))

# Visualization
edu_plot <- ggplot(edu_expenditure, aes(x = Year, y = Value, color = Country)) +
  geom_point() +
  labs(title = "Educational Expenditure (% of GDP) in 1990 vs 2014")
print(edu_plot)

# 2. Reshape Educational Data
cat("2. Reshaping Spain's Educational Expenditure Data\n")
edu_spain <- education_data %>% 
  filter(Country == "Spain" & Indicator == "Government expenditure on education, total (% of GDP)") %>%
  mutate(Year = as.numeric(gsub("X", "", Year)))

print(edu_spain)

# 3. Compare Literacy Rate and Unemployment Rate
cat("3. Comparing Literacy Rate and Unemployment Rate (2014)\n")
female_lit_unemp <- education_data %>% 
  filter(Year == 2014 & Indicator %in% c("Literacy rate, female (% of females ages 15 and above)", 
                                         "Unemployment, female (% of female labor force)")) %>%
  spread(Indicator, Value)

# Scatter Plot
lit_unemp_plot <- ggplot(female_lit_unemp, aes(x = `Literacy rate, female (% of females ages 15 and above)`,
                                               y = `Unemployment, female (% of female labor force)`)) +
  geom_point() +
  labs(title = "Female Literacy Rate vs Unemployment Rate (2014)")
print(lit_unemp_plot)

cat("Analysis Completed Successfully!\n")
