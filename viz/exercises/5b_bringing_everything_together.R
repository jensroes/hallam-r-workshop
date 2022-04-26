# Load tidyverse package 
library(tidyverse)
library(ggthemes)
# If not installed, install ggthemes
#install.packages("ggthemes")

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# In this script we will look at changing the appearance of a plot.
# We will use the long data format as before.

# We have looked at this earlier:
blomkvist_long <- pivot_longer(blomkvist, 
                               cols = starts_with("rt_"), 
                               names_to = c(".value", "response_by", "dominant"),
                               names_pattern = "(.+)_(.+)_(.+)") %>% 
  mutate(dominant = recode(dominant, 
                           d = "dominant", 
                           nd = "non-dominant"),
         smoker = recode(smoker, 
                         former = "Ex-smoker", 
                         yes = "Smoker", 
                         no = "Non-smoker")) %>% 
  filter(!is.na(smoker))

# This time we will use a boxplot.
ggplot(blomkvist_long, aes(y = rt, 
                           x = response_by, 
                           colour = dominant)) +
  geom_jitter() +
  geom_boxplot() +
  facet_wrap(~smoker) +
  scale_y_log10()

# There are a couple of data viz related things that needs cleaning up:

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1. Dots are too large.
# 2. We want red dots behind red boxplots and blue dots behind blue boxplots
# 3. Boxplots add dots for outliers that are shown as jittered dots anyway. 
# These need to be removed (i.e. either the jitter or the outliers).
# Use the code below. 
# `position_jitterdodge` allows us to control the width of the jitter and
# how far apart the dots are dodged, so they appear behind the boxplot.
# Finding the right values is often a bit of trial and error.

rt_plot <- ggplot(blomkvist_long, aes(y = rt, 
                                      x = response_by, 
                                      colour = dominant)) +
  geom_jitter(size = ---, # 1. set size to .5
              position = position_jitterdodge(jitter.width = ---, # 2. set jitter.width to .25
                                              dodge.width = ---)) + # and dodge.width to .75
  geom_boxplot(outlier.shape = ---) + # 3. set `oulier.shape` to NA
  facet_wrap(~smoker) +
  scale_y_log10()

# We've assigned the plot to a variable called `rt_plot` so to look at it, 
# you need to call it:
rt_plot

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# We definitely need to change the text.
# Not that we already change the labels for `smoker` and `dominant` above in anticipation.
# Correctly insert, `y`, `x`, `colour`
rt_plot <- rt_plot + 
  labs(--- = "Reaction time in msecs",
       --- = "Response made by", # I'm  not too happy with this label, so feel free to change it.
       --- = "") # Empty quotes is removing the legend title.
  
# Check out the new plot:
rt_plot

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Changing the colour scheme. 
# You can define colours yourself but often it is easier to use functions that provide
# colour schemes. Here are some example.
# I like the first one because it is designed for colourblind people
# and do a good job when printed on a grey scale.
rt_plot + scale_colour_colorblind() # `ggthemes` package
rt_plot + scale_color_wsj() # `ggthemes` package
rt_plot + scale_colour_viridis_d()

# Select your favourite and add the plot to `rt_plot`
rt_plot <- rt_plot + scale_colour_---()
  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# You can manually change the `theme` properties or use existing ones.
# For example:
rt_plot + theme_bw()
rt_plot + theme_classic()
rt_plot + theme_clean()
rt_plot + theme_light()

# Type `theme_` and you will see a drop down menu with all themes available in your environment.

# Choose your favourtie and add the plot to `rt_plot`
rt_plot <- rt_plot + theme_---()

# Changing the overall font size.
# All themes allow you to change the base font size (default size varies).
# Repeat the code from before but this time change the base size to 14
rt_plot <- rt_plot + theme_---(base_size = ---)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Changing theme properties manually.
# Legend position: I prefer to legend to be on the top or bottom to there is more room
# for showing data (default is "right")
# Removing grid in the background.
rt_plot + theme(legend.position = "---", # use "top" or "bottom
                legend.justification = "right", # default is "centre". Use "right" or "left".
                panel.grid.minor = ---) # `element_blank()` can be use to remove properties such as minor grid lines
  
# Add the above changes to rt_plot using assignment `<-` as above.


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# To save the plot you can use the following line. Before name the plot "myplot.pdf"
# Set width and height to 6.
# This code will save the plot that is currently open in the viewer.
ggsave("viz/---.pdf", width = ---, height = ---)

# The pdf with the plot is now in the visulisation workshop folder (viz).
# You can also use other image formats like ".png" instead of ".pdf".
