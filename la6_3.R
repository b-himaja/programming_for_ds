con <- dbConnect(SQLite(), ":memory:")

# Create Courses table

dbExecute(con, "CREATE TABLE courses (CourseID INTEGER, CourseName TEXT, StudentsEnrolled INTEGER, CourseFee REAL)")

# Insert data
dbExecute(con, "INSERT INTO courses VALUES (3001, 'Data Science', 50, 1200),
                                           (3002, 'Web Development', 75, 800),
                                           (3003, 'Digital Marketing', 40, 600),
                                           (3004, 'Cloud Computing', 90, 1000),
                                           (3005, 'Cybersecurity', 60, 1500)")

# i) Identify courses with more than 50 students
dbGetQuery(con, "SELECT * FROM courses WHERE StudentsEnrolled > 50")

# ii) Select Course Name and Fee
dbGetQuery(con, "SELECT CourseName, CourseFee FROM courses")

# iii) Count courses with 50 or fewer students
dbGetQuery(con, "SELECT COUNT(*) FROM courses WHERE StudentsEnrolled <= 50")

# iv) Retrieve the Course with the highest fee
dbGetQuery(con, "SELECT CourseID, CourseName FROM courses ORDER BY CourseFee DESC LIMIT 1")

# v) Increase fees by 5% and display updated fees
dbExecute(con, "UPDATE courses SET CourseFee = CourseFee * 1.05")
dbGetQuery(con, "SELECT * FROM courses")

# Close connection
dbDisconnect(con)
