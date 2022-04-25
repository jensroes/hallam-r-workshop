# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select variables: id and rename to ppt, age, and the rt of the dominant hand (rename to rt)
blomkvist <- select(blomkvist, ppt = ---, smoker, age, rt = ---)

# Filtering data: keeping data that fulfill our inclusion criteria.
# rts larger than or equal to 1 sec
filter(blomkvist, rt >= ---)

# only rows with missing rt values
filter(blomkvist, is.na(---))

# only rows with non-missing rt values
filter(---, !is.na(---))

# rts smaller than 500 msecs
filter(blomkvist, --- < 500)

# rts larger than 500 msec and smaller than 1 sec
filter(blomkvist, ---, ---)

# rts larger than 750 msecs for individuals younger than 50
filter(---, --, ---)

# rts larger than the average rt
filter(---, --- > mean(---, na.rm = TRUE))
# na.rm = TRUE removes missing values when calculating the mean

# Only smokers
filter(blomkvist, --- == ---)

# How do you know the category names for smoker?
count(blomkvist, smoker)

# or
unique(blomkvist$---)

# Only non-smokers and former smokers
filter(blomkvist, --- %in% c(---, ---))

# Only smokers whose age is above the median age of this sample
filter(blomkvist, --- == ---, 
                  --- > ---(---, na.rm = TRUE))

# Assign the result to a new data variable called "blomkvist_filtered".
# Conditions are: rts are smaller than 500, or larger 1250, age is younger than 40,
# and only smokers and non-smokers (not former smokers)
--- <- filter(---, ---)

# Inspect new data variable using glimpse
glimpse(---)

# How do you know your filter code was successful 
# (other than confidence in your code)?

