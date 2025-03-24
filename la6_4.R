library(ggplot2)
data(iris)

# 1. Scatter Plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  ggtitle("Sepal Length vs Sepal Width") +
  xlab("Sepal Length") + ylab("Sepal Width")

# 2. Pairwise Plot
pairs(iris[, 1:4], col = iris$Species)

# 3. Histogram of Petal Length
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(fill = "blue", bins = 20) +
  ggtitle("Histogram of Petal Length") +
  xlab("Petal Length") + ylab("Frequency")
