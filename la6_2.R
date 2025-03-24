library(DBI)
library(RSQLite)

# Create an in-memory SQLite database
con <- dbConnect(SQLite(), ":memory:")

# Create Sales table
dbExecute(con, "CREATE TABLE sales (ProductID INTEGER, Name TEXT, UnitsSold INTEGER, Price REAL)")

# Insert data
dbExecute(con, "INSERT INTO sales VALUES (2001, 'Laptop', 150, 1200),
                                            (2002, 'Smartphone', 300, 800),
                                            (2003, 'Tablet', 100, 600),
                                            (2004, 'Smartwatch', 200, 300),
                                            (2005, 'Desktop', 75, 1000)")

# i) Find products where Units Sold > 150
dbGetQuery(con, "SELECT * FROM sales WHERE UnitsSold > 150")

# ii) Select only Name and Price columns
dbGetQuery(con, "SELECT Name, Price FROM sales")

# iii) Count products with Units Sold <= 100
dbGetQuery(con, "SELECT COUNT(*) FROM sales WHERE UnitsSold <= 100")

# iv) Retrieve the Product with the highest price
dbGetQuery(con, "SELECT ProductID, Name FROM sales ORDER BY Price DESC LIMIT 1")

# v) Increase prices by 10% and display updated table
dbExecute(con, "UPDATE sales SET Price = Price * 1.10")
dbGetQuery(con, "SELECT * FROM sales")

# Close connection
dbDisconnect(con)
