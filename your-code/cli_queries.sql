/*Question 1:
Obtain (average) of total scores for the schools
Focus on courses, categorize them in 4 main fields: cybersecurity, data analytics, web development, ux/ui
Obtain (total) number of reviews

 Categorize the competition of Ironhack to relevant groups*/

USE cli;

SELECT *
FROM comments;

CREATE TABLE temp1_comments
SELECT comment_id, query_date, program_name, total_score, school_name
FROM comments;

SELECT *
from temp1_comments;

CREATE TABLE temp2_comments
SELECT comment_id, query_date, program_name, total_score, school_name,
CASE WHEN program_name LIKE '%cybersecurity%' THEN 'yes' ELSE 'no' END AS cybersecurity,
CASE WHEN program_name LIKE '%data%' THEN 'yes' ELSE 'no' END AS data_analytics,
CASE WHEN program_name LIKE '%web%' THEN 'yes' ELSE 'no' END AS web_development,
CASE WHEN program_name LIKE '%ux%' THEN 'yes' ELSE 'no' END AS ux_ui
FROM temp1_comments;

SELECT *
FROM temp2_comments
WHERE school_name = 'Le-Wagon';

CREATE TABLE temp3_comments AS
SELECT 
    school_name, 
    ROUND(AVG(total_score), 2) AS avg_total_score, 
    COUNT(*) AS total_reviews,
    CASE
        WHEN SUM(CASE WHEN cybersecurity = 'yes' THEN 1 ELSE 0 END) > 0 THEN 1 
        ELSE 0 
    END
    +
    CASE 
        WHEN SUM(CASE WHEN data_analytics = 'yes' THEN 1 ELSE 0 END) > 0 THEN 1 
        ELSE 0 
    END
    +
    CASE 
        WHEN SUM(CASE WHEN web_development = 'yes' THEN 1 ELSE 0 END) > 0 THEN 1 
        ELSE 0 
    END
    +
    CASE 
        WHEN SUM(CASE WHEN ux_ui = 'yes' THEN 1 ELSE 0 END) > 0 THEN 1
        ELSE 0
    END
    AS number_tracks_offered
FROM temp2_comments
GROUP BY school_name;

SELECT *
from temp3_comments;

CREATE TABLE competitors AS
SELECT 
    school_name, 
    avg_total_score, 
    total_reviews, 
    number_tracks_offered
FROM temp3_comments
ORDER BY number_tracks_offered DESC, total_reviews DESC;

SELECT *
from competitors;

SELECT 
    school_name, 
    avg_total_score, 
    total_reviews, 
    number_tracks_offered
FROM competitors
ORDER BY avg_total_score DESC
LIMIT 5;

SELECT 
    school_name, 
    avg_total_score, 
    total_reviews, 
    number_tracks_offered
FROM competitors
ORDER BY total_reviews DESC
LIMIT 5;

SELECT 
    school_name,
	avg_total_score,  
    total_reviews, 
    number_tracks_offered
FROM competitors
ORDER BY number_tracks_offered DESC, total_reviews DESC
LIMIT 5;


/*Question 2:
Focus on the strongest competitor (Le-Wagon) and one that looks similar to Ironhack (Thinkful)
Analyze trends of score and reviews in time

Define trajectories*/

SELECT *
FROM comments;

SELECT *
FROM comments
WHERE school_name IN ('Ironhack', 'Thinkful', 'Le-Wagon');

SELECT MIN(query_date), MAX(query_date) FROM comments
WHERE school_name IN ('Ironhack', 'Thinkful', 'Le-Wagon');

SELECT MIN(query_date) INTO @min_date FROM comments
WHERE school_name IN ('Ironhack', 'Thinkful', 'Le-Wagon');

SELECT MAX(query_date) INTO @max_date FROM comments
WHERE school_name IN ('Ironhack', 'Thinkful', 'Le-Wagon');

SELECT 
  YEAR(query_date) AS time_years,
  ROUND(AVG(CASE WHEN school_name = 'Ironhack' THEN total_score END), 2) AS Ironhack_average_score,
  COUNT(CASE WHEN school_name = 'Ironhack' THEN 1 END) AS Ironhack_review_count,
  ROUND(AVG(CASE WHEN school_name = 'Thinkful' THEN total_score END), 2) AS Thinkful_average_score,
  COUNT(CASE WHEN school_name = 'Thinkful' THEN 1 END) AS Thinkful_review_count,
  ROUND(AVG(CASE WHEN school_name = 'Le-Wagon' THEN total_score END), 2) AS LeWagon_average_score,
  COUNT(CASE WHEN school_name = 'Le-Wagon' THEN 1 END) AS LeWagon_review_count
FROM comments
WHERE school_name IN ('Ironhack', 'Thinkful', 'Le-Wagon') AND query_date BETWEEN @min_date AND @max_date
GROUP BY YEAR(query_date)
ORDER BY YEAR(query_date) DESC;