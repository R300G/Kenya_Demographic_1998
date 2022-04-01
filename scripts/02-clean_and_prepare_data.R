#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites:
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().


library(haven)
library(tidyverse)
library(janitor)
# Read in the raw data.

# data cleaning and manipulation for age
raw_data_male <- readr::read_csv("outputs/data/raw_data_male.csv")
raw_data_female <- readr::read_csv("outputs/data/raw_data_female.csv")
raw_data_male <- mutate_if(raw_data_male, is.character, as.factor)

age_data_male <-
  raw_data_male %>%
  slice(13:18) %>%
  select(-total) %>%
  rename("age_group" = "background_characteristic")
age_data_female <-
  raw_data_female %>%
  slice(13:18) %>%
  select(-total) %>%
  rename("age_group" = "background_characteristic")
m1 <- age_data_male[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m2 <- age_data_male[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m3 <- age_data_male[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m4 <- age_data_male[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "male")

m5 <- age_data_male[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "male")

m6 <- age_data_male[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "male")

m7 <- age_data_male[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m8 <- age_data_male[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m9 <- age_data_male[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m10 <- age_data_male[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m11 <- age_data_male[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m12 <- age_data_male[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m13 <- age_data_male[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m14 <- age_data_male[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m15 <- age_data_male[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m16 <- age_data_male[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

f1 <- age_data_female[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f2 <- age_data_female[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f3 <- age_data_female[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f4 <- age_data_female[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "female")

f5 <- age_data_female[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "female")

f6 <- age_data_female[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "female")

f7 <- age_data_female[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f8 <- age_data_female[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f9 <- age_data_female[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f10 <- age_data_female[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f11 <- age_data_female[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f12 <- age_data_female[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f13 <- age_data_female[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f14 <- age_data_female[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f15 <- age_data_female[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f16 <- age_data_female[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")
age_data_list <- list(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16)
age_data_final <- age_data_final %>%
  Reduce(plyr::rbind.fill, age_data_list)
age_data_final <- age_data_final %>%
  group_by(age_group, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
age_data_final <- age_data_final %>%
  filter(!is.na(age_group)) %>%
  select(age_group, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()
#### What's next? ####
