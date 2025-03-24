
# i) Create a data frame with student details
students <- data.frame(
  StudentID = 101:105,
  Name = c("John", "Jane", "Mike", "Emily", "Anna"),
  Age = c(21, 22, 20, 21, 22),
  Gender = c("M", "F", "M", "F", "F"),
  GPA = c(3.5, 3.8, 2.9, 3.6, 3.9)
)

# ii) Calculate the mean GPA of all students
mean(students$GPA)

# iii) Separate male and female students
male_students <- students[students$Gender == "M", ]
female_students <- students[students$Gender == "F", ]
print(male_students)
print(female_students)

# iv) Add a new column "Classification" based on GPA
students$Classification <- ifelse(students$GPA >= 3.5, "High", "Low")
print(students)

# v) Identify the student with the highest age
highest_age_student <- students[which.max(students$Age), c("Name", "Age", "GPA")]
print(highest_age_student)

# vi) Remove duplicate entries based on Name
students <- students[!duplicated(students$Name), ]
print(students)

# vii) Count the number of male and female students
table(students$Gender)

# viii) Replace missing GPA values with the median and calculate average GPA by gender
students$GPA[is.na(students$GPA)] <- median(students$GPA, na.rm = TRUE)
aggregate(GPA ~ Gender, data = students, FUN = mean)
print(students)
