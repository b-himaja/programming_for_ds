data(mtcars)

# 1. Boxplot of MPG by Cylinder Count
ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot() +
  ggtitle("MPG Distribution by Cylinder Count") +
  xlab("Cylinders") + ylab("Miles per Gallon")

# 2. Scatter Plot of Horsepower vs MPG
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  ggtitle("Horsepower vs MPG") +
  xlab("Horsepower") + ylab("Miles per Gallon")

# 3. Facet Grid Plot of MPG vs Weight by Gear
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  facet_grid(~gear) +
  ggtitle("MPG vs Weight by Gear Type") +
  xlab("Weight") + ylab("Miles per Gallon")
