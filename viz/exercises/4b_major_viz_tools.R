# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# Check out the variables in the data
glimpse(blomkvist)

# Comparing boxplots and dynamite plots for medicine
# Create a variable that distinguishes 4 levels for medicine (none, little, some, a lot)
# called `meds_cat`.
blomkvist <- mutate(blomkvist, # Recode "medicine"
                    meds_cat = case_when(medicine == 0 ~ "none",
                                         medicine <= 2 ~ "little",
                                         medicine <= 4 ~ "some",
                                         TRUE ~ "a lot"),
                    meds_cat = factor(meds_cat, # order the levels of meds_cat
                                      levels = c("none", "little", "some", "a lot"), 
                                      ordered = TRUE)) %>%
  drop_na(medicine)

# Let's start by creating a canvas for the data with rt of dominant hand on y axis and meds_cat on x axis.
p_meds <- ggplot(data = blomkvist, aes(y = ---, x = ---))

# Check out the plot so far: 
p_meds 

# Dynamite plots are frequently used to compare groups although there are very good 
# reasons to avoid these when copmaring groups.
# For practice here is how to create a dynamite plot.

# stat_summary allows us to calculate summary statistics such as the mean and error bars
# Check the following code. Medians are plotted as point.
# Try instead to represent the mean as "bar":
p_meds + stat_summary(fun = median, geom = "point", fill = "grey") 
# HINT: change median to mean and point to bar.
p_meds + stat_summary(fun = median, geom = "---", fill = "grey") 

# Repeat the above for the first stat_summary function below.
# The second stat_summary() should add the geom "errorbar"s. 
# Set width to 0.5.
p_meds + stat_summary(fun = ---, geom = "---", fill = "grey") +
  stat_summary(fun.data = mean_sdl, 
               geom = "---", width = ---)

# Pitfalls for dynamite plots
# 1. we don't know how the data are distributed (plot suggest normal distribution),
# 2. how many observation do we have in each group?
# 3. bars suggest data where there are none (e.g. zero rt).
# 4. there are values above the bar that are not shown in ink.
# Don't bother with dynamite plots :)

# Here are some alternatives equivalent to what you have done in the previous script:
# Add them to the canvas p_meds
--- + geom_point()
--- + geom_jitter(width = .1)
--- + geom_boxplot(width = .25)

# For boxplots you can change the colour attribute of outliers. Try red.
--- + geom_boxplot(width = .25, outlier.colour = "---")

# You can add notches which represent 95% confidence intervals.
# Set notch from FALSE to TRUE (FALSE is default)
--- + geom_boxplot(width = .25, notch = FALSE) 

# The middle line shows the median. You can add the mean though.
# Set fun to mean, geom to point and display the means in red.
p_meds + geom_boxplot(width = .25) +
  stat_summary(fun = ---, geom = "---", colour = "---") 

# As alternative you can use violin plots but they are not always helpful.
p_meds + geom_violin(draw_quantiles = c(.025,.5,.975), trim = F) # matter of taste ;)

# Add jittered data points to the boxplot below (reduce width).
# Note: outlier.shape = NA removes "outliers" because we want to add the raw data as jittered data points anyway.
p_meds + 
  geom_---(width = .15) + # jittered points here
  geom_---(width = .25, outlier.shape = NA, notch = TRUE) # boxplot here

# Consider this plot:
p_meds + 
  geom_jitter(width = .1) +
  stat_summary(fun = mean, geom = "point", size = 5, colour = "darkred") +
  stat_summary(fun.data = mean_sdl, 
               geom = "errorbar", 
               colour = "darkred",
               width = .25)

# Task:
# The errorbars in the plot indicate 2 times SD
# Instead you might want to use confidence intervals. 
# For CIs use the function mean_cl_normal instead of mean_sdl
# Change mean to median.
# Beautiful :)
