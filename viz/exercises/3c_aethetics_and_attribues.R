# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# For this exercise we use the differences between rt of the dominant and non-dominant hand.
# For following line computes a new variable.
blomkvist <- mutate(blomkvist, hand_diff = rt_hand_nd - rt_hand_d)

# To create a histogram, we just need to map the variable difference on the x axis.
# Add the variable difference to x.
# To distinguish sex, we need to separate fill and colour for category.
hist_diff <- ggplot(---, aes(x = hand_diff, fill = ---, colour = ---)) 

# So far, we created the canvas for plotting
hist_diff

# Data can be rendered as a histogram. Set alpha to .25: 
hist_diff + geom_histogram(alpha = ---)

# By default the two groups are shown as stacked bars which can be made explicit as:
hist_diff + geom_histogram(position = "---", alpha = ---)

# Better ways of representing the data is by replacing stack with "dodge"
# (bars are next to each other)
hist_diff + geom_histogram(position = "---", alpha = ---)

# Or "identity" (red bars are behind blue bars)
hist_diff + geom_histogram(position = "---", alpha = ---)

# Or "fill".
hist_diff + geom_histogram(position = "---", alpha = ---)

# Note how the position of the bars changed.

