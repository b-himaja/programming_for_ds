# 4. U.S. Presidential Elections Data Analysis

library(pscl)
library(dplyr)

data("presidentialElections")


# 1. Selecting year and democratic vote percentage
presidentialElections %>%
  select(year, demVote)

# 2. Filtering rows for the 2008 election in Colorado
presidentialElections %>%
  filter(year == 2008 & state == "Colorado")

# 3. Mutating to calculate other parties' vote percentage and vote difference
presidentialElections %>%
  mutate(other_parties_vote = 100 - demVote,
         abs_vote_difference = abs(demVote - other_parties_vote))

# 4. Arranging rows to show most recent elections first
presidentialElections %>%
  arrange(-year, demVote)

# 5. Summarizing mean Democratic and other parties' vote percentages
presidentialElections %>%
  summarise(mean_dem_vote = mean(demVote, na.rm = TRUE),
            mean_other_parties_vote = mean(100 - demVote, na.rm = TRUE))

# 6. Finding the biggest landslide (furthest from 50%)
furthest_from_50 <- function(x) {
  return(max(abs(x - 50)))
}

presidentialElections %>%
  summarise(biggest_landslide = furthest_from_50(demVote))

# 7. Finding the state with the highest Democratic vote in 2008
presidentialElections %>%
  filter(year == 2008) %>%
  arrange(-demVote) %>%
  head(1) %>%
  select(state, demVote)
