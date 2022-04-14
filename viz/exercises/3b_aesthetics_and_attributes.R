# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv") 

# For this exercise we use the differences between rt of the dominant and non-dominant hand.
# For following line computes a new variable.
blomkvist <- mutate(blomkvist, hand_diff = rt_hand_nd - rt_hand_d)

# Working with position jitter.
# Create this plot:
diff_plot <- ggplot(blomkvist, aes(x = hand_diff, y = 0)) +
  coord_cartesian(ylim = c(-1, 1))

# Consider this example. There are a lot of data hidden.
diff_plot + geom_point()

# This can be solved by adding position "jitter" to the data
diff_plot + geom_point(position = "---")

# Or by using the wrapper function `geom_jitter()`
diff_plot + ---

# Set alpha to .5 and size to 1 to improve the visability of the jittered dots.
diff_plot + geom_---(alpha = ---, size = ---) 

# For using positioning in histograms continue with Exercise 3c.