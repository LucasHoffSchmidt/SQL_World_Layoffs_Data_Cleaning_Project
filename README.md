# SQL World Layoffs Data Cleaning Project
In this project we clean world layoff data in MySQL, to prepare for exploratory data analysis. 

## Quick Links
- Original world layoffs dataset: [Original World Layoffs Dataset](world_layoffs_dataset.csv)
- Cleaned world layoffs dataset: [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
- SQL code used to clean the dataset: [SQL Code](world_layoffs_data_cleaning_project.sql)
- Part 2 of this project, where we conduct exploratory data analysis on the cleaned world layoffs dataset: [World Layoffs Exploratory Data Analysis](https://github.com/LucasHoffSchmidt/SQL_World_Layoffs_Data_Exploration_Project)
- Other projects I have made: [Portfolio Website](https://lucashoffschmidt.github.io/)

## Technologies Used
- **MySQL**: Database Management System.
- **SQL**: Interacting with the database.

## Process
- Set up the MySQL Server, created a database and table schema and imported the dataset .csv file into a layoffs table using the import wizard.
- Duplicated the layoffs table to layoffs_staging for cleaning and created a table called layoffs_staging2 with an extra row_num column to identify duplicates.
- Deleted all duplicate rows and standardized data by trimming white space, unifying industry names under the same name and removing trailing dots from countries.
- Converted the date column from string to date type.
- Changed blank values in industries to null values and then to a comparable industry value if there was one.
- Deleted rows where both total_laid_off and percentage_laid_off were null and removed the row_num helper column.  
