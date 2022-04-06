# Load libraries
library(tidyverse)

# Import data as data frame
blomkvist_df <- read.csv("data/blomkvist.csv")

# ways to check out data
View(blomkvist_df) # not a fan :)

head(blomkvist_df) # just print the first rows

str(blomkvist_df) # str of the data

blomkvist_df # print out data (yuk)


# Import data as tibble
blomkvist_tbl <- read_csv("data/blomkvist.csv")

# Tasks (replace "---" correctly)

# Check out data
head(---) # just print the first rows 

# but: just type the name of the data variable in the console
glimpse(---) # like str() but better

# What happens if you use str() on the tibble format of the data

# Print out data by typing the name of the data variable
--- 
  
# How many observations are in the data?

# How many variables are in the data?
  
# What data type is "smoker"?
  
# What differences did you spot between using data frames and tibbles?

# You can save data after you loaded them into R using write_csv().
# First argument needs to be the name of your data variable.
# Second argument is the name of the file you want to save the data to.
# There is no need to do this now but sometimes you want to save
# a copy of the processed data. 
# Make sure you don't overwrite the original data though (use a new name).
write_csv(---, "data/mydata.csv")

# Open the data in a spreadsheet to check if it has worked.