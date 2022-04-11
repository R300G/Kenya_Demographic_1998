#### Preamble ####
# Purpose: Clean the survey data downloaded from the DHS Paper, saved as raw data.
# Author: Charles Lu, Mahak Jain, Yujun Jiao
# Data: 10 July 2022
# Contact: charlesjiahong.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - Need to have DHS report of Kenya 1998 "FR102.pdf" in inputs/data folder

library(tidyverse)
library(pdftools)

dhs_1998 <- pdf_text("inputs/data/FR102.pdf")

dhs_1998 <- tibble(raw_data = dhs_1998)

dhs_1998_p164 <- dhs_1998 %>% slice(164)
dhs_1998_p164 <-
  dhs_1998_p164 %>%
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

dhs_1998_p164_extract <-
  dhs_1998_p164 %>%
  mutate(raw_data = str_trim(raw_data)) %>%
  separate(
    col = raw_data,
    into = c("background_characteristic","data"),
    sep = "\\s{2,}",
    remove = TRUE,
    extra = "merge",
    fill = "right"
  )%>%
  mutate(data = str_squish(data)) %>%
  separate(
    col = data,
    into = c(
      "no_risk_at_all", "small", "moderate", "great", "dont_know","total", "population_count"),
    sep = "\\s",
    remove = FALSE,
    extra = "drop",
    fill = "right"
  )%>%select(-c(data,"total"))

dhs_1998_p164_extract <- dhs_1998_p164_extract[-c(1,2,3,4,5,6,7,8,9,10),]


write.csv(dhs_1998_p164_extract, "outputs/data/raw_data_female.csv",row.names = FALSE)





dhs_1998_p165 <- dhs_1998 %>% slice(165)
dhs_1998_p165 <-
  dhs_1998_p165 %>%
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

dhs_1998_p165_extract <-
  dhs_1998_p165 %>%
  mutate(raw_data = str_trim(raw_data)) %>%
  separate(
    col = raw_data,
    into = c("background_characteristic","data"),
    sep = "\\s{2,}",
    remove = TRUE,
    extra = "merge",
    fill = "right"
  )%>%
  mutate(data = str_squish(data)) %>%
  separate(
    col = data,
    into = c(
      "no_risk_at_all", "small", "moderate", "great", "dont_know","total", "population_count"),
    sep = "\\s",
    remove = FALSE,
    extra = "drop",
    fill = "right"
  )%>%select(-c(data,"total")) 
rm(dhs_1998,dhs_1998_p164,dhs_1998_p165)
write.csv(dhs_1998_p165_extract, "outputs/data/raw_data_male.csv",row.names = FALSE)