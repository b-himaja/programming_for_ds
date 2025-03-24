# 3. Diamond Analysis using ggplot2

library(ggplot2)

# 1. Find the diamond cut with the most diamonds priced above $5000
diamonds %>%
  filter(price > 5000) %>%
  count(cut, sort = TRUE) %>%
  head(1)

# 2. Find the diamond clarity with the lightest diamonds (smallest avg carat weight)
diamonds %>%
  group_by(clarity) %>%
  summarise(avg_weight = mean(carat)) %>%
  arrange(avg_weight) %>%
  head(1)

# diamonds %>%
#   group_by(month) %>%
#   summarise(avg_price = mean(price)) %>%
#   arrange(desc(avg_price)) %>%
#   head(1)

# Since the diamonds dataset does not have a date column, this part is hypothetical
print("The dataset does not have a time column to analyze average price by month.")
