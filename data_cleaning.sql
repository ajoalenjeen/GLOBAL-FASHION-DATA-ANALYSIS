-- ============================================
-- Data Cleaning
-- ============================================

-- 1. STORES TABLE - Translate to English

-- Country translations
UPDATE stores SET country = 'China' WHERE country = '中国';
UPDATE stores SET country = 'Germany' WHERE country = 'Deutschland';
UPDATE stores SET country = 'Spain' WHERE country = 'España';

-- City translations (Chinese cities)
UPDATE stores SET city = 'Shanghai' WHERE city = '上海';
UPDATE stores SET city = 'Beijing' WHERE city = '北京';
UPDATE stores SET city = 'Guangzhou' WHERE city = '广州';
UPDATE stores SET city = 'Shenzhen' WHERE city = '深圳';
UPDATE stores SET city = 'Chongqing' WHERE city = '重庆';

-- City translations (German cities)
UPDATE stores SET city = 'Munich' WHERE city = 'München';
UPDATE stores SET city = 'Cologne' WHERE city = 'Köln';

-- City translations (Portuguese cities)
UPDATE stores SET city = 'Lisbon' WHERE city = 'Lisboa';

-- City translations (Spanish cities)
UPDATE stores SET city = 'Seville' WHERE city = 'Sevilla';




-- 2. CUSTOMERS TABLE - Translate + Fix Gender

-- Country translations
UPDATE customers SET country = 'China' WHERE country = '中国';
UPDATE customers SET country = 'Germany' WHERE country = 'Deutschland';
UPDATE customers SET country = 'Spain' WHERE country = 'España';


-- Gender: D → O (Others)
UPDATE customers SET gender = 'O' WHERE gender = 'D';


-- TRANSACTIONS TABLE - Date only (remove time)
ALTER TABLE transactions ALTER COLUMN date TYPE DATE;


-- Remove 2025 transactions
DELETE FROM transactions WHERE EXTRACT(YEAR FROM date) = 2025;
