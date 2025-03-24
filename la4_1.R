# i) Create a data frame with student details
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Name = c("Alice", "Bob", "Carol", "David", "Eve"),
  Age = c(23, 30, 27, 35, 29),
  Gender = c("F", "M", "F", "M", "F"),
  Score = c(85, 90, 78, 88, 91)
)

# ii) Display the first few rows of the data frame
head(data)

# iii) Extract the Score column
data$Score

# iv) Filter rows where Score is greater than 85
data[data$Score > 85, ]

# v) Add a new column "Passed" based on Score
data$Passed <- data$Score >= 85
print(data)

# vi) Summary statistics for Age and Score
summary(data[, c("Age", "Score")])

# vii) Convert Name column to character and update the Name where ID is 2
data$Name <- as.character(data$Name)
data[data$ID == 2, "Name"] <- "Robert"
print(data)

# viii) Sort data frame by Score in descending order
sorted_data <- data[order(-data$Score), ]
print(sorted_data)

# ix) Replace missing Score values with mean Score (assuming missing values)
data$Score[is.na(data$Score)] <- mean(data$Score, na.rm = TRUE)
print(data)

# x) Extract Name and Score for rows where Age is less than 30
data[data$Age < 30, c("Name", "Score")]
