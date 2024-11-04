# SQL World Layoffs Data Cleaning Project
In this project we clean world layoff data in MySQL, to prepare for data exploration. 

## Tools and technologies
- **MySQL**
- **SQL**: Data cleaning 

## Project Objectives
- Clean the world layoff data, so that it is easy to perform exploratory data analysis on it. 

## Data Sources
- [World Layoffs Dataset](world_layoffs_dataset.csv)

## Analysis steps
- **Data Cleaning**:
  - Created a new schema called world_layoffs
  - Imported a table called layoffs into the world_layoffs schema using the table data import wizard
  - Duplicated the layoffs table to a new table called layoffs_staging
  - Checked for duplicate rows using a CTE and the window function ROW_NUMBER()
  - Created a new table called layoffs_staging2 from the create statement of the layoffs table with an extra column named row_num to show duplicate rows
  - Showed all duplicate rows
  - Deleted all duplicate rows
  - Trimmed extra spaces from companies
  - Standardized all industries containing "Crypto" to "Crypto"
  - Removed trailing dots from all countries
  - Changed the format of dates from string to date
  - Changes the format of the date column to DATE on the table level
  - Checked for null values in industries
  - Changed blank values in industries into null values
  - Changed the industries that had null values to a comparable industry value if there were one
  - Deleted rows where the columns total_laid_off and percentage_laid_off were both null
  - Removed the row_num column

## Visualizations
- [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
