USE db;

-- 1. Analyse the data
-- Hint: use a SELECT statement via a JOIN to sample the data
-- ****************************************************************
SELECT * FROM users LIMIT 50;

-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************
SELECT COUNT(email_domain) AS "Top 25 schools", email_domain FROM users
GROUP BY email_domain
ORDER BY `Top 25 schools` DESC LIMIT 25;

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************
SELECT COUNT(user_id) AS "No. of users", city FROM users
WHERE city = "New York";

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************
SELECT COUNT(user_id) AS "mobile-user learners" FROM users
WHERE mobile_app IN("mobile-user");

-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************
SELECT HOUR(STR_TO_DATE(sign_up_at, "%Y-%m-%d %h:%i:%s")) AS hour,
COUNT(*) AS "sign up counts" FROM users
GROUP BY hour
ORDER BY hour;

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************
SELECT
SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++",
SUM(CASE WHEN learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking SQL",
SUM(CASE WHEN learn_html NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking HTML",
SUM(CASE WHEN learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking JavaScript",
SUM(CASE WHEN learn_java NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking Java"
FROM users u JOIN progress p ON u.user_id = p.user_id
WHERE city = "New York";

-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************
SELECT
SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++",
SUM(CASE WHEN learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking SQL",
SUM(CASE WHEN learn_html NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking HTML",
SUM(CASE WHEN learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking JavaScript",
SUM(CASE WHEN learn_java NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking Java"
FROM users u JOIN progress p ON u.user_id = p.user_id
WHERE city = "Chicago";

