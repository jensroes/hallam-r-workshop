# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select variables
blomkvist <- select(blomkvist, id, starts_with("rt_"))
blomkvist <- select(blomkvist, id, starts_with("pal_"))


# Joining data sets
# inner join:  includes all rows in first and second data set
inner_join(data_locs, data_events)

# full join includes all rows in both data set.
full_join(data_locs, data_events)

# left join includes all rows in first data set
left_join(data_locs, data_events)

# right join includes all rows in second data set
right_join(data_locs, data_events)


# bind_cols
# data must have the same number of rows to be bound as columns
data_ppt <- select(data, ppt)
data_task <- select(data, task)

bind_cols(data_ppt, data_task)


# bind_rows
# data must have the same number of columns and names
# but not necessarily in the same order:
data_a <- filter(data, task == "A")
# scramble order of variables a little :)
data_a <- select(data_a, ppt, location, task, event_duration)
data_b <- filter(data, task == "B")

bind_rows(data_a, data_b)

