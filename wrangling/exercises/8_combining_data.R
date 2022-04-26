# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select just a few variables for illustration
blomkvist <- select(blomkvist, id, age, medicine, smoker)

# Check you the data
blomkvist

# First some examples:
# bind_cols
# data must have the same number of rows to be bound as columns

# For illustration we create two 
blomkvist_1 <- select(blomkvist, id, age)
blomkvist_2 <- select(blomkvist, medicine, smoker)

# Check out both mini-datasets
blomkvist_1 # this only has id and age
blomkvist_2 # this has only medicine and smoker

# Data sets have nothing in common!

# bind_cols just merges them side by side
blomkvist_both <- bind_cols(blomkvist_1, blomkvist_2)

# Check the result:
blomkvist_both
# obviously this isn't great in this example cause you don't actually
# know if e.g. medicine info corresponds to id / age

# bind_rows
# data must have the same number of columns and names
# but not necessarily in the same order:
blomkvist_former <- filter(blomkvist, smoker == "former")
blomkvist_smoker <- filter(blomkvist, smoker == "yes")
# scramble order of variables a little :)
blomkvist_smoker <- select(blomkvist_smoker, age, smoker, medicine, id)

# Check out mini datasets
blomkvist_former
blomkvist_smoker

blomkvist_both <- bind_rows(blomkvist_former, blomkvist_smoker)

# Check out new data
blomkvist_both

# Task: 
# Here are two mini datasets
blomkvist_1 <- select(blomkvist, age, medicine)
blomkvist_2 <- filter(blomkvist_1, age > 50)

# There is only one possible way to combine these two datasets: bind_col or bind_rows?
blomkvist_both <- bind_---(blomkvist_1, blomkvist_2)
# Why is this the only way possible?

# Next, lets look at the different ways of joining data.
# Here are, again, two mini datasets.
blomkvist_meds <- select(blomkvist, age, medicine)
blomkvist_meds <- unique(blomkvist_meds)
blomkvist_smoker <- select(blomkvist, age, smoker)
blomkvist_smoker <- unique(blomkvist_smoker)
blomkvist_meds_o45 <- filter(blomkvist_meds, age > 45)
blomkvist_smoker_u50 <- filter(blomkvist_smoker, age < 50)

# Dataset 1: participants over 45 with meds info
blomkvist_meds_o45

# Dataset 2: participants under 50 with smoker info
blomkvist_smoker_u50

# Use blomkvist_meds_o45 and blomkvist_smoker_u50 for the following functions.
# Age will be used to combine both datasets
# Write a note for every function about the differences in the results,
# answering how the datasets were merged
inner_join(---, ---, by = "age")
# note:

full_join(---, ---, by = "age")
# note:

left_join(---, ---, by = "age")
# note:

right_join(---, ---, by = "age")
# note:

# More realistic example:
# Given are two data sets both have id and age but 
# one contains the smoker info
blomkvist_1 <- select(blomkvist, id, age, smoker)
# the other meds info
blomkvist_2 <- select(blomkvist, id, age, medicine)

# We want both smoker and meds in one dataset,
# so you know for each individual if they are smoker or not
# and how much meds they are taking.
# What do you do:
blomkvist_both <- ---_join(---, ---, by = "---")





