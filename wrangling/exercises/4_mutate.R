# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select id, smoker, age, medicine and rt of dominant hand renamed as rt
blomkvist <- select(blomkvist, ---)

# Remove all former smokers and rts larger than 1.5 secs.
blomkvist_filtered <- filter(blomkvist, ---)

# Make sure you code has worked!

# mutate, then! mutate is a function that allows you to create and change 
# variables in your data.
# Like so:
# mutate(data, new_variable = some_function(old_variable))

# transform the rt to its logarithm
mutate(blomkvist_filtered, log_rt = log(---))

# add the mean rt to the data and centre the rt by subtracting the mean.
mutate(blomkvist_filtered, --- = mean(---),
                           rt_ctr = --- - ---)

# add a column that indicates whether or not an rt is larger than the mean
mutate(blomkvist_filtered, ---)

# instead of the mean lets use the upper 2.5% or the data. You can get this value 
# using the quantile function.
quantile(blomkvist_filtered$rt, probs = .975)
# Use this function (not the returned value directly) to create a variable that 
# indicates whether or not an rt value is in the upper 2.5% of the data.
mutate(blomkvist_filtered, ---)

# Use case_when to recode medicine into a categorical variable that
# is "none" of when medicine is 0
# "low" when medicine is 1
# "med" when medicine is smaller or equal to 4
# and "high" for everything else that isn't NA
blomkvist_med <- mutate(blomkvist_filtered, 
                        medicine_cat = case_when(--- == --- ~ "none",
                                                 --- == --- ~ "low",
                                                 --- <= --- ~ "med",
                                                 is.na(---) ~ NA_character_, # NAs should stay NA
                                                 TRUE ~ ---)) # everything else is "high"

# Count each instance of medicine_cat
count(blomkvist_med, medicine_cat)
