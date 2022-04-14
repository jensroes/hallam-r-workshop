# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# Check out the variables in the data
glimpse(blomkvist)

# Univariate distribution

# Visualising the distribution of the rt of the dominant hand
# Let create the plotting canvas first. Map rt of dominant hand on the x axis
rt_plot <- ggplot(data = ---, aes(x = ---)) 

# Create a histogram by adding geom_histogram()
rt_plot + ---

# Create a density plot by adding geom_density()
rt_plot + ---

# Use the code for the density plot from before and log scale the x axis: scale_x_log10()
rt_plot + --- + ---

# The information represented in the histogram can be summarised in a boxplot.
# Lets see how a boxplot is summarsing a univariate distribution.
# First lets create a new canvas with the rt of the dominant hand mapped on the y-axis.
rt_plot_2 <- ggplot(data = blomkvist, aes(x = 0, y = ---)) +
  coord_cartesian(xlim = c(-1,1))

# To allow us to compare the following visualisations we set x to 0 and the limits of the x-axis to -1 to 1.

# Have a look at the plot created so far:
rt_plot_2

# Now represent the data as points, i.e. geom_point()
rt_plot_2 + ---

# Points are overlapping on the lower end.
# You can add some jitter to the points using position_jitter. 
rt_plot_2 + ---

# There are many observations on the lower end and few on the upper.
# In additional to jittered points, use log scale the x axis using scale_y_log10()
rt_plot_2 + --- + ---

# To add summary descriptives to the plot, we can add a boxplot using geom_boxplot() to the jittered points 
# and the log scaled y axis
rt_plot_2 + --- + --- + ---
  
# Finally of using a dummy variable for x, we can all a categorical variable
# such as "sex" to be represented on the x axis to allow for easy comparisons between
# the rts of males and females
ggplot(data = blomkvist, aes(x = ---, y = rt_hand_d)) +
  geom_jitter(width = .25) +
  scale_y_log10() +
  geom_boxplot(outlier.shape = NA, width = .5)

# Continue with Exercise 4b
