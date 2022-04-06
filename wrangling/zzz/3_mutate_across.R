# Load libraries
library(tidyverse)

# Import data as tibble
data <- read_csv("data/prowrite-4-tasks.csv") %>% 
  filter(event_duration > 50, event_duration < 10000) %>%
  select(ppt, task, location, next_event_type, event_duration, global_offset)


# mutate across
mutate(data, event_duration = log(event_duration))
mutate(data, across(event_duration, log))
mutate(data, across(event_duration, ~.^2))
mutate(data, across(c(event_duration, global_offset), log, .names = "log_{.col}"))
mutate(data, across(where(is.numeric), log))
mutate(data, across(starts_with("event_"), log))
mutate(data, across(c(task, location), factor))
mutate(data, across(where(is.character), factor))
mutate(data, across(task, ~paste("task: ", .)))


# Summary data for next examples
data_means <- data %>% mutate(is_prod = next_event_type == "production") %>%
  group_by(ppt, task, location) %>%
  summarise(sum_del = length(is_prod) - sum(is_prod)) %>%
  ungroup() 

# Pivot wider
data_wide <- pivot_wider(data_means, names_from = task, values_from = sum_del, names_prefix = "Task: ")

# mutate c_across and starts_with()
mutate(data_wide, total = `Task: A` + `Task: B` + `Task: followup` + `Task: intervention`)
mutate(data_wide, total = sum(c_across(starts_with("Task")), na.rm = TRUE))

rowwise(data_wide) %>%
  mutate(total = sum(c_across(starts_with("Task")))) %>%
  ungroup()

# Exercise:
# - mean across all tasks rowwise
# - change each task variable by subtracting the mean
# - square the differences between task and mean
# - sum across the squared differences
datanew <- rowwise(data_wide) %>% 
  mutate(mean_task = mean(c_across(starts_with("Task")), na.rm = TRUE),
         across(starts_with("Task")) - mean_task,
         across(starts_with("Task"))^2,
         sum_task = sum(c_across(starts_with("Task")), na.rm = TRUE))

