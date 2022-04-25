# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Check out variable names
names(blomkvist)

# Select variables of interest
select(blomkvist, id, sex, smoker)

# Get rid of variables you don't need
select(blomkvist, -medicine)

# Select multiple variables
select(blomkvist, ends_with("_d"))

# or
select(blomkvist, age, starts_with("rt_"))

# Remove multiple variable
select(blomkvist, -contains("hand_"))

# Use where() to remove all variables that are of the type character (is.character).
select(blomkvist, where(---))

# Tasks:
# Without spelling out every variable, ...
# select the following variables: id, medicine, pal_work, pal_leisure
select(blomkvist, ---)

# select the first 4 variables
select(---)

# remove all rt_ variables
select(---)

# remove all foot rt data
select(---)

# Assign the tibble with id and all rt_ variables to a new variable.
--- <- select(---)

# Check out new data variable using glimpse
glimpse(---)

# Use can rename variables while selecting them like so:
# select(data, new_name = old_name, var2, var3)
# Use select to keep id and all rt_ variables and rename id to ppt.
select(---)

# You can save your new data in csv format using:
write_csv(---, "data/name_of_target_file.csv")
