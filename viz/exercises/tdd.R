# Load tidyverse package (which includes ggplot2 and many other useful functions for data processing)
library(tidyverse)

# Load data frame 
tdd <- read_csv("data/tdd.csv")

# Inspect data frame
glimpse(tdd)

# Get the mean and the standard deviation for each of the 13 data sets
# Convince yourself that all dataset have the same mean and standard deviation for x and y.
tdd %>% group_by(dataset) %>%
  summarise(across(c(x,y), 
                   list(mean = mean, sd = sd)))

# You can also run 13 linear regressions and correlations
# which show relatively similar (if not identical) relationships between y and x.
tdd %>% nest(data = c(x,y)) %>% 
  mutate(x_mean = map(data, ~mean(.$x)),
         x_sd = map(data, ~sd(.$x)),
         y_mean = map(data, ~mean(.$y)),
         y_sd = map(data, ~sd(.$y)),
         model = map(data, ~lm(y ~ x, data = .)),
         intercept = map(model, ~coef(.)[1]),
         slope = map(model, ~coef(.)[2]),
         cor = map(data, ~cor(.$y, .$x))) %>% 
  select(-model, -data) %>%
  unnest(-dataset) %>%
  mutate(across(where(is.numeric), round, 2))

# Don't worry if this code is confusing. It's just a concise way of running many
# regression models in one go.
# All that matters is that you can see that for all datasets, the estimates (mean, sd
# intercept, slope, correlation coefficient) are virtually identical.

# Regression lines illustrate this relationship for each of the 13 data sets.
ggplot(data = tdd, aes(y = y, x = x)) +
  facet_wrap(~dataset, labeller = label_both) +
  geom_smooth(method = "lm", fullrange = T, se = F)

# The last line in the previous code creates the regression line.
# Task: Create a scatterplot with points instead of regression lines.
# Add the following line to the code below to create a scatter plot: geom_point(size = 0.5) 
# Convince yourself that the relationship between y and x are very different for each of the data sets.
ggplot(data = tdd, aes(y = y, x = x)) +
  facet_wrap(~dataset, labeller = label_both) 
