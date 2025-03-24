# Load necessary libraries
library(tidyr)
library(ggplot2)


# Assuming dataset is named `education`
wb_data <- read.csv(
  "education.csv",
  stringsAsFactors = F,
  skip = 4
)
head(wb_data,1)

# 1. Compare educational expenditure in 1990 & 2014

library(scales)  # Load the scales package

indicator <- "Government expenditure on education, total (% of GDP)"

# Filter the dataset
expenditure_plot_data <- wb_data %>%
  filter(Indicator.Name == indicator) %>%
  filter(!is.na(X1990) & !is.na(X2014))  # Remove rows with missing values

# Create the plot
expenditure_chart <- ggplot(data = expenditure_plot_data) +
  geom_text(mapping = aes(x = X1990 / 100, y = X2014 / 100, label = Country.Code)) +
  scale_x_continuous(labels = percent_format(accuracy = 1)) +  # Fix `percent` issue
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  labs(
    title = indicator,
    x = "Expenditure in 1990",
    y = "Expenditure in 2014"
  )

print(expenditure_chart)

# 2. Reshape Educational Data for Spain
long_year_data <- wb_data %>%
  gather(
    key = year,
    value = value, 
    X1960:X
  )

# Filter the rows for the indicator and country of interest
indicator <- "Government expenditure on education, total (% of GDP)"
spain_plot_data <- long_year_data %>%
  filter(
    Indicator.Name == indicator,
    Country.Code == "ESP" # Spain
  ) %>%
  mutate(year = as.numeric(substr(year, 2, 5)))

head(spain_plot_data)
# 3. Compare literacy rate and unemployment rate in 2014
# Reshape the data to create columns for each indicator
wide_data <- long_year_data %>%
  select(-Indicator.Code) %>% 
  spread(
    key = Indicator.Name, 
    value = value
  )

if (!(x_var %in% names(wide_data))) {
  stop(paste("Column", x_var, "not found in wide_data!"))
}

if (!(y_var %in% names(wide_data))) {
  stop(paste("Column", y_var, "not found in wide_data!"))
}

colnames(wide_data)
head(wide_data)
x_var <- "Literacy rate, adult female (% of females ages 15 and above)"
y_var <- "Unemployment, female (% of female labor force) (modeled ILO estimate)"
lit_plot_data <- wide_data %>%
  mutate(
    lit_percent_2014 = wide_data[, x_var]/100,
    employ_percent_2014 = wide_data[, y_var]/100
  ) %>%
  filter(year == "X2014")
# Show the  graph for literacy vs. employment rates
ggplot(data = lit_plot_data) +
  geom_point(mapping = aes(x = lit_percent_2014, y = employ_percent_2014))
scale_x_continuous(labels = percent) +
  scale_y_continuous(labels = percent) +
  labs(
    x = x_var,
    y = "Unemployment, female (% of female labor force)",
    title = "Female Literacy Rate versus Female Unemployment Rate"
  )
