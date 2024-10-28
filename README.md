# SQL World Layoffs Data Cleaning Project
In this project we clean world layoff data in SQL, to prepare for data exploration. 

## Tools and technologies
- **SQL**: Data cleaning 

## Project Objectives
- Clean the world layoff data, so that it is easy to perform exploratory data analysis on it. 

## Data Sources
- [World Layoffs Dataset](world_layoffs_dataset.csv)

## Analysis steps
- **Data Cleaning**:
  - Create new table layoffs_staging from raw data table
  - Create new table layoffs_staging2 from layoffs_staging with an extra column row_num
  - Make row_num increase in value for each duplicate row
  - Delete duplicate rows
  - Remove leading and trailing spaces
  - Standardize all industries containing "Crypto" to "Crypto"
  - Remove trailing dots from all countries including "United States"
  - Change the format of the date from string to date
  - Change blank values into null values
  - Change the industries that have null values to a comparable industry value if there is one
  - Delete rows where the columns total_laid_off and percentage_laid_off are both null
  - Remove the row_num column

## Visualizations
- [Cleaned World Layoffs Dataset](clean_world_layoffs_dataset.csv)
