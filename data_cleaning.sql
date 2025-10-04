-- ===============
-- Data Cleaning 
-- ===============

--Change Country name to English
UPDATE customers
SET country = CASE 
                 WHEN country = N'中国' THEN 'China'
                 WHEN country = N'España' THEN 'Spain'
                 ELSE country
              END
WHERE country IN (N'中国', N'España');


--Change date type
UPDATE transactions
SET Date = CAST(Date AS date);

ALTER TABLE transactions
ALTER COLUMN Date date;


-- Add a return flag
ALTER TABLE transactions ADD is_return BIT;
UPDATE transactions
SET is_return = CASE WHEN [Line Total] < 0 THEN 1 ELSE 0 END;


-- Standardize gender
UPDATE customers
SET gender = CASE
    WHEN gender IN ('M','Male') THEN 'Male'
    WHEN gender IN ('F','Female') THEN 'Female'
    ELSE 'Other'
END;