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
generate_survey_distribution <- function(n){
  x<- runif(n, 0, 1)
  y <- x/sum(x)
  sum(y) == 1
  return (y*100)
}
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
    survey_answer =
    rep(c("no","yes","dont_know"),6)
    ,
    question1 = rep(generate_survey_distribution(3),6)
  )
