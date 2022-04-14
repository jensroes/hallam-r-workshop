# Load tidyverse package (which includes ggplot2 and many other useful functions for data processing)
# If you haven't installed tidyverse, uncomment and run this line:
# install.packages("tidyverse")
library(tidyverse)

# Load the data
blomkvist <- read_csv("data/blomkvist.csv") 

# Explore the data blomkvist with glimpse()
glimpse(---) # replace "---"

# Make sure you have an idea of the variable names in the data.
# Eg, what could rt_hand_d mean (vs rt_foot_nd)?

# Map rt of the dominant hand on the x-axis and rt of the non-dominand hand on the y-axis
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---)) +
  geom_point()

# There are some participants with more extreme values. Let's see who are those individuals.
# 1. Map rt of dominant hand on the x-axis and rt of non-dominant hand on the y-axis (as before).
# 2. Map id on label.
# 3. Replace geom_point() with geom_text() or geom_label().
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---, label = --)) +
  geom_point()

# It's hard to see the participants on the lower end. Use the logarithm for both axis to increase the 
# distance between values on the lower end of the scale.
# 1. x and y as before.
# 2. I already added scale_y_log10() to log transform the y-axis. Do the same for the x-axis.
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---)) +
  geom_point() +
  scale_y_log10() +
  ---

# Repeat the previous plot with text or labels instead of points.

# Copy the previous code and add a linear model to it, i.e.:
# + stat_smooth(method = "lm")

# We can change the attributes of the points. For example we can have large red £ signs 
# (if you think that's a good idea). 
ggplot(data = blomkvist, mapping = aes(x = rt_hand_d, y = rt_hand_nd)) +
  geom_point(colour = "red", shape = "£", size = 16)

# Recreate the same plot as before but instead of red £s use green filled triangles in size 8.
# To figure out how to get the shape filled triangle, check here:
# http://www.sthda.com/english/wiki/ggplot2-point-shapes

ggplot(data = ---, mapping = aes(y = ---, x = ---)) +
  geom_point(colour = "---", shape = "---", size = ---)