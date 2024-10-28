SELECT *
FROM layoffs;

-- Data cleaning steps
-- 1. Make a duplicate of the raw data table
-- 2. Remove duplicates
-- 3. Standardize data
-- 4. Remove or replace null and blank values
-- 5. Remove any unnecessary columns and rows

##################################
###1. Duplicating the raw table###
##################################
-- Create table columns from layoffs table
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Create table data from layoffs table
INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

############################
###2. Removing duplicates###
############################
-- Make a CTW that shows all the rows that have identical data
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;

-- Create new equivalent table to layoffs_staging with the extra column row_num
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

-- Inserts the row number data into the new row_num column with duplicate rows increasing in value
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- Delete all duplicate rows
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

###############################
###3. Standardizing the data###
###############################
SELECT company, TRIM(company)
FROM layoffs_staging2;

-- Remove spaces from the beginning and end of data in the company column
UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT * 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

-- Set all industries starting with Crypto to Crypto
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

-- Remove trailing dots from the end of countries starting with United States
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

-- Make the string into a date, based on the format mm/dd/yyyy
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Change the data type of the date column to date
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

#############################################
###4. Modify or delete null and blank rows###
#############################################
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

-- Changes blank industry values to null values
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT st1.industry, st2.industry
FROM layoffs_staging2 st1
JOIN layoffs_staging2 st2
	ON st1.company = st2.company
WHERE st1.industry IS NULL
AND st2.industry IS NOT NULL;

-- Changes the industries that have null values to a comparable industry value, if there is one
UPDATE layoffs_staging2 st1
JOIN layoffs_staging2 st2
	ON st1.company = st2.company
SET st1.industry = st2.industry
WHERE st1.industry IS NULL
AND st2.industry IS NOT NULL;

#############################################
###5. delete irrelevant columns and rows#####
#############################################
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Deletes rows where the columns total_laid_off and percentage_laid_off are both null
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

-- Removes the row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;