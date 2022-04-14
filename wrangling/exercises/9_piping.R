# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Instead of 
blomkvist_slct <- select(blomkvist, id, starts_with("rt_"))

# we can do 
blomkvist_slct <- blomkvist %>% select(id, starts_with("rt_"))

# and even chain up other functions like filter
blomkvist_slct_flt <- blomkvist %>% 
  select(id, starts_with("rt_")) %>%
  filter(rt_hand_d > 2000)

# Translate the remaining lines of code in this script 
# into one chain using the pipe operator.
# For every operation you add, check how the output looks like!
# How would you pipe this one:

# Read in data
blomkvist <- read_csv("../data/blomkvist.csv") 

# Select variables
blomkvist_slct <- select(blomkvist, id, starts_with("rt_"))

# Transform data to long format
blomkvist_lgr <- pivot_longer(blomkvist_slct, cols = -id, 
                              names_to = c(".value", "response_by", "dominant"),
                              names_pattern = "(.+)_(.+)_(.+)") 

# Recode the names for "dominant"
blomkvist_rcd <- mutate(blomkvist_lgr, across(dominant, recode, 
                                                        d = "dominant", 
                                                        nd = "non-dominant")) 

# Remove rts that are larger 97.5% or the data:
blomkvist_flt <- filter(blomkvist_rcd, rt < quantile(rt, probs = .975, na.rm = TRUE)) 


# Group by response_by and dominant
blomkvist_grpd <- group_by(blomkvist_flt, response_by, dominant) 

# Summarise data
blomkvist_smrd <- summarise(blomkvist_grpd, across(rt, 
                                                   list(mean = mean, 
                                                        median = median, 
                                                        sd = sd), na.rm = TRUE))

# Ungroup resulting summary
blomkvist_fin <- ungroup(blomkvist_smrd)
  
# Check out result
blomkvist_fin
  
  
  