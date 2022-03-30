#### Preamble ####
# Purpose: Obtain and prepare data about men responding to questions about AIDS
# for demographics such as age and province.
# Author: 
# Email: 
# Date: 
# Prerequisites: - 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)

#### Simulate data ####
set.seed(853)
simulated_dhs_1998_pg163 <- 
  tibble(
    age = 
      c(
        rep('15-19', 3),
        rep('20-24', 3),
        rep('25-29', 3),
        rep('30-39', 3),
        rep('40-49', 3),
        rep('50-54', 3)
      ),
    can_healthy_aids = c(
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1),
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1),
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1),
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1),
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1),
      rep('yes', 1),
      rep('no', 1),
      rep('dont know', 1)
    ),
    nmr = 
      runif(n = 18, 
            min = 0, ##how to make only 3 rows be equal to 100?
            max = 100)
  )

