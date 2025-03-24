data(airquality)

# 1. Line Plot of Temperature Over Time
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line(color = "red") +
  ggtitle("Daily Temperature Trend") +
  xlab("Day") + ylab("Temperature (°F)")

# 2. Bar Plot of Average Ozone Levels per Month
ggplot(airquality, aes(x = factor(Month), y = Ozone)) +
  geom_bar(stat = "summary", fun = "mean", fill = "blue") +
  ggtitle("Average Ozone Levels by Month") +
  xlab("Month") + ylab("Ozone Level")

# 3. Boxplot of Wind Speed per Month
ggplot(airquality, aes(x = factor(Month), y = Wind, fill = factor(Month))) +
  geom_boxplot() +
  ggtitle("Wind Speed Distribution by Month") +
  xlab("Month") + ylab("Wind Speed")
