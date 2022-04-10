#### Preamble ####
# Purpose: Obtain and prepare data about men responding to questions about AIDS
# for demographics such as age and province.
# Author: 
# Email: 
# Date: 
# Prerequisites: - 



#### Simulate data ######## Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)

#### Simulate data ####

set.seed(853)
generate_survey_distribution <- function(n) {
  x <- runif(n, 0, 1)
  y <- x / sum(x)
  sum(y) == 1
  return(y * 100)
}
simulated_dhs_1998 <-
  tibble(
    demographic_info =
      c(
        rep("15-19", 8),
        rep("20-29",8),
        rep("30-39", 8),
        rep("40-49", 8),
        rep("50-54", 8),
        rep("0", 8),
        rep("1", 8),
        rep("2", 8),
        rep("3", 8),
        rep("4+", 8),
        rep("Central", 8),
        rep("Coast", 8),
        rep("Eastern", 8),
        rep("Nairobi", 8),
        rep("Nyanza", 8),
        rep("Rift Valley", 8),
        rep("Western", 8),
        rep("No education", 8),
        rep("Primary incomplete", 8),
        rep("Primary complete", 8),
        rep("Secondary+", 8)
      ),
    gender = rep(c(rep("female", 4), rep("male", 4)), 21),
    survey_answer =
      rep(c("no risk at all", "small", "moderate", "great"), 42),
    chances_of_getting_aids = c(replicate(42, generate_survey_distribution(4))),
   
  )

view(simulated_dhs_1998)
