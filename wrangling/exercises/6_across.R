# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select id, smoker, age, and all rt columns
blomkvist <- select(blomkvist, id, smoker, age, starts_with("rt"))

# across and mutate to transform variables in situ
# This is how it works: 
# mutate(data, across(variables, function))
# or
# mutate(data, across(variables, ~function(.)))

# Change the following calls using across().
# Make sure you transform only the variables required by the code.

# 1.
mutate(blomkvist, rt_hand_d = log(rt_hand_d))

mutate(blomkvist, across(---, ---))

# 2.
mutate(blomkvist, rt_hand_d = rt_hand_d^2)

mutate(blomkvist, across(---, ~. ---))

# 3.
mutate(blomkvist, rt_hand_d = log(rt_hand_d),
                  rt_hand_nd = log(rt_hand_nd))

mutate(blomkvist, across(---, ---))

# 4.
mutate(blomkvist, rt_hand_d = log(rt_hand_d),
                  rt_hand_nd = log(rt_hand_nd),
                  rt_foot_d = log(rt_foot_d),
                  rt_foot_nd = log(rt_foot_nd))

mutate(blomkvist, across(---, ---))

# 5.
mutate(blomkvist, log_rt_hand_d = log(rt_hand_d),
                  log_rt_hand_nd = log(rt_hand_nd),
                  log_rt_foot_d = log(rt_foot_d),
                  log_rt_foot_nd = log(rt_foot_nd))

mutate(blomkvist, across(---, ---, .names = "---{.col}"))

# We want the rowwise means across all rt variables like so
mutate(blomkvist, mean_rt = (rt_hand_d + rt_hand_nd + rt_foot_d + rt_foot_nd)/4)
# but using c_across.

# c_across requires rowwise grouping
blomkvist_rowwise <- rowwise(blomkvist)

# Here is a(n incorrect) proposal that you need to fix.
mutate(blomkvist, some_kinda_mean = sum(c_across(where(is.numeric))))
# Is the data variable correct?
# What does where(is.numeric) do?
# Is sum() correct?
# Use a better name for the mean rt column

# We want to get the means all rt variables like so:
summarise(blomkvist, rt_hand_d_mean = mean(rt_hand_d, na.rm = TRUE),
                     rt_hand_nd_mean = mean(rt_hand_nd, na.rm = TRUE),
                     rt_foot_d_mean = mean(rt_foot_d, na.rm = TRUE),
                     rt_foot_nd_mean = mean(rt_foot_nd, na.rm = TRUE))

# but using across() as below.
# First argument needs to be the variables for aggregating
# and in list() you need to supply the function.
summarise(blomkvist, across(---, list(---)))

