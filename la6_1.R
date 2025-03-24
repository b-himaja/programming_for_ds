
library(httr)
library(jsonlite)
library(ggplot2)
library(dplyr)

# Set API Key

# i) Retrieve Current Weather Data
library(httr)
library(jsonlite)

api_key <- ""  # Replace with your API key
lat <- 39.099724
long <- -94.578331
base_url <- "https://api.openweathermap.org/data/"


# Retrieve Current Weather Data
url <- paste0(base_url, "3.0/onecall?lat=", lat, "&lon=", long, "&appid=", api_key, "&units=metric") 
response <- GET(url)
weather_data <- fromJSON(content(response, "text", encoding = "UTF-8"))

str(weather_data$current$weather)

# Extract relevant information
city_name <- weather_data$timezone
temperature <- weather_data$current$temp 
humidity <- weather_data$current$humidity
weather_desc <- weather_data$current$weather$description  

# Display results
print(paste("City:", city_name))
print(paste("Temperature:", temperature, "°C"))
print(paste("Weather:", weather_desc))
print(paste("Humidity:", humidity, "%"))


# ii) Retrieve 5-Day Weather Forecast
forecast_url <- paste0(base_url, "2.5/forecast?lat=", lat, "&lon=",long, "&appid=", api_key)
forecast_response <- GET(forecast_url)
forecast_data <- fromJSON(content(forecast_response, "text"))

# Extract date, temperature, and weather description
forecast_df <- data.frame(
  date = as.Date(forecast_data$list$dt_txt),
  temp = forecast_data$list$main$temp,
  weather = forecast_data$list$weather[[1]]$description
)

# Plot temperature over time
ggplot(forecast_df, aes(x = date, y = temp)) +
  geom_line(color = "blue") +
  ggtitle("5-Day Temperature Forecast") +
  xlab("Date") + ylab("Temperature (°C)")

# iii) Retrieve Historical Weather Data (Last 30 Days)
# OpenWeatherMap requires a paid plan for historical data


