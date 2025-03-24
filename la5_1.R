# 1. NYC Flights Data Analysis

library(nycflights13)
library(dplyr)

# 1. Find the airline with the highest number of delayed departures
flights %>%
  filter(dep_delay > 0) %>%
  count(carrier, sort = TRUE) %>%
  head(1)

# 2. Find the destination airport where flights arrive most early (negative arrival delay)
flights %>%
  group_by(dest) %>%
  summarise(avg_arrival_early = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(avg_arrival_early) %>%
  head(1)

# 3. Find the month with the longest average departure delays
flights %>%
  group_by(month) %>%
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(avg_dep_delay)) %>%
  head(1)
