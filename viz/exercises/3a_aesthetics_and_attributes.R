# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# For this exercise we use the differences between rt of the dominant and non-dominant hand.
# For following line computes a new variable.
blomkvist <- mutate(blomkvist, hand_diff = rt_hand_nd - rt_hand_d)

# Check out the variable (the new variable is on the bottom of this output):
glimpse(blomkvist)

# Scatter plot of the differences
# Complete the code by mapping hand_diff on the y axis and age on the x-axis
diff_plot <- ggplot(data = ---, mapping = aes(x = ---, y = ---)) 

# We can now add dots and have them distinguish between smoker.
# For example, we can use shape as aesthetic of the dots.
diff_plot + geom_point(mapping = aes(shape = ---))

# You might want to increase the size of the symbols to make them better visible (try 3).
# In this case, size is an attribute.
diff_plot + geom_point(mapping = aes(shape = ---), size = ---)

# Shape is not really helpful though. Instead of shape, try colour.
diff_plot + geom_point(mapping = aes(colour = ---), size = ---)

# We can use for example "size" as aesthetic to add a third numeric variables
diff_plot + geom_point(mapping = aes(--- = medicine))

# Note that size as attribute needs to be defined outside the aes() mappings.
# Anything we write inside of aes() will interpreted as aesthetic.

# or the transparency / opacity using "alpha" (0 = fully transparent, 1 = fully opaque)
diff_plot + geom_point(mapping = aes(size = medicine, --- = medicine))

# or combine numeric and categorical variables. Try colour for the categorical
# variable and size for the numeric variable
diff_plot + geom_point(mapping = aes(--- = smoker, --- = medicine))

# There are a lot of overlapping data points. 
# We can change some attributes to make more data visible.

# Change shape to a non-filled shape. Use for example 1 as shape. 
diff_plot + geom_point(mapping = aes(size = medicine, colour = smoker), shape = ---)

# Or we can reduce the increase the transparency by reducing alpha. Try .35
diff_plot + geom_point(mapping = aes(size = medicine, colour = smoker), alpha = ---)

# These techniques allow us to deal with overplotting. 
# Another way to reduce overplotting is to adjust the position of the geom (see Exercise 3b).

