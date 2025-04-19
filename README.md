# SQL World Layoffs Data Cleaning Project
In this project we clean world layoff data in MySQL, to prepare for exploratory data analysis. 

## Quick Links
- Initial dataset: [Initial Dataset](world_layoffs_dataset.csv)
- Cleaned dataset: [Cleaned Dataset](clean_world_layoffs_dataset.csv)
- SQL code: [SQL Code](world_layoffs_data_cleaning_project.sql)
- Other projects I have made: [Portfolio Website](https://lucashoffschmidt.github.io/)

## Tools Used
- **MySQL**: Database Management System.
- **SQL**: Interacting with the database.

## Project Objective
- Clean the world layoff data, so that it is easy to perform exploratory data analysis on it. 

## Data Source
- [World Layoffs Dataset](world_layoffs_dataset.csv)

## Process
  - Created a new schema called world_layoffs.
  - Imported a table called layoffs into the world_layoffs schema using the table data import wizard.
  - Duplicated the layoffs table to a new table called layoffs_staging.
  - Checked for duplicate rows using a CTE and the window function ROW_NUMBER().
  - Created a new table called layoffs_staging2 from the create statement of the layoffs table with an extra column named row_num to show duplicate rows.
  - Showed all duplicate rows.
  - Deleted all duplicate rows.
  - Trimmed extra spaces from companies.
  - Standardized all industries containing the word "Crypto" to only "Crypto".
  - Removed trailing dots from all countries.
  - Changed the format of dates from string to date.
  - Changes the format of the date column to DATE on the table level.
  - Checked for null values in industries.
  - Changed blank values in industries into null values.
  - Changed the industries that had null values to a comparable industry value if there were one.
  - Deleted rows where the columns total_laid_off and percentage_laid_off were both null.
  - Removed the row_num column.

## Result
- [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
