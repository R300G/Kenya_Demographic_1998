# Impacts of social backgrounds on people's perception of the risk of getting AIDS

- Author: Charles Lu, Mahak Jain, Yujun Jiao
- Date: April 3rd, 2022
- E-mail: charlesjiahong.lu@utoronto.ca
- E-mail: bella.jiao@mail.utoronto.ca
- E-mail: mahak.jain@mail.utoronto.ca

## Overview of the paper

This repository explores the Kenya DHS 1998 data to better understand people's perception on the risk of receiving AIDS based on their various demographic backgrounds.

## Obtaining data

The data is available on https://dhsprogram.com/publications/publication-fr102-dhs-final-reports.cfm

It is also included in this repository, in the directory "inputs/data/FR102.pdf"

## Preprocess data

After obtaining the data, the script "01-gather_data.R", located in "scripts" folder, can be used to preprocess the data and save the files as csv files in the directory "outputs/data/raw_data_male.csv" and "outputs/data/raw_data_female.csv"

## cleaning data

In the script "02-clean_and_prepare_data.R", located in "scripts" folder, contains all the code that is necessary to clean and tidy the data and save the file as csvfile in the directory "outputs/data/cleaned_data.csv". 


## Building the Report

There is a RMarkDown document located in "outputs/paper/paper.Rmd". This file is used to produce the report "AIDS related knowledge of Kenya population of 1998". It contains the R code to produce the graphs and the report format code. The reference used are also located in "outputs/paper/references.bib".


## File Structure

1. Inputs
- In the data folder, you will find Kenya's DHS 1998 Report.

2. Outputs
- In the paper folder you will find a reference file, RMarkdown file, and a pdf document of the report.
- In the data folder you will find two raw data file, one cleaned data file, and two survey screenshots of the pdf document DHS 1998 report.

3. Scripts
- This folder contains R-Scripts that simulates the data, gather the data from the DHS report, and clean the data.

4. Licence
- Typical MIT licence for reusability


