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
  - Created a new table called layoffs_staging from raw data table
  - Created a new table called layoffs_staging2 from layoffs_staging with an extra column named row_num
  - Made row_num increase in value for each duplicate row
  - Deleted duplicate rows
  - Removed leading and trailing spaces
  - Standardized all industries containing "Crypto" to "Crypto"
  - Removed trailing dots from all countries including "United States"
  - Changed the format of the date from string to date
  - Changed blank values into null values
  - Changed the industries that had null values to a comparable industry value if there were one
  - Deleted rows where the columns total_laid_off and percentage_laid_off were both null
  - Removed the row_num column

## Visualizations
- [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
