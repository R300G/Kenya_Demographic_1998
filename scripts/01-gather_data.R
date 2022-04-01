
library(tidyverse)
library(pdftools)

dhs_1998 <- pdf_text("inputs/FR102.pdf")

dhs_1998 <- tibble(raw_data = dhs_1998)

dhs_1998_p163 <- dhs_1998 %>% slice(163)
dhs_1998_p163 <-
  dhs_1998_p163 %>%
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

dhs_1998_p163_extract <-
    dhs_1998_p163 %>%
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
      "can_a_healthy-looking_person_have_the_AIDS_vrius_no", "can_a_healthy-looking_person_have_the_AIDS_vrius_yes", "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know",
      "is_AIDS_a_fatal_disease_almost_never", "is_AIDS_a_fatal_disease_some_times", "is_AIDS_a_fatal_disease_almost_always", "is_AIDS_a_fatal_disease_dont_know",
      "can_AIDS_be_cured_no","can_AIDS_be_cured_yes","can_AIDS_be_cured_dont_know",
      "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no","can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes","can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know",
      "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no","do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes","do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know","total"),
    sep = "\\s",
    remove = FALSE,
    extra = "drop",
    fill = "right"
  )%>%select(-data)

write.csv(dhs_1998_p163_extract, "outputs/data/raw_data_male.csv",row.names = FALSE)





dhs_1998_p162 <- dhs_1998 %>% slice(162)
dhs_1998_p162 <-
  dhs_1998_p162 %>%
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

dhs_1998_p162_extract <-
  dhs_1998_p162 %>%
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
      "can_a_healthy-looking_person_have_the_AIDS_vrius_no", "can_a_healthy-looking_person_have_the_AIDS_vrius_yes", "can_a_healthy-looking_person_have_the_AIDS_vrius_dont_know",
      "is_AIDS_a_fatal_disease_almost_never", "is_AIDS_a_fatal_disease_some_times", "is_AIDS_a_fatal_disease_almost_always", "is_AIDS_a_fatal_disease_dont_know",
      "can_AIDS_be_cured_no","can_AIDS_be_cured_yes","can_AIDS_be_cured_dont_know",
      "can_the_AIDS_virus_be_transmitted_from_mother_to_child_no","can_the_AIDS_virus_be_transmitted_from_mother_to_child_yes","can_the_AIDS_virus_be_transmitted_from_mother_to_child_dont_know",
      "do_you_know_someone_with_AIDS_or_who_died_of_AIDS_no","do_you_know_someone_with_AIDS_or_who_died_of_AIDS_yes","do_you_know_someone_with_AIDS_or_who_died_of_AIDS_dont_know","total"),
    sep = "\\s",
    remove = FALSE,
    extra = "drop",
    fill = "right"
  )%>%select(-data)

write.csv(dhs_1998_p162_extract, "outputs/data/raw_data_female.csv",row.names = FALSE)