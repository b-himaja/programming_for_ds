# i) Load diabetes dataset
diabetes_data <- read.csv("diabetes.csv")

# ii) Display first 10 rows and summary statistics
head(diabetes_data, 10)
summary(diabetes_data)
str(diabetes_data)

# iii) Handling missing data
missing_values <- colSums(is.na(diabetes_data))
print(missing_values)

diabetes_data[is.na(diabetes_data)] <- apply(diabetes_data, 2, function(x) median(x, na.rm = TRUE))
head(diabetes_data,10)

# iv) Visualizing data distributions
# Histogram of Glucose Levels
hist(diabetes_data$Glucose, 
     main = "Glucose Level Distribution", 
     xlab = "Glucose", 
     ylab = "Frequency", 
     col = "blue")

# Boxplot of BMI by Outcome
boxplot(BMI ~ Outcome, data = diabetes_data, 
        main = "BMI Distribution by Outcome", 
        xlab = "Outcome (0 = No Diabetes, 1 = Diabetes)", 
        ylab = "BMI")

# Scatter Plot of Insulin vs Glucose
plot(diabetes_data$Insulin, diabetes_data$Glucose, 
     col = diabetes_data$Outcome + 1, 
     pch = 19, 
     main = "Insulin vs Glucose", 
     xlab = "Insulin", 
     ylab = "Glucose")

# Adding a legend for Outcome categories
legend("topright", 
       legend = c("Outcome 0 (No Diabetes)", "Outcome 1 (Diabetes)"), 
       col = 1:2, 
       pch = 19)

# Histogram of Age Distribution
hist(diabetes_data$Age, 
     main = "Age Distribution", 
     xlab = "Age", 
     ylab = "Frequency", 
     col = "green")


# Boxplot of Age by Outcome
boxplot(Age ~ Outcome, data = diabetes_data, 
        main = "Age Distribution by Outcome", 
        xlab = "Outcome (0 = No Diabetes, 1 = Diabetes)", 
        ylab = "Age")

# v) Compute and display correlation matrix
cor_matrix <- cor(diabetes_data[, sapply(diabetes_data, is.numeric)], use = "pairwise.complete.obs")
print(cor_matrix)
