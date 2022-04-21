# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select the following variables: id, age, all rt measures
blomkvist <- select(blomkvist, id, ---)

# Changing the format of data from wide to long and back.
# We want all rts in one column as specified in cols:
blomkvist_long <- pivot_longer(blomkvist, cols = ---)

# Check out the resulting data format
blomkvist_long

# Transform this back to wide format
pivot_wider(---, names_from = "name", values_from = "value")

# That's all really. Everything else is only cosmetic.

# We can change the names of the resulting "name" and "value" columns:
# cols is the same as above.
# Set names_to to "group" and values_to to "rt
pivot_longer(blomkvist, 
             cols = ---, 
             names_to = ---, 
             values_to = ---)

# In the data, rt_hand/foot_n/nd decodes the rt of dominant and non-dominant hand and foot.
# It would make sense to store hand/foot and n/nd in two different columns.
# Hence, we would get three new columns (rt, hand/foot, dominant/non-dominant).
# The current column name can be seperated into the new columns:
pivot_longer(---, 
             cols = ---, 
             names_to = c(".value", "response_by", "dominant"),
             names_pattern = "(.+)_(.+)_(.+)") # check out what happens if you remove "+"

# .value indicates that the value name comes the first part of the current column name
# which is "rt" for all four columns.

# Btw, here is the shortcut for variable names that follow systematic naming conventions.
blomkvist_long <- pivot_longer(---, 
                               cols = ---, 
                               names_to = c(".value", "response_by", "dominant"),
                               names_sep = "_") 


# And back to long format:
pivot_wider(---, # needs to be the last long data 
            names_from = c("response_by", "dominant"), 
            values_from = ---, # name of the reaction time column
            names_prefix = "rt_") # this is optional

# Summarise data for the next trick:
# Group data
blomkvist_grouped <- group_by(blomkvist_long, response_by, dominant) 

# Summarise data
blomkvist_summary <- summarise(blomkvist_grouped, 
                      across(rt, list(mean = mean, sd = sd),  na.rm = TRUE))

# Ungroup data
blomkvist_summary <- ungroup(blomkvist_summary)

# Pivot is better than older reshaping functions because it can handle more than
# one variable at once like so:
pivot_wider(---, # needs to be the summary data set 
            names_from = ---, # use dominant 
            values_from = c(rt_mean, rt_sd))
