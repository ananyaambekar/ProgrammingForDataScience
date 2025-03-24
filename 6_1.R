print("Ananya Ambekar")
print("22BDS0074")


library(httr)
library(jsonlite)


my_api_key <- "8b74e0d5155cff73790544808adbbae0"
# add_headers(Authorization = paste("bearer", yelp_key))
# source("api_key.R")

get_current_weather_by_latlon <- function(lat, lon, api_key) {
  base_url <- "http://api.openweathermap.org/data/2.5/weather"
  response <- GET(base_url, query = list(lat = lat, lon = lon, appid = api_key, units = "metric"))
  
  # Check if the request was successful
  if (response$status_code == 200) {
    weather_data <- fromJSON(content(response, as = "text"))
    
    # Extract required information from the API response
    city_name <- weather_data$name                  # City Name
    temperature <- weather_data$main$temp           # Temperature in Celsius
    weather_desc <- weather_data['current']['weather']['description']  # Weather Description
    
    # Print the extracted information
    cat("City Name: ", city_name, "\n")
    cat("Temperature (C): ", temperature, "\n")
    #    cat("Weather Description: ", weather_desc, "\n")
    print(weather_desc)
  } else {
    # Handle errors
    cat("Error: Unable to fetch data. Status code: ", response$status_code, "\n")
  }
}

# Call the function with lat, lon, and API key
api_key <- "8b74e0d5155cff73790544808adbbae0Y"  # Replace with your actual API key
latitude <- 33.44  # Example latitude
longitude <- -94.04  # Example longitude
get_current_weather_by_latlon(latitude, longitude, my_api_key)