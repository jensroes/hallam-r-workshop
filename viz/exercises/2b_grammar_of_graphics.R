# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# There are 4 more (optional) grammatical elements.

# Create a scatter plot with physical activity in leisure time (x-axis) and rt of dominant hand (y-axis)
pal_plot <- ggplot(data = blomkvist, mapping = aes(x = pal_leisure, y = rt_hand_d)) + 
  geom_jitter() # similar to geom_point() but adds some jitter to avoid overplotting
  
# Check out the pal plot
pal_plot

# 1. Facets: in facet_grid, replace "---" with smoker to create one panel per smoker level:
pal_plot + facet_grid( ~ ---)

# 2. Statistics: run the code below, then add + stat_smooth(method = "lm") and run again
ggplot(data = blomkvist, mapping = aes(x = pal_leisure, y = rt_hand_d, colour = sex)) +
  geom_jitter() 

# Run this code:
smoker_plot <- ggplot(data = blomkvist, mapping = aes(x = age, fill = smoker, colour = smoker)) + 
  geom_density(alpha = .5) # "alpha controlls the transparency of the colour

# Check the plot
smoker_plot

# 3. Coordinates: add + coord_flip()
smoker_plot + ---

# 4. Themes: non-data related information (ink)
# can be changed using preexisting "themes" as in the example below
smoker_plot + theme_bw()

# Copy the previous code and change theme_bw() to theme_linedraw().

# Try theme_minimal() as well.

# We can make manual adjustments too. Let's change the position of the legend 
# by adding a layer called "theme" and the argument legend.position.
# "right" is the default position. Replace "---" with "top" or "bottom"
age_plot + theme(legend.position = "---")
