CREATE DATABASE agridb;
USE agridb;
select * from agridb.agri_data;
DESCRIBE agri_data;

--- 1. Top 7 rice-producing states in India
SELECT state_name, SUM(rice_production_1000_tons) AS total_rice FROM agri_data
GROUP BY state_name ORDER BY total_rice DESC LIMIT 7;

--- 2. Top 5 wheat producing states & their % production
SELECT state_name, SUM(wheat_production_1000_tons) AS total_wheat,
100 * SUM(wheat_production_1000_tons) / (SELECT SUM(wheat_production_1000_tons) FROM agri_data) AS percentage_share
FROM agri_data GROUP BY state_name ORDER BY total_wheat DESC LIMIT 5;

--- 3. Top 5 oilseed production states
SELECT state_name, SUM(oilseeds_production_1000_tons) AS total_oilseed
FROM agri_data GROUP BY state_name ORDER BY total_oilseed DESC LIMIT 5;

--- 4. Top 7 sunflower producing states
SELECT state_name, SUM(sunflower_production_1000_tons) AS total_sunflower FROM agri_data
GROUP BY state_name ORDER BY total_sunflower DESC LIMIT 7;

--- 5. Rice production by Districts of West Bengal
SELECT dist_name, SUM(rice_production_1000_tons) AS rice_wb FROM agri_data
WHERE state_name = 'West Bengal' GROUP BY dist_name ORDER BY rice_wb DESC;

--- 6. Top 10 wheat production years in Uttar Pradesh
SELECT year, SUM(wheat_production_1000_tons) AS wheat_up FROM agri_data
WHERE state_name = 'Uttar Pradesh' GROUP BY year ORDER BY wheat_up DESC LIMIT 10;

--- 7. Top 10 groundnut-producing districts
SELECT dist_name, SUM(groundnut_production_1000_tons) AS total_groundnut
FROM agri_data GROUP BY dist_name ORDER BY total_groundnut DESC LIMIT 10;

--- 8. Total agriculture area vs production for India (overall)
SELECT SUM(rice_area_1000_ha + wheat_area_1000_ha + maize_area_1000_ha + oilseeds_area_1000_ha) AS total_area,
SUM(rice_production_1000_tons + wheat_production_1000_tons + maize_production_1000_tons + oilseeds_production_1000_tons) AS total_production
FROM agri_data;

--- 9. Highest yield crop per state (Rice example)0
SELECT state_name, AVG(rice_yield_kg_per_ha) AS avg_rice_yield
FROM agri_data GROUP BY state_name ORDER BY avg_rice_yield DESC;

--- 10. Correlation-like analysis between area & production for rice
SELECT rice_area_1000_ha, rice_production_1000_tons FROM agri_data
WHERE rice_area_1000_ha IS NOT NULL AND rice_production_1000_tons IS NOT NULL;









 


