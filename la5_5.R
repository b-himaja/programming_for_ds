# 5. Global Development Data Analysis using gapminder

library(gapminder)
library(dplyr)

# 1. Selecting country, year, and GDP per capita
gapminder %>%
  select(country, year, gdpPercap)

# 2. Filtering data for Asia in 2007
gapminder %>%
  filter(year == 2007 & continent == "Asia")

# 3. Adding GDP in millions and GDP growth
gapminder_new <- gapminder %>%
  group_by(country) %>%
  mutate(
    gdp_million = gdpPercap * pop / 1e6,
    gdp_growth = ifelse(year == 2007,
                        (gdpPercap - lag(gdpPercap, order_by = year)) / lag(gdpPercap, order_by = year) * 100,
                        NA)
  )

# Print the first 20 rows of the updated table before ungrouping
print(gapminder_new, n = 20)


# 4. Arranging data by highest GDP per capita
gapminder %>%
  arrange(desc(gdpPercap), country)

# 5. Summarizing mean GDP per capita and total population
gapminder %>%
  summarise(mean_gdpPercap = mean(gdpPercap, na.rm = TRUE),
            total_pop = sum(pop, na.rm = TRUE))

# 6. Finding the highest-ranked country in 2007 based on GDP per capita
gdp_rank <- function(x) {
  return(rank(-x, ties.method = "first"))
}

gapminder %>%
  filter(year == 2007) %>%
  mutate(rank = gdp_rank(gdpPercap)) %>%
  summarise(
    country = country[which.min(rank)],
    highest_gdp = max(gdpPercap)
  )

# 7. Finding the continent with the highest GDP per capita in 2007
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(avg_gdpPercap = mean(gdpPercap, na.rm = TRUE)) %>%
  arrange(desc(avg_gdpPercap)) %>%
  head(1)
