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
raw_data_female <- mutate_if(raw_data_female, is.character, as.factor)

# age_data_male <-
#   raw_data_male %>%
#   slice(13:18) %>%
#   rename(population_count = "total") %>%
#   rename(age_group = "background_characteristic")
# age_data_female <-
#   raw_data_female %>%
#   slice(13:18) %>%
#   rename(population_count = "total") %>%
#   rename(age_group = "background_characteristic")
# m1 <- age_data_male[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m2 <- age_data_male[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m3 <- age_data_male[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m4 <- age_data_male[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "male")
# 
# m5 <- age_data_male[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "male")
# 
# m6 <- age_data_male[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "male")
# 
# m7 <- age_data_male[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m8 <- age_data_male[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m9 <- age_data_male[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m10 <- age_data_male[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m11 <- age_data_male[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m12 <- age_data_male[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m13 <- age_data_male[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m14 <- age_data_male[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m15 <- age_data_male[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m16 <- age_data_male[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# f1 <- age_data_female[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f2 <- age_data_female[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f3 <- age_data_female[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f4 <- age_data_female[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "female")
# 
# f5 <- age_data_female[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "female")
# 
# f6 <- age_data_female[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "female")
# 
# f7 <- age_data_female[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f8 <- age_data_female[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f9 <- age_data_female[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f10 <- age_data_female[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f11 <- age_data_female[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f12 <- age_data_female[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f13 <- age_data_female[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f14 <- age_data_female[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f15 <- age_data_female[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f16 <- age_data_female[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# age_data_list <- list(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16)
# age_data_final <- 
#   Reduce(plyr::rbind.fill, age_data_list)
# age_data_final <- age_data_final %>%
#   group_by(age_group, gender, survey_answer) %>%
#   fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
#   slice(1)
# age_data_final <- age_data_final %>%
#   filter(!is.na(age_group)) %>%
#   select(age_group, gender, population_count, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
#   clean_names()
# 
# write.csv(age_data_final, "age_cleaned_data.csv",row.names = FALSE) ##save age_data_final to ‘outputs/data/cleaned_age_data.csv’.
# 
# 
# # data cleaning and manipulation for education
# 
# educ_data_male <-
#   raw_data_male %>%
#   slice(43:47) %>%
#   rename(population_count = "total") %>%
#   rename(education = "background_characteristic")
# educ_data_female <-
#   raw_data_female %>%
#   slice(42:46) %>%
#   rename(population_count = "total") %>%
#   rename(education = "background_characteristic")
# m17 <- educ_data_male[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m18 <- educ_data_male[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m19 <- educ_data_male[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m20 <- educ_data_male[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "male")
# 
# m21 <- educ_data_male[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "male")
# 
# m22 <- educ_data_male[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "male")
# 
# m23 <- educ_data_male[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m24 <- educ_data_male[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m25 <- educ_data_male[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m26 <- educ_data_male[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m27 <- educ_data_male[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m28 <- educ_data_male[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m29 <- educ_data_male[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m30 <- educ_data_male[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m31 <- educ_data_male[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m32 <- educ_data_male[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# f17 <- educ_data_female[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f18 <- educ_data_female[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f19 <- educ_data_female[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f20 <- educ_data_female[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "female")
# 
# f21 <- educ_data_female[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "female")
# 
# f22 <- educ_data_female[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "female")
# 
# f23 <- educ_data_female[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f24 <- educ_data_female[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f25 <- educ_data_female[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f26 <- educ_data_female[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f27 <- educ_data_female[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f28 <- educ_data_female[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f29 <- educ_data_female[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f30 <- educ_data_female[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f31 <- educ_data_female[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f32 <- educ_data_female[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# educ_data_list <- list(m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32)
# educ_data_final <- 
#   Reduce(plyr::rbind.fill, educ_data_list)
# educ_data_final <- educ_data_final %>%
#   group_by(education, gender, survey_answer) %>%
#   fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
#   slice(1)
# educ_data_final <- educ_data_final %>%
#   filter(!is.na(education)) %>%
#   select(education, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
#   clean_names()
# 
# 
# write.csv(educ_data_final, "educ_cleaned_data.csv",row.names = FALSE)  ##save educ_data_final to ‘outputs/data/educ_data_final.csv’.
# 
# # data cleaning and manipulation for residence
# 
# res_data_male <-
#   raw_data_male %>%
#   slice(30:31) %>%
#   rename(population_count = "total") %>%
#   rename(residence = "background_characteristic")
# res_data_female <-
#   raw_data_female %>%
#   slice(29:31) %>%
#   rename(population_count = "total") %>%
#   rename(residence = "background_characteristic")
# m33 <- res_data_male[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m34 <- res_data_male[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m35 <- res_data_male[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m36 <- res_data_male[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "male")
# 
# m37 <- res_data_male[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "male")
# 
# m38 <- res_data_male[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "male")
# 
# m39 <- res_data_male[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m40 <- res_data_male[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m41 <- res_data_male[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m42 <- res_data_male[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m43 <- res_data_male[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m44 <- res_data_male[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m45 <- res_data_male[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# m46 <- res_data_male[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "male")
# 
# m47 <- res_data_male[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "male")
# 
# m48 <- res_data_male[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "male")
# 
# f33 <- res_data_female[, c(1, 18,2)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f34 <- res_data_female[, c(1, 18,3)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f35 <- res_data_female[, c(1, 18,4)] %>%
#   dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f36 <- res_data_female[, c(1, 18,5)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
#   mutate(survey_answer = "almost never") %>%
#   mutate(gender = "female")
# 
# f37 <- res_data_female[, c(1, 18,6)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
#   mutate(survey_answer = "sometimes") %>%
#   mutate(gender = "female")
# 
# f38 <- res_data_female[, c(1, 18,7)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
#   mutate(survey_answer = "almost always") %>%
#   mutate(gender = "female")
# 
# f39 <- res_data_female[, c(1, 18,8)] %>%
#   dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f40 <- res_data_female[, c(1, 18,9)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f41 <- res_data_female[, c(1, 18,10)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f42 <- res_data_female[, c(1, 18,11)] %>%
#   dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f43 <- res_data_female[, c(1, 18,12)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f44 <- res_data_female[, c(1, 18,13)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f45 <- res_data_female[, c(1, 18,14)] %>%
#   dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# f46 <- res_data_female[, c(1, 18,15)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
#   mutate(survey_answer = "no") %>%
#   mutate(gender = "female")
# 
# f47 <- res_data_female[, c(1, 18,16)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
#   mutate(survey_answer = "yes") %>%
#   mutate(gender = "female")
# 
# f48 <- res_data_female[, c(1, 18,17)] %>%
#   dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
#   mutate(survey_answer = "don't know") %>%
#   mutate(gender = "female")
# 
# res_data_list <- list( m33, m34, m35, m36, m38, m39, m40, m41, m42, m43,m44, m45, m46, m47, m48, f33, f34, f35, f36, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48)
# res_data_final <- 
#   Reduce(plyr::rbind.fill, res_data_list)
# res_data_final <- res_data_final %>%
#   group_by(residence, gender, survey_answer) %>%
#   fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
#   slice(1)
# res_data_final <- res_data_final %>%
#   filter(!is.na(residence)) %>%
#   select(residence, gender, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
#   clean_names()
# 
# write.csv(res_data_final, "res_cleaned_data.csv",row.names = FALSE) ##save res_data_final to ‘outputs/data/cleaned_res_data.csv’.


