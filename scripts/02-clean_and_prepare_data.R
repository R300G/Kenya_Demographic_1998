#### Preamble ####
# Purpose: Clean the survey data downloaded from the DHS Paper, saved as raw data.
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
age_data_final <- 
  Reduce(plyr::rbind.fill, age_data_list)
age_data_final <- age_data_final %>%
  group_by(age_group, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
age_data_final <- age_data_final %>%
  filter(!is.na(age_group)) %>%
  select(age_group, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()

write.csv(age_data_final, "outputs/data/age_cleaned_data.csv",row.names = FALSE) ##save age_data_final to ‘outputs/data/cleaned_age_data.csv’.


# data cleaning and manipulation for education

educ_data_male <-
  raw_data_male %>%
  slice(43:47) %>%
  select(-total) %>%
  rename("education" = "background_characteristic")
educ_data_female <-
  raw_data_female %>%
  slice(42:46) %>%
  select(-total) %>%
  rename("education" = "background_characteristic")
m17 <- educ_data_male[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m18 <- educ_data_male[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m19 <- educ_data_male[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m20 <- educ_data_male[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "male")

m21 <- educ_data_male[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "male")

m22 <- educ_data_male[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "male")

m23 <- educ_data_male[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m24 <- educ_data_male[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m25 <- educ_data_male[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m26 <- educ_data_male[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m27 <- educ_data_male[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m28 <- educ_data_male[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m29 <- educ_data_male[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m30 <- educ_data_male[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m31 <- educ_data_male[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m32 <- educ_data_male[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

f17 <- educ_data_female[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f18 <- educ_data_female[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f19 <- educ_data_female[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f20 <- educ_data_female[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "female")

f21 <- educ_data_female[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "female")

f22 <- educ_data_female[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "female")

f23 <- educ_data_female[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f24 <- educ_data_female[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f25 <- educ_data_female[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f26 <- educ_data_female[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f27 <- educ_data_female[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f28 <- educ_data_female[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f29 <- educ_data_female[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f30 <- educ_data_female[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f31 <- educ_data_female[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f32 <- educ_data_female[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")
educ_data_list <- list(m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32)
educ_data_final <- 
  Reduce(plyr::rbind.fill, educ_data_list)
educ_data_final <- educ_data_final %>%
  group_by(education, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
educ_data_final <- educ_data_final %>%
  filter(!is.na(education)) %>%
  select(education, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()


write.csv(educ_data_final, "outputs/data/educ_cleaned_data.csv",row.names = FALSE)  ##save educ_data_final to ‘outputs/data/educ_data_final.csv’.

# data cleaning and manipulation for residence

res_data_male <-
  raw_data_male %>%
  slice(30:31) %>%
  select(-total) %>%
  rename("residence" = "background_characteristic")
res_data_female <-
  raw_data_female %>%
  slice(29:31) %>%
  select(-total) %>%
  rename("residence" = "background_characteristic")
m33 <- res_data_male[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m34 <- res_data_male[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m35 <- res_data_male[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m36 <- res_data_male[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "male")

m37 <- res_data_male[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "male")

m38 <- res_data_male[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "male")

m39 <- res_data_male[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m40 <- res_data_male[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m41 <- res_data_male[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m42 <- res_data_male[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m43 <- res_data_male[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m44 <- res_data_male[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m45 <- res_data_male[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m46 <- res_data_male[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m47 <- res_data_male[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m48 <- res_data_male[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

f33 <- res_data_female[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f34 <- res_data_female[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f35 <- res_data_female[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f36 <- res_data_female[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "female")

f37 <- res_data_female[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "female")

f38 <- res_data_female[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "female")

f39 <- res_data_female[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f40 <- res_data_female[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f41 <- res_data_female[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f42 <- res_data_female[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f43 <- res_data_female[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f44 <- res_data_female[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f45 <- res_data_female[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f46 <- res_data_female[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f47 <- res_data_female[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f48 <- res_data_female[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

res_data_list <- list( m33, m34, m35, m36, m38, m39, m40, m41, m42, m43,m44, m45, m46, m47, m48, f33, f34, f35, f36, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48)
res_data_final <- 
  Reduce(plyr::rbind.fill, res_data_list)
res_data_final <- res_data_final %>%
  group_by(residence, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
res_data_final <- res_data_final %>%
  filter(!is.na(residence)) %>%
  select(residence, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()

write.csv(res_data_final, "outputs/data/res_cleaned_data.csv",row.names = FALSE) ##save res_data_final to ‘outputs/data/cleaned_res_data.csv’.

# data cleaning and manipulation for residence

mar_data_male <-
  raw_data_male %>%
  slice(21:23) %>%
  select(-total) %>%
  rename("mar_stat" = "background_characteristic")
mar_data_female <-
  raw_data_female %>%
  slice(20:23) %>%
  select(-total) %>%
  rename("mar_stat" = "background_characteristic")
m49 <- mar_data_male[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m50 <- mar_data_male[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m51 <- mar_data_male[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m52 <- mar_data_male[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "male")

m53 <- mar_data_male[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "male")

m54 <- mar_data_male[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "male")

m55 <- mar_data_male[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m56 <- mar_data_male[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m57 <- mar_data_male[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m58 <- mar_data_male[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m59 <- mar_data_male[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m60 <- mar_data_male[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m61 <- mar_data_male[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m62 <- mar_data_male[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m63 <- mar_data_male[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m64 <- mar_data_male[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

f49 <- mar_data_female[, c(1, 2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f50 <- mar_data_female[, c(1, 3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f51 <- mar_data_female[, c(1, 4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f52 <- mar_data_female[, c(1, 5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "female")

f53 <- mar_data_female[, c(1, 6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "female")

f54 <- mar_data_female[, c(1, 7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "female")

f55 <- mar_data_female[, c(1, 8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f56 <- mar_data_female[, c(1, 9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f57 <- mar_data_female[, c(1, 10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f58 <- mar_data_female[, c(1, 11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f59 <- mar_data_female[, c(1, 12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f60 <- mar_data_female[, c(1, 13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f61 <- mar_data_female[, c(1, 14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f62 <- mar_data_female[, c(1, 15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f63 <- mar_data_female[, c(1, 16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f64 <- mar_data_female[, c(1, 17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

mar_data_list <- list(  m49, m50, m51, m52, m53, m54, m55, m56, m57, m58, m59, m60, m61, m62, m63, m64, f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63, f64)
mar_data_final <- 
  Reduce(plyr::rbind.fill, mar_data_list)
mar_data_final <- mar_data_final %>%
  group_by(mar_stat, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
mar_data_final <- mar_data_final %>%
  filter(!is.na(mar_stat)) %>%
  select(mar_stat, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()

write.csv(mar_data_final, "outputs/data/mar_cleaned_data.csv",row.names = FALSE) ##save res_data_final to ‘outputs/data/cleaned_res_data.csv’.
