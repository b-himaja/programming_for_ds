# i) Load the airquality dataset
data(airquality)

# ii) Display the first few rows
head(airquality)

# iii) Summary statistics
summary(airquality)

# iv) Display structure of the dataset
str(airquality)

# v) Adjust plot margins and plot Ozone levels over time
par("mar")
par(mar=c(1,1,1,1))
plot(airquality$Ozone, type = "l", main = "Ozone levels over time", xlab = "Time", ylab = "Ozone")

# vi) Remove rows with missing values
airquality_clean <- na.omit(airquality)

# vii) Display first few rows of cleaned dataset
head(airquality_clean)

# viii) Scatter plot of Ozone vs Temperature after removing missing values
clean_data <- na.omit(airquality[, c("Ozone", "Temp")])
plot(clean_data$Temp, clean_data$Ozone, main = "Ozone versus Temperature", xlab = "Temperature", ylab = "Ozone")

# a) Add regression line
abline(lm(Ozone ~ Temp, data = clean_data), col="green")

# b) Boxplot of Ozone levels for different temperature bins
airquality$TempBins <- cut(airquality$Temp, breaks = c(0, 60, 69, 79, 89, Inf), labels = c("<60", "60-69", "70-79", "80-89", "90+"))
boxplot(Ozone ~ TempBins, data = airquality, main = "Ozone Levels by Temperature Bins", xlab = "Temperature Bins", ylab = "Ozone")

