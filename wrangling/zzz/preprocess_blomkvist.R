library(tidyverse) 
library(readxl) # read in excel files
library(janitor) # clean names

# Basic preprocessing (wide format)
data <- read_xlsx("data/samlet.xlsx") %>% 
  clean_names() %>%
  mutate(sex = recode(sex_m_1, `1` = "male",
                               `2` = "female"),
         smoker = recode(smoking_y_1_n_2_former_smoker_3, `1` = "yes", `2` = "no",
                          `3` = "former")) %>%
  select(id, sex, age, medicin = medicin_n, smoker, pal_work = pal_work_1_4, 
         pal_leisure = pal_leisure_1_4, rt_hand_d = rth_d, rt_hand_nd = rth_nd,
         rt_foot_d = rtf_d, rt_foot_nd = rtf_nd)

write_csv(data, "data/blomkvist.csv")
