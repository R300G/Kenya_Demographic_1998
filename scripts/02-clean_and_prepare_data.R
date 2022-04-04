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

get_data <- function(m_slice1, m_slice2, f_slice1, f_slice2, demo_type) {
  data_male <-
    raw_data_male %>%
    slice(m_slice1:m_slice2)
  data_female <-
    raw_data_female %>%
    slice(f_slice1:f_slice2)
  m1 <- data_male[, c(1, 2, 7)] %>%
    rename("chances_of_getting_aids" = "no_risk_at_all") %>%
    mutate(survey_answer = "no_risk_at_all") %>%
    mutate(gender = "male")

  m2 <- data_male[, c(1, 3, 7)] %>%
    rename("chances_of_getting_aids" = "small") %>%
    mutate(survey_answer = "small") %>%
    mutate(gender = "male")

  m3 <- data_male[, c(1, 4, 7)] %>%
    rename("chances_of_getting_aids" = "moderate") %>%
    mutate(survey_answer = "moderate") %>%
    mutate(gender = "male")

  m4 <- data_male[, c(1, 5, 7)] %>%
    rename("chances_of_getting_aids" = "great") %>%
    mutate(survey_answer = "great") %>%
    mutate(gender = "male")

  m5 <- data_male[, c(1, 6, 7)] %>%
    rename("chances_of_getting_aids" = "dont_know") %>%
    mutate(survey_answer = "dont_know") %>%
    mutate(gender = "male")

  f1 <- data_female[, c(1, 2, 7)] %>%
    rename("chances_of_getting_aids" = "no_risk_at_all") %>%
    mutate(survey_answer = "no_risk_at_all") %>%
    mutate(gender = "female")

  f2 <- data_female[, c(1, 3, 7)] %>%
    rename("chances_of_getting_aids" = "small") %>%
    mutate(survey_answer = "small") %>%
    mutate(gender = "female")

  f3 <- data_female[, c(1, 4, 7)] %>%
    rename("chances_of_getting_aids" = "moderate") %>%
    mutate(survey_answer = "moderate") %>%
    mutate(gender = "male")

  f4 <- data_female[, c(1, 5, 7)] %>%
    rename("chances_of_getting_aids" = "great") %>%
    mutate(survey_answer = "great") %>%
    mutate(gender = "female")

  f5 <- data_female[, c(1, 6, 7)] %>%
    rename("chances_of_getting_aids" = "dont_know") %>%
    mutate(survey_answer = "dont_know") %>%
    mutate(gender = "female")

  data_list <- list(m1, m2, m3, m4, m5, f1, f2, f3, f4, f5)
  data_final <-
    Reduce(rbind, data_list) %>%
    rename(demographic_info = background_characteristic) %>%
    filter(!is.na(demographic_info)) %>%
    mutate(demographic_type = demo_type) %>%
    select(demographic_info, demographic_type, gender, survey_answer, chances_of_getting_aids, population_count) %>%
    clean_names()
  rm(m1, m2, m3, m4, m5, f1, f2, f3, f4, f5, data_male, data_female, data_list)
  return(data_final)
}
age_data_final <- get_data(22, 26, 22, 26, "age group")
marital_status_data_final <- get_data(28, 31, 28, 31, "marital status")
sexual_partner_data_final <- get_data(36, 40, 36, 40, "No. of sexual partner other than husband/wife in past year")
residence_data_final <- get_data(43, 44, 43, 44, "residence")
province_data_final <- get_data(47, 53, 47, 53, "province")
education_data_final <- get_data(56, 59, 56, 59, "education")

data_final <-
  Reduce(rbind, list(age_data_final, marital_status_data_final, sexual_partner_data_final, residence_data_final, province_data_final, education_data_final))

data_final <- mutate_if(data_final, is.character, as.factor)

rm(raw_data_female, raw_data_male, age_data_final, education_data_final, sexual_partner_data_final, residence_data_final, marital_status_data_final, province_data_final)
write.csv(data_final, "outputs/data/cleaned_data.csv", row.names = FALSE) ## save data_final to ‘outputs/data/cleaned_age_data.csv’.
