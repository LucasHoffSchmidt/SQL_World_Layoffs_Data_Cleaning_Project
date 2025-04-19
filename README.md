# SQL World Layoffs Data Cleaning Project
In this project we clean world layoff data in MySQL, to prepare for exploratory data analysis. 

## Quick Links
- Original world layoffs dataset: [Original Dataset](world_layoffs_dataset.csv)
- Cleaned world layoffs dataset: [Cleaned Dataset](clean_world_layoffs_dataset.csv)
- SQL code used to clean the dataset: [SQL Code](world_layoffs_data_cleaning_project.sql)
- Part 2 of this project, where we conduct exploratory data analysis on the cleaned world layoffs dataset: [World Layoffs Exploratory Data Analysis](https://github.com/LucasHoffSchmidt/SQL_World_Layoffs_Data_Exploration_Project)
- Other projects I have made: [Portfolio Website](https://lucashoffschmidt.github.io/)

## Tools Used
- **MySQL**: Database Management System.
- **SQL**: Interacting with the database.

## Project Objective
- Clean the world layoff data, so that it is easy to perform exploratory data analysis on it. 

## Data Source
- [World Layoffs Dataset](world_layoffs_dataset.csv)

## Process
  - Started MySQL Server.
  - Created a database to contain tables. 
  - Created a table schema called world_layoffs.
  - Created a table called layoffs using the .csv dataset file, the world_layoffs schema and the table data import wizard.
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
  - Changed the industries that had null values to a comparable industry value if there was one.
  - Deleted rows where the columns total_laid_off and percentage_laid_off were both null.
  - Removed the row_num column.

## Cleaned Dataset
- [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
