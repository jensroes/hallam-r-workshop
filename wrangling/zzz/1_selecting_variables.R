# Load libraries
library(tidyverse)

# Import data as tibble
data <- read_csv("data/prowrite-4-tasks.csv")
glimpse(data)

# select with index, start_with(), ends_with(), contains()
select(data, z_start, edge_id, pretext)
select(data, z_start:pretext)
select(data, 2:4)
select(data, starts_with("n_"))
select(data, ends_with("_run"))
select(data, contains("fix"))
select(data, where(is.character))

# removing variables
select(data, -z_start, -edge_id, -pretext)
select(data, -z_start:-pretext)
select(data, -starts_with("n_"))

# rename while select
select(data, z = z_start)

# Exercise: Select variables ppt, task, and anything that is numeric
newdata <- select(data, ppt, task, where(is.numeric))
