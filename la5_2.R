# 2. Vehicle Performance Analysis using mtcars dataset

data(mtcars)


# 1. Find the car model with the highest horsepower
mtcars %>%
  mutate(model = rownames(mtcars)) %>%
  arrange(-hp) %>%
  select(model, hp) %>%
  head(1)

# 2. Find the car model with the best fuel efficiency (lowest mpg)
mtcars %>%
  mutate(model = rownames(mtcars)) %>%
  arrange(mpg) %>%
  select(model, mpg) %>%
  head(1)

# 3. Find the cylinder category with the highest average weight
mtcars %>%
  group_by(cyl) %>%
  summarise(avg_weight = mean(wt)) %>%
  arrange(desc(avg_weight))
