# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select id, smoker, age, medicine and rt of dominant hand renamed as rt
blomkvist <- select(blomkvist, ---)

# Remove rts larger than 1.5 secs.
blomkvist_filtered <- filter(blomkvist, ---)

# Recode medicine: no need to write the code again :)
blomkvist_med <- mutate(blomkvist_filtered, 
                        medicine_cat = case_when(medicine == 0 ~ "none",
                                                 medicine <= 4 ~ "low",
                                                 is.na(medicine) ~ NA_character_, # NAs should stay NA
                                                 TRUE ~ "high")) # everything else is "high"

# Add the sample mean and a variable that indicates
# whether or not an rt value is larger than the average.
blomkvist_med <- mutate(blomkvist_med, mean_rt = mean(rt),
                        is_slow = rt > mean_rt)

# Check out the new two columns
blomkvist_med

# Summarise the data
# get the mean of rt
# add the median of age
# get the mean of is_slow (what does this represent?)
# get the sum of is_slow (what does this represent?)
# what is N?
summarise(---, 
          mean_rt = mean(---),
          median_age = ---,
          prop_is_slow = mean(---), 
          sum_is_slow = sum(---),
          N = n())

# Group data by medicine_cat
blomkvist_grouped <- group_by(blomkvist_med, medicine_cat)

# Check the the second line says "Groups: ..."
blomkvist_grouped

# Summarise the data with the same stats as above but with data grouped by medicine_cat.
summarise(---,---)

# Don't forget to ungroup your data again:
blomkvist_ungrouped <- ungroup(blomkvist_grouped)
