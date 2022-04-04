# AIDS related knowledge of Kenya population of 1998

- Author: Charles Lu
- Date: April 3rd, 2022
- E-mail: charlesjiahong.lu@utoronto.ca

## Overview of the paper

This repository explores the Kenya DHS 1998 data to better understand the people's preception of AIDS.

## Obtaining data

The data is available on https://dhsprogram.com/

It is also included in this repository, in the directory "inputs/data/FR102.pdf"

## Preprocess data

After obtaining the data, the script "01-gather_data.R", located in "scripts" folder, can be used to preprocess the data and save the files as csv files in the directory "outputs/data/raw_data_male.csv" and "outputs/data/raw_data_female.csv"

## cleaning data

In the script "02-clean_and_prepare_data.R", located in "scripts" folder, contains all the code that is necessary to clean and tidy the data and save the file as csvfile in the directory "outputs/data/cleaned_data.csv". 


## Building the Report

There is a RMarkDown document located in "outputs/paper/paper.Rmd". This file is used to produce the report "AIDS related knowledge of Kenya population of 1998". It contains the R code to produce the graphs and the report format code. The reference used are also located in "outputs/paper/references.bib".


## File Structure

1. Inputs
- In this folder, you will find DHS 1998 raw data, cleaned datasets, and supplemental survey screenshots (within supplemental_survey folder).

2. Outputs
- In this folder you will find a reference file, RMarkdown file, and a pdf document of the paper.

3. Scripts
- This folder contains R-Scripts to retrieve, clean, and do analysis (visulization) with the dataset.

4. Licence
- Typical MIT licence for re usability


