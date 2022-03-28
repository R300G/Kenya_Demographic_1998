
library(tidyverse)
library(pdftools)

dhs_1998 <- pdf_text("inputs/FR102.pdf")

dhs_1998 <- tibble(raw_data = dhs_1998)

dhs_1998 <- dhs_1998 %>% slice(165)
dhs_1998 <-
  dhs_1998 %>%
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

dhs_1998_test <-
  dhs_1998 %>%
  mutate(data = str_trim(raw_data)) %>%
  separate(
    col = raw_data,
    into = c("background_characteristic", "No_risk_at_all", "small", "moderate", "great", "don't_know", "total", "number_of_men"),
    sep = "\\s{2,}",
    remove = FALSE,
    fill = "right"
  )
