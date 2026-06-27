select *
from layoffs;

-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways


CREATE TABLE layoffs_stagging
LIKE layoffs;

select *
from layoffs_stagging;


INSERT layoffs_stagging
SELECT *
FROM layoffs;

select *,
ROW_NUMBER() OVER(
PARTITION BY company, location , industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised_millions ) AS row_num
from layoffs_stagging;

WITH duplicate_cte AS
(select *,
ROW_NUMBER() OVER(
PARTITION BY company, location , industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised_millions ) AS row_num
from layoffs_stagging
)

SELECT *
FROM duplicate_cte
where row_num > 1;

select *
from layoffs_stagging
WHERE company = 'Casper';


CREATE TABLE `layoffs_stagging2` (
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

select *
from layoffs_stagging2;

INSERT INTO layoffs_stagging2
select *,
ROW_NUMBER() OVER(
PARTITION BY company, location , industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised_millions ) AS row_num
from layoffs_stagging;


SELECT *
from layoffs_stagging2
WHERE row_num > 1;


DELETE 
from layoffs_stagging2
WHERE row_num > 1;

SELECT *
from layoffs_stagging2
;

-- STANDARISING DATA

select company, TRIM(company)
from layoffs_stagging2;

UPDATE layoffs_stagging2
SET company = TRIM(company);


select *
from layoffs_stagging2
WHERE industry LIKE 'crypto%';


UPDATE layoffs_stagging2
SET industry = 'crypto'
WHERE industry LIKE 'crypto%';

select DISTINCT country, TRIM(TRAILING '.' FROM country)
from layoffs_stagging2
order by 1;


UPDATE layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';


SELECT `date`,
STR_TO_DATE(`date`, "%m/%d/%Y")
from layoffs_stagging2;


UPDATE layoffs_stagging2
SET `date` = STR_TO_DATE(`date`, "%m/%d/%Y")
;

ALTER TABLE layoffs_stagging2
MODIFY `date` DATE;


SELECT *
FROM layoffs_stagging2
WHERE industry IS NULL 
OR industry = '';

UPDATE  layoffs_stagging2 
SET industry = NULL
WHERE industry = '' ;

SELECT *
FROM layoffs_stagging2
WHERE company LIKE 'Airbnb';

SELECT *
FROM layoffs_stagging2 tb1
JOIN layoffs_stagging2 tb2
ON tb1.company = tb2.company
WHERE( tb1.industry IS NULL OR tb1.industry = '')
AND tb2.industry IS NOT NULL;

UPDATE 	layoffs_stagging2 tb1
JOIN layoffs_stagging2 tb2
ON tb1.company = tb2.company
SET tb1.industry = tb2.industry 
where tb1.industry IS NULL
AND tb2.industry IS NOT NULL;

SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL AND  percentage_laid_off IS NULL
;


DELETE
FROM layoffs_stagging2
WHERE total_laid_off IS NULL AND  percentage_laid_off IS NULL
;

SELECT *
FROM layolayoffs_stagging2ffs_stagging2
order by 1;

ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;

