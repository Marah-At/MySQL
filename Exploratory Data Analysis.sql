-- Exploratory Data Analysis 

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;  -- this issue started in 2020-03-11 till 2023-03-06 ( 3 years ) during pandemic started "covid-19"


SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;  -- 125677 only for three months ( alot high)

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;  -- Post-IPO( Initial Public Offering)

SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off 
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
)
SELECT `MONTH`, total_off ,
SUM(total_off ) OVER( ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;


SELECT company, YEAR(`date`) AS `YEAR`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, `YEAR`
ORDER BY company;

-- we want to rank which years they laid off the most employees 

SELECT company, YEAR(`date`) AS `YEAR`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, `YEAR`
ORDER BY 3 DESC;

WITH Company_Year(company, years, total_laid_off) AS 
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT * 
FROM Company_Year_Rank 
WHERE ranking <= 5;