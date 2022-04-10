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


get_data <- function(m_slice1, m_slice2, f_slice1, f_slice2, demo_type) {
  data_male <-
    raw_data_male %>%
    slice(m_slice1:m_slice2)
  data_female <-
    raw_data_female %>%
    slice(f_slice1:f_slice2)
  m1 <- data_male[, c(1, 2, 7)] %>%
    rename("chances_of_getting_aids" = "no_risk_at_all") %>%
    mutate(survey_answer = "no risk at all") %>%
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
    mutate(survey_answer = "don't know") %>%
    mutate(gender = "male")

  f1 <- data_female[, c(1, 2, 7)] %>%
    rename("chances_of_getting_aids" = "no_risk_at_all") %>%
    mutate(survey_answer = "no risk at all") %>%
    mutate(gender = "female")

  f2 <- data_female[, c(1, 3, 7)] %>%
    rename("chances_of_getting_aids" = "small") %>%
    mutate(survey_answer = "small") %>%
    mutate(gender = "female")

  f3 <- data_female[, c(1, 4, 7)] %>%
    rename("chances_of_getting_aids" = "moderate") %>%
    mutate(survey_answer = "moderate") %>%
    mutate(gender = "female")

  f4 <- data_female[, c(1, 5, 7)] %>%
    rename("chances_of_getting_aids" = "great") %>%
    mutate(survey_answer = "great") %>%
    mutate(gender = "female")

  f5 <- data_female[, c(1, 6, 7)] %>%
    rename("chances_of_getting_aids" = "dont_know") %>%
    mutate(survey_answer = "don't know") %>%
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
age_data_final <- get_data(12, 17, 12, 16, "age group")
marital_status_data_final <- get_data(20, 22, 19, 21, "marital status")
sexual_partner_data_final <- get_data(27, 31, 26, 30, "No. of sexual partner other than husband/wife in past year")
residence_data_final <- get_data(34, 35, 33, 34, "residence")
province_data_final <- get_data(38, 44, 37, 43, "province")
education_data_final <- get_data(47, 50, 46, 49, "education")

data_final <-
  Reduce(rbind, list(age_data_final, marital_status_data_final, sexual_partner_data_final, residence_data_final, province_data_final, education_data_final))

data_final <-
  data_final %>%
  mutate(population_count = as.numeric(gsub("[,]", "", population_count)), chances_of_getting_aids = as.numeric(gsub("[()]", "", chances_of_getting_aids)), survey_answer = as.factor(survey_answer), gender = as.factor(gender), demographic_type = as.factor(demographic_type)) %>%
  mutate(survey_answer = fct_relevel(survey_answer, "no risk at all", "small", "moderate", "great", "don't know")) %>%
  select(-"population_count") %>%
  filter(demographic_info != "Don’t know/missing", survey_answer != "don't know")

rm(raw_data_female, raw_data_male, age_data_final, education_data_final, sexual_partner_data_final, residence_data_final, marital_status_data_final, province_data_final)
write.csv(data_final, "outputs/data/cleaned_data.csv", row.names = FALSE) ## save data_final to ‘outputs/data/cleaned_age_data.csv’.
