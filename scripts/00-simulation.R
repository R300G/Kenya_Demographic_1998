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

#One dataset for Age
set.seed(853)
generate_survey_distribution <- function(n) {
  x <- runif(n, 0, 1)
  y <- x / sum(x)
  sum(y) == 1
  return(y * 100)
}
simulated_dhs_1998_age <-
  tibble(
    age =
      c(
        rep("15-19", 12),
        rep("20-24", 12),
        rep("25-29", 12),
        rep("30-39", 12),
        rep("40-49", 12),
        rep("50-54", 12)
      ),
    gender = rep(c(rep("female", 6), rep("male", 6)), 6),
    survey_answer =
      rep(c("no", "yes", "dont_know", "almost_never", "some_times", "almost_always"), 12),
    can_healthy_looking_person_have_the_AIDS_virus = c(replicate(12, c(generate_survey_distribution(3), rep(NA, 3)))),
    is_AIDS_a_fatal_disease = c(replicate(12, c(rep(NA, 2), generate_survey_distribution(4)))),
    can_AIDS_be_cured = c(replicate(12, c(generate_survey_distribution(3), rep(NA, 3)))),
    can_the_AIDS_virus_be_transmitted_form_mother_to_child = c(replicate(12, c(generate_survey_distribution(3), rep(NA, 3)))),
    do_you_know_someone_with_AIDS_or_who_died_of_AIDS = c(replicate(12, c(generate_survey_distribution(3), rep(NA, 3)))),
  )

#One dataset for Education
set.seed(853)
generate_survey_distribution <- function(n) {
  x <- runif(n, 0, 1)
  y <- x / sum(x)
  sum(y) == 1
  return(y * 100)
}
simulated_dhs_1998_educ <-
  tibble(
    educ =
      c(
        rep("no_educ", 12),
        rep("prim_incom", 12),
        rep("prim_comp", 12),
        rep("sec_above", 12)
      ),
    gender = rep(c(rep("female", 6), rep("male", 6)), 4),
    survey_answer =
      rep(c("no", "yes", "dont_know", "almost_never", "some_times", "almost_always"), 8),
    can_healthy_looking_person_have_the_AIDS_virus = c(replicate(8, c(generate_survey_distribution(3), rep(NA, 3)))),
    is_AIDS_a_fatal_disease = c(replicate(8, c(rep(NA, 2), generate_survey_distribution(4)))),
    can_AIDS_be_cured = c(replicate(8, c(generate_survey_distribution(3), rep(NA, 3)))),
    can_the_AIDS_virus_be_transmitted_form_mother_to_child = c(replicate(8, c(generate_survey_distribution(3), rep(NA, 3)))),
    do_you_know_someone_with_AIDS_or_who_died_of_AIDS = c(replicate(8, c(generate_survey_distribution(3), rep(NA, 3)))),
  )

#One dataset for residence
set.seed(853)
generate_survey_distribution <- function(n) {
  x <- runif(n, 0, 1)
  y <- x / sum(x)
  sum(y) == 1
  return(y * 100)
}
simulated_dhs_1998_res <-
  tibble(
    educ =
      c(
        rep("urban", 12),
        rep("rural", 12)
      ),
    gender = rep(c(rep("female", 6), rep("male", 6)), 2),
    survey_answer =
      rep(c("no", "yes", "dont_know", "almost_never", "some_times", "almost_always"), 4),
    can_healthy_looking_person_have_the_AIDS_virus = c(replicate(4, c(generate_survey_distribution(3), rep(NA, 3)))),
    is_AIDS_a_fatal_disease = c(replicate(4, c(rep(NA, 2), generate_survey_distribution(4)))),
    can_AIDS_be_cured = c(replicate(4, c(generate_survey_distribution(3), rep(NA, 3)))),
    can_the_AIDS_virus_be_transmitted_form_mother_to_child = c(replicate(4, c(generate_survey_distribution(3), rep(NA, 3)))),
    do_you_know_someone_with_AIDS_or_who_died_of_AIDS = c(replicate(4, c(generate_survey_distribution(3), rep(NA, 3)))),
  )
view(simulated_dhs_1998_res)

#this comment