get_data <- function(m_slice1,m_slice2,f_slice1,f_slice2, characteristic_type) {
  data_male <-
  raw_data_male %>%
  slice(m_slice1:m_slice2) %>%
  rename(population_count = "total") 
  data_female <-
  raw_data_female %>%
  slice(f_slice1:f_slice2) %>%
  rename(population_count = "total") 
m1 <- data_male[, c(1, 18,2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m2 <- data_male[, c(1, 18,3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m3 <- data_male[, c(1, 18,4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m4 <- data_male[, c(1, 18,5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "male")

m5 <- data_male[, c(1, 18,6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "male")

m6 <- data_male[, c(1, 18,7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "male")

m7 <- data_male[, c(1, 18,8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m8 <- data_male[, c(1, 18,9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m9 <- data_male[, c(1, 18,10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m10 <- data_male[, c(1, 18,11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m11 <- data_male[, c(1, 18,12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m12 <- data_male[, c(1, 18,13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m13 <- data_male[, c(1, 18,14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

m14 <- data_male[, c(1, 18,15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "male")

m15 <- data_male[, c(1, 18,16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "male")

m16 <- data_male[, c(1, 18,17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "male")

f1 <- data_female[, c(1, 18,2)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f2 <- data_female[, c(1, 18,3)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f3 <- data_female[, c(1, 18,4)] %>%
  dplyr::rename("can_a_healthy-looking_person_have_the_AIDS_vrius" = "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f4 <- data_female[, c(1, 18,5)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_never") %>%
  mutate(survey_answer = "almost never") %>%
  mutate(gender = "female")

f5 <- data_female[, c(1, 18,6)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_some_times") %>%
  mutate(survey_answer = "sometimes") %>%
  mutate(gender = "female")

f6 <- data_female[, c(1, 18,7)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_almost_always") %>%
  mutate(survey_answer = "almost always") %>%
  mutate(gender = "female")

f7 <- data_female[, c(1, 18,8)] %>%
  dplyr::rename("is_AIDS_a_fatal_disease" = "is_AIDS_a_fatal_disease_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f8 <- data_female[, c(1, 18,9)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f9 <- data_female[, c(1, 18,10)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f10 <- data_female[, c(1, 18,11)] %>%
  dplyr::rename("can_AIDS_be_cured" = "can_AIDS_be_cured_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f11 <- data_female[, c(1, 18,12)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f12 <- data_female[, c(1, 18,13)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f13 <- data_female[, c(1, 18,14)] %>%
  dplyr::rename("can_the_AIDS_virus_be_transmitted_from_mother_to_child" = "can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")

f14 <- data_female[, c(1, 18,15)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no") %>%
  mutate(survey_answer = "no") %>%
  mutate(gender = "female")

f15 <- data_female[, c(1, 18,16)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes") %>%
  mutate(survey_answer = "yes") %>%
  mutate(gender = "female")

f16 <- data_female[, c(1, 18,17)] %>%
  dplyr::rename("do_you_know_someone_with_AIDS_or_who_died_of_AIDS" = "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know") %>%
  mutate(survey_answer = "don't know") %>%
  mutate(gender = "female")
data_list <- list(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16)
data_final <- 
  Reduce(plyr::rbind.fill, data_list)
data_final <- data_final %>%
  group_by(background_characteristic, gender, survey_answer) %>%
  fill(c("can_a_healthy-looking_person_have_the_AIDS_vrius", "is_AIDS_a_fatal_disease", "can_AIDS_be_cured", "can_the_AIDS_virus_be_transmitted_from_mother_to_child", "do_you_know_someone_with_AIDS_or_who_died_of_AIDS"), .direction = "updown") %>%
  slice(1)
data_final <- data_final %>%
  filter(!is.na(background_characteristic)) %>% mutate(background_characteristic_type = characteristic_type )%>%
  select(background_characteristic,background_characteristic_type, gender, population_count, survey_answer, `can_a_healthy-looking_person_have_the_AIDS_vrius`, is_AIDS_a_fatal_disease, can_AIDS_be_cured, can_the_AIDS_virus_be_transmitted_from_mother_to_child, do_you_know_someone_with_AIDS_or_who_died_of_AIDS) %>%
  clean_names()
rm(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16,data_male,data_female,data_list)
return (data_final)
}
age_data_final <- get_data(13,18,13,17,"age group") 
education_data_final <- get_data(43,47,42,46,"education")
residence_data_final <- get_data(30,31,29,30,"residence")
marital_status_data_final <- get_data(21,23,20,22,"marital status")
province_data_final <- get_data(34,40,33,39,"province")
data_final <- 
  Reduce(rbind, list(age_data_final,education_data_final,residence_data_final,marital_status_data_final,province_data_final))
rm(raw_data_female,raw_data_male,age_data_final,education_data_final,residence_data_final)
write.csv(data_final, "outputs/data/cleaned_data.csv",row.names = FALSE) ##save data_final to ‘outputs/data/cleaned_age_data.csv’.