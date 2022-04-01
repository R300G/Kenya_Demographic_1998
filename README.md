# starter_folder

This repo....

It is organised as follows...



The PDF Version of the Demographic and Health Survey: 1998, Kenya is saved in inputs. We use 2 tables as one table accounts for male and the other for female.

The simulation of the plan is saved ‘scripts/00-simulation.R’. 

The R code used to extract the tables on Page 162 and 163 is saved as ‘scripts/01-gather_data.R’, and saved the output  ‘outputs/data/raw_data_male.csv’ and ‘outputs/data/raw_data_female.csv’.

The cleaned dataset for both genders male and female saved as ‘scripts/02-clean_and_prepare_data.R’,
that draws on ‘raw_data_male.csv’ and  ‘raw_data_female.csv’  to clean and prepare the dataset. 

Since we have 3 background characteristics to look into, they are saved in different datasets. The cleaned datasets are saved as ....