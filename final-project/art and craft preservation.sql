-- ------------------------------------------------------------------- Database Queries --------------------------------------------------------------------------------------------

-- create a database
CREATE DATABASE Traditional_art_craft_preservation;

-- to work on it, you need to use it first
USE Traditional_art_craft_preservation;

-- delete database
 DROP DATABASE Traditional_art_craft_preservation;

-- ------------------------------------------------------------------- Database Analysis -------------------------------------------------------------------------------------------
/*
T1 : Artisans(artisan_id, name, age, gender, contact_number, email, address, region, experience_years, craft_type)

T2 : Craft_Types (craft_type_id, craft_name, origin_state, description,material_used, tools_required, cultural_significance,estimated_cost, popularity_score, preservation_status)

T3 : Workshops (workshop_id, title, description, location, start_date, end_date,max_participants, craft_type_id, organizer_name, fees

T4 : Registrations (registration_id, workshop_id, artisan_id, status,payment_status, amount_paid, payment_mode,remarks, attendance_status)

T5 : Materials (material_id, material_name, type, source_location,cost_per_unit, availability_status, unit,environmental_impact, storage_conditions, description)

T6 : Tools (tool_id, tool_name, used_in_craft, material_id,manufacturer, lifespan_years, cost, weight, dimensions) 

T7 : Artworks (artwork_id, title, artisan_id, craft_type_id,creation_date, price, material_used, tool_used, status)

T8 : Sales (sale_id, artwork_id, buyer_name, sale_date,sale_price, payment_method, delivery_address,contact_number, email)

T9 : Exhibitions (exhibition_id, title, location, start_date, end_date,organizer, theme, expected_visitors, entry_fee, description)

T10 : Exhibition_Artworks (id, exhibition_id, artwork_id, display_location,display_start, display_end, status, remarks,spotlight, curator_in_charge) 

T11 : Donors (donor_id, name, contact_number, email, address,donation_amount, donation_date, payment_method,remarks, anonymous) 

T12 : Sponsorships (sponsorship_id, sponsor_name, event_name, amount,sponsor_type, start_date, end_date,contact_email, phone, status)

T13 : Training_Programs (program_id, title, description, start_date, end_date,location, instructor, target_audience, fees, capacity)

T14 : Program_Enrollments (enrollment_id, program_id, artisan_id, status, completion_status,remarks, attendance_percentage, grade, feedback) 

T15 : Cultural_Events (event_id, event_name, date, venue, organizer, theme,description, entry_fee, expected_attendance, status) 

T16 : Event_Participants (participant_id, event_id, artisan_id, participation_type,feedback_score, remarks, certificate_issued, honorarium, attendance_status) 

T17 : Research_Projects (project_id, title, description, lead_researcher, start_date,end_date, funding_amount, focus_area, associated_craft, status)

T18 : Publications (publication_id, title, author, publish_date, project_id,type, language, file_url, summary) 

T19 : Volunteers (volunteer_id, name, age, gender, contact_number, email,address, joined_date, area_of_interest, availability_status)

T20 : Volunteer_Assignments (assignment_id, volunteer_id, task_title, description, start_date,end_date, assigned_by, status, feedback) 
 
T21 : Media_Coverage (media_id, title, media_type, published_date, covered_event,link, reporter_name, summary, region, language)

T22 : Government_Schemes (scheme_id, scheme_name, department, launch_year, eligibility_criteria,benefits, application_link, duration, contact_info, status)

T23 : Artisan_Feedback (feedback_id, artisan_id, workshop_id, rating, comments, suggestion,liked_most, improvement_area, instructor_rating, facility_rating)

T24 : Preservation_Techniques (technique_id, name, description, used_in_craft, effectiveness_score,equipment_needed, duration_days, success_rate, origin_place, is_traditional) 

T25 : User_Login (user_id, username, password_hash, role, last_login, status,email, contact_number, profile_completed, security_question,security_answer_hash, created_at)

T26 : Raw_Material_Suppliers (supplier_id, name, contact_number, email, address,material_type, region, rating, years_of_service, status) 

T27 : Collaborations (collab_id, partner_name, type, start_date, end_date,project_theme, funding_amount, status, contact_email, remarks) 

T28 : Export_Orders (export_id, artwork_id, buyer_country, buyer_name, order_date,export_date, price, shipping_status, delivery_partner)

T29 : Emergency_Grants (grant_id, artisan_id, grant_type, amount, reason,approved_by, approval_date, status) 

T30 : Online_Courses (course_id, title, instructor, duration_weeks, mode,certification_provided, language, enroll_link, status)

*/

-- -------------------------------------------------------------------Table Related Queries -------------------------------------------------------------------------------------

-- Table 1: Artisans
CREATE TABLE Artisans (
    artisan_id INT PRIMARY KEY, -- unique identifier for each artisan
    name VARCHAR(100) NOT NULL, -- name of the artisans cannot be null
    age INT CHECK (age >= 18), -- Age of the artisans
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    contact_number VARCHAR(15) UNIQUE, -- contact must be  unique
    email VARCHAR(100) UNIQUE, -- email address for artisans must be unique
    address TEXT,
    region VARCHAR(50),
    experience_years INT DEFAULT 0,
    craft_type VARCHAR(50) NOT NULL
);

-- Insert 20 records into Artisians table
INSERT INTO Artisans (artisan_id, name, age, gender, contact_number, email, address, region, experience_years, craft_type)
 VALUES 
(1, 'Ravi Sharma', 38, 'Male', '9876543210', 'ravi.sharma@gmail.com', 'Bikaner, Rajasthan', 'Rajasthan', 15, 'Block Printing'),
(2, 'Sunita Devi', 44, 'Female', '9823456789', 'sunita.devi@yahoo.com', 'Darbhanga, Bihar', 'Bihar', 20, 'Madhubani Painting'),
(3, 'Anil Kumar', 30, 'Male', '9765432101', 'anil.kumar@rediffmail.com', 'Jabalpur, Madhya Pradesh', 'Madhya Pradesh', 10, 'Terracotta'),
(4, 'Meena Kumari', 28, 'Female', '9123456789', 'meena.kumari@gmail.com', 'Bhubaneswar, Odisha', 'Odisha', 8, 'Pattachitra'),
(5, 'Mohd. Arif', 40, 'Male', '9832178910', 'arif.m@gmail.com', 'Varanasi, Uttar Pradesh', 'Uttar Pradesh', 18, 'Wood Carving'),
(6, 'Geeta Verma', 33, 'Female', '9012345678', 'geeta.verma@gmail.com', 'Nagpur, Maharashtra', 'Maharashtra', 12, 'Warli Art'),
(7, 'Suresh Das', 50, 'Male', '9321456781', 'suresh.das@gmail.com', 'Puri, Odisha', 'Odisha', 25, 'Pattachitra'),
(8, 'Lakshmi Bai', 36, 'Female', '9001234567', 'lakshmi.b@gmail.com', 'Thanjavur, Tamil Nadu', 'Tamil Nadu', 14, 'Handloom Weaving'),
(9, 'Ajay Patel', 29, 'Male', '9822123456', 'ajay.patel@yahoo.com', 'Surat, Gujarat', 'Gujarat', 6, 'Bamboo Craft'),
(10, 'Kiran Reddy', 35, 'Other', '9988776655', 'kiran.r@gmail.com', 'Hyderabad, Telangana', 'Telangana', 10, 'Stone Sculpture'),
(11, 'Ramesh Babu', 47, 'Male', '9876001234', 'ramesh.babu@gmail.com', 'Chennai, Tamil Nadu', 'Tamil Nadu', 22, 'Terracotta'),
(12, 'Pooja Sinha', 31, 'Female', '9345678912', 'pooja.sinha@gmail.com', 'Gaya, Bihar', 'Bihar', 11, 'Madhubani Painting'),
(13, 'Nisha Pandey', 27, 'Female', '9787654321', 'nisha.p@gmail.com', 'Kanpur, Uttar Pradesh', 'Uttar Pradesh', 7, 'Block Printing'),
(14, 'Devendra Joshi', 52, 'Male', '9867543210', 'dev.j@gmail.com', 'Jaipur, Rajasthan', 'Rajasthan', 30, 'Stone Sculpture'),
(15, 'Anita Mishra', 39, 'Female', '9811223344', 'anita.m@gmail.com', 'Lucknow, Uttar Pradesh', 'Uttar Pradesh', 16, 'Handloom Weaving'),
(16, 'Santosh Yadav', 42, 'Male', '9877098765', 'santosh.y@gmail.com', 'Rewa, Madhya Pradesh', 'Madhya Pradesh', 20, 'Terracotta'),
(17, 'Jaya Nair', 34, 'Female', '9888001122', 'jaya.nair@gmail.com', 'Kochi, Kerala', 'Kerala', 12, 'Wood Carving'),
(18, 'Prakash Thakur', 45, 'Male', '9090909090', 'prakash.t@gmail.com', 'Shimla, Himachal Pradesh', 'Himachal Pradesh', 23, 'Stone Sculpture'),
(19, 'Deepa Rawat', 30, 'Female', '9011223344', 'deepa.r@gmail.com', 'Dehradun, Uttarakhand', 'Uttarakhand', 9, 'Bamboo Craft'),
(20, 'Yogesh Pawar', 37, 'Male', '9900112233', 'yogesh.p@gmail.com', 'Kolhapur, Maharashtra', 'Maharashtra', 14, 'Warli Art');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- to display/retrieve table data
SELECT * FROM Artisans;               

-- to remove complete data from table
truncate table Artisans;

-- to delete complete attributes and records 
drop table Artisans;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for artisan’s income
ALTER TABLE Artisans ADD COLUMN monthly_income DECIMAL(10,2) DEFAULT 0.00;

-- 2. Rename column experience_years → total_experience
ALTER TABLE Artisans CHANGE experience_years total_experience INT;

-- 3. Create index on region for faster search
CREATE INDEX idx_region ON Artisans(region);

-- 4. Add NOT NULL constraint on region
ALTER TABLE Artisans MODIFY region VARCHAR(50) NOT NULL;

-- 5. Drop address column if not needed
ALTER TABLE Artisans DROP COLUMN address;

-- 6. Show all artisans older than 40 years
SELECT * FROM Artisans WHERE age > 40;

-- 7. Count number of artisans per craft
SELECT craft_type, COUNT(*) AS total_artisans FROM Artisans GROUP BY craft_type;

-- 8. List artisans sorted by income (highest first)
SELECT name, region, monthly_income FROM Artisans ORDER BY monthly_income DESC;

-- 9. Find maximum and minimum income among artisans
SELECT MAX(monthly_income) AS highest_income, MIN(monthly_income) AS lowest_income FROM Artisans;

-- 10. Show artisans from Maharashtra only
SELECT name, craft_type FROM Artisans WHERE region = 'Maharashtra';

-- 11. Increase income of artisans from Bihar
UPDATE Artisans SET monthly_income = monthly_income + 3000 WHERE region = 'Bihar';

-- 12. Self Join: Find pairs of artisans from the same region
SELECT a1.name AS Artisan1, a2.name AS Artisan2, a1.region
FROM Artisans a1
JOIN Artisans a2 ON a1.region = a2.region AND a1.artisan_id < a2.artisan_id;

-- 13. Aggregated Join (with itself for mentorship mapping assumption)
SELECT a1.name AS Senior, a2.name AS Junior
FROM Artisans a1
JOIN Artisans a2 ON a1.total_experience > a2.total_experience AND a1.region = a2.region;

-- 14. Convert artisan names to uppercase
SELECT UPPER(name) FROM Artisans;

-- 15. Find average income of artisans
SELECT AVG(monthly_income) AS avg_income FROM Artisans;

-- 16. Length of artisan names
SELECT name, LENGTH(name) AS name_length FROM Artisans;

-- 17. Round artisan income to nearest thousand
SELECT name, ROUND(monthly_income, -3) AS rounded_income FROM Artisans;

-- 18. Rank artisans based on income
SELECT name, region, monthly_income,
RANK() OVER (ORDER BY monthly_income DESC) AS income_rank
FROM Artisans;

-- 19. Row number by region
SELECT name, region, total_experience,
ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_experience DESC) AS region_rank
FROM Artisans;

-- 20. Cumulative income
SELECT region, monthly_income,
SUM(monthly_income) OVER (PARTITION BY region ORDER BY artisan_id) AS cumulative_income
FROM Artisans;

-- 21. Find artisans between age 30 and 40
SELECT * FROM Artisans WHERE age BETWEEN 30 AND 40;

-- 22. Find artisans not from Uttar Pradesh
SELECT * FROM Artisans WHERE NOT region = 'Uttar Pradesh';

-- 23. Find artisans earning more than 20,000 OR having more than 15 years experience
SELECT * FROM Artisans WHERE monthly_income > 20000 OR total_experience > 15;

-- 24. Convert income into integer
SELECT name, CAST(monthly_income AS SIGNED) FROM Artisans;

-- 25. Convert contact number to CHAR
SELECT CAST(contact_number AS CHAR) AS phone FROM Artisans;

-- 26. Format income with 2 decimals
SELECT name, FORMAT(monthly_income, 2) FROM Artisans;

-- 27. DISTINCT regions
SELECT DISTINCT region FROM Artisans;

-- 28. LIKE clause: names starting with 'S'
SELECT * FROM Artisans WHERE name LIKE 'S%';

-- 29. LIMIT clause: Top 5 highest paid artisans
SELECT name, monthly_income FROM Artisans ORDER BY monthly_income DESC LIMIT 5;

-- 30. GROUP BY with HAVING
SELECT region, COUNT(*) AS total
FROM Artisans
GROUP BY region
HAVING COUNT(*) > 2;

-- 31. Add UNIQUE constraint on contact number
ALTER TABLE Artisans ADD CONSTRAINT unique_contact UNIQUE(contact_number);

-- 32. Add CHECK constraint for income
ALTER TABLE Artisans ADD CONSTRAINT chk_income CHECK (monthly_income >= 0);

-- 33. Add DEFAULT value for gender as 'Other'
ALTER TABLE Artisans MODIFY gender VARCHAR(10) DEFAULT 'Other';

-- 34. Subquery: artisans earning above average income
SELECT name, monthly_income
FROM Artisans
WHERE monthly_income > (SELECT AVG(monthly_income) FROM Artisans);

-- 35. Case: Categorize artisans by income
SELECT name, monthly_income,
CASE
  WHEN monthly_income > 20000 THEN 'High Earner'
  WHEN monthly_income BETWEEN 10000 AND 20000 THEN 'Middle Earner'
  ELSE 'Low Earner'
END AS income_category
FROM Artisans;

-- 36. IF function: Senior or Junior
SELECT name, IF(total_experience > 15, 'Senior', 'Junior') AS experience_level FROM Artisans;

-- 37. UNION: List of artisan names + regions as single column
SELECT name AS info FROM Artisans
UNION
SELECT region FROM Artisans;

-- 38. Subquery with IN: Find artisans from regions having more than 2 artisans
SELECT name, region FROM Artisans
WHERE region IN (SELECT region FROM Artisans GROUP BY region HAVING COUNT(*) > 2);

-- 39. Calculate average experience of artisans grouped by region
SELECT region, AVG(total_experience) AS avg_experience
FROM Artisans
GROUP BY region
HAVING AVG(total_experience) > 10; -- only skilled regions

-- 40. List artisans who earn more than the average experience of all artisans
SELECT name, total_experience
FROM Artisans
WHERE total_experience > (SELECT AVG(total_experience) FROM Artisans);

-- 41. Add a new column for skill_level based on experience
ALTER TABLE Artisans ADD skill_level VARCHAR(20);

-- 42. Update skill_level based on years of experience
UPDATE Artisans
SET skill_level = CASE 
    WHEN total_experience >= 20 THEN 'Expert'
    WHEN total_experience BETWEEN 10 AND 19 THEN 'Intermediate'
    ELSE 'Beginner'
END;

-- 43. Delete artisans who have no craft_type mentioned (data cleaning)
DELETE FROM Artisans
WHERE craft_type IS NULL;

-- 44. Create a backup table for artisans from Odisha
CREATE TABLE Odisha_Artisans AS
SELECT * FROM Artisans WHERE region = 'Odisha';

-- 45. Find artisans with duplicate craft_type using self join
SELECT A.name AS artisan1, B.name AS artisan2, A.craft_type
FROM Artisans A
JOIN Artisans B ON A.craft_type = B.craft_type AND A.artisan_id < B.artisan_id;

-- 46. Window function - running total of experience years
SELECT name, region, total_experience,
       SUM(total_experience) OVER (PARTITION BY region ORDER BY artisan_id) AS running_total
FROM Artisans;

-- 47. Create a trigger to log artisan insertions
CREATE TABLE Artisan_Log (
   log_id INT PRIMARY KEY AUTO_INCREMENT,
   artisan_id INT,
   action_type VARCHAR(20),
   log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_new_artisan
AFTER INSERT ON Artisans
FOR EACH ROW
INSERT INTO Artisan_Log (artisan_id, action_type)
VALUES (NEW.artisan_id, 'INSERT');

-- 48. CTE - Find artisans with above average experience per region
WITH RegionAvg AS (
   SELECT region, AVG(total_experience) AS avg_exp
   FROM Artisans
   GROUP BY region
)
SELECT A.name, A.region, A.total_experience
FROM Artisans A
JOIN RegionAvg R ON A.region = R.region
WHERE A.total_experience > R.avg_exp;

-- 49. Create an index on craft_type for faster search
CREATE INDEX idx_craft_type ON Artisans(craft_type);

-- 50. Use CONCAT() to display full artisan info in one line
SELECT CONCAT(name, ' from ', region, ' specializes in ', craft_type) AS artisan_summary
FROM Artisans;

-- 51. Use EXISTS to check if artisans exist in Bihar
SELECT CASE 
    WHEN EXISTS (SELECT 1 FROM Artisans WHERE region = 'Bihar')
    THEN 'Yes, artisans exist in Bihar'
    ELSE 'No artisans in Bihar'
END AS Bihar_status;

-- 52. Find artisans who have more experience than the average artisan
SELECT name, total_experience
FROM Artisans
WHERE total_experience > (SELECT AVG(total_experience) FROM Artisans);

-- 53. Find artisans who belong to the same region as 'Ravi Sharma'
SELECT name, region
FROM Artisans
WHERE region = (SELECT region FROM Artisans WHERE name = 'Ravi Sharma');

-- 54. Get artisans whose experience equals the maximum experience
SELECT name, total_experience
FROM Artisans
WHERE total_experience = (SELECT MAX(total_experience) FROM Artisans);

-- 55. List artisans whose craft type exists in Odisha artisans
SELECT name, craft_type
FROM Artisans
WHERE craft_type IN (SELECT craft_type FROM Artisans WHERE region = 'Odisha');

-- 56. Find artisans whose email domain is unique (appears only once)
SELECT name, email
FROM Artisans
WHERE email IN (
    SELECT email FROM Artisans
    GROUP BY email
    HAVING COUNT(*) = 1
);

-- 57. Correlated subquery: Find artisans who are the oldest in their region
SELECT A.name, A.region, A.age
FROM Artisans A
WHERE A.age = (
    SELECT MAX(B.age) FROM Artisans B WHERE B.region = A.region
);

-- 58. Find artisans who work in the same craft type as 'Meena Kumari'
SELECT name, craft_type
FROM Artisans
WHERE craft_type = (SELECT craft_type FROM Artisans WHERE name = 'Meena Kumari');

-- 59. Nested subquery: Find artisans from regions where at least one artisan has > 20 years experience
SELECT name, region
FROM Artisans
WHERE region IN (
    SELECT DISTINCT region
    FROM Artisans
    WHERE total_experience > 20
);

-- 60. Get artisans who do not belong to the region of the most experienced artisan
SELECT name, region, total_experience
FROM Artisans
WHERE region <> (
    SELECT region FROM Artisans
    WHERE total_experience = (SELECT MAX(total_experience) FROM Artisans)
);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 2: Craft_Types
CREATE TABLE Craft_Types (
    craft_type_id INT PRIMARY KEY, -- unique identifier for each craft_typse
    craft_name VARCHAR(100) NOT NULL UNIQUE, -- Name of the craft_types
    origin_state VARCHAR(50),
    description TEXT,
    material_used VARCHAR(100),
    tools_required VARCHAR(100),
    cultural_significance TEXT,
    estimated_cost DECIMAL(10,2),
    popularity_score INT DEFAULT 0,
    preservation_status VARCHAR(50) -- 
);

-- Insert 20 records into Craft_Types table
INSERT INTO Craft_Types (
    craft_type_id, craft_name, origin_state, description,material_used, tools_required, cultural_significance,estimated_cost, popularity_score, preservation_status)
VALUES
(1, 'Madhubani Painting', 'Bihar', 'Folk art using twigs, fingers, and matchsticks.', 'Natural dyes, handmade paper', 'Twigs, nibs, brushes', 'Used in weddings, rituals, and festivals.', 1200.00, 85, 'Endangered'),
(2, 'Warli Art', 'Maharashtra', 'Tribal art by Warli community on mud walls.', 'Rice paste, mud wall', 'Bamboo sticks', 'Depicts tribal lifestyle and beliefs.', 900.00, 78, 'Reviving'),
(3, 'Pattachitra', 'Odisha', 'Scroll painting based on mythology.', 'Cloth, natural dyes', 'Brushes, stylus', 'Related to Jagannath temple and rituals.', 1500.00, 88, 'Stable'),
(4, 'Block Printing', 'Rajasthan', 'Hand block printing on textiles.', 'Cotton, natural dye', 'Wooden blocks', 'Used in royal garments and decor.', 1300.00, 92, 'Popular'),
(5, 'Stone Sculpture', 'Tamil Nadu', 'Sculptures carved from granite or sandstone.', 'Granite, sandstone', 'Chisels, hammer', 'Used in temples and monuments.', 3000.00, 80, 'Stable'),
(6, 'Dhokra Art', 'Chhattisgarh', 'Metal craft using lost wax casting.', 'Brass, beeswax', 'Clay molds, furnace', 'Traditional tribal handicraft.', 1800.00, 76, 'Endangered'),
(7, 'Terracotta', 'West Bengal', 'Clay sculptures and pottery.', 'Clay', 'Potter’s wheel, kiln', 'Used in festivals, rituals, and homes.', 800.00, 70, 'Common'),
(8, 'Bamboo Craft', 'Assam', 'Weaving using bamboo for utility & decor.', 'Bamboo, cane', 'Knives, weaving tools', 'Used in baskets, mats, furniture.', 1000.00, 74, 'Reviving'),
(9, 'Phad Painting', 'Rajasthan', 'Religious scroll paintings.', 'Canvas, natural dyes', 'Brushes', 'Used in storytelling of local gods.', 1400.00, 69, 'Rare'),
(10, 'Channapatna Toys', 'Karnataka', 'Handcrafted wooden toys with lacquer.', 'Ivory wood, colors', 'Lathe machine', 'Used as eco-friendly traditional toys.', 950.00, 90, 'Popular'),
(11, 'Kalamkari', 'Andhra Pradesh', 'Hand-painted or block printed fabric.', 'Cotton, organic dyes', 'Pens, blocks', 'Depicts epics and floral motifs.', 1600.00, 82, 'Reviving'),
(12, 'Banarasi Weaving', 'Uttar Pradesh', 'Silk sarees with zari embroidery.', 'Silk, zari', 'Handloom', 'Used in weddings and cultural events.', 4500.00, 95, 'Popular'),
(13, 'Tanjore Painting', 'Tamil Nadu', 'Classical painting with gold leaf.', 'Canvas, gold foil', 'Brushes', 'Rich spiritual depictions.', 2500.00, 87, 'Stable'),
(14, 'Zardozi Embroidery', 'Uttar Pradesh', 'Metal embroidery on fine fabric.', 'Gold thread, fabric', 'Needle, frame', 'Used in Mughal-inspired clothing.', 3500.00, 83, 'Reviving'),
(15, 'Blue Pottery', 'Rajasthan', 'Glazed pottery with floral patterns.', 'Quartz, Multani mitti', 'Kiln, pottery wheel', 'Inspired by Persian designs.', 1700.00, 72, 'Endangered'),
(16, 'Lippan Kaam', 'Gujarat', 'Mud and mirror mural work.', 'Clay, mirror', 'Hand tools', 'Traditional Kutch home decor.', 1100.00, 68, 'Rare'),
(17, 'Bidriware', 'Karnataka', 'Metal inlay on blackened alloy.', 'Zinc, copper, silver', 'Chisels, files', 'Royal heritage art of Bidar.', 2900.00, 66, 'Endangered'),
(18, 'Pichwai Painting', 'Rajasthan', 'Temple art behind idols.', 'Cloth, pigments', 'Brushes', 'Dedicated to Lord Krishna.', 2000.00, 71, 'Stable'),
(19, 'Kondapalli Toys', 'Andhra Pradesh', 'Painted wooden toys.', 'Softwood, colors', 'Carving tools', 'Traditional storytelling toys.', 950.00, 60, 'Declining'),
(20, 'Rogan Art', 'Gujarat', 'Castor oil paste painting on cloth.', 'Fabric, castor paste', 'Stylus', 'Preserved by one family in Nirona.', 2400.00, 50, 'Critically Endangered');

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Craft_Types;

-- to remove complete data from table
truncate table Craft_Types;

-- to delete complete attributes and records 
drop table Craft_Types;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for UNESCO recognition status
ALTER TABLE Craft_Types ADD unesco_recognition VARCHAR(20);

-- 2. Modify estimated_cost to allow higher values (big crafts cost more)
ALTER TABLE Craft_Types MODIFY estimated_cost DECIMAL(12,2);

-- 3. Drop a column if not required (example cleanup column)
ALTER TABLE Craft_Types DROP COLUMN unesco_recognition;

-- 4. Rename column popularity_score to popularity_index
ALTER TABLE Craft_Types RENAME COLUMN popularity_score TO popularity_index;

-- 5. Create an index on origin_state for faster searches
CREATE INDEX idx_origin_state ON Craft_Types(origin_state);

-- 6. Add a CHECK constraint for popularity_index (0–100 range)
ALTER TABLE Craft_Types ADD CONSTRAINT chk_popularity CHECK (popularity_index BETWEEN 0 AND 100);

-- 7. Drop constraint if needed
ALTER TABLE Craft_Types DROP CONSTRAINT chk_popularity;

-- 8. Update cost of endangered crafts (support govt subsidy)
UPDATE Craft_Types
SET estimated_cost = estimated_cost * 0.9
WHERE preservation_status = 'Endangered';

-- 9. Delete critically endangered crafts (simulating data cleanup)
DELETE FROM Craft_Types
WHERE preservation_status = 'Critically Endangered';

-- 10. Increase popularity of crafts from Rajasthan by 5 points
UPDATE Craft_Types
SET popularity_index = popularity_index + 5
WHERE origin_state = 'Rajasthan';

-- 11. Get all popular crafts (popularity above 80)
SELECT craft_name, popularity_index FROM Craft_Types WHERE popularity_index > 80;

-- 12. Find crafts from Tamil Nadu
SELECT * FROM Craft_Types WHERE origin_state = 'Tamil Nadu';

-- 13. List crafts sorted by cost
SELECT craft_name, estimated_cost FROM Craft_Types ORDER BY estimated_cost DESC;

-- 14. Find total number of endangered crafts
SELECT COUNT(*) AS endangered_count FROM Craft_Types WHERE preservation_status = 'Endangered';

-- 15. Find average cost of crafts in Gujarat
SELECT AVG(estimated_cost) AS avg_cost_gujarat FROM Craft_Types WHERE origin_state = 'Gujarat';

-- 16. Crafts costing between 1000 and 2000
SELECT craft_name FROM Craft_Types WHERE estimated_cost BETWEEN 1000 AND 2000;

-- 17. Crafts sorted by popularity within state
SELECT craft_name, origin_state, popularity_index,
       DENSE_RANK() OVER (PARTITION BY origin_state ORDER BY popularity_index DESC) AS rank_in_state
FROM Craft_Types;

-- 18. Find artisans from states that produce stable crafts
SELECT A.name, A.region
FROM Artisans A
WHERE A.region IN (SELECT origin_state FROM Craft_Types WHERE preservation_status = 'Stable');

-- 19. Crafts with max artisans per state
SELECT A.region, C.craft_name, COUNT(A.artisan_id) AS artisan_count
FROM Artisans A
JOIN Craft_Types C ON A.craft_type = C.craft_name
GROUP BY A.region, C.craft_name
HAVING COUNT(A.artisan_id) = (
    SELECT MAX(cnt) 
    FROM (
        SELECT COUNT(artisan_id) AS cnt
        FROM Artisans A2
        JOIN Craft_Types C2 ON A2.craft_type = C2.craft_name
        WHERE A2.region = A.region
        GROUP BY C2.craft_name
    ) AS sub
);

-- 20. Crafts with artisans working outside their origin state
SELECT A.name, A.region AS artisan_region, C.origin_state AS craft_origin, C.craft_name
FROM Artisans A
JOIN Craft_Types C ON A.craft_type = C.craft_name
WHERE A.region <> C.origin_state;

-- 21. Inner join artisans with their crafts
SELECT A.name, A.region, C.craft_name
FROM Artisans A
JOIN Craft_Types C ON A.craft_type = C.craft_name;

-- 22. Left join to find crafts without artisans
SELECT C.craft_name, A.name
FROM Craft_Types C
LEFT JOIN Artisans A ON A.craft_type = C.craft_name
WHERE A.name IS NULL;

-- 23. Count artisans per craft type
SELECT C.craft_name, COUNT(A.artisan_id) AS artisan_count
FROM Craft_Types C
LEFT JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.craft_name;

-- 24. Find artisans working on endangered crafts
SELECT A.name, A.region, C.preservation_status
FROM Artisans A
JOIN Craft_Types C ON A.craft_type = C.craft_name
WHERE C.preservation_status = 'Endangered';

-- 25. Find crafts that have artisans in more than one region
SELECT C.craft_name
FROM Craft_Types C
JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.craft_name
HAVING COUNT(DISTINCT A.region) > 1;

-- 26. Display craft names in uppercase
SELECT UPPER(craft_name) FROM Craft_Types;

-- 27. Get length of each craft name
SELECT craft_name, LENGTH(craft_name) AS name_length FROM Craft_Types;

-- 28. Round estimated cost
SELECT craft_name, ROUND(estimated_cost, -2) AS rounded_cost FROM Craft_Types;

-- 29. Replace word "Painting" with "Art" in craft names
SELECT REPLACE(craft_name, 'Painting', 'Art') FROM Craft_Types;

-- 30. Find crafts added this year (using current date)
SELECT craft_name FROM Craft_Types WHERE YEAR(CURDATE()) = YEAR(NOW());

-- 31. Rank crafts by cost
SELECT craft_name, estimated_cost, RANK() OVER (ORDER BY estimated_cost DESC) AS rank_pos
FROM Craft_Types;

-- 32. Running total of popularity
SELECT craft_name, popularity_index, SUM(popularity_index) OVER (ORDER BY craft_type_id) AS running_popularity
FROM Craft_Types;

-- 33. Average popularity per state
SELECT origin_state, AVG(popularity_index) OVER (PARTITION BY origin_state) AS avg_popularity
FROM Craft_Types;

-- 34. Difference from state average popularity
SELECT craft_name, origin_state, popularity_index,
       popularity_index - AVG(popularity_index) OVER (PARTITION BY origin_state) AS diff_from_avg
FROM Craft_Types;

-- 35. GROUP BY state with average cost
SELECT origin_state, AVG(estimated_cost) AS avg_cost
FROM Craft_Types
GROUP BY origin_state;

-- 36. HAVING clause - only states with average cost above 2000
SELECT origin_state, AVG(estimated_cost) AS avg_cost
FROM Craft_Types
GROUP BY origin_state
HAVING AVG(estimated_cost) > 2000;

-- 37. ORDER BY multiple columns (cost desc, popularity asc)
SELECT craft_name, estimated_cost, popularity_index
FROM Craft_Types
ORDER BY estimated_cost DESC, popularity_index ASC;

-- 38. LIMIT - top 5 most popular crafts
SELECT craft_name, popularity_index
FROM Craft_Types
ORDER BY popularity_index DESC
LIMIT 5;

-- 39. Crafts costlier than average craft
SELECT craft_name, estimated_cost
FROM Craft_Types
WHERE estimated_cost > (SELECT AVG(estimated_cost) FROM Craft_Types);

-- 40. Crafts with same cost as 'Banarasi Weaving'
SELECT craft_name
FROM Craft_Types
WHERE estimated_cost = (SELECT estimated_cost FROM Craft_Types WHERE craft_name = 'Banarasi Weaving');

-- 41. Find crafts practiced in states where artisans exist
SELECT craft_name
FROM Craft_Types
WHERE origin_state IN (SELECT DISTINCT region FROM Artisans);

-- 42. Correlated subquery – get craft with highest cost in each state
SELECT craft_name, origin_state, estimated_cost
FROM Craft_Types C1
WHERE estimated_cost = (SELECT MAX(estimated_cost) FROM Craft_Types C2 WHERE C2.origin_state = C1.origin_state);

-- 43. Log when a new craft is added
CREATE TABLE Craft_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    craft_type_id INT,
    action_type VARCHAR(20),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_new_craft
AFTER INSERT ON Craft_Types
FOR EACH ROW
INSERT INTO Craft_Log (craft_type_id, action_type)
VALUES (NEW.craft_type_id, 'INSERT');

-- 44. Log updates of estimated cost
CREATE TRIGGER log_cost_update
AFTER UPDATE ON Craft_Types
FOR EACH ROW
INSERT INTO Craft_Log (craft_type_id, action_type)
VALUES (NEW.craft_type_id, 'UPDATE');

-- 45. UNION – list unique origin states and artisan regions
SELECT DISTINCT origin_state FROM Craft_Types
UNION
SELECT DISTINCT region FROM Artisans;

-- 46. INTERSECT equivalent (craft names that artisans actually practice)
SELECT DISTINCT C.craft_name
FROM Craft_Types C
WHERE C.craft_name IN (SELECT DISTINCT craft_type FROM Artisans);

-- 47. EXCEPT equivalent (crafts with no artisans)
SELECT craft_name FROM Craft_Types
WHERE craft_name NOT IN (SELECT DISTINCT craft_type FROM Artisans);

-- 48. Find second most expensive craft
SELECT craft_name, estimated_cost
FROM Craft_Types
ORDER BY estimated_cost DESC
LIMIT 1 OFFSET 1;

-- 49. Calculate cost difference between most and least expensive craft
SELECT MAX(estimated_cost) - MIN(estimated_cost) AS cost_difference FROM Craft_Types;

-- 50. Crafts grouped by preservation status count
SELECT preservation_status, COUNT(*) AS craft_count
FROM Craft_Types
GROUP BY preservation_status;

-- 51. Find crafts with highest artisan count (joined query)
SELECT C.craft_name, COUNT(A.artisan_id) AS artisan_count
FROM Craft_Types C
JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.craft_name
ORDER BY artisan_count DESC
LIMIT 1;

-- 52. List endangered crafts with artisans’ names
SELECT C.craft_name, A.name
FROM Craft_Types C
JOIN Artisans A ON C.craft_name = A.craft_type
WHERE C.preservation_status = 'Endangered';

-- 53. Find average artisan experience per craft
SELECT C.craft_name, AVG(A.total_experience) AS avg_experience
FROM Craft_Types C
JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.craft_name;

-- 54. Crafts from states with more than 2 endangered crafts
SELECT origin_state, COUNT(*) AS endangered_count
FROM Craft_Types
WHERE preservation_status = 'Endangered'
GROUP BY origin_state
HAVING COUNT(*) > 2;

-- 55. Crafts practiced in exactly one state (unique craft origins)
SELECT origin_state, COUNT(craft_type_id) AS craft_count
FROM Craft_Types
GROUP BY origin_state
HAVING COUNT(craft_type_id) = 1;

-- 56. Window function – rank endangered crafts by cost
SELECT craft_name, estimated_cost,
       RANK() OVER (ORDER BY estimated_cost DESC) AS endangered_rank
FROM Craft_Types
WHERE preservation_status = 'Endangered';

-- 57. Crafts with cost above state average (correlated subquery)
SELECT craft_name, origin_state, estimated_cost
FROM Craft_Types C1
WHERE estimated_cost > (SELECT AVG(estimated_cost) FROM Craft_Types C2 WHERE C2.origin_state = C1.origin_state);

-- 58. Crafts where artisans’ average experience > 15 years
SELECT C.craft_name
FROM Craft_Types C
JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.craft_name
HAVING AVG(A.total_experience) > 15;

-- 59. Calculate artisans per preservation category
SELECT C.preservation_status, COUNT(DISTINCT A.artisan_id) AS artisan_count
FROM Craft_Types C
LEFT JOIN Artisans A ON C.craft_name = A.craft_type
GROUP BY C.preservation_status;

-- 60. Crafts with higher cost than Banarasi Weaving
SELECT craft_name, estimated_cost
FROM Craft_Types
WHERE estimated_cost > (SELECT estimated_cost FROM Craft_Types WHERE craft_name = 'Banarasi Weaving');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 3: Workshops
CREATE TABLE Workshops (
    workshop_id INT PRIMARY KEY, -- unique identifier for each workshop
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    max_participants INT CHECK (max_participants > 0),
    craft_type_id INT,
    organizer_name VARCHAR(100),
    fees DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (craft_type_id) REFERENCES Craft_Types(craft_type_id)
);

--  Insert 20 records into Workshops table
INSERT INTO Workshops (workshop_id, title, description, location, start_date, end_date,max_participants, craft_type_id, organizer_name, fees) 
VALUES
(1, 'Madhubani Art Basics', 'Learn traditional Madhubani painting with natural dyes.', 'Darbhanga, Bihar', '2025-08-01', '2025-08-05', 25, 1, 'Sunita Devi', 500.00),
(2, 'Warli Art for Beginners', 'Introduction to tribal Warli art on handmade paper.', 'Palghar, Maharashtra', '2025-07-15', '2025-07-17', 20, 2, 'Geeta Verma', 300.00),
(3, 'Pattachitra Masterclass', 'Advanced scroll painting on canvas.', 'Puri, Odisha', '2025-09-10', '2025-09-12', 30, 3, 'Suresh Das', 750.00),
(4, 'Block Printing Workshop', 'Hands-on workshop using traditional blocks.', 'Jaipur, Rajasthan', '2025-08-20', '2025-08-22', 25, 4, 'Ravi Sharma', 400.00),
(5, 'Stone Sculpture Camp', 'Carving basics using granite and tools.', 'Mahabalipuram, Tamil Nadu', '2025-10-01', '2025-10-10', 15, 5, 'Ramesh Babu', 1500.00),
(6, 'Dhokra Casting Techniques', 'Lost wax method of metal crafting.', 'Bastar, Chhattisgarh', '2025-09-15', '2025-09-18', 20, 6, 'Prakash Thakur', 800.00),
(7, 'Terracotta Pottery Workshop', 'Clay modeling and baking techniques.', 'Bishnupur, West Bengal', '2025-08-05', '2025-08-07', 18, 7, 'Anil Kumar', 300.00),
(8, 'Bamboo Weaving Basics', 'Basket and mat weaving from bamboo.', 'Guwahati, Assam', '2025-08-10', '2025-08-12', 20, 8, 'Ajay Patel', 350.00),
(9, 'Phad Painting Storytelling', 'Painting scrolls with mythological tales.', 'Bhilwara, Rajasthan', '2025-08-18', '2025-08-20', 22, 9, 'Devendra Joshi', 600.00),
(10, 'Toy Making - Channapatna Style', 'Make eco-friendly toys with lacquer.', 'Channapatna, Karnataka', '2025-09-25', '2025-09-27', 25, 10, 'Yogesh Pawar', 400.00),
(11, 'Kalamkari Textile Workshop', 'Natural dye printing on fabric.', 'Machilipatnam, Andhra Pradesh', '2025-08-01', '2025-08-03', 20, 11, 'Kiran Reddy', 500.00),
(12, 'Banarasi Saree Weaving Demo', 'Live weaving on handlooms.', 'Varanasi, Uttar Pradesh', '2025-08-15', '2025-08-16', 15, 12, 'Anita Mishra', 1000.00),
(13, 'Tanjore Painting Techniques', 'Religious painting with gold leaf.', 'Thanjavur, Tamil Nadu', '2025-10-05', '2025-10-08', 20, 13, 'Lakshmi Bai', 700.00),
(14, 'Zardozi Embroidery Camp', 'Royal metal thread embroidery basics.', 'Lucknow, Uttar Pradesh', '2025-09-01', '2025-09-03', 18, 14, 'Mohd. Arif', 600.00),
(15, 'Blue Pottery Glazing Session', 'Hands-on ceramic pottery making.', 'Jaipur, Rajasthan', '2025-08-12', '2025-08-14', 20, 15, 'Nisha Pandey', 500.00),
(16, 'Lippan Kaam Mirror Art', 'Mud and mirror mural craft.', 'Bhuj, Gujarat', '2025-09-20', '2025-09-21', 15, 16, 'Jaya Nair', 450.00),
(17, 'Bidriware Metal Inlay Art', 'Making decorative Bidri items.', 'Bidar, Karnataka', '2025-08-25', '2025-08-27', 12, 17, 'Deepa Rawat', 1200.00),
(18, 'Pichwai Art for Temples', 'Detailed Krishna-themed cloth art.', 'Nathdwara, Rajasthan', '2025-09-10', '2025-09-13', 16, 18, 'Sunita Devi', 800.00),
(19, 'Kondapalli Toy Carving', 'Make wooden toys using softwood.', 'Kondapalli, Andhra Pradesh', '2025-09-05', '2025-09-06', 20, 19, 'Ravi Sharma', 400.00),
(20, 'Rogan Art Heritage Workshop', 'Learn fabric painting using castor paste.', 'Nirona, Gujarat', '2025-10-12', '2025-10-14', 10, 20, 'Yogesh Pawar', 1000.00);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Workshops;

-- to remove complete data from table
truncate table Workshops;

-- to delete complete attributes and records 
drop table Workshops;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column to track workshop difficulty level
ALTER TABLE Workshops ADD COLUMN difficulty_level VARCHAR(20) DEFAULT 'Beginner';

-- 2️. DDL: Modify column size of title
ALTER TABLE Workshops MODIFY COLUMN title VARCHAR(150);

-- 3️. DDL: Drop a column if no longer needed
ALTER TABLE Workshops DROP COLUMN difficulty_level;

-- 4️. DML: Update fees for workshops in Jaipur by 10%
UPDATE Workshops SET fees = fees * 1.10 WHERE location LIKE '%Jaipur%';

-- 5️. DML: Delete a workshop with less than 10 participants capacity
DELETE FROM Workshops WHERE max_participants < 10;

-- 6. Operator: Find workshops in Rajasthan OR Gujarat
SELECT title, location
FROM Workshops
WHERE location LIKE '%Rajasthan%' OR location LIKE '%Gujarat%';

-- 7️. DQL: List all workshops happening in September 2025
SELECT title, location, start_date, end_date
FROM Workshops
WHERE MONTH(start_date) = 9 AND YEAR(start_date) = 2025;

-- 8️. DQL: Get all workshops with fees between 500 and 1000
SELECT title, fees FROM Workshops
WHERE fees BETWEEN 500 AND 1000;

-- 9️. DQL: Find workshops organized by "Ravi Sharma"
SELECT workshop_id, title, location, fees
FROM Workshops
WHERE organizer_name = 'Ravi Sharma';

-- 10. DQL: Count number of workshops per location
SELECT location, COUNT(*) AS total_workshops
FROM Workshops
GROUP BY location;

-- 1️1. Operator: Workshops NOT organized by 'Sunita Devi'
SELECT workshop_id, title, organizer_name
FROM Workshops
WHERE organizer_name <> 'Sunita Devi';

-- 1️2. Join: Show workshop title with its craft name
SELECT w.title, c.craft_name, w.location, w.fees
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id;

-- 1️3. Join: Show workshops and craft description for those above 1000 fees
SELECT w.title, c.craft_name, c.description, w.fees
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
WHERE w.fees > 1000;

-- 1️4. Join + Aggregation: Count workshops conducted for each craft
SELECT c.craft_name, COUNT(w.workshop_id) AS total_workshops
FROM Craft_Types c
LEFT JOIN Workshops w ON c.craft_type_id = w.craft_type_id
GROUP BY c.craft_name;

-- 15. Subquery: Find workshops whose fees are higher than the average fee
SELECT title, fees
FROM Workshops
WHERE fees > (SELECT AVG(fees) FROM Workshops);

-- 16. Window Function: Rank workshops by fees (highest to lowest)
SELECT title, location, fees,
       RANK() OVER (ORDER BY fees DESC) AS fee_rank
FROM Workshops;

-- 17. Window Function: Number workshops per organizer
SELECT organizer_name, title,
       ROW_NUMBER() OVER (PARTITION BY organizer_name ORDER BY start_date) AS workshop_no
FROM Workshops;

-- 18. Window Function: Running total of fees collected per state
SELECT location, title, fees,
       SUM(fees) OVER (PARTITION BY location ORDER BY start_date) AS running_total
FROM Workshops;

-- 19. Window Function: Find most expensive workshop per state
SELECT location, title, fees
FROM (
    SELECT location, title, fees,
           RANK() OVER (PARTITION BY location ORDER BY fees DESC) AS rnk
    FROM Workshops
) t
WHERE rnk = 1;

-- 20. Correlated Subquery: Find organizers running workshops costlier than their own average
SELECT organizer_name, title, fees
FROM Workshops w1
WHERE fees > (
    SELECT AVG(fees) FROM Workshops w2 WHERE w1.organizer_name = w2.organizer_name
);

-- 21. EXISTS Subquery: Find crafts that have at least one workshop in 2025
SELECT c.craft_name
FROM Craft_Types c
WHERE EXISTS (
    SELECT 1 FROM Workshops w
    WHERE w.craft_type_id = c.craft_type_id AND YEAR(w.start_date) = 2025
);

-- 22. IN Operator with Subquery: Find all workshops of crafts from 'Rajasthan'
SELECT title, location
FROM Workshops
WHERE craft_type_id IN (
    SELECT craft_type_id FROM Craft_Types WHERE origin_state = 'Rajasthan'
);

-- 23. Multi-Join: Show workshop, craft, and artisan (organizer) details
SELECT w.title, c.craft_name, a.name AS artisan_name, w.location, w.fees
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
JOIN Artisans a ON w.organizer_name = a.name;

-- 24. Function: String function – extract first word from title
SELECT title, SUBSTRING_INDEX(title, ' ', 1) AS first_word
FROM Workshops;

-- 25. Function: Date function – show day of week for workshop start
SELECT title, start_date, DAYNAME(start_date) AS weekday
FROM Workshops;

-- 26. Function: Math – Round fees to nearest 100
SELECT title, fees, ROUND(fees, -2) AS rounded_fee
FROM Workshops;

-- 27. CASE Expression: Categorize workshops by fee level
SELECT title, fees,
       CASE 
            WHEN fees < 500 THEN 'Low Cost'
            WHEN fees BETWEEN 500 AND 1000 THEN 'Medium Cost'
            ELSE 'Premium'
       END AS fee_category
FROM Workshops;

-- 28. LIKE Operator: Find workshops with 'Painting' in title
SELECT title, location
FROM Workshops
WHERE title LIKE '%Painting%';

-- 29. BETWEEN Operator: List workshops with participant capacity 15–20
SELECT title, max_participants
FROM Workshops
WHERE max_participants BETWEEN 15 AND 20;

-- 30. Aggregate + Having: Find organizers who conducted more than 1 workshop
SELECT organizer_name, COUNT(*) AS total_workshops
FROM Workshops
GROUP BY organizer_name
HAVING COUNT(*) > 1;

-- 31. Stored Procedure: Get workshops by craft
DELIMITER $$
CREATE PROCEDURE GetWorkshopsByCraft(IN craftId INT)
BEGIN
   SELECT title, location, fees FROM Workshops WHERE craft_type_id = craftId;
END$$
DELIMITER ;

-- 32. Stored Procedure: Increase fees for all workshops in a state
DELIMITER $$
CREATE PROCEDURE IncreaseFeesByState(IN stateName VARCHAR(50), IN increment INT)
BEGIN
   UPDATE Workshops
   SET fees = fees + increment
   WHERE location LIKE CONCAT('%', stateName, '%');
END$$
DELIMITER ;

-- 33. Subquery: Find crafts with NO workshops yet
SELECT craft_name
FROM Craft_Types
WHERE craft_type_id NOT IN (SELECT craft_type_id FROM Workshops);

-- 34. Subquery in SELECT: Show workshop + its organizer's total workshops
SELECT w.title, w.organizer_name,
       (SELECT COUNT(*) FROM Workshops WHERE organizer_name = w.organizer_name) AS total_workshops
FROM Workshops w;

-- 35. Correlated Subquery: Find workshops with above-average fees in their location
SELECT title, location, fees
FROM Workshops w1
WHERE fees > (
    SELECT AVG(fees) FROM Workshops w2 WHERE w2.location = w1.location
);

-- 36. Window Function: Divide workshops into 4 groups based on fee
SELECT title, fees,
       NTILE(4) OVER (ORDER BY fees DESC) AS fee_quartile
FROM Workshops;

-- 37. Window Function: Previous workshop fee comparison
SELECT title, fees,
       LAG(fees, 1, 0) OVER (ORDER BY start_date) AS prev_fee
FROM Workshops;

-- 38. Window Function: Next workshop fee prediction
SELECT title, fees,
       LEAD(fees, 1, 0) OVER (ORDER BY start_date) AS next_fee
FROM Workshops;

-- 39. Advanced Aggregation: Average fee per craft, sorted highest first
SELECT c.craft_name, AVG(w.fees) AS avg_fee
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
GROUP BY c.craft_name
ORDER BY avg_fee DESC;

-- 40. Advanced Aggregation: Top 3 locations with max workshops
SELECT location, COUNT(*) AS total
FROM Workshops
GROUP BY location
ORDER BY total DESC
LIMIT 3;

-- 41. CASE + Aggregation: Total revenue category-wise
SELECT 
   CASE 
       WHEN fees < 500 THEN 'Low Revenue'
       WHEN fees BETWEEN 500 AND 1000 THEN 'Medium Revenue'
       ELSE 'High Revenue'
   END AS revenue_category,
   SUM(fees) AS total_revenue
FROM Workshops
GROUP BY revenue_category;

-- 42. Self-Join: Find workshops with same fees
SELECT w1.title AS workshop1, w2.title AS workshop2, w1.fees
FROM Workshops w1
JOIN Workshops w2 ON w1.fees = w2.fees AND w1.workshop_id < w2.workshop_id;

-- 43. EXISTS: Find artisans who organized at least one workshop
SELECT a.name
FROM Artisans a
WHERE EXISTS (
    SELECT 1 FROM Workshops w WHERE w.organizer_name = a.name
);

-- 44. ANY Operator: Find workshops costlier than ANY workshop in 'Delhi'
SELECT title, fees
FROM Workshops
WHERE fees > ANY (SELECT fees FROM Workshops WHERE location = 'Delhi');

-- 45. ALL Operator: Find workshops cheaper than ALL workshops in 'Mumbai'
SELECT title, fees
FROM Workshops
WHERE fees < ALL (SELECT fees FROM Workshops WHERE location = 'Mumbai');

-- 46. Create a View: Active Workshops with future dates
CREATE VIEW Active_Workshops AS
SELECT title, location, start_date, end_date, fees
FROM Workshops
WHERE start_date > CURDATE();

-- 47. Show all workshops happening in Mumbai
SELECT title, location, start_date, end_date
FROM Workshops
WHERE location LIKE '%Mumbai%';

-- 48. Using Index: Find workshops in 'Rajasthan'
SELECT title, fees FROM Workshops WHERE location LIKE '%Rajasthan%';

-- 49. Recursive CTE: Generate next 10 days from today
WITH RECURSIVE dates AS (
   SELECT CURDATE() AS d
   UNION ALL
   SELECT DATE_ADD(d, INTERVAL 1 DAY) FROM dates WHERE d < CURDATE() + INTERVAL 9 DAY
)
SELECT * FROM dates;

-- 50. CROSS JOIN: Generate all possible craft-location pairs
SELECT c.craft_name, w.location
FROM Craft_Types c
CROSS JOIN Workshops w;

-- 51. FULL OUTER JOIN Simulation (using UNION)
SELECT w.title, c.craft_name
FROM Workshops w LEFT JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
UNION
SELECT w.title, c.craft_name
FROM Workshops w RIGHT JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id;

-- 52. CTE with Aggregation: Average fees per craft
WITH avg_fees AS (
   SELECT craft_type_id, AVG(fees) AS avg_fee
   FROM Workshops
   GROUP BY craft_type_id
)
SELECT c.craft_name, a.avg_fee
FROM avg_fees a
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id;

-- 53. CTE with Filtering: Top 5 most expensive workshops
WITH expensive AS (
   SELECT title, fees, RANK() OVER (ORDER BY fees DESC) AS rnk
   FROM Workshops
)
SELECT * FROM expensive WHERE rnk <= 5;

-- 54. Performance Test: Find workshops with the word 'Art' in title
SELECT * FROM Workshops WHERE title LIKE '%Art%';

-- 55. Advanced Function: Find fee difference from average
SELECT title, fees, fees - (SELECT AVG(fees) FROM Workshops) AS diff_from_avg
FROM Workshops;

-- 56. Advanced Condition with HAVING: Crafts with avg fee above 700
SELECT craft_type_id, AVG(fees) AS avg_fee
FROM Workshops
GROUP BY craft_type_id
HAVING AVG(fees) > 700;

-- 57. Rank Organizers: Who conducted the most workshops
SELECT organizer_name, COUNT(*) AS total_workshops,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_position
FROM Workshops
GROUP BY organizer_name;

-- 58. Combine Multiple Tables: Show craft name, workshop title & artisan if organizer exists in Artisans
SELECT w.title, c.craft_name, a.name AS artisan_name
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
LEFT JOIN Artisans a ON w.organizer_name = a.name;

-- 59. Show all workshops happening in Rajasthan
SELECT title, location, start_date, end_date
FROM Workshops
WHERE location LIKE '%Rajasthan%';

-- 60. Find average workshop fees craft-wise
SELECT c.craft_name, AVG(w.fees) AS avg_fee
FROM Workshops w
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
GROUP BY c.craft_name;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 4: Registrations
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY, -- unique identifier for each registration
    workshop_id INT,
    artisan_id INT,
    status VARCHAR(20) DEFAULT 'Registered',
    payment_status VARCHAR(20) CHECK (payment_status IN ('Pending', 'Completed')),
    amount_paid DECIMAL(10,2) DEFAULT 0,
    payment_mode VARCHAR(20) DEFAULT 'Cash',  -- New attribute
    remarks TEXT,                              -- New attribute
    attendance_status VARCHAR(20) DEFAULT 'Not Attended',  -- New attribute
    FOREIGN KEY (workshop_id) REFERENCES Workshops(workshop_id),
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id)
);

-- Insert 20 records into Registrations table
INSERT INTO Registrations (registration_id, workshop_id, artisan_id, status,payment_status, amount_paid, payment_mode,remarks, attendance_status)
 VALUES
(1, 1, 2, 'Registered', 'Completed', 500.00, 'UPI', 'Attended full session', 'Attended'),
(2, 2, 3, 'Registered', 'Pending', 0.00, 'Cash', 'Payment due on arrival', 'Not Attended'),
(3, 3, 4, 'Registered', 'Completed', 750.00, 'Card', 'Very active participant', 'Attended'),
(4, 4, 1, 'Registered', 'Completed', 400.00, 'UPI', 'Loved block printing!', 'Attended'),
(5, 5, 5, 'Cancelled', 'Pending', 0.00, 'Cash', 'Cancelled due to travel', 'Not Attended'),
(6, 6, 6, 'Registered', 'Completed', 800.00, 'Cash', 'Great Dhokra demonstration', 'Attended'),
(7, 7, 7, 'Registered', 'Completed', 300.00, 'UPI', 'Perfect for beginners', 'Attended'),
(8, 8, 8, 'Registered', 'Completed', 350.00, 'UPI', 'Weaving was fun!', 'Attended'),
(9, 9, 9, 'Registered', 'Completed', 600.00, 'Card', 'Told stories through art', 'Attended'),
(10, 10, 10, 'Registered', 'Completed', 400.00, 'Cash', 'Very good lacquer toy tips', 'Attended'),
(11, 11, 11, 'Registered', 'Completed', 500.00, 'UPI', 'Enjoyed working with natural dyes', 'Attended'),
(12, 12, 12, 'Registered', 'Completed', 1000.00, 'Card', 'Wants advanced class next', 'Attended'),
(13, 13, 13, 'Registered', 'Completed', 700.00, 'UPI', 'Gold leaf work was stunning', 'Attended'),
(14, 14, 14, 'Registered', 'Pending', 0.00, 'Cash', 'Didn’t join due to health', 'Not Attended'),
(15, 15, 15, 'Registered', 'Completed', 500.00, 'Card', 'Loved Persian patterns', 'Attended'),
(16, 16, 16, 'Registered', 'Completed', 450.00, 'Cash', 'Want to teach others', 'Attended'),
(17, 17, 17, 'Registered', 'Completed', 1200.00, 'UPI', 'Loved the metal inlay skill', 'Attended'),
(18, 18, 18, 'Registered', 'Completed', 800.00, 'UPI', 'Excellent artwork display', 'Attended'),
(19, 19, 19, 'Registered', 'Completed', 400.00, 'Cash', 'Childhood memories revived', 'Attended'),
(20, 20, 20, 'Registered', 'Completed', 1000.00, 'UPI', 'Only one family teaches this now', 'Attended');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Registrations;

-- to remove complete data from table
truncate table Registrations;

-- to delete complete attributes and records 
drop table Registrations;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add an index on registration workshop for faster lookup of registrations per workshop
CREATE INDEX idx_reg_workshop ON Registrations(workshop_id);

-- 2. Add an index on registration artisan for quick artisan history queries
CREATE INDEX idx_reg_artisan ON Registrations(artisan_id);

-- 3. Add a CHECK constraint to enforce positive amount_paid (MySQL 8.0+ supports CHECK)
ALTER TABLE Registrations ADD CONSTRAINT chk_amount_paid CHECK (amount_paid >= 0);

-- 4. Extract organizer's last name from organizer_name (first space split)
SELECT workshop_id, organizer_name, SUBSTRING_INDEX(organizer_name, ' ', -1) AS organizer_last_name FROM Workshops;

-- 5. Find weekday distribution of workshop start days
SELECT DAYNAME(start_date) AS weekday, COUNT(*) AS workshops_count FROM Workshops GROUP BY weekday;

-- 6. Average amount paid by payment_mode
SELECT payment_mode, AVG(amount_paid) AS avg_paid FROM Registrations GROUP BY payment_mode;

-- 7. Mark a pending payment as completed after receiving UPI payment
UPDATE Registrations
SET payment_status = 'Completed', amount_paid = 750.00, payment_mode = 'UPI'
WHERE registration_id = 2;

-- 8. Cancel a registration and refund (example: mark Cancelled and payment pending refund)
UPDATE Registrations
SET status = 'Cancelled', payment_status = 'Pending', remarks = CONCAT(remarks, '; Cancelled by artisan')
WHERE registration_id = 5;

-- 9. Bulk update: mark attendance for a finished workshop (attendance taken)
UPDATE Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
SET r.attendance_status = 'Attended'
WHERE w.end_date < CURDATE() AND r.attendance_status = 'Not Attended';

-- 10. Delete test registration (cleanup)
DELETE FROM Registrations WHERE registration_id = 999; -- safe delete of a known test id

-- 11. List all registrations with artisan and workshop details
SELECT r.registration_id, a.name AS artisan_name, w.title AS workshop_title, r.status, r.payment_status, r.amount_paid
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
JOIN Workshops w ON r.workshop_id = w.workshop_id;

-- 12. Find all registrations for a given workshop (id = 3)
SELECT r.*, a.name FROM Registrations r JOIN Artisans a ON r.artisan_id = a.artisan_id WHERE r.workshop_id = 3;

-- 13. Count total participants registered per workshop
SELECT w.workshop_id, w.title, COUNT(r.registration_id) AS total_registered
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title;

-- 14. Total revenue collected per workshop (sum of amount_paid)
SELECT w.workshop_id, w.title, SUM(r.amount_paid) AS revenue_collected
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title;

-- 15. Registrations with pending payments
SELECT r.registration_id, a.name, w.title, r.amount_paid, r.payment_status
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE r.payment_status = 'Pending';

-- 16. Active registrations for upcoming workshops
SELECT r.registration_id, a.name, w.title, w.start_date
FROM Registrations r
JOIN Artisans a USING (artisan_id)
JOIN Workshops w USING (workshop_id)
WHERE w.start_date > CURDATE() AND r.status = 'Registered';

-- 17. Registrations per craft type (how many participants per craft)
SELECT c.craft_name, COUNT(r.registration_id) AS participants
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
GROUP BY c.craft_name;

-- 19. Workshops with seats available (max_participants - registered < threshold)
SELECT w.workshop_id, w.title, w.max_participants, COALESCE(COUNT(r.registration_id),0) AS registered,
       (w.max_participants - COALESCE(COUNT(r.registration_id),0)) AS seats_left
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title, w.max_participants
HAVING seats_left > 0;

-- 20. Find registrations where remarks mention 'advanced' (text search)
SELECT r.registration_id, r.remarks FROM Registrations r WHERE r.remarks LIKE '%advanced%';

-- 21. Rank artisans by total amount_paid across all registrations
SELECT artisan_id, SUM(amount_paid) AS total_paid,
       RANK() OVER (ORDER BY SUM(amount_paid) DESC) AS payment_rank
FROM Registrations
GROUP BY artisan_id;

-- 22. For each workshop, assign a sequential registration number (ticket no.)
SELECT registration_id, workshop_id, artisan_id,
       ROW_NUMBER() OVER (PARTITION BY workshop_id ORDER BY registration_id) AS ticket_no
FROM Registrations;

-- 23. Running total of revenue per workshop ordered by registration time (registration_id)
SELECT registration_id, workshop_id, amount_paid,
       SUM(amount_paid) OVER (PARTITION BY workshop_id ORDER BY registration_id) AS running_revenue
FROM Registrations;

-- 24. NTILE example: split registered artisans for a large workshop into 4 batches
SELECT registration_id, workshop_id, artisan_id,
       NTILE(4) OVER (PARTITION BY workshop_id ORDER BY registration_id) AS batch_no
FROM Registrations
WHERE workshop_id = 5;

-- 25. Lead/Lag: compare a registrant's payment to next registrant's payment for same workshop
SELECT registration_id, workshop_id, amount_paid,
       LAG(amount_paid) OVER (PARTITION BY workshop_id ORDER BY registration_id) AS prev_amount,
       LEAD(amount_paid) OVER (PARTITION BY workshop_id ORDER BY registration_id) AS next_amount
FROM Registrations;

-- 26. Registrations for workshops whose fees are above average workshop fee
SELECT r.registration_id, w.title, w.fees
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE w.fees > (SELECT AVG(fees) FROM Workshops);

-- 27. Registrations where artisan's region differs from workshop location's state (traveling artisans)
SELECT r.registration_id, a.name AS artisan, a.region AS artisan_region, w.location AS workshop_location
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE a.region NOT LIKE CONCAT('%', (SELECT SUBSTRING_INDEX(w.location, ',', -1) FROM Workshops w WHERE w.workshop_id = r.workshop_id), '%');

-- 28. Find registrations for workshops run by organizers who also are artisans (organizer_name matches artisan name)
SELECT r.registration_id, w.title, w.organizer_name
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE w.organizer_name IN (SELECT name FROM Artisans);

-- 29. Format collected amount with 2 decimals for report readability
SELECT registration_id, FORMAT(amount_paid,2) AS amount_paid_formatted FROM Registrations;

-- 30. Nested subquery: find artisans registered for the most expensive craft (craft with highest estimated_cost)
SELECT r.registration_id, a.name, c.craft_name
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
JOIN Artisans a ON r.artisan_id = a.artisan_id
WHERE c.estimated_cost = (SELECT MAX(estimated_cost) FROM Craft_Types);

-- 31. Full registration detail: registration + workshop + craft + artisan
SELECT r.registration_id, a.name AS artisan, a.contact_number, w.title AS workshop, c.craft_name, r.payment_status, r.amount_paid
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
JOIN Workshops w ON r.workshop_id = w.workshop_id
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id;

-- 32. Registrations for crafts marked 'Endangered' (help target participants)
SELECT r.registration_id, a.name, c.craft_name, c.preservation_status
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
JOIN Craft_Types c ON w.craft_type_id = c.craft_type_id
JOIN Artisans a ON r.artisan_id = a.artisan_id
WHERE c.preservation_status = 'Endangered';

-- 33. Workshops and number of completed payments
SELECT w.workshop_id, w.title, SUM(CASE WHEN r.payment_status='Completed' THEN 1 ELSE 0 END) AS payments_completed
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title;

-- 34. Organizers who have registered themselves to their own workshop
SELECT DISTINCT w.organizer_name, w.title
FROM Workshops w
JOIN Registrations r ON w.workshop_id = r.workshop_id
JOIN Artisans a ON r.artisan_id = a.artisan_id
WHERE w.organizer_name = a.name;

-- 35. Artisans who paid via UPI and attended
SELECT a.name, r.amount_paid, w.title
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE r.payment_mode = 'UPI' AND r.attendance_status = 'Attended';

-- 36. Enforce uniqueness by creating composite unique index (if you want to prevent duplicates)
ALTER TABLE Registrations ADD CONSTRAINT unique_artisan_workshop UNIQUE (artisan_id, workshop_id);

-- 37. Refund candidates: find registrations cancelled but with amount_paid > 0
SELECT r.registration_id, a.name, r.amount_paid, r.remarks
FROM Registrations r
JOIN Artisans a ON r.artisan_id = a.artisan_id
WHERE r.status = 'Cancelled' AND r.amount_paid > 0;

-- 38. Organizer payout report: total collected for workshops organized by each organizer
SELECT w.organizer_name, SUM(r.amount_paid) AS total_collected
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.organizer_name
ORDER BY total_collected DESC;

-- 39. Reserve seats: check seats left and create a reservation (select then insert pattern)
SELECT w.workshop_id, w.max_participants - COALESCE(c.registered,0) AS seats_left
FROM Workshops w
LEFT JOIN (SELECT workshop_id, COUNT(*) AS registered FROM Registrations GROUP BY workshop_id) c ON w.workshop_id = c.workshop_id
WHERE w.workshop_id = 1;

-- 40. Combine artisan name and workshop into a summary sentence
SELECT CONCAT(a.name, ' - attended ', w.title) AS summary FROM Registrations r JOIN Artisans a ON r.artisan_id = a.artisan_id JOIN Workshops w ON r.workshop_id = w.workshop_id;

-- 41. Find registrations with amount_paid = 0 (likely pending)
SELECT * FROM Registrations WHERE amount_paid = 0;

-- 42. Find registrations with payment_mode not 'Cash' (electronic payments)
SELECT * FROM Registrations WHERE payment_mode <> 'Cash';

-- 43. Registrations between two dates (example: August 2025)
SELECT r.*
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
WHERE w.start_date BETWEEN '2025-08-01' AND '2025-08-31';

-- 44. Registrations with remarks not null (feedback or special notes)
SELECT registration_id, remarks FROM Registrations WHERE remarks IS NOT NULL AND remarks <> '';

-- 45. Complex nested subquery: find workshops where average payment by attendees is above overall average
SELECT w.workshop_id, w.title, AVG(r.amount_paid) AS workshop_avg
FROM Workshops w
JOIN Registrations r ON w.workshop_id = r.workshop_id
WHERE r.attendance_status = 'Attended'
GROUP BY w.workshop_id, w.title
HAVING AVG(r.amount_paid) > (SELECT AVG(amount_paid) FROM Registrations WHERE attendance_status = 'Attended');

-- 46. Trigger: After INSERT, log registration into Registration_Audit
CREATE TRIGGER trg_reg_insert
AFTER INSERT ON Registrations
FOR EACH ROW
INSERT INTO Registration_Audit (registration_id, old_status, new_status, changed_by)
VALUES (NEW.registration_id, NULL, NEW.status, 'system');

-- 47. Mark no-shows after 2 days post-workshop end (automation-friendly query)
UPDATE Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
SET r.attendance_status = 'No-Show'
WHERE w.end_date < DATE_SUB(CURDATE(), INTERVAL 2 DAY) AND r.attendance_status = 'Not Attended';

-- 48. Find most popular payment mode among attended registrations
SELECT payment_mode, COUNT(*) AS cnt
FROM Registrations r
WHERE r.attendance_status = 'Attended'
GROUP BY payment_mode
ORDER BY cnt DESC
LIMIT 1;

-- 49. Monthly new registrants count
SELECT DATE_FORMAT(w.start_date, '%Y-%m') AS month, COUNT(r.registration_id) AS new_registrations
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
GROUP BY month
ORDER BY month;

-- 50. Average attendance rate per workshop = attended / registered
SELECT w.workshop_id, w.title,
       SUM(CASE WHEN r.attendance_status='Attended' THEN 1 ELSE 0 END) / NULLIF(COUNT(r.registration_id),0) AS attendance_rate
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title;

-- 51. Create a view for financial summary per workshop
CREATE VIEW Workshop_Financial_Summary AS
SELECT w.workshop_id, w.title, COUNT(r.registration_id) AS total_registrations, SUM(r.amount_paid) AS total_collected, AVG(r.amount_paid) AS avg_payment
FROM Workshops w
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY w.workshop_id, w.title;

-- 52. Query the created view
SELECT * FROM Workshop_Financial_Summary ORDER BY total_collected DESC;

-- 53. View for artisan activity (how many workshops each artisan registered)
CREATE VIEW Artisan_Activity AS
SELECT a.artisan_id, a.name, COUNT(r.registration_id) AS registrations_count, SUM(r.amount_paid) AS total_paid
FROM Artisans a
LEFT JOIN Registrations r ON a.artisan_id = r.artisan_id
GROUP BY a.artisan_id, a.name;

-- 54. Query artisans who paid above average across all artisans
SELECT * FROM Artisan_Activity WHERE total_paid > (SELECT AVG(total_paid) FROM Artisan_Activity);

-- 55. Rebuild index (if supported) — example command (MySQL automatically manages, but shown for reference)
ALTER TABLE Registrations DROP INDEX idx_reg_workshop, ADD INDEX idx_reg_workshop (workshop_id);

-- 56. Registrations grouped by payment_mode and attendance_status (cross-tab)
SELECT payment_mode, attendance_status, COUNT(*) AS cnt
FROM Registrations
GROUP BY payment_mode, attendance_status
ORDER BY payment_mode, attendance_status;

-- 57. Monthly revenue for workshops (group by month)
SELECT DATE_FORMAT(w.start_date, '%Y-%m') AS month, SUM(r.amount_paid) AS revenue
FROM Registrations r
JOIN Workshops w ON r.workshop_id = w.workshop_id
GROUP BY month
ORDER BY month;

-- 58. Payment mode share (percentage)
SELECT payment_mode, COUNT(*) AS cnt, ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM Registrations),2) AS pct_share
FROM Registrations
GROUP BY payment_mode;

-- 59. Top 3 artisans by total_paid
SELECT artisan_id, SUM(amount_paid) AS total_paid
FROM Registrations
GROUP BY artisan_id
ORDER BY total_paid DESC
LIMIT 3;

-- 60. CTE: List workshops with average payment using WITH
WITH avg_pay AS (
  SELECT workshop_id, AVG(amount_paid) AS avg_payment FROM Registrations GROUP BY workshop_id
)
SELECT w.title, a.avg_payment
FROM Workshops w
LEFT JOIN avg_pay a ON w.workshop_id = a.workshop_id
ORDER BY a.avg_payment DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 5: Materials
CREATE TABLE Materials (
    material_id INT PRIMARY KEY, -- unique identification for each material
    material_name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50),
    source_location VARCHAR(100),
    cost_per_unit DECIMAL(10,2),
    availability_status VARCHAR(20) DEFAULT 'Available',
    unit VARCHAR(20),
    environmental_impact TEXT,
    storage_conditions VARCHAR(100),
    description TEXT
);

-- Insert 20 records into Materials table
INSERT INTO Materials (material_id, material_name, type, source_location,cost_per_unit, availability_status, unit,environmental_impact, storage_conditions, description)
 VALUES
(1, 'Handmade Paper', 'Surface Base', 'Sanganer, Rajasthan', 12.00, 'Available', 'Sheet', 'Eco-friendly, biodegradable', 'Dry & flat storage', 'Used in Madhubani and miniature paintings'),
(2, 'Natural Indigo', 'Dye', 'Bagru, Rajasthan', 45.00, 'Available', '100 ml', 'Low impact, organic', 'Cool, airtight bottle', 'Traditional dye used in block printing'),
(3, 'Terracotta Clay', 'Clay', 'Kumhar Para, West Bengal', 20.00, 'Available', 'kg', 'Natural, eco-friendly', 'Cool dry place', 'Primary material for pottery and figurines'),
(4, 'Cotton Fabric', 'Textile', 'Tirupur, Tamil Nadu', 150.00, 'Available', 'Meter', 'Sustainable if organic', 'Rolled, cool & dry', 'Used in Kalamkari, block printing, and embroidery'),
(5, 'Multani Mitti', 'Mineral Base', 'Jodhpur, Rajasthan', 18.00, 'Available', 'kg', 'Natural mineral, harmless', 'Dry and airtight', 'Used in blue pottery glaze mix'),
(6, 'Beeswax', 'Organic Wax', 'Chhattisgarh Forests', 70.00, 'Available', 'kg', 'Biodegradable, natural', 'Cool airtight jar', 'Used in Dhokra art for wax casting'),
(7, 'Cane Strips', 'Natural Fiber', 'Silchar, Assam', 60.00, 'Available', 'Bundle', 'Fully biodegradable', 'Dry ventilated area', 'Used in bamboo and cane weaving crafts'),
(8, 'Silk Thread', 'Fiber', 'Varanasi, Uttar Pradesh', 250.00, 'Available', 'Spool', 'Moderate, non-synthetic', 'Keep away from humidity', 'Used in Banarasi weaving and embroidery'),
(9, 'Stone (Granite)', 'Raw Stone', 'Mahabalipuram, Tamil Nadu', 180.00, 'Available', 'Block', 'Minimal, natural', 'Covered outdoors', 'Used in stone sculpture for temples'),
(10, 'Zari Thread', 'Embroidery Thread', 'Bareilly, Uttar Pradesh', 300.00, 'Available', 'Spool', 'Metallic coating, semi-recyclable', 'Avoid moisture', 'Used in Zardozi embroidery'),
(11, 'Bamboo Poles', 'Natural Material', 'Tezpur, Assam', 90.00, 'Available', 'Pole', 'Biodegradable', 'Shade & dry', 'Used in bamboo furniture and crafts'),
(12, 'Castor Oil Paste', 'Paint Base', 'Nirona, Gujarat', 75.00, 'Available', '100 gm', 'Organic base', 'Airtight box', 'Used in Rogan art fabric painting'),
(13, 'Lac', 'Resin', 'Channapatna, Karnataka', 40.00, 'Available', '100 gm', 'Derived from insects, natural', 'Cool & wrapped', 'Used in toy and bangle finishing'),
(14, 'Marble Dust', 'Powder', 'Makrana, Rajasthan', 35.00, 'Available', 'kg', 'Low toxicity', 'Dry sealed bag', 'Used in Tanjore painting base'),
(15, 'Natural Dyes', 'Color Pigment', 'Auroville, Tamil Nadu', 55.00, 'Available', '100 gm', 'Non-toxic, eco-friendly', 'Cool airtight jar', 'Used across textile and mural arts'),
(16, 'Wood Blocks', 'Tool', 'Bagru, Rajasthan', 120.00, 'Available', 'Piece', 'Reusable, eco-friendly', 'Dry shelf', 'Used for hand block printing'),
(17, 'Softwood Logs', 'Wood Material', 'Kondapalli, Andhra Pradesh', 85.00, 'Available', 'Log', 'Natural wood, moderate impact', 'Covered storage', 'Used in Kondapalli toy making'),
(18, 'Mirror Pieces', 'Decorative', 'Bhuj, Gujarat', 15.00, 'Available', '100 pcs', 'Glass, recyclable', 'Cushioned box', 'Used in Lippan Kaam and embroidery'),
(19, 'Clay Pigments', 'Color', 'Bishnupur, West Bengal', 25.00, 'Available', '100 gm', 'Natural pigment', 'Airtight pouch', 'Used in terracotta coloring'),
(20, 'Zinc Alloy', 'Metal', 'Bidar, Karnataka', 200.00, 'Available', 'kg', 'Recyclable metal', 'Dry room temp', 'Base for Bidriware metal art');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Materials;

-- to remove complete data from table
truncate table Materials;

-- to delete complete attributes and records 
drop table Materials;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Create an index on material_name for fast lookup
CREATE INDEX idx_material_name ON Materials(material_name);

-- 2. Add a CHECK to ensure cost_per_unit is non-negative
ALTER TABLE Materials ADD CONSTRAINT chk_cost_nonneg CHECK (cost_per_unit >= 0);

-- 3. Add a supplier_id column (nullable) to Materials for future linking
ALTER TABLE Materials ADD COLUMN supplier_id INT NULL;

-- 4. Update cost_per_unit for Natural Indigo due to supplier price change
UPDATE Materials SET cost_per_unit = 50.00 WHERE material_name = 'Natural Indigo';

-- 5. Mark a material as temporarily unavailable
UPDATE Materials SET availability_status = 'Out of Stock' WHERE material_name = 'Silk Thread';

-- 6. Delete a deprecated test material (safe delete by id)
DELETE FROM Materials WHERE material_id = 999;

-- 7. Remove materials never referenced anywhere (optional cleanup)
DELETE m FROM Materials m
LEFT JOIN Craft_Types c ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
LEFT JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
WHERE c.craft_type_id IS NULL AND w.workshop_id IS NULL;

-- 8. Find materials with unusually long descriptions (possible data issues)
SELECT material_id, material_name, CHAR_LENGTH(description) AS desc_len FROM Materials WHERE CHAR_LENGTH(description) > 500;

-- 9. Materials cheaper than average of materials used in the same craft group
SELECT m.material_name, m.cost_per_unit
FROM Materials m
WHERE m.cost_per_unit < (
  SELECT AVG(m2.cost_per_unit)
  FROM Materials m2
  JOIN Craft_Types c ON LOWER(c.description) LIKE CONCAT('%', LOWER(m2.material_name), '%')
  WHERE LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
);

-- 10. Find materials used in multiple art forms (search description for keywords)
SELECT material_name, description
FROM Materials
WHERE description LIKE '%painting%' OR description LIKE '%weaving%' OR description LIKE '%embroidery%';

-- 11. Display top 5 most expensive materials for budgeting purposes
SELECT material_name, type, cost_per_unit
FROM Materials
ORDER BY cost_per_unit DESC
LIMIT 5;

-- 12. Get materials sourced from Rajasthan
SELECT material_name, source_location FROM Materials WHERE source_location LIKE '%Rajasthan%';

-- 13. Materials costing more than 100 per unit
SELECT material_name, cost_per_unit FROM Materials WHERE cost_per_unit > 100 ORDER BY cost_per_unit DESC;

-- 14. Count of available vs unavailable materials
SELECT availability_status, COUNT(*) AS cnt FROM Materials GROUP BY availability_status;

-- 15. Materials and crafts that use them (join with Craft_Types via keyword match in description)
SELECT m.material_name, c.craft_name
FROM Materials m
JOIN Craft_Types c ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%');

-- 16. Final report: material summary with counts and avg cost
SELECT type, COUNT(*) AS material_count, AVG(cost_per_unit) AS avg_cost_per_type FROM Materials GROUP BY type ORDER BY material_count DESC;

-- 17. Cheapest material per unit (top 1)
SELECT material_name, cost_per_unit FROM Materials ORDER BY cost_per_unit ASC LIMIT 1;

-- 18. Average cost per unit by type
SELECT type, AVG(cost_per_unit) AS avg_cost FROM Materials GROUP BY type;

-- 19. Materials with cost between 20 and 100
SELECT material_name, cost_per_unit FROM Materials WHERE cost_per_unit BETWEEN 20 AND 100;

-- 20. Materials NOT from Rajasthan or Gujarat
SELECT material_name, source_location FROM Materials WHERE source_location NOT LIKE '%Rajasthan%' AND source_location NOT LIKE '%Gujarat%';

-- 21. Materials whose name starts with 'B'
SELECT material_name FROM Materials WHERE material_name LIKE 'B%';

-- 22. List materials with non-null storage instructions
SELECT material_id, material_name, storage_conditions FROM Materials WHERE storage_conditions IS NOT NULL;

-- 23. Show workshops and primary material if mentioned in description (keyword match)
SELECT w.workshop_id, w.title, m.material_name
FROM Workshops w
LEFT JOIN Materials m ON LOWER(w.title) LIKE CONCAT('%', LOWER(m.material_name), '%')
   OR LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%');

-- 24. Show crafts that likely use a material by searching craft description
SELECT DISTINCT c.craft_name, m.material_name
FROM Craft_Types c
JOIN Materials m ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%');

-- 25. For each material, count number of workshops referencing it
SELECT m.material_name, COUNT(DISTINCT w.workshop_id) AS workshops_using
FROM Materials m
LEFT JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
GROUP BY m.material_name
ORDER BY workshops_using DESC;

-- 26. Average material cost for workshops in Rajasthan
SELECT AVG(m.cost_per_unit) AS avg_cost
FROM Materials m
JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
WHERE w.location LIKE '%Rajasthan%';

-- 27. Rank materials by cost within each type (expensive first)
SELECT material_id, material_name, type, cost_per_unit,
       RANK() OVER (PARTITION BY type ORDER BY cost_per_unit DESC) AS type_cost_rank
FROM Materials;

-- 28. Cumulative cost (running sum) ordered by material_id (useful for packing lists)
SELECT material_id, material_name, cost_per_unit,
       SUM(cost_per_unit) OVER (ORDER BY material_id) AS running_cost
FROM Materials;

-- 29. NTILE to create 3 price tiers
SELECT material_id, material_name, cost_per_unit,
       NTILE(3) OVER (ORDER BY cost_per_unit) AS price_tier
FROM Materials;

-- 30. Materials that are more expensive than the average material
SELECT material_name, cost_per_unit FROM Materials WHERE cost_per_unit > (SELECT AVG(cost_per_unit) FROM Materials);

-- 31. Top 3 materials most frequently mentioned across workshops
SELECT m.material_name, COUNT(*) AS mention_count
FROM Materials m
JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
GROUP BY m.material_name
ORDER BY mention_count DESC
LIMIT 3;

-- 32. Materials that are referenced in any workshop description (exists)
SELECT m.material_name
FROM Materials m
WHERE EXISTS (
   SELECT 1 FROM Workshops w WHERE LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
);

-- 33. Materials not used in any craft descriptions (anti-join via subquery)
SELECT material_name FROM Materials
WHERE material_name NOT IN (SELECT DISTINCT material_name FROM Materials m JOIN Craft_Types c ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%'));

-- 34. Cast cost_per_unit to integer for approximate reporting
SELECT material_name, CAST(cost_per_unit AS SIGNED) AS cost_integer FROM Materials;

-- 35. Display cost with currency formatting
SELECT material_name, CONCAT('₹', FORMAT(cost_per_unit,2)) AS cost_display FROM Materials;

-- 36. Insert sample JSON extra info for a material
UPDATE Materials SET extra = JSON_OBJECT('lead_time_days', 7, 'preferred_supplier', 'LocalCo') WHERE material_id = 1;

-- 37. Extract JSON field (lead time)
SELECT material_name, JSON_EXTRACT(extra, '$.lead_time_days') AS lead_days FROM Materials WHERE extra IS NOT NULL;

-- 38. Materials that appear in workshops where registrations exist (supply-demand)
SELECT DISTINCT m.material_name, w.title, COUNT(r.registration_id) AS participants
FROM Materials m
JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
LEFT JOIN Registrations r ON r.workshop_id = w.workshop_id
GROUP BY m.material_name, w.title;

-- 39. Add UNIQUE constraint on source_location + material_name (prevent duplicate sourcing entries)
ALTER TABLE Materials ADD CONSTRAINT uniq_material_source UNIQUE(material_name, source_location);

-- 40. Add default unit if null (alter column)
ALTER TABLE Materials MODIFY COLUMN unit VARCHAR(20) DEFAULT 'Unit';

-- 41. CTE: find materials and their types for reporting
WITH mat_summary AS (
  SELECT type, COUNT(*) AS count_by_type, AVG(cost_per_unit) AS avg_cost_by_type
  FROM Materials GROUP BY type
)
SELECT * FROM mat_summary ORDER BY avg_cost_by_type DESC;

-- 42. Recursive example: generate 5 procurement dates (every 7 days) from today
WITH RECURSIVE proc_dates AS (
  SELECT CURDATE() AS d
  UNION ALL
  SELECT DATE_ADD(d, INTERVAL 7 DAY) FROM proc_dates WHERE d < DATE_ADD(CURDATE(), INTERVAL 28 DAY)
)
SELECT * FROM proc_dates;

-- 43. Create a JSON column to hold supplier notes (if needed)
ALTER TABLE Materials ADD COLUMN extra JSON NULL;

-- 44. Find materials that are mentioned in both craft descriptions and workshop descriptions
SELECT material_name FROM Materials m
WHERE EXISTS (SELECT 1 FROM Craft_Types c WHERE LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%'))
  AND EXISTS (SELECT 1 FROM Workshops w WHERE LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%'));

-- 45. Find materials with null or missing critical info (data quality)
SELECT * FROM Materials WHERE material_name IS NULL OR cost_per_unit IS NULL OR unit IS NULL;

-- 46. Query the view
SELECT * FROM Expensive_Materials ORDER BY cost_per_unit DESC;

-- 47. Materials linked to crafts via keyword in craft description (practical but heuristic)
SELECT m.material_name, c.craft_name
FROM Materials m
JOIN Craft_Types c ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%');

-- 48. Materials used in workshops (via workshop descriptions)
SELECT DISTINCT m.material_name, w.title
FROM Materials m
JOIN Workshops w ON LOWER(w.description) LIKE CONCAT('%', LOWER(m.material_name), '%');

-- 49. Materials sourced from the same state as the workshop locations (substring match)
SELECT DISTINCT m.material_name, m.source_location
FROM Materials m
WHERE EXISTS (
  SELECT 1 FROM Workshops w WHERE w.location LIKE CONCAT('%', SUBSTRING_INDEX(m.source_location, ',', 1), '%')
);

-- 50. Top 5 most expensive materials overall
SELECT material_name, cost_per_unit,
       RANK() OVER (ORDER BY cost_per_unit DESC) AS global_rank
FROM Materials
ORDER BY cost_per_unit DESC
LIMIT 5;

-- 51. Running average cost ordered by material_id
SELECT material_id, material_name, cost_per_unit,
       AVG(cost_per_unit) OVER (ORDER BY material_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg_cost
FROM Materials;

-- 52. Combine materials used in a craft and average material cost for that craft
SELECT c.craft_name, AVG(m.cost_per_unit) AS avg_material_cost
FROM Craft_Types c
JOIN Materials m ON LOWER(c.description) LIKE CONCAT('%', LOWER(m.material_name), '%')
GROUP BY c.craft_name;

-- 53. Suggested reorder list: materials with low availability
SELECT material_id, material_name, availability_status FROM Materials WHERE availability_status IN ('Out of Stock','Low Stock');

-- 54. Cost impact: total cost to buy 10 units of each material
SELECT material_id, material_name, cost_per_unit, (cost_per_unit * 10) AS cost_for_10_units FROM Materials;

-- 55. Find all natural fibers or eco-friendly materials
SELECT material_name, type, environmental_impact
FROM Materials
WHERE type IN ('Natural Fiber', 'Organic Wax', 'Fiber') 
   OR environmental_impact LIKE '%eco-friendly%';

-- 56. Update the availability status of 'Silk Thread' to 'Out of Stock'
UPDATE Materials
SET availability_status = 'Out of Stock'
WHERE material_name = 'Silk Thread';

-- 57. Delete materials with very low demand (example: cost_per_unit < 20)
DELETE FROM Materials
WHERE cost_per_unit < 20;

-- 58. Count how many materials are of each type
SELECT type, COUNT(*) AS total_materials
FROM Materials
GROUP BY type;

-- 59. Show all materials that need cool or dry storage
SELECT material_name, storage_conditions
FROM Materials
WHERE storage_conditions LIKE '%cool%' OR storage_conditions LIKE '%dry%';

-- 60. Calculate average cost of all dyes (Natural Indigo, Natural Dyes, Clay Pigments)
SELECT AVG(cost_per_unit) AS avg_dye_cost
FROM Materials
WHERE type IN ('Dye', 'Color Pigment', 'Color');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 6: Tools
CREATE TABLE Tools (
    tool_id INT PRIMARY KEY, -- unique identifier for each tool
    tool_name VARCHAR(100) NOT NULL UNIQUE, -- tool_name must be unique and cannot be null
    used_in_craft VARCHAR(100),
    material_id INT,
    manufacturer VARCHAR(100),
    lifespan_years INT,
    cost DECIMAL(10,2),
    weight DECIMAL(5,2),
    dimensions VARCHAR(50),
    FOREIGN KEY (material_id) REFERENCES Materials(material_id)
);

-- Insert 20 records into Tools table
INSERT INTO Tools (tool_id, tool_name, used_in_craft, material_id,manufacturer, lifespan_years, cost, weight, dimensions) 
VALUES
(1, 'Bamboo Stylus', 'Rogan Art', 12, 'Nirona Craft Co.', 3, 50.00, 0.02, '15cm x 0.5cm'),
(2, 'Wooden Block', 'Block Printing', 16, 'Bagru Print Makers', 8, 120.00, 0.40, '10cm x 10cm'),
(3, 'Stone Chisel', 'Stone Sculpture', 9, 'Tamil Stone Tools', 5, 200.00, 0.80, '20cm x 2cm'),
(4, 'Weaving Knife', 'Bamboo Craft', 11, 'Assam Hand Tools', 4, 100.00, 0.30, '18cm x 1.5cm'),
(5, 'Lac Stick Heater', 'Channapatna Toys', 13, 'Toy Turner Tools', 6, 250.00, 0.60, '25cm x 3cm'),
(6, 'Wax Molding Spatula', 'Dhokra Art', 6, 'Tribal Forge Works', 5, 150.00, 0.25, '12cm x 1.2cm'),
(7, 'Terracotta Wheel', 'Pottery', 3, 'Bishnupur Clay Co.', 10, 800.00, 8.00, '50cm diameter'),
(8, 'Embroidery Needle', 'Zardozi Embroidery', 10, 'Lucknow Needle Co.', 2, 10.00, 0.01, '6cm x 0.1cm'),
(9, 'Silk Reeler', 'Banarasi Weaving', 8, 'Varanasi Loom Works', 7, 500.00, 1.50, '30cm x 5cm'),
(10, 'Mirror Inlay Tweezer', 'Lippan Kaam', 18, 'Kutch Design Tools', 3, 80.00, 0.05, '12cm x 1cm'),
(11, 'Cotton Roller', 'Kalamkari', 4, 'Andhra Print Tools', 5, 300.00, 1.20, '25cm x 4cm'),
(12, 'Pigment Mixer Bowl', 'Terracotta Painting', 19, 'Bengal Hand Mixers', 6, 180.00, 0.70, '15cm diameter'),
(13, 'Carving Blade', 'Kondapalli Toys', 17, 'Andhra Toy Blades', 4, 120.00, 0.15, '10cm x 1.5cm'),
(14, 'Gold Leaf Tweezers', 'Tanjore Painting', 14, 'Tanjore Art Tools', 3, 90.00, 0.03, '10cm x 0.5cm'),
(15, 'Block Hammer', 'Stone Sculpture', 9, 'Mahabalipuram Tools', 7, 300.00, 1.80, '25cm x 8cm'),
(16, 'Clay Cutter Wire', 'Pottery', 3, 'Kolkata Ceramics', 5, 50.00, 0.10, '30cm wire'),
(17, 'Brush (Natural Fiber)', 'Madhubani Painting', 1, 'Bihar Art Supplies', 2, 70.00, 0.03, '12cm x 0.8cm'),
(18, 'Block Alignment Pad', 'Block Printing', 16, 'Jaipur Hand Blocks', 6, 150.00, 0.60, '20cm x 20cm'),
(19, 'Zari Frame', 'Zardozi Embroidery', 10, 'UP Thread Works', 5, 400.00, 2.00, '40cm x 40cm'),
(20, 'Natural Dye Brush', 'Warli Art', 15, 'Maharashtra Tribal Co.', 3, 60.00, 0.04, '14cm x 1cm');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Tools;

-- to remove complete data from table
truncate table Tools;

-- to delete complete attributes and records 
drop table Tools;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for tool maintenance frequency
ALTER TABLE Tools ADD maintenance_frequency VARCHAR(50) DEFAULT 'Yearly';

-- 2. Rename column "dimensions" to "tool_dimensions"
ALTER TABLE Tools RENAME COLUMN dimensions TO tool_dimensions;

-- 3. Change datatype of lifespan_years to SMALLINT
ALTER TABLE Tools MODIFY lifespan_years SMALLINT;

-- 4. Drop the maintenance_frequency column
ALTER TABLE Tools DROP COLUMN maintenance_frequency;

-- 5. Create index on tool_name for faster search
CREATE INDEX idx_toolname ON Tools(tool_name);

-- 6. Create unique index on manufacturer
CREATE UNIQUE INDEX idx_manufacturer ON Tools(manufacturer);

-- 7. Drop index idx_toolname
DROP INDEX idx_toolname ON Tools;

-- 8. Add NOT NULL constraint on cost
ALTER TABLE Tools MODIFY cost DECIMAL(10,2) NOT NULL;

-- 9. Add CHECK constraint on lifespan_years
ALTER TABLE Tools ADD CONSTRAINT chk_lifespan CHECK (lifespan_years > 0);

-- 10. Drop constraint chk_lifespan
ALTER TABLE Tools DROP CONSTRAINT chk_lifespan;

-- 11. Uppercase tool names
SELECT UPPER(tool_name) FROM Tools;

-- 12. Update cost of Bamboo Stylus
UPDATE Tools SET cost = 55.00 WHERE tool_id = 1;

-- 13. Update manufacturer name for Wooden Block
UPDATE Tools SET manufacturer = 'Jaipur Block Co.' WHERE tool_name = 'Wooden Block';

-- 14. Delete a tool with low lifespan
DELETE FROM Tools WHERE lifespan_years < 3;

-- 15. Increase cost of all tools by 10%
UPDATE Tools SET cost = cost * 1.1;

-- 16. Mark all tools above ₹500 as premium
UPDATE Tools SET used_in_craft = CONCAT(used_in_craft, ' (Premium)') WHERE cost > 500;

-- 17. Show expensive tools and their source material location
SELECT t.tool_name, t.cost, m.source_location
FROM Tools t JOIN Materials m ON t.material_id = m.material_id
WHERE t.cost > 300;

-- 18. Tools with eco-friendly materials
SELECT t.tool_name, m.environmental_impact
FROM Tools t JOIN Materials m ON t.material_id = m.material_id
WHERE m.environmental_impact LIKE '%eco-friendly%';

-- 19. Tools and their cost per unit of material
SELECT t.tool_name, t.cost, m.cost_per_unit
FROM Tools t JOIN Materials m ON t.material_id = m.material_id;

-- 20. Find tools manufactured in the same state as their materials
SELECT t.tool_name, t.manufacturer, m.source_location
FROM Tools t JOIN Materials m ON t.material_id = m.material_id
WHERE m.source_location LIKE CONCAT('%', SUBSTRING_INDEX(t.manufacturer, ' ', -1), '%');

-- 21. Show all tools costing more than ₹200
SELECT tool_name, cost FROM Tools WHERE cost > 200;

-- 22. List tools with lifespan over 5 years
SELECT tool_name, lifespan_years FROM Tools WHERE lifespan_years > 5;

-- 23. Fetch the cheapest tool
SELECT tool_name, cost FROM Tools ORDER BY cost ASC LIMIT 1;

-- 24. Fetch the most expensive tool
SELECT tool_name, cost FROM Tools ORDER BY cost DESC LIMIT 1;

-- 25. Count how many tools are used in pottery
SELECT COUNT(*) FROM Tools WHERE used_in_craft LIKE '%Pottery%';

-- 26. Find total investment in tools
SELECT SUM(cost) AS total_cost FROM Tools;

-- 27. Average lifespan of tools
SELECT AVG(lifespan_years) AS avg_lifespan FROM Tools;

-- 28. Tools costing between 100 and 500
SELECT tool_name, cost FROM Tools WHERE cost BETWEEN 100 AND 500;

-- 29. Tools not linked with any material (check orphan tools)
SELECT tool_name FROM Tools WHERE material_id IS NULL;

-- 30. Tools starting with letter 'B'
SELECT * FROM Tools WHERE tool_name LIKE 'B%';

-- 31. Show tool names with their material names
SELECT t.tool_name, m.material_name
FROM Tools t JOIN Materials m ON t.material_id = m.material_id;

-- 32. Trigger to log cost updates
CREATE TRIGGER trg_tool_cost_update
BEFORE UPDATE ON Tools
FOR EACH ROW
INSERT INTO Tool_Audit(tool_id, old_cost, new_cost)
VALUES (OLD.tool_id, OLD.cost, NEW.cost);

-- 33. Add DEFAULT for weight
ALTER TABLE Tools ALTER weight SET DEFAULT 0.5;

-- 34. Add foreign key with cascade delete
ALTER TABLE Tools ADD CONSTRAINT fk_material FOREIGN KEY (material_id)
REFERENCES Materials(material_id) ON DELETE CASCADE;

-- 35. Drop foreign key constraint
ALTER TABLE Tools DROP FOREIGN KEY fk_material;

-- 36. Check constraint for cost
ALTER TABLE Tools ADD CONSTRAINT chk_cost CHECK (cost > 0);

-- 37. Length of each tool name
SELECT tool_name, LENGTH(tool_name) AS name_length FROM Tools;

-- 38. Round off tool costs
SELECT tool_name, ROUND(cost,0) FROM Tools;

-- 39. Extract first word from manufacturer
SELECT manufacturer, SUBSTRING_INDEX(manufacturer,' ',1) AS brand FROM Tools;

-- 40. Replace 'Block' with 'Stamp' in tool names
SELECT REPLACE(tool_name,'Block','Stamp') FROM Tools;

-- 41. Rank tools by cost
SELECT tool_name, cost, RANK() OVER (ORDER BY cost DESC) AS cost_rank FROM Tools;

-- 42. Dense rank tools by lifespan
SELECT tool_name, lifespan_years, DENSE_RANK() OVER (ORDER BY lifespan_years DESC) AS life_rank FROM Tools;

-- 43. Running total of costs
SELECT tool_name, cost, SUM(cost) OVER (ORDER BY tool_id) AS running_total FROM Tools;

-- 44. Average tool cost partitioned by material
SELECT material_id, tool_name, cost, AVG(cost) OVER (PARTITION BY material_id) AS avg_cost_by_material FROM Tools;

-- 45. Find tool with maximum cost in each craft type
SELECT used_in_craft, tool_name, cost,
       MAX(cost) OVER (PARTITION BY used_in_craft) AS max_cost
FROM Tools;

-- 46. Tools with cost > 200 AND lifespan > 5
SELECT * FROM Tools WHERE cost > 200 AND lifespan_years > 5;

-- 47. Tools with cost < 100 OR weight < 0.1
SELECT * FROM Tools WHERE cost < 100 OR weight < 0.1;

-- 48. Tools NOT used in Embroidery
SELECT * FROM Tools WHERE used_in_craft NOT LIKE '%Embroidery%';

-- 50. Use IN operator for multiple crafts
SELECT * FROM Tools WHERE used_in_craft IN ('Pottery','Block Printing');

-- 51. Show datatype of tool_name (for reference)
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tools';

-- 52. Check if cost column is numeric
SELECT tool_name, cost, (cost + 10) AS test_add FROM Tools;

-- 53. Concatenate string and number
SELECT tool_name, CONCAT('₹', cost) AS cost_with_symbol FROM Tools;

-- 54. GROUP BY craft type
SELECT used_in_craft, COUNT(*) FROM Tools GROUP BY used_in_craft;

-- 55. HAVING clause to filter only crafts with > 1 tool
SELECT used_in_craft, COUNT(*) 
FROM Tools GROUP BY used_in_craft HAVING COUNT(*) > 1;

-- 56. ORDER BY cost descending
SELECT tool_name, cost FROM Tools ORDER BY cost DESC;

-- 57. Find tools with cost same as any tool used in Pottery
SELECT tool_name, cost FROM Tools
WHERE cost IN (SELECT cost FROM Tools WHERE used_in_craft LIKE '%Pottery%');

-- 58. DISTINCT manufacturers
SELECT DISTINCT manufacturer FROM Tools;

-- 59. Find tools costlier than average cost
SELECT tool_name, cost FROM Tools WHERE cost > (SELECT AVG(cost) FROM Tools);

-- 60. Find tools linked to the most expensive material
SELECT tool_name FROM Tools
WHERE material_id = (SELECT material_id FROM Materials ORDER BY cost_per_unit DESC LIMIT 1);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 7: Artworks
CREATE TABLE Artworks (
    artwork_id INT PRIMARY KEY, -- unique identifier for each artwork
    title VARCHAR(100) NOT NULL,
    artisan_id INT,
    craft_type_id INT,
    creation_date DATE,
    price DECIMAL(10,2),
    material_used VARCHAR(100),
    tool_used VARCHAR(100),
    status VARCHAR(20) CHECK (status IN ('Available', 'Sold')),
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id),
    FOREIGN KEY (craft_type_id) REFERENCES Craft_Types(craft_type_id)
);

-- Insert 20 records into Artworks table
INSERT INTO Artworks (artwork_id, title, artisan_id, craft_type_id,creation_date, price, material_used, tool_used, status)
 VALUES
(1, 'Tree of Life Madhubani', 1, 1, '2025-06-15', 1200.00, 'Handmade Paper', 'Brush (Natural Fiber)', 'Available'),
(2, 'Tribal Warli Panel', 2, 2, '2025-05-10', 950.00, 'Natural Dye on Canvas', 'Natural Dye Brush', 'Sold'),
(3, 'Krishna Pattachitra Scroll', 3, 3, '2025-04-20', 1500.00, 'Cloth, Natural Pigments', 'Pigment Mixer Bowl', 'Available'),
(4, 'Elephant Block Print Fabric', 4, 4, '2025-05-30', 1100.00, 'Cotton Fabric', 'Wooden Block', 'Sold'),
(5, 'Dancing Shiva Sculpture', 5, 5, '2025-06-01', 3200.00, 'Granite', 'Stone Chisel', 'Available'),
(6, 'Dhokra Nandi Bull', 6, 6, '2025-03-25', 1800.00, 'Brass, Beeswax', 'Wax Molding Spatula', 'Sold'),
(7, 'Terracotta Ganesha Idol', 7, 7, '2025-04-02', 850.00, 'Terracotta Clay', 'Clay Cutter Wire', 'Available'),
(8, 'Assam Bamboo Tray', 8, 8, '2025-06-20', 700.00, 'Cane Strips', 'Weaving Knife', 'Sold'),
(9, 'Phad Story Scroll', 9, 9, '2025-03-10', 1400.00, 'Canvas', 'Brush (Natural Fiber)', 'Available'),
(10, 'Lacquered Elephant Toy', 10, 10, '2025-06-05', 950.00, 'Ivory Wood, Lac', 'Lac Stick Heater', 'Available'),
(11, 'Kalamkari Floral Wall Art', 11, 11, '2025-06-18', 1550.00, 'Cotton Fabric', 'Cotton Roller', 'Sold'),
(12, 'Banarasi Bridal Saree', 12, 12, '2025-05-01', 4500.00, 'Silk, Zari Thread', 'Silk Reeler', 'Available'),
(13, 'Tanjore Gajalakshmi Painting', 13, 13, '2025-05-15', 2600.00, 'Canvas, Gold Leaf', 'Gold Leaf Tweezers', 'Available'),
(14, 'Zardozi Peacock Frame', 14, 14, '2025-06-12', 3500.00, 'Fabric, Zari Thread', 'Embroidery Needle', 'Sold'),
(15, 'Blue Pottery Vase', 15, 15, '2025-04-18', 1750.00, 'Multani Mitti, Glaze', 'Pigment Mixer Bowl', 'Available'),
(16, 'Mirror Mural Lippan Art', 16, 16, '2025-06-08', 1100.00, 'Clay and Mirrors', 'Mirror Inlay Tweezer', 'Available'),
(17, 'Bidri Hookah Base', 17, 17, '2025-03-30', 2950.00, 'Zinc Alloy', 'Carving Blade', 'Sold'),
(18, 'Pichwai Krishna Cow Art', 18, 18, '2025-05-22', 2200.00, 'Cloth, Pigments', 'Brush (Natural Fiber)', 'Available'),
(19, 'Kondapalli Hanuman Toy', 19, 19, '2025-04-26', 950.00, 'Softwood', 'Carving Blade', 'Sold'),
(20, 'Rogan Tree Wall Hanging', 20, 20, '2025-06-30', 2400.00, 'Cotton Fabric, Castor Paste', 'Bamboo Stylus', 'Available');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Artworks;

-- to remove complete data from table
truncate table Artworks;

-- to delete complete attributes and records 
drop table Artworks;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for artwork dimensions
ALTER TABLE Artworks ADD dimensions VARCHAR(50);

-- 2. Rename the column material_used to primary_material
ALTER TABLE Artworks RENAME COLUMN material_used TO primary_material;

-- 3. Drop the column tool_used
ALTER TABLE Artworks DROP COLUMN tool_used;

-- 4. Modify price column to hold larger values
ALTER TABLE Artworks MODIFY price DECIMAL(12,2);

-- 5. Create index on artisan_id for faster searching
CREATE INDEX idx_artisan_id ON Artworks(artisan_id);

-- 6. Add NOT NULL constraint to title
ALTER TABLE Artworks MODIFY title VARCHAR(100) NOT NULL;

-- 7. Update artwork price
UPDATE Artworks SET price = price + 500 WHERE artwork_id = 5;

-- 8. Mark an artwork as sold
UPDATE Artworks SET status = 'Sold' WHERE artwork_id = 1;

-- 9. Delete artworks priced below 800
DELETE FROM Artworks WHERE price < 800;

-- 10. Bulk update prices for Tanjore paintings
UPDATE Artworks SET price = price * 1.1 WHERE title LIKE '%Tanjore%';

-- 11. Give discount on sold artworks
UPDATE Artworks SET price = price * 0.9 WHERE status = 'Sold';

-- 12. Change material for Warli artworks
UPDATE Artworks SET primary_material = 'Cow Dung Base' WHERE title LIKE '%Warli%';

-- 13. Delete artwork by artisan
DELETE FROM Artworks WHERE artisan_id = 19;

-- 14. Update artworks with NULL materials
UPDATE Artworks SET primary_material = 'Unknown' WHERE primary_material IS NULL;

-- 15. List all available artworks
SELECT * FROM Artworks WHERE status = 'Available';

-- 16. Count artworks by status
SELECT status, COUNT(*) FROM Artworks GROUP BY status;

-- 17. Get artworks created after May 2025
SELECT title, creation_date FROM Artworks WHERE creation_date > '2025-05-01';

-- 18. Average artwork price
SELECT AVG(price) FROM Artworks;

-- 19. Show artworks between 1000 and 2000
SELECT title, price FROM Artworks WHERE price BETWEEN 1000 AND 2000;

-- 20. Order artworks by price descending
SELECT title, price FROM Artworks ORDER BY price DESC;

-- 21. Find artworks whose title contains 'Toy'
SELECT * FROM Artworks WHERE title LIKE '%Toy%';

-- 22. Find top 5 artworks by price
SELECT * FROM Artworks ORDER BY price DESC LIMIT 5;

-- 23. Count artworks by artisan
SELECT artisan_id, COUNT(*) FROM Artworks GROUP BY artisan_id;

-- 24. Trigger before insert
CREATE TRIGGER before_artwork_insert
BEFORE INSERT ON Artworks
FOR EACH ROW
SET NEW.status = IFNULL(NEW.status, 'Available');

-- 25. Trigger after update
CREATE TRIGGER after_artwork_update
AFTER UPDATE ON Artworks
FOR EACH ROW
INSERT INTO Audit_Log(action, table_name, change_time)
VALUES('UPDATE', 'Artworks', NOW());

-- 26. Trigger log deletion
CREATE TRIGGER after_artwork_delete
AFTER DELETE ON Artworks
FOR EACH ROW
INSERT INTO Audit_Log(action, table_name, change_time)
VALUES('DELETE', 'Artworks', NOW());

-- 27. Trigger auto-capitalize titles
CREATE TRIGGER capitalize_title
BEFORE INSERT ON Artworks
FOR EACH ROW
SET NEW.title = CONCAT(UPPER(LEFT(NEW.title,1)), SUBSTRING(NEW.title,2));

-- 28. DISTINCT clause
SELECT DISTINCT status FROM Artworks;

-- 29. GROUP BY clause
SELECT artisan_id, COUNT(*) FROM Artworks GROUP BY artisan_id;

-- 30. LIMIT clause
SELECT * FROM Artworks LIMIT 3;

-- 31. ORDER BY clause
SELECT * FROM Artworks ORDER BY creation_date DESC;

-- 32. Add unique constraint on title
ALTER TABLE Artworks ADD CONSTRAINT uq_title UNIQUE(title);

-- 33. Drop unique constraint
ALTER TABLE Artworks DROP INDEX uq_title;

-- 34. Add check constraint on price
ALTER TABLE Artworks ADD CONSTRAINT chk_price CHECK (price > 0);

-- 35. Add foreign key constraint for artisan
ALTER TABLE Artworks ADD CONSTRAINT fk_artisan FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id);

-- 36. Add default value for status
ALTER TABLE Artworks ALTER status SET DEFAULT 'Available';

-- 37. Convert creation_date to string
SELECT title, DATE_FORMAT(creation_date, '%d-%m-%Y') FROM Artworks;

-- 38. Boolean expression
SELECT title, (status='Sold') AS is_sold FROM Artworks;

-- 39. Extract year from date
SELECT title, YEAR(creation_date) FROM Artworks;

-- 40. Join artworks with craft types
SELECT a.title, c.craft_name 
FROM Artworks a 
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id;

-- 41. Count artworks per craft type
SELECT c.craft_name, COUNT(a.artwork_id) 
FROM Craft_Types c 
LEFT JOIN Artworks a ON c.craft_type_id = a.craft_type_id 
GROUP BY c.craft_name;

-- 42. Join 3 tables: Artworks, Artisans, Craft_Types
SELECT a.title, c.craft_name 
FROM Artworks a
JOIN Artisans ar ON a.artisan_id = ar.artisan_id
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id;

-- 43. Find total revenue from sold artworks
SELECT SUM(price) FROM Artworks WHERE status = 'Sold';

-- 44. Round price values
SELECT title, ROUND(price,0) FROM Artworks;

-- 45. Uppercase all artwork titles
SELECT UPPER(title) FROM Artworks;

-- 46. Find length of each artwork title
SELECT title, LENGTH(title) FROM Artworks;

-- 47. Use decimal math
SELECT title, price * 1.05 AS price_after_tax FROM Artworks;

-- 48. Rank artworks by price
SELECT title, price, RANK() OVER (ORDER BY price DESC) AS rank_position 
FROM Artworks;

-- 49. Cast price as integer
SELECT title, CAST(price AS SIGNED) FROM Artworks;

-- 50. Row number for each artwork
SELECT title, ROW_NUMBER() OVER (ORDER BY creation_date) AS row_num 
FROM Artworks;

-- 51. Moving average price
SELECT title, price, AVG(price) OVER (ORDER BY creation_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg 
FROM Artworks;

-- 52. Partition artworks by status and rank by price
SELECT title, status, RANK() OVER (PARTITION BY status ORDER BY price DESC) AS rank_in_status 
FROM Artworks;

-- 53. Artworks priced > 2000
SELECT * FROM Artworks WHERE price > 2000;

-- 54. Artworks either Available or cost > 3000
SELECT * FROM Artworks WHERE status = 'Available' OR price > 3000;

-- 55. NOT operator example
SELECT * FROM Artworks WHERE NOT status = 'Sold';

-- 56. IN operator
SELECT * FROM Artworks WHERE artisan_id IN (1,2,3);

-- 57. BETWEEN operator
SELECT * FROM Artworks WHERE creation_date BETWEEN '2025-05-01' AND '2025-06-30';

-- 58. Find artworks priced higher than the average artwork price
SELECT title, price
FROM Artworks
WHERE price > (SELECT AVG(price) FROM Artworks);

-- 59. Get the artisan_id of the most expensive artwork
SELECT artisan_id, title, price
FROM Artworks
WHERE price = (SELECT MAX(price) FROM Artworks);

-- 60. List artworks created after the earliest creation date in the table
SELECT title, creation_date
FROM Artworks
WHERE creation_date > (SELECT MIN(creation_date) FROM Artworks);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 8: Sales
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY, -- unique identifier for each sale
    artwork_id INT,
    buyer_name VARCHAR(100),
    sale_date DATE,
    sale_price DECIMAL(10,2),
    payment_method VARCHAR(50),
    delivery_address TEXT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id)
);

-- Insert 20 records into Sales table
INSERT INTO Sales (sale_id, artwork_id, buyer_name, sale_date,sale_price, payment_method, delivery_address,contact_number, email)
 VALUES
(1, 2, 'Aarti Sharma', '2025-06-10', 950.00, 'UPI', 'B-15, Sector 12, Noida, Uttar Pradesh', '9876543210', 'aarti.sharma@example.com'),
(2, 4, 'Ravi Mehta', '2025-06-12', 1100.00, 'Credit Card', 'Flat 3B, Andheri East, Mumbai, Maharashtra', '9123456789', 'ravi.mehta@example.com'),
(3, 6, 'Nikita Reddy', '2025-06-15', 1800.00, 'Net Banking', 'Plot 22, Jubilee Hills, Hyderabad, Telangana', '9988776655', 'nikita.reddy@example.com'),
(4, 8, 'Kunal Deshmukh', '2025-06-18', 700.00, 'Cash on Delivery', 'Shivaji Nagar, Pune, Maharashtra', '9823456781', 'kunal.deshmukh@example.com'),
(5, 11, 'Simran Kaur', '2025-06-20', 1550.00, 'UPI', 'Sector 17, Chandigarh', '9786543210', 'simran.kaur@example.com'),
(6, 14, 'Mohit Verma', '2025-06-21', 3500.00, 'Credit Card', 'MIG 101, Lajpat Nagar, New Delhi', '9564783210', 'mohit.verma@example.com'),
(7, 17, 'Ritika Joshi', '2025-06-22', 2950.00, 'Debit Card', 'Civil Lines, Allahabad, Uttar Pradesh', '9678452136', 'ritika.joshi@example.com'),
(8, 19, 'Arun Kumar', '2025-06-24', 950.00, 'UPI', 'Old City, Vijayawada, Andhra Pradesh', '9890012345', 'arun.kumar@example.com'),
(9, 20, 'Meena Nair', '2025-06-26', 2400.00, 'UPI', 'MG Road, Kochi, Kerala', '9745123680', 'meena.nair@example.com'),
(10, 13, 'Priya Singh', '2025-06-27', 2600.00, 'Credit Card', 'Park Street, Kolkata, West Bengal', '9032145678', 'priya.singh@example.com'),
(11, 10, 'Deepak Mishra', '2025-06-29', 950.00, 'UPI', 'Station Road, Kanpur, Uttar Pradesh', '9900123456', 'deepak.mishra@example.com'),
(12, 5, 'Vaishnavi Rao', '2025-07-01', 3200.00, 'Net Banking', 'Rajajinagar, Bengaluru, Karnataka', '9812233445', 'vaishnavi.rao@example.com'),
(13, 3, 'Suresh Patil', '2025-07-02', 1500.00, 'UPI', 'Shivaji Chowk, Nashik, Maharashtra', '8877665544', 'suresh.patil@example.com'),
(14, 7, 'Anjali Gupta', '2025-07-03', 850.00, 'Cash on Delivery', 'A-24, Indira Nagar, Lucknow', '9123344556', 'anjali.gupta@example.com'),
(15, 9, 'Farhan Shaikh', '2025-07-03', 1400.00, 'Debit Card', 'Charminar, Hyderabad, Telangana', '9098765432', 'farhan.shaikh@example.com'),
(16, 16, 'Rajeev Menon', '2025-07-04', 1100.00, 'UPI', 'Panampilly Nagar, Ernakulam, Kerala', '9871234567', 'rajeev.menon@example.com'),
(17, 18, 'Shalini Iyer', '2025-07-04', 2200.00, 'Credit Card', 'Adyar, Chennai, Tamil Nadu', '9678234512', 'shalini.iyer@example.com'),
(18, 12, 'Kavita Chawla', '2025-07-05', 4500.00, 'UPI', 'Model Town, Ludhiana, Punjab', '9900998877', 'kavita.chawla@example.com'),
(19, 15, 'Ankit Jain', '2025-07-05', 1750.00, 'Cash on Delivery', 'Ashok Nagar, Bhopal, MP', '9898765432', 'ankit.jain@example.com'),
(20, 1, 'Pooja Desai', '2025-07-06', 1200.00, 'UPI', 'Navrangpura, Ahmedabad, Gujarat', '9823456700', 'pooja.desai@example.com');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Sales;

-- to remove complete data from table
truncate table Sales;

-- to delete complete attributes and records 
drop table Sales;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a column for GST applied on each sale
ALTER TABLE Sales ADD gst_percent DECIMAL(5,2) DEFAULT 18.00;

-- 2. Rename column buyer_name → customer_name
ALTER TABLE Sales RENAME COLUMN buyer_name TO customer_name;

-- 3. Increase email column size to support longer domains
ALTER TABLE Sales MODIFY email VARCHAR(150);

-- 4. Drop unnecessary column (if needed)
ALTER TABLE Sales DROP COLUMN contact_number;

-- 5. Create index for fast searching by buyer email
CREATE INDEX idx_email ON Sales(email);

-- 6. Add NOT NULL constraint on sale_date
ALTER TABLE Sales MODIFY sale_date DATE NOT NULL;

-- 7. Drop index idx_email
DROP INDEX idx_email ON Sales;

-- 8. Add unique constraint for (artwork_id, sale_date) to prevent duplicate sales
ALTER TABLE Sales ADD CONSTRAINT uq_sale UNIQUE (artwork_id, sale_date);

-- 9. LIMIT first 5 sales
SELECT * FROM Sales LIMIT 5;

-- 10. ORDER BY sale_price DESC
SELECT * FROM Sales ORDER BY sale_price DESC;

-- 11. Add NOT NULL constraint on email
ALTER TABLE Sales MODIFY email VARCHAR(150) NOT NULL;

-- 12. Add default payment method as UPI
ALTER TABLE Sales ALTER payment_method SET DEFAULT 'UPI';

-- 13. Add check constraint on sale_date
ALTER TABLE Sales ADD CONSTRAINT chk_date CHECK (sale_date >= '2025-01-01');

-- 14. Update customer address
UPDATE Sales SET delivery_address = 'DLF Phase 3, Gurgaon, Haryana' WHERE customer_name = 'Aarti Sharma';

-- 15. Change payment method for a specific buyer
UPDATE Sales SET payment_method = 'Net Banking' WHERE sale_id = 4;

-- 16. Delete all sales paid via Cash on Delivery
DELETE FROM Sales WHERE payment_method = 'Cash on Delivery';

-- 17. Increase sale_price for July 2025 sales by 10%
UPDATE Sales SET sale_price = sale_price * 1.10 WHERE MONTH(sale_date) = 7;

-- 18. Delete sale by customer name
DELETE FROM Sales WHERE customer_name = 'Ankit Jain';

-- 19. Set default GST for missing entries
UPDATE Sales SET gst_percent = 18.00 WHERE gst_percent IS NULL;

-- 20. Mark high-value sales for reporting
UPDATE Sales SET payment_method = CONCAT(payment_method, ' (High Value)') WHERE sale_price > 4000;

-- 21. List all sales above ₹2000
SELECT * FROM Sales WHERE sale_price > 2000;

-- 22. Find top 3 highest sales
SELECT * FROM Sales ORDER BY sale_price DESC LIMIT 3;

-- 23. Count number of sales by payment method
SELECT payment_method, COUNT(*) FROM Sales GROUP BY payment_method;

-- 24. Find total revenue from UPI payments
SELECT SUM(sale_price) AS total_upi_revenue FROM Sales WHERE payment_method = 'UPI';

-- 25. Average sale price for June 2025
SELECT AVG(sale_price) FROM Sales WHERE MONTH(sale_date) = 6;

-- 26. Find all customers who bought more than once
SELECT customer_name, COUNT(*) FROM Sales GROUP BY customer_name HAVING COUNT(*) > 1;

-- 27. Get earliest and latest sale dates
SELECT MIN(sale_date) AS first_sale, MAX(sale_date) AS last_sale FROM Sales;

-- 28. Cast price to INT
SELECT sale_id, CAST(sale_price AS SIGNED) FROM Sales;

-- 29. Format date
SELECT DATE_FORMAT(sale_date, '%d-%m-%Y') FROM Sales;

-- 30. Boolean flag for expensive sales
SELECT sale_id, (sale_price > 3000) AS high_value FROM Sales;

-- 31. Extract month
SELECT MONTHNAME(sale_date) FROM Sales;

-- 32. Concatenate buyer and email
SELECT CONCAT(customer_name, ' <', email, '>') AS buyer_contact FROM Sales;

-- 33. Auto-apply GST if not entered
CREATE TRIGGER set_gst BEFORE INSERT ON Sales
FOR EACH ROW
SET NEW.gst_percent = IFNULL(NEW.gst_percent, 18.00);

-- 34. Audit after insert
CREATE TRIGGER log_sale AFTER INSERT ON Sales
FOR EACH ROW
INSERT INTO Audit_Log(action, table_name, change_time) VALUES('INSERT','Sales',NOW());

-- 35. Auto-format customer name
CREATE TRIGGER format_name BEFORE INSERT ON Sales
FOR EACH ROW
SET NEW.customer_name = CONCAT(UPPER(LEFT(NEW.customer_name,1)), SUBSTRING(NEW.customer_name,2));

-- 36. Audit deletion
CREATE TRIGGER log_delete AFTER DELETE ON Sales
FOR EACH ROW
INSERT INTO Audit_Log(action, table_name, change_time) VALUES('DELETE','Sales',NOW());

-- 37. DISTINCT payment methods
SELECT DISTINCT payment_method FROM Sales;

-- 38. GROUP BY city
SELECT SUBSTRING_INDEX(delivery_address, ',', -1) AS city, COUNT(*) FROM Sales GROUP BY city;

-- 39. HAVING total sales > 1
SELECT customer_name, COUNT(*) FROM Sales GROUP BY customer_name HAVING COUNT(*) > 1;

-- 40. Show buyers and their cities (from address)
SELECT customer_name, SUBSTRING_INDEX(delivery_address, ',', -1) AS city FROM Sales;

-- 41. Find artworks sold in July 2025
SELECT artwork_id, customer_name FROM Sales WHERE MONTH(sale_date) = 7;

-- 42. Join Sales with Artworks to show what was sold
SELECT s.customer_name, a.title, s.sale_price 
FROM Sales s 
JOIN Artworks a ON s.artwork_id = a.artwork_id;

-- 43. Join Sales with Artisans (who made the artwork)
SELECT s.customer_name, a.title 
FROM Sales s
JOIN Artworks a ON s.artwork_id = a.artwork_id
JOIN Artisans ar ON a.artisan_id = ar.artisan_id;

-- 44. Join Sales with Craft_Types to show craft details
SELECT s.sale_id, a.title, c.craft_name 
FROM Sales s
JOIN Artworks a ON s.artwork_id = a.artwork_id
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id;

-- 45. Find customers who bought pottery items
SELECT s.customer_name, a.title 
FROM Sales s
JOIN Artworks a ON s.artwork_id = a.artwork_id
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id
WHERE c.craft_name = 'Pottery';

-- 46. Round sale price
SELECT ROUND(sale_price,0) FROM Sales;

-- 47. Extract year of sale
SELECT YEAR(sale_date) AS sale_year, COUNT(*) FROM Sales GROUP BY sale_year;

-- 48. Uppercase buyer names
SELECT UPPER(customer_name) FROM Sales;

-- 49. Length of customer names
SELECT customer_name, LENGTH(customer_name) FROM Sales;

-- 50. Calculate GST amount
SELECT sale_id, sale_price, (sale_price * gst_percent / 100) AS gst_amount FROM Sales;

-- 51. Rank sales by price
SELECT customer_name, sale_price, RANK() OVER (ORDER BY sale_price DESC) AS rank_price FROM Sales;

-- 52. Dense rank for sales
SELECT customer_name, sale_price, DENSE_RANK() OVER (ORDER BY sale_price DESC) FROM Sales;

-- 53. Row numbers by sale date
SELECT sale_id, customer_name, ROW_NUMBER() OVER (ORDER BY sale_date) FROM Sales;

-- 54. Moving average of sales price
SELECT sale_id, sale_price, AVG(sale_price) OVER (ORDER BY sale_date ROWS 2 PRECEDING) FROM Sales;

-- 55. Partition sales by payment method and rank
SELECT customer_name, payment_method, sale_price, RANK() OVER (PARTITION BY payment_method ORDER BY sale_price DESC) FROM Sales;

-- 56. Sales above ₹2000
SELECT * FROM Sales WHERE sale_price > 2000;

-- 57. Sales in June OR with UPI
SELECT * FROM Sales WHERE MONTH(sale_date)=6 OR payment_method='UPI';

-- 58. NOT operator example
SELECT * FROM Sales WHERE NOT payment_method='Cash on Delivery';

-- 59. IN operator
SELECT * FROM Sales WHERE payment_method IN ('UPI','Credit Card');

-- 60. BETWEEN operator
SELECT * FROM Sales WHERE sale_price BETWEEN 1000 AND 3000;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 9: Exhibitions
CREATE TABLE Exhibitions (
    exhibition_id INT PRIMARY KEY, -- unique identifier for wach Exibition
    title VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    organizer VARCHAR(100),
    theme VARCHAR(100),
    expected_visitors INT,
    entry_fee DECIMAL(10,2),
    description TEXT
);

-- Insert 20 records into Exhibitions table
INSERT INTO Exhibitions (exhibition_id, title, location, start_date, end_date,organizer, theme, expected_visitors, entry_fee, description)
 VALUES
(1, 'Kala Mela 2025', 'Pragati Maidan, Delhi', '2025-08-01', '2025-08-10', 'Lalit Kala Akademi', 'Folk and Tribal Arts', 15000, 50.00, 'A vibrant celebration of tribal and rural artists from across India.'),
(2, 'Lok Kala Utsav', 'Bhopal Haat, MP', '2025-09-05', '2025-09-12', 'Tribal Museum Bhopal', 'Indigenous Crafts', 10000, 30.00, 'Showcasing Gond, Bhil, and Baiga crafts with live demonstrations.'),
(3, 'Kutch Karigar Haat', 'Bhuj, Gujarat', '2025-11-15', '2025-11-22', 'Khamir Foundation', 'Handloom and Embroidery', 8000, 20.00, 'Focus on Rabari embroidery and Ajrakh printing traditions.'),
(4, 'Rajasthan Craft Week', 'Jaipur, Rajasthan', '2025-12-01', '2025-12-07', 'Craft Council of Rajasthan', 'Block Printing & Blue Pottery', 12000, 40.00, 'Exhibition of Bagru, Sanganeri prints and Jaipur Blue Pottery.'),
(5, 'Eastern Heritage Expo', 'Kolkata, WB', '2025-10-10', '2025-10-17', 'Banglanatak.com', 'Pattachitra and Terracotta', 9500, 25.00, 'Traditional Pattachitra scrolls, Bankura horses, and Bishnupur terracotta.'),
(6, 'Southern Craft Carnival', 'Chennai, TN', '2025-11-01', '2025-11-08', 'Kalakshetra Foundation', 'Temple Arts and Textiles', 11000, 35.00, 'Kalamkari, Tanjore paintings, and handwoven Kanjeevaram silks.'),
(7, 'Handmade India Fair', 'Mumbai, Maharashtra', '2025-10-01', '2025-10-07', 'Dastkari Haat Samiti', 'Nationwide Artisan Showcase', 20000, 60.00, 'Pan-India crafts exhibition with live craft stations.'),
(8, 'Virasat 2025', 'Lucknow, UP', '2025-12-10', '2025-12-17', 'Sanskriti Foundation', 'Zardozi and Chikankari', 8500, 20.00, 'Exquisite Lucknawi embroidery and royal textile traditions.'),
(9, 'Crafts of the North East', 'Guwahati, Assam', '2025-09-20', '2025-09-27', 'NEHHDC', 'Bamboo and Weaving', 7000, 25.00, 'Bamboo crafts, cane work, and tribal weaving from Northeast states.'),
(10, 'Warli Vishwa Utsav', 'Thane, Maharashtra', '2025-08-25', '2025-08-31', 'Adivasi Kala Sangh', 'Warli Art Revival', 5000, 10.00, 'Traditional Warli art panels, workshops by tribal artisans.'),
(11, 'Silken Threads Fest', 'Varanasi, UP', '2025-10-15', '2025-10-22', 'Banarasi Heritage Cell', 'Banarasi Weaves', 14000, 50.00, 'Showcasing silk weaving traditions and handloom innovations.'),
(12, 'Dhokra Mahotsav', 'Raipur, Chhattisgarh', '2025-11-10', '2025-11-16', 'Tribal Cooperative Society', 'Metal Casting Art', 6000, 15.00, 'Ancient Dhokra metal craft with live casting sessions.'),
(13, 'Bidri Craft Show', 'Bidar, Karnataka', '2025-12-05', '2025-12-11', 'Bidri Artisans Guild', 'Metal Inlay Work', 4000, 10.00, 'Black metalwork with silver inlay by skilled Bidri artisans.'),
(14, 'Rural Design Confluence', 'Auroville, Tamil Nadu', '2025-09-10', '2025-09-16', 'Auroville Artisans Hub', 'Sustainable Crafts', 5500, 25.00, 'Eco-conscious craft innovations blending tradition and design.'),
(15, 'Lippan Kaam Festival', 'Bhuj, Gujarat', '2025-11-20', '2025-11-26', 'Kutch Craft Collective', 'Mud Mirror Work', 3000, 15.00, 'Workshops and exhibits of decorative mirror murals from Kutch.'),
(16, 'Kala Srijan Haat', 'Patna, Bihar', '2025-10-05', '2025-10-12', 'Bihar State Emporium', 'Madhubani and Sujni', 7500, 20.00, 'Folk paintings, applique art, and story-telling crafts of Bihar.'),
(17, 'Terracotta Roots Fair', 'Bishnupur, WB', '2025-08-20', '2025-08-27', 'Clay Culture Trust', 'Temple Pottery', 4800, 20.00, 'Showcasing the spiritual art of Bengal terracotta.'),
(18, 'Handloom Connect', 'Panipat, Haryana', '2025-09-25', '2025-10-01', 'National Handloom Board', 'Carpets and Shawls', 9800, 30.00, 'Traditional durries, carpets, and shawls from North India.'),
(19, 'Santhe: The Art Bazaar', 'Bangalore, Karnataka', '2025-12-20', '2025-12-27', 'Karnataka Chitrakala Parishath', 'Contemporary Indian Folk Art', 13000, 40.00, 'Fusion of folk, tribal, and modern handmade crafts.'),
(20, 'Art of the Deccan', 'Hyderabad, Telangana', '2025-11-18', '2025-11-24', 'Deccan Heritage Trust', 'Bidri, Kalamkari, Nirmal', 9100, 30.00, 'Exploring Deccan’s royal crafts and traditional artistry.');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Exhibitions;

-- to remove complete data from table
truncate table Exhibitions;

-- to delete complete attributes and records 
drop table Exhibitions;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a column for venue_capacity (to track max visitors venue can hold)
ALTER TABLE Exhibitions ADD COLUMN venue_capacity INT;

-- 2. Add a column to track online_ticket_link
ALTER TABLE Exhibitions ADD COLUMN online_ticket_link VARCHAR(255);

-- 3. Change entry_fee precision for larger events
ALTER TABLE Exhibitions MODIFY entry_fee DECIMAL(12,2);

-- 4. Create an index on start_date for faster date-range queries
CREATE INDEX idx_exh_start ON Exhibitions(start_date);

-- 5. Create an index on location to speed location-based searches
CREATE INDEX idx_exh_location ON Exhibitions(location);

-- 6. Create a view of upcoming exhibitions (useful for the website)
CREATE VIEW Upcoming_Exhibitions AS
SELECT exhibition_id, title, location, start_date, end_date, entry_fee
FROM Exhibitions
WHERE start_date > CURDATE();

-- 7. Create a materialized-like summary table for quick reporting (populate once)
CREATE TABLE Exhibition_Summary AS
SELECT exhibition_id, title, start_date, end_date, expected_visitors, entry_fee FROM Exhibitions;

-- 8. Find exhibitions with entry fees higher than the average fee
SELECT title, location, entry_fee
FROM Exhibitions
WHERE entry_fee > (SELECT AVG(entry_fee) FROM Exhibitions);

-- 9. Get exhibitions having expected visitors more than the average visitors of all exhibitions
SELECT title, expected_visitors
FROM Exhibitions
WHERE expected_visitors > (SELECT AVG(expected_visitors) FROM Exhibitions);

-- 10. Find exhibitions that end after the latest starting exhibition
SELECT title, start_date, end_date
FROM Exhibitions
WHERE end_date > (SELECT MAX(start_date) FROM Exhibitions);

-- 11. Add a JSON column to store organizer contact details (phone, email)
ALTER TABLE Exhibitions ADD COLUMN organizer_contact JSON;

-- 12. Drop the temporary Exhibition_Summary table (cleanup)
DROP TABLE IF EXISTS Exhibition_Summary;

-- 13. Update expected visitor estimate after ticket sales surge
UPDATE Exhibitions SET expected_visitors = expected_visitors + 2000 WHERE title = 'Handmade India Fair';

-- 14. Cancel an exhibition (mark by setting expected_visitors = 0 and note in description)
UPDATE Exhibitions SET expected_visitors = 0, description = CONCAT(description, ' -- CANCELLED') WHERE exhibition_id = 13;

-- 15. Delete a draft exhibition entry (cleanup test)
DELETE FROM Exhibitions WHERE exhibition_id = 99;

-- 16. Running total of expected visitors ordered by start date
SELECT exhibition_id, title, expected_visitors,
       SUM(expected_visitors) OVER (ORDER BY start_date) AS running_visitors
FROM Exhibitions;

-- 17. Partition rank: rank exhibitions within each organizer by expected visitors
SELECT organizer, title, expected_visitors,
       RANK() OVER (PARTITION BY organizer ORDER BY expected_visitors DESC) AS org_rank
FROM Exhibitions;

-- 18. NTILE to bucket exhibitions into 4 popularity buckets by expected visitors
SELECT title, expected_visitors, NTILE(4) OVER (ORDER BY expected_visitors DESC) AS popularity_quartile FROM Exhibitions;

-- 19. LAG to compare expected visitors with previous exhibition
SELECT exhibition_id, title, expected_visitors,
       LAG(expected_visitors) OVER (ORDER BY start_date) AS prev_expected
FROM Exhibitions;

-- 20. Update organizer contact JSON for an exhibition
UPDATE Exhibitions SET organizer_contact = JSON_OBJECT('phone','+91-9876543210','email','info@lalitkala.org') WHERE exhibition_id = 1;

-- 21. Insert sample description update (text cleanup)
UPDATE Exhibitions SET description = TRIM(description) WHERE description IS NOT NULL;

-- 22. List exhibitions happening in October 2025
SELECT * FROM Exhibitions WHERE MONTH(start_date) = 10 AND YEAR(start_date) = 2025;

-- 23. Top 5 exhibitions by expected visitors (for marketing prioritization)
SELECT title, expected_visitors FROM Exhibitions ORDER BY expected_visitors DESC LIMIT 5;

-- 24. Total projected ticket revenue per exhibition (expected_visitors * entry_fee)
SELECT exhibition_id, title, expected_visitors, entry_fee, (expected_visitors * entry_fee) AS projected_revenue
FROM Exhibitions ORDER BY projected_revenue DESC;

-- 25. Count exhibitions by state (extracting state from location after comma)
SELECT TRIM(SUBSTRING_INDEX(location, ',', -1)) AS state, COUNT(*) AS total_exhibitions
FROM Exhibitions
GROUP BY state
ORDER BY total_exhibitions DESC;

-- 26. Find exhibitions organized by 'Lalit Kala Akademi'
SELECT * FROM Exhibitions WHERE organizer = 'Lalit Kala Akademi';

-- 27. Show exhibitions whose theme includes 'Textile'
SELECT * FROM Exhibitions WHERE theme LIKE '%Textile%';

-- 28. Upcoming exhibitions within next 30 days
SELECT * FROM Exhibitions WHERE start_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY;

-- 29. Average entry fee by theme (pricing strategy)
SELECT theme, ROUND(AVG(entry_fee),2) AS avg_fee FROM Exhibitions GROUP BY theme;

-- 30. List exhibitions whose entry fee equals the minimum entry fee
SELECT title, location, entry_fee
FROM Exhibitions
WHERE entry_fee = (SELECT MIN(entry_fee) FROM Exhibitions);

-- 31. Find long-running exhibitions (duration > 7 days)
SELECT title, start_date, end_date, DATEDIFF(end_date, start_date) AS duration_days
FROM Exhibitions
HAVING duration_days > 7;

-- 32. Find exhibitions with zero expected visitors (likely canceled)
SELECT * FROM Exhibitions WHERE expected_visitors = 0;

-- 33. List exhibitions that charge entry fee under ₹20 (affordable-access programs)
SELECT * FROM Exhibitions WHERE entry_fee < 20;

-- 34. Distinct themes being showcased
SELECT DISTINCT theme FROM Exhibitions;

-- 35. Find exhibitions where description mentions 'live' (live demos/workshops)
SELECT * FROM Exhibitions WHERE LOWER(description) LIKE '%live%';

-- 36. Find exhibitions that displayed sold artworks (join Sales -> Artworks -> Exhibitions via description heuristic)
SELECT DISTINCT e.title, s.sale_id, a.title AS artwork_title
FROM Sales s
JOIN Artworks a ON s.artwork_id = a.artwork_id
JOIN Exhibitions e ON LOWER(e.description) LIKE CONCAT('%', LOWER(a.title), '%');

-- 37. Exhibition-wise artisan participation (organizer invites)
SELECT e.title, ar.name, COUNT(a.artwork_id) AS works_displayed
FROM Exhibitions e
JOIN Artworks a ON LOWER(e.description) LIKE CONCAT('%', LOWER(a.title), '%')
JOIN Artisans ar ON a.artisan_id = ar.artisan_id
GROUP BY e.title, ar.name;

-- 38. Total projected revenue across all exhibitions (sum of expected_visitors * entry_fee)
SELECT SUM(expected_visitors * entry_fee) AS total_projected_revenue FROM Exhibitions;

-- 39. Average duration of exhibitions (in days)
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_duration_days FROM Exhibitions;

-- 40. Longest exhibition
SELECT title, DATEDIFF(end_date, start_date) AS duration FROM Exhibitions ORDER BY duration DESC LIMIT 1;

-- 41. Format entry fee for display with currency symbol
SELECT title, CONCAT('₹', FORMAT(entry_fee,2)) AS entry_fee_display FROM Exhibitions;

-- 42. Use COALESCE to show organizer contact when JSON missing (example)
SELECT title, COALESCE(JSON_UNQUOTE(JSON_EXTRACT(organizer_contact,'$.email')), 'no-email') AS organizer_email FROM Exhibitions;

-- 43. Calculate price band counts (cheap/medium/high)
SELECT 
  SUM(CASE WHEN entry_fee < 20 THEN 1 ELSE 0 END) AS cheap,
  SUM(CASE WHEN entry_fee BETWEEN 20 AND 40 THEN 1 ELSE 0 END) AS medium,
  SUM(CASE WHEN entry_fee > 40 THEN 1 ELSE 0 END) AS premium
FROM Exhibitions;

-- 44. Rank exhibitions by expected visitors
SELECT title, expected_visitors, RANK() OVER (ORDER BY expected_visitors DESC) AS visitor_rank FROM Exhibitions;

-- 45. Show exhibitions and number of workshops scheduled there (join heuristic: workshop.location match)
SELECT e.exhibition_id, e.title, COUNT(w.workshop_id) AS workshops_count
FROM Exhibitions e
LEFT JOIN Workshops w ON LOWER(e.location) LIKE CONCAT('%', LOWER(SUBSTRING_INDEX(w.location, ',', -1)), '%')
GROUP BY e.exhibition_id, e.title;

-- 46. Find artworks displayed (if artworks table has exhibition linkage via description or schedule) — heuristic join via title mention
SELECT e.title AS exhibition, a.title AS artwork, ar.name AS artist
FROM Exhibitions e
JOIN Artworks a ON LOWER(e.description) LIKE CONCAT('%', LOWER(a.title), '%')
JOIN Artisans ar ON a.artisan_id = ar.artisan_id;

-- 47. List exhibitions that feature crafts from a specific craft_type (e.g., 'Pattachitra')
SELECT e.title, c.craft_name
FROM Exhibitions e
JOIN Craft_Types c ON LOWER(e.theme) LIKE CONCAT('%', LOWER(c.craft_name), '%');

-- 48. Exhibition organizers and their total expected visitors (organizer-level KPI)
SELECT organizer, SUM(expected_visitors) AS total_expected
FROM Exhibitions GROUP BY organizer ORDER BY total_expected DESC;

-- 49. Match Exhibitions to nearest Materials' source region (planning logistics)
SELECT e.title, m.material_name, m.source_location
FROM Exhibitions e
JOIN Materials m ON LOWER(e.location) LIKE CONCAT('%', LOWER(SUBSTRING_INDEX(m.source_location, ',', -1)), '%');

-- 50. Exhibitions and tools used in demonstrations (heuristic via Tools descriptions)
SELECT e.title, t.tool_name, t.manufacturer
FROM Exhibitions e
JOIN Tools t ON LOWER(e.description) LIKE CONCAT('%', LOWER(t.tool_name), '%');

-- 51. Exhibitions with registrations in Workshops that are part of the exhibition (multi-join)
SELECT e.title, COUNT(r.registration_id) AS participants
FROM Exhibitions e
LEFT JOIN Workshops w ON LOWER(e.title) LIKE CONCAT('%', LOWER(w.title), '%')
LEFT JOIN Registrations r ON r.workshop_id = w.workshop_id
GROUP BY e.exhibition_id, e.title;

-- 52. Find exhibitions with entry fee higher than the average fee of all exhibitions
SELECT title, entry_fee
FROM Exhibitions
WHERE entry_fee > (SELECT AVG(entry_fee) FROM Exhibitions);

-- 53. Get exhibitions organized in cities where expected visitors are above 10,000
SELECT title, location
FROM Exhibitions
WHERE expected_visitors > (
    SELECT AVG(expected_visitors) 
    FROM Exhibitions
    WHERE expected_visitors > 10000
);

-- 54. Find the exhibition(s) with the maximum entry fee
SELECT title, entry_fee
FROM Exhibitions
WHERE entry_fee = (SELECT MAX(entry_fee) FROM Exhibitions);

-- 55. List exhibitions ending after the average end date
SELECT title, end_date
FROM Exhibitions
WHERE end_date > (SELECT AVG(DATEDIFF(end_date, start_date)) 
                  FROM Exhibitions) + start_date;

-- 56. Get the organizer(s) who organized exhibitions in the same city as 'Kala Mela 2025'
SELECT organizer
FROM Exhibitions
WHERE location = (SELECT location FROM Exhibitions WHERE title = 'Kala Mela 2025');

-- 57. Find exhibitions whose entry fee is more than the minimum entry fee in 'Maharashtra'
SELECT title, entry_fee
FROM Exhibitions
WHERE entry_fee > (
    SELECT MIN(entry_fee) 
    FROM Exhibitions 
    WHERE location LIKE '%Maharashtra%'
);

-- 58. List exhibitions having more visitors than 'Warli Vishwa Utsav'
SELECT title, expected_visitors
FROM Exhibitions
WHERE expected_visitors > (
    SELECT expected_visitors 
    FROM Exhibitions 
    WHERE title = 'Warli Vishwa Utsav'
);

-- 59. Get exhibitions with entry fee less than the average fee of exhibitions in Gujarat
SELECT title, entry_fee
FROM Exhibitions
WHERE entry_fee < (
    SELECT AVG(entry_fee) 
    FROM Exhibitions 
    WHERE location LIKE '%Gujarat%'
);

-- 60. Find the longest duration exhibition(s)
SELECT title, DATEDIFF(end_date, start_date) AS duration
FROM Exhibitions
WHERE DATEDIFF(end_date, start_date) = (
    SELECT MAX(DATEDIFF(end_date, start_date)) 
    FROM Exhibitions
);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 10: Exhibition_Artworks
CREATE TABLE Exhibition_Artworks (
    id INT PRIMARY KEY, -- unique identifier for each exibition artwork
    exhibition_id INT,
    artwork_id INT,
    display_location VARCHAR(100),
    display_start DATE,
    display_end DATE,
    status VARCHAR(50) DEFAULT 'On Display',
    remarks TEXT,  -- New: Any notes about the display
    spotlight BOOLEAN DEFAULT FALSE,  -- New: Whether artwork is in spotlight/highlighted
    curator_in_charge VARCHAR(100),  -- New: Person managing the artwork display
    FOREIGN KEY (exhibition_id) REFERENCES Exhibitions(exhibition_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id)
);

-- Insert 20 records into Exhibition_Artworks table
INSERT INTO Exhibition_Artworks (id, exhibition_id, artwork_id, display_location,display_start, display_end, status, remarks,spotlight, curator_in_charge) 
VALUES
(1, 1, 1, 'Hall A - Wall Panel 3', '2025-08-01', '2025-08-10', 'On Display', 'Featured near the main entry.', TRUE, 'Rekha Mehra'),
(2, 2, 2, 'Stall B5', '2025-09-05', '2025-09-12', 'On Display', 'Requires soft lighting for texture.', FALSE, 'Yogesh Prasad'),
(3, 3, 4, 'Pavilion 1 - Textile Zone', '2025-11-15', '2025-11-22', 'On Display', 'Popular among foreign visitors.', TRUE, 'Deepika Sinha'),
(4, 4, 5, 'Gallery C - Sculpture Area', '2025-12-01', '2025-12-07', 'On Display', 'Heavy item, reinforced pedestal used.', FALSE, 'Arvind Joshi'),
(5, 5, 3, 'Scroll Corner - Stall 12', '2025-10-10', '2025-10-17', 'On Display', 'Displayed with traditional lighting.', TRUE, 'Shreya Banerjee'),
(6, 6, 13, 'Main Hall - Gold Art Section', '2025-11-01', '2025-11-08', 'On Display', 'Curator-guided story-telling.', TRUE, 'Lakshmi Iyer'),
(7, 7, 6, 'Live Crafting Arena', '2025-10-01', '2025-10-07', 'On Display', 'Live Dhokra demo scheduled daily.', TRUE, 'Neha Raut'),
(8, 8, 14, 'Textile Gallery', '2025-12-10', '2025-12-17', 'On Display', 'Paired with Chikankari samples.', FALSE, 'Nida Khan'),
(9, 9, 8, 'Craft Pavilion - Bamboo Zone', '2025-09-20', '2025-09-27', 'On Display', 'Received local media coverage.', TRUE, 'Ramesh Sharma'),
(10, 10, 9, 'Tribal Art Hall', '2025-08-25', '2025-08-31', 'On Display', 'Painted using eco-friendly colors.', FALSE, 'Pratibha Kale'),
(11, 11, 12, 'Silk Showcase', '2025-10-15', '2025-10-22', 'On Display', 'Requires humidity control.', TRUE, 'Kavita Thakur'),
(12, 12, 17, 'Metal Craft Zone', '2025-11-10', '2025-11-16', 'On Display', 'Historic context explained in captions.', TRUE, 'Tanmay Deshpande'),
(13, 13, 17, 'Inlay Art Display Hall', '2025-12-05', '2025-12-11', 'On Display', 'Interactive QR code panel added.', FALSE, 'Siddhi Kamat'),
(14, 14, 11, 'Eco Craft Lane', '2025-09-10', '2025-09-16', 'On Display', 'Demonstrates sustainable dyeing.', FALSE, 'Manish Pillai'),
(15, 15, 16, 'Wall Art Zone', '2025-11-20', '2025-11-26', 'On Display', 'Spotlight piece of the gallery.', TRUE, 'Mansi Bhatt'),
(16, 16, 1, 'Madhubani Heritage Zone', '2025-10-05', '2025-10-12', 'On Display', 'Original from Darbhanga artist.', TRUE, 'Preeti Jha'),
(17, 17, 7, 'Temple Craft Display', '2025-08-20', '2025-08-27', 'On Display', 'Paired with documentary screening.', FALSE, 'Rajendra Mohanty'),
(18, 18, 19, 'Toy Story Lane', '2025-09-25', '2025-10-01', 'On Display', 'Child-safe interactive exhibit.', TRUE, 'Vidya Chauhan'),
(19, 19, 10, 'Channapatna Showcase', '2025-12-20', '2025-12-27', 'On Display', 'Rotating platform used for effect.', FALSE, 'Rohit Mallya'),
(20, 20, 18, 'Miniature Hall - South Wing', '2025-11-18', '2025-11-24', 'On Display', 'Spotlight mural with lighting effects.', TRUE, 'Bhavna Patel');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Exhibition_Artworks;

-- to remove complete data from table
truncate table Exhibition_Artworks;

-- to delete complete attributes and records 
drop table Exhibition_Artworks;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column to store visitor count for each exhibition artwork
ALTER TABLE Exhibition_Artworks ADD COLUMN visitor_count INT DEFAULT 0;

-- 2. DDL: Modify curator_in_charge column to ensure every curator name must be unique
ALTER TABLE Exhibition_Artworks ADD CONSTRAINT unique_curator UNIQUE (curator_in_charge);

-- 3. DDL: Drop a column (remarks) if management decides to stop storing free comments
ALTER TABLE Exhibition_Artworks DROP COLUMN remarks;

-- 4. DDL: Rename column 'status' to 'display_status' for clarity
ALTER TABLE Exhibition_Artworks RENAME COLUMN status TO display_status;

-- 5. DDL: Create an index on exhibition_id for faster lookups
CREATE INDEX idx_exhibition_id ON Exhibition_Artworks(exhibition_id);

-- 6. DML: Update visitor count when exhibition is ongoing
UPDATE Exhibition_Artworks
SET visitor_count = visitor_count + 120
WHERE exhibition_id = 5;

-- 7. DML: Delete an artwork record when display is finished
DELETE FROM Exhibition_Artworks
WHERE display_end < CURRENT_DATE;

-- 8. DML: Change spotlight to TRUE for all paintings above ₹2000
UPDATE Exhibition_Artworks
SET spotlight = TRUE
WHERE artwork_id IN (SELECT artwork_id FROM Artworks WHERE price > 2000);

-- 9. DQL: Display all artworks with their curator
SELECT ea.id, ea.curator_in_charge, a.title
FROM Exhibition_Artworks ea
JOIN Artworks a ON ea.artwork_id = a.artwork_id;

-- 10. DQL: Get all exhibitions starting in December 2025
SELECT * FROM Exhibition_Artworks
WHERE MONTH(display_start) = 12 AND YEAR(display_start) = 2025;

-- 11. DQL: Show artworks that are under spotlight
SELECT id, artwork_id, display_location
FROM Exhibition_Artworks
WHERE spotlight = TRUE;

-- 12. DQL: List unique curators managing exhibitions
SELECT DISTINCT curator_in_charge
FROM Exhibition_Artworks;

-- 13. Subquery: Find curators who managed artworks priced above ₹3000
SELECT curator_in_charge
FROM Exhibition_Artworks
WHERE artwork_id IN (SELECT artwork_id FROM Artworks WHERE price > 3000);

-- 14. Constraint: Make sure visitor_count cannot be negative
ALTER TABLE Exhibition_Artworks
ADD CONSTRAINT chk_visitors CHECK (visitor_count >= 0);

-- 15. Operator: Find artworks with display_end in next 30 days
SELECT * FROM Exhibition_Artworks
WHERE display_end BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY);

-- 16. Operator: Find exhibitions where visitor_count > 500 OR spotlight is TRUE
SELECT * FROM Exhibition_Artworks
WHERE visitor_count > 500 OR spotlight = TRUE;

-- 17. Operator: Get exhibitions where curator name starts with 'R'
SELECT * FROM Exhibition_Artworks
WHERE curator_in_charge LIKE 'R%';

-- 18. Nested Subquery: Find exhibition where the longest titled artwork is displayed
SELECT e.title
FROM Exhibitions e
WHERE e.exhibition_id = (
    SELECT exhibition_id
    FROM Exhibition_Artworks
    WHERE artwork_id = (
        SELECT artwork_id
        FROM Artworks
        ORDER BY LENGTH(title) DESC
        LIMIT 1
    )
);

-- 19. Subquery: Find curators who manage artworks in both Delhi and Mumbai exhibitions
SELECT DISTINCT curator_in_charge
FROM Exhibition_Artworks
WHERE exhibition_id IN (
    SELECT exhibition_id FROM Exhibitions WHERE location LIKE '%Delhi%'
)
AND curator_in_charge IN (
    SELECT curator_in_charge FROM Exhibition_Artworks
    WHERE exhibition_id IN (SELECT exhibition_id FROM Exhibitions WHERE location LIKE '%Mumbai%')
);

-- 20. Subquery: Find exhibitions where entry_fee is higher than the average fee
SELECT title, entry_fee
FROM Exhibitions
WHERE entry_fee > (SELECT AVG(entry_fee) FROM Exhibitions);

-- 21. JOIN: List artworks with their exhibition display location
SELECT a.title, ea.display_location, ea.display_start, ea.display_end
FROM Exhibition_Artworks ea
JOIN Artworks a ON ea.artwork_id = a.artwork_id;

-- 22. JOIN: Find all exhibitions where 'Madhubani' artworks are displayed
SELECT e.exhibition_id, ea.display_location
FROM Exhibition_Artworks ea
JOIN Artworks a ON ea.artwork_id = a.artwork_id
JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
WHERE a.title LIKE '%Madhubani%';

-- 23. JOIN: Show all artworks with curator names and their prices
SELECT a.title, a.price, ea.curator_in_charge
FROM Artworks a
JOIN Exhibition_Artworks ea ON a.artwork_id = ea.artwork_id;

-- 24. JOIN + Aggregate: Find total visitor count per curator
SELECT curator_in_charge, SUM(visitor_count) AS total_visitors
FROM Exhibition_Artworks
GROUP BY curator_in_charge;

-- 25. Subquery with IN: List artworks that were displayed in exhibitions with more than 10,000 expected visitors
SELECT a.title
FROM Artworks a
WHERE a.artwork_id IN (
    SELECT artwork_id FROM Exhibition_Artworks ea
    JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
    WHERE e.expected_visitors > 10000
);

-- 26. Subquery with NOT EXISTS: Find exhibitions that do not have any spotlight artworks
SELECT e.title
FROM Exhibitions e
WHERE NOT EXISTS (
    SELECT 1 FROM Exhibition_Artworks ea
    WHERE ea.exhibition_id = e.exhibition_id AND ea.spotlight = TRUE
);

-- 27. Window Function: Cumulative artworks displayed over time
SELECT exhibition_id, display_start,
       COUNT(*) OVER (ORDER BY display_start ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_artworks
FROM Exhibition_Artworks;

-- 28. Reporting Query: Find exhibition with the maximum number of spotlight artworks
SELECT e.title, COUNT(*) AS spotlight_count
FROM Exhibition_Artworks ea
JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
WHERE ea.spotlight = TRUE
GROUP BY e.title
ORDER BY spotlight_count DESC
LIMIT 1;

-- 29. Function: Show artwork title and length of title
SELECT a.title, LENGTH(a.title) AS title_length
FROM Artworks a
JOIN Exhibition_Artworks ea ON a.artwork_id = ea.artwork_id;

-- 30. Function: Display curator names in uppercase
SELECT DISTINCT UPPER(curator_in_charge) AS curator_name
FROM Exhibition_Artworks;

-- 31. Function: Calculate duration of each exhibition in days
SELECT id, DATEDIFF(display_end, display_start) AS duration_days
FROM Exhibition_Artworks;

-- 32. Window Function: Rank exhibitions by visitor count (highest first)
SELECT id, curator_in_charge, visitor_count,
       RANK() OVER (ORDER BY visitor_count DESC) AS rank_position
FROM Exhibition_Artworks;

-- 33. Window Function: Find running total of visitors for each curator
SELECT curator_in_charge, visitor_count,
       SUM(visitor_count) OVER (PARTITION BY curator_in_charge ORDER BY display_start) AS cumulative_visitors
FROM Exhibition_Artworks;

-- 34. Window Function: Average visitors per exhibition using window
SELECT curator_in_charge, visitor_count,
       AVG(visitor_count) OVER (PARTITION BY curator_in_charge) AS avg_visitors
FROM Exhibition_Artworks;

-- 35. Operator: Find artworks displayed in November OR December
SELECT * FROM Exhibition_Artworks
WHERE MONTH(display_start) IN (11, 12);

-- 36. Clause: Get top 5 exhibitions by visitor count
SELECT * FROM Exhibition_Artworks
ORDER BY visitor_count DESC
LIMIT 5;

-- 37. Clause: Group exhibitions by month and count artworks
SELECT MONTH(display_start) AS month, COUNT(*) AS total_exhibits
FROM Exhibition_Artworks
GROUP BY MONTH(display_start);

-- 38. Subquery: Find exhibition IDs where spotlight artworks are displayed
SELECT exhibition_id
FROM Exhibition_Artworks
WHERE artwork_id IN (SELECT artwork_id FROM Artworks WHERE price > 2000);

-- 39. Subquery + Aggregate: Find curator who managed the most expensive artwork
SELECT curator_in_charge
FROM Exhibition_Artworks
WHERE artwork_id = (SELECT artwork_id FROM Artworks ORDER BY price DESC LIMIT 1);

-- 40. Subquery: List artworks not yet assigned to any exhibition
SELECT title
FROM Artworks
WHERE artwork_id NOT IN (SELECT artwork_id FROM Exhibition_Artworks);

-- 41. JOIN: Show exhibition titles with artworks displayed and their curators
SELECT e.title AS exhibition, a.title AS artwork, ea.curator_in_charge
FROM Exhibition_Artworks ea
JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
JOIN Artworks a ON ea.artwork_id = a.artwork_id;

-- 42. JOIN + Condition: List exhibitions in Delhi where spotlight artworks are displayed
SELECT e.title, a.title AS artwork, ea.display_location
FROM Exhibition_Artworks ea
JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
JOIN Artworks a ON ea.artwork_id = a.artwork_id
WHERE e.location LIKE '%Delhi%' AND ea.spotlight = TRUE;

-- 43. JOIN + Aggregation: Find total artworks displayed per exhibition
SELECT e.title, COUNT(ea.artwork_id) AS total_artworks
FROM Exhibition_Artworks ea
JOIN Exhibitions e ON ea.exhibition_id = e.exhibition_id
GROUP BY e.title;

-- 44. Nested Subquery: Find exhibitions where average visitor_count is above overall average
SELECT exhibition_id, AVG(visitor_count) AS avg_visitors
FROM Exhibition_Artworks
GROUP BY exhibition_id
HAVING AVG(visitor_count) > (SELECT AVG(visitor_count) FROM Exhibition_Artworks);

-- 45. Subquery: Get curators handling more than 2 spotlight artworks
SELECT curator_in_charge
FROM Exhibition_Artworks
WHERE curator_in_charge IN (
    SELECT curator_in_charge
    FROM Exhibition_Artworks
    WHERE spotlight = TRUE
    GROUP BY curator_in_charge
    HAVING COUNT(*) > 2
);

-- 46. Subquery in SELECT: Show exhibition with artwork count inline
SELECT e.title,
       (SELECT COUNT(*) FROM Exhibition_Artworks ea WHERE ea.exhibition_id = e.exhibition_id) AS artwork_count
FROM Exhibitions e;

-- 47. EXISTS Subquery: Find exhibitions that have at least one artwork with price > 3000
SELECT e.title
FROM Exhibitions e
WHERE EXISTS (
    SELECT 1
    FROM Exhibition_Artworks ea
    JOIN Artworks a ON ea.artwork_id = a.artwork_id
    WHERE ea.exhibition_id = e.exhibition_id AND a.price > 3000
);

-- 48. Function: Calculate average artwork price for each curator
SELECT curator_in_charge, AVG(a.price) AS avg_price
FROM Exhibition_Artworks ea
JOIN Artworks a ON ea.artwork_id = a.artwork_id
GROUP BY curator_in_charge;

-- 49. Function: Round off exhibition entry fees to nearest 10
SELECT e.title, ROUND(e.entry_fee, -1) AS rounded_fee
FROM Exhibitions e;

-- 50. Function: Display only first 5 characters of curator names
SELECT DISTINCT LEFT(curator_in_charge, 5) AS short_name
FROM Exhibition_Artworks;

-- 51. Window Function: Rank curators by number of exhibitions managed
SELECT curator_in_charge,
       COUNT(DISTINCT exhibition_id) AS exhibitions_managed,
       RANK() OVER (ORDER BY COUNT(DISTINCT exhibition_id) DESC) AS rank_curator
FROM Exhibition_Artworks
GROUP BY curator_in_charge;

-- 52. Window Function: Find percentage contribution of each exhibition’s visitors
SELECT exhibition_id, visitor_count,
       ROUND(100 * visitor_count / SUM(visitor_count) OVER(), 2) AS percentage_share
FROM Exhibition_Artworks;

-- 53. Operator: Find all exhibitions held between September and November 2025
SELECT * FROM Exhibitions
WHERE start_date BETWEEN '2025-09-01' AND '2025-11-30';

-- 54. Operator: Show all exhibitions NOT in Maharashtra
SELECT * FROM Exhibitions
WHERE location NOT LIKE '%Maharashtra%';

-- 55. Clause: List exhibitions grouped by theme with average visitors
SELECT theme, AVG(expected_visitors) AS avg_expected
FROM Exhibitions
GROUP BY theme
ORDER BY avg_expected DESC;

-- 56. Reporting Query: Average exhibition duration (days) per organizer
SELECT organizer, AVG(DATEDIFF(end_date, start_date)) AS avg_duration
FROM Exhibitions
GROUP BY organizer;

-- 57. Reporting Query: Find artworks displayed in more than 1 exhibition
SELECT artwork_id, COUNT(DISTINCT exhibition_id) AS exhibition_count
FROM Exhibition_Artworks
GROUP BY artwork_id
HAVING COUNT(DISTINCT exhibition_id) > 1;

-- 58. Clause + Subquery: Find the exhibition with the longest duration
SELECT title, DATEDIFF(end_date, start_date) AS duration
FROM Exhibitions
WHERE DATEDIFF(end_date, start_date) = (
    SELECT MAX(DATEDIFF(end_date, start_date)) FROM Exhibitions
);

-- 59. Clause + Aggregation: Find organizer with maximum exhibitions hosted
SELECT organizer, COUNT(*) AS exhibition_count
FROM Exhibitions
GROUP BY organizer
ORDER BY exhibition_count DESC
LIMIT 1;

-- 60. Final Advanced Query: Show top 3 curators based on total number of spotlight artworks across exhibitions
SELECT curator_in_charge, COUNT(*) AS spotlight_count
FROM Exhibition_Artworks
WHERE spotlight = TRUE
GROUP BY curator_in_charge
ORDER BY spotlight_count DESC
LIMIT 3;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 11: Donors
CREATE TABLE Donors (
    donor_id INT PRIMARY KEY, -- unique identifier for each donor
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    donation_amount DECIMAL(10,2),
    donation_date DATE,
    payment_method VARCHAR(50),
    remarks TEXT,
    anonymous BOOLEAN DEFAULT FALSE
);

-- Insert 20 records into Donors table
INSERT INTO Donors (donor_id, name, contact_number, email, address,donation_amount, donation_date, payment_method,remarks, anonymous) 
VALUES
(1, 'Anjali Verma', '9876543210', 'anjali.verma@example.com', 'Sector 12, Noida, UP', 5000.00, '2025-06-01', 'UPI', 'For Madhubani Artist Welfare.', FALSE),
(2, 'Rajesh Kumar', '9123456789', 'rajesh.kumar@example.com', 'BTM Layout, Bengaluru, Karnataka', 10000.00, '2025-06-03', 'Net Banking', 'Annual patron donor.', FALSE),
(3, 'Anonymous', NULL, NULL, 'Undisclosed', 2500.00, '2025-06-05', 'Cash', 'Prefers to stay unnamed.', TRUE),
(4, 'Pooja Desai', '9823456789', 'pooja.desai@example.com', 'Navrangpura, Ahmedabad', 7500.00, '2025-06-06', 'Cheque', 'In memory of her grandmother.', FALSE),
(5, 'Deepak Nair', '9012345678', 'deepak.nair@example.com', 'Marine Drive, Kochi, Kerala', 3000.00, '2025-06-07', 'Credit Card', 'Support for tribal pottery.', FALSE),
(6, 'Simran Kaur', '9786543210', 'simran.kaur@example.com', 'Model Town, Ludhiana', 12000.00, '2025-06-08', 'UPI', 'Zardozi revival initiative.', FALSE),
(7, 'Ashok Mehta', '9871234567', 'ashok.mehta@example.com', 'Malad, Mumbai, Maharashtra', 500.00, '2025-06-09', 'Cash', 'Small monthly support.', FALSE),
(8, 'Rekha Banerjee', '9765432109', 'rekha.banerjee@example.com', 'Salt Lake, Kolkata, WB', 8400.00, '2025-06-10', 'Net Banking', 'Terracotta preservation fund.', FALSE),
(9, 'Arvind Joshi', '9345678901', 'arvind.joshi@example.com', 'Vishrantwadi, Pune', 6000.00, '2025-06-11', 'UPI', 'Crafts education for youth.', FALSE),
(10, 'Nikita Sharma', '9988776655', 'nikita.sharma@example.com', 'Shivaji Nagar, Bhopal', 2200.00, '2025-06-12', 'Debit Card', 'For warli art training.', FALSE),
(11, 'Anonymous', NULL, NULL, 'Undisclosed', 1500.00, '2025-06-13', 'Cash', 'Private donation.', TRUE),
(12, 'Rohit Jain', '9123344556', 'rohit.jain@example.com', 'Lajpat Nagar, New Delhi', 9500.00, '2025-06-14', 'UPI', 'For blue pottery artisans.', FALSE),
(13, 'Lakshmi Iyer', '9876001122', 'lakshmi.iyer@example.com', 'Adyar, Chennai', 8000.00, '2025-06-15', 'Net Banking', 'Temple crafts preservation.', FALSE),
(14, 'Manoj Reddy', '9667788990', 'manoj.reddy@example.com', 'Begumpet, Hyderabad', 4300.00, '2025-06-16', 'Cheque', 'To support Kalamkari workshops.', FALSE),
(15, 'Sonal Kapoor', '9833445566', 'sonal.kapoor@example.com', 'Juhu, Mumbai', 10000.00, '2025-06-17', 'Credit Card', 'To sponsor artisan scholarships.', FALSE),
(16, 'Yusuf Khan', '9988123412', 'yusuf.khan@example.com', 'Charminar, Hyderabad', 1200.00, '2025-06-18', 'Cash', 'Support for Channapatna toys.', FALSE),
(17, 'Priya Ramesh', '9723456780', 'priya.ramesh@example.com', 'Panampilly Nagar, Ernakulam', 3000.00, '2025-06-19', 'UPI', 'Tribal women training.', FALSE),
(18, 'Kunal Deshmukh', '9823459870', 'kunal.deshmukh@example.com', 'FC Road, Pune', 1900.00, '2025-06-20', 'Debit Card', 'Craft awareness programs.', FALSE),
(19, 'Sangeeta Joshi', '9090123456', 'sangeeta.joshi@example.com', 'Ashok Nagar, Jaipur', 7700.00, '2025-06-21', 'Net Banking', 'Support for exhibitions.', FALSE),
(20, 'Anonymous', NULL, NULL, 'Undisclosed', 2100.00, '2025-06-22', 'Cash', 'No public mention requested.', TRUE);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Donors;

-- to remove complete data from table
truncate table Donors;

-- to delete complete attributes and records 
drop table Donors;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column to track donor occupation
ALTER TABLE Donors ADD occupation VARCHAR(100);

-- 2. Modify column size for contact_number
ALTER TABLE Donors MODIFY contact_number VARCHAR(20);

-- 3. Rename column 'remarks' to 'donor_message'
ALTER TABLE Donors RENAME COLUMN remarks TO donor_message;

-- 4. Drop the column occupation (if not needed)
ALTER TABLE Donors DROP COLUMN occupation;

-- 5. Create index for faster search on donor name
CREATE INDEX idx_donor_name ON Donors(name);

-- 6. Donors who donated more than the average donation amount
SELECT name, donation_amount
FROM Donors
WHERE donation_amount > (SELECT AVG(donation_amount) FROM Donors);

-- 7. Find the highest donation details
SELECT name, donation_amount, payment_method
FROM Donors
WHERE donation_amount = (SELECT MAX(donation_amount) FROM Donors);

-- 8. List donors who donated more than Rajesh Kumar’s donation 
SELECT name, donation_amount
FROM Donors
WHERE donation_amount > (
    SELECT donation_amount 
    FROM Donors 
    WHERE name = 'Rajesh Kumar'
);

-- 9. Get donors who donated on dates after the earliest donation date
SELECT name, donation_date, donation_amount
FROM Donors
WHERE donation_date > (SELECT MIN(donation_date) FROM Donors);

-- 10. Create unique constraint on email (no duplicate emails allowed)
ALTER TABLE Donors ADD CONSTRAINT unique_email UNIQUE(email);

-- 11. Add check constraint (donation_amount must be > 0)
ALTER TABLE Donors ADD CONSTRAINT chk_donation CHECK(donation_amount > 0);

-- 12. Drop constraint (example: chk_donation)
ALTER TABLE Donors DROP CONSTRAINT chk_donation;

-- 13. Rename table Donors to Donor_Info
ALTER TABLE Donors RENAME TO Donor_Info;

-- 14. Revert name (Donor_Info → Donors)
ALTER TABLE Donor_Info RENAME TO Donors;

-- 15. Update donor message for donor_id = 5
UPDATE Donors SET donor_message = 'Special request: pottery awareness program.' WHERE donor_id = 5;

-- 16. Increase donation amount by 10% for all Net Banking donors
UPDATE Donors SET donation_amount = donation_amount * 1.10 WHERE payment_method = 'Net Banking';

-- 17. Delete donor record where donor_id = 7
DELETE FROM Donors WHERE donor_id = 7;

-- 18. Set anonymous donors' name to 'Hidden Donor'
UPDATE Donors SET name = 'Hidden Donor' WHERE anonymous = TRUE;

-- 19. Add ₹500 bonus for all UPI donors
UPDATE Donors SET donation_amount = donation_amount + 500 WHERE payment_method = 'UPI';

-- 20. Delete all donors who donated less than 1000
DELETE FROM Donors WHERE donation_amount < 1000;

-- 21. Update payment method from 'Cheque' to 'Online Banking'
UPDATE Donors SET payment_method = 'Online Banking' WHERE payment_method = 'Cheque';

-- 22. Delete donors from "Undisclosed" address
DELETE FROM Donors WHERE address = 'Undisclosed';

-- 23. List all donor names and their donation amounts
SELECT name, donation_amount FROM Donors;

-- 24. Find top 5 donors by donation amount
SELECT name, donation_amount FROM Donors ORDER BY donation_amount DESC LIMIT 5;

-- 25. Get all UPI donors with donations above ₹5000
SELECT name, donation_amount FROM Donors WHERE payment_method = 'UPI' AND donation_amount > 5000;

-- 26. Count total number of donors
SELECT COUNT(*) AS total_donors FROM Donors;

-- 27. Find maximum donation amount
SELECT MAX(donation_amount) AS max_donation FROM Donors;

-- 28. Find minimum donation amount
SELECT MIN(donation_amount) AS min_donation FROM Donors;

-- 29. Find average donation amount
SELECT AVG(donation_amount) AS avg_donation FROM Donors;

-- 30. Find total donation amount collected
SELECT SUM(donation_amount) AS total_donations FROM Donors;

-- 31. List donors whose name starts with 'S'
SELECT name FROM Donors WHERE name LIKE 'S%';

-- 32. Display donors who donated between ₹2000 and ₹8000
SELECT name, donation_amount FROM Donors WHERE donation_amount BETWEEN 2000 AND 8000;

-- 33. Group donors by payment method
SELECT payment_method, COUNT(*) FROM Donors GROUP BY payment_method;

-- 34. Having clause - payment methods with total donation > 15000
SELECT payment_method, SUM(donation_amount) 
FROM Donors 
GROUP BY payment_method 
HAVING SUM(donation_amount) > 15000;

-- 35. Order donors by donation amount
SELECT name, donation_amount FROM Donors ORDER BY donation_amount DESC;

-- 36. Limit top 3 donors
SELECT name, donation_amount FROM Donors ORDER BY donation_amount DESC LIMIT 3;

-- 37. Distinct payment methods
SELECT DISTINCT payment_method FROM Donors;

-- 38. Add NOT NULL constraint to payment_method
ALTER TABLE Donors MODIFY payment_method VARCHAR(50) NOT NULL;

-- 39. Add unique constraint to contact_number
ALTER TABLE Donors ADD CONSTRAINT unique_contact UNIQUE(contact_number);

-- 40. Add check constraint for minimum donation
ALTER TABLE Donors ADD CONSTRAINT min_donation CHECK (donation_amount >= 500);

-- 41. Drop unique constraint
ALTER TABLE Donors DROP CONSTRAINT unique_contact;

-- 42. Drop check constraint
ALTER TABLE Donors DROP CONSTRAINT min_donation;

-- 43. Find donors who donated more than average donation
SELECT name, donation_amount 
FROM Donors
WHERE donation_amount > (SELECT AVG(donation_amount) FROM Donors);

-- 44. Get donor(s) with maximum donation
SELECT name, donation_amount 
FROM Donors
WHERE donation_amount = (SELECT MAX(donation_amount) FROM Donors);

-- 45. Find donors from cities where at least one donation > 10000
SELECT name, address 
FROM Donors
WHERE address IN (SELECT address FROM Donors WHERE donation_amount > 10000);

-- 46. List donors who donated the same amount as 'Rajesh Kumar'
SELECT name, donation_amount 
FROM Donors
WHERE donation_amount = (SELECT donation_amount FROM Donors WHERE name = 'Rajesh Kumar');

-- 47. Donors who donated more than the total of all anonymous donors
SELECT name, donation_amount
FROM Donors
WHERE donation_amount > (SELECT SUM(donation_amount) FROM Donors WHERE anonymous = TRUE);

-- 48. Uppercase donor names
SELECT UPPER(name) FROM Donors;

-- 49. Find length of donor names
SELECT name, LENGTH(name) AS name_length FROM Donors;

-- 50. Concatenate donor name and email
SELECT CONCAT(name, ' - ', email) AS donor_contact FROM Donors;

-- 51. Round donation amounts to nearest 100
SELECT name, ROUND(donation_amount, -2) AS rounded_amount FROM Donors;

-- 52. Rank donors by donation amount
SELECT name, donation_amount, RANK() OVER (ORDER BY donation_amount DESC) AS rank_no
FROM Donors;

-- 53. Running total of donations
SELECT name, donation_amount, SUM(donation_amount) OVER (ORDER BY donation_date) AS running_total
FROM Donors;

-- 54. Average donation per donor compared to overall avg
SELECT name, donation_amount, AVG(donation_amount) OVER() AS avg_donation
FROM Donors;

-- 55. Partition donations by payment method
SELECT name, payment_method, donation_amount,
       SUM(donation_amount) OVER(PARTITION BY payment_method) AS method_total
FROM Donors;

-- 56. Donors who donated more than 5000 AND paid via UPI
SELECT name, donation_amount FROM Donors WHERE donation_amount > 5000 AND payment_method = 'UPI';

-- 57. Donors who donated using Cash OR Cheque
SELECT name, payment_method FROM Donors WHERE payment_method = 'Cash' OR payment_method = 'Cheque';

-- 58. Donors not using UPI
SELECT name FROM Donors WHERE NOT payment_method = 'UPI';

-- 59. Donors who donated between 2000 and 8000
SELECT name, donation_amount FROM Donors WHERE donation_amount BETWEEN 2000 AND 8000;

-- 60. Donors with NULL email
SELECT name FROM Donors WHERE email IS NULL;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table 12: Sponsorships
CREATE TABLE Sponsorships (
    sponsorship_id INT PRIMARY KEY, -- unique identifier for each sponsorship
    sponsor_name VARCHAR(100) NOT NULL,
    event_name VARCHAR(100),
    amount DECIMAL(10,2),
    sponsor_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    contact_email VARCHAR(100),
    phone VARCHAR(15),
    status VARCHAR(20) DEFAULT 'Active'
);

-- Insert 20 records into Sponsorships table
INSERT INTO Sponsorships (sponsorship_id, sponsor_name, event_name, amount,sponsor_type, start_date, end_date,contact_email, phone, status)
 VALUES
(1, 'HDFC Bank Ltd.', 'Kala Mela 2025', 100000.00, 'Corporate', '2025-07-01', '2025-08-10', 'sponsorships@hdfcbank.com', '9876543210', 'Active'),
(2, 'Tata Trusts', 'Lok Kala Utsav', 150000.00, 'NGO', '2025-07-15', '2025-09-12', 'info@tatatrusts.org', '9123456789', 'Active'),
(3, 'Reliance Foundation', 'Rajasthan Craft Week', 200000.00, 'Foundation', '2025-08-01', '2025-12-07', 'contact@reliancefoundation.org', '9988776655', 'Active'),
(4, 'Godrej & Boyce', 'Kutch Karigar Haat', 85000.00, 'Corporate', '2025-07-20', '2025-11-22', 'csr@godrej.com', '9876543211', 'Active'),
(5, 'Infosys Foundation', 'Southern Craft Carnival', 130000.00, 'Foundation', '2025-08-10', '2025-11-08', 'support@infosysfoundation.org', '9012345678', 'Active'),
(6, 'State Bank of India', 'Handmade India Fair', 110000.00, 'Corporate', '2025-09-01', '2025-10-07', 'sbi.sponsorship@bank.com', '9345678901', 'Active'),
(7, 'Amazon India', 'Virasat 2025', 95000.00, 'Corporate', '2025-09-15', '2025-12-17', 'csr@amazon.in', '9765432109', 'Active'),
(8, 'Google India CSR', 'Crafts of the North East', 180000.00, 'Corporate', '2025-08-20', '2025-09-27', 'india-csr@google.com', '9812233445', 'Active'),
(9, 'ONGC', 'Warli Vishwa Utsav', 70000.00, 'Government', '2025-07-10', '2025-08-31', 'sponsorship@ongc.in', '9988771122', 'Active'),
(10, 'Asian Paints', 'Lippan Kaam Festival', 92000.00, 'Corporate', '2025-08-25', '2025-11-26', 'artsupport@asianpaints.com', '9833445566', 'Active'),
(11, 'Axis Bank Foundation', 'Silken Threads Fest', 125000.00, 'Foundation', '2025-08-15', '2025-10-22', 'csr@axisbank.com', '9723456780', 'Active'),
(12, 'Adobe India', 'Terracotta Roots Fair', 86000.00, 'Corporate', '2025-07-30', '2025-08-27', 'adobe.csr@adobe.com', '9786543210', 'Active'),
(13, 'Indian Oil Corp.', 'Dhokra Mahotsav', 99000.00, 'Government', '2025-08-10', '2025-11-16', 'csr@indianoil.co.in', '9823456789', 'Active'),
(14, 'Zee Entertainment', 'Bidri Craft Show', 60000.00, 'Media', '2025-09-05', '2025-12-11', 'csr@zee.in', '9023456712', 'Active'),
(15, 'Tanishq Jewellers', 'Art of the Deccan', 145000.00, 'Corporate', '2025-09-20', '2025-11-24', 'sponsorship@tanishq.co.in', '9098765432', 'Active'),
(16, 'L&T Public Charitable Trust', 'Santhe: The Art Bazaar', 105000.00, 'Trust', '2025-09-01', '2025-12-27', 'lttrust@larsentoubro.com', '9654123789', 'Active'),
(17, 'Crafts Council of India', 'Rural Design Confluence', 70000.00, 'NGO', '2025-08-01', '2025-09-16', 'info@craftscouncil.in', '9912345678', 'Active'),
(18, 'Coca-Cola Foundation', 'Banarasi Weaves Showcase', 120000.00, 'Foundation', '2025-07-25', '2025-10-22', 'csr@coca-cola.com', '9876001122', 'Active'),
(19, 'Microsoft Philanthropies', 'Handloom Connect', 110000.00, 'Corporate', '2025-08-05', '2025-10-01', 'csr@microsoft.com', '9955123456', 'Active'),
(20, 'Asian Heritage Fund', 'Eastern Heritage Expo', 75000.00, 'NGO', '2025-07-28', '2025-10-17', 'heritage@ahf.org', '9877891234', 'Active');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Sponsorships;

-- to remove complete data from table
truncate table Sponsorships;

-- to delete complete attributes and records 
drop table Sponsorships;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a sponsorship tier column to categorize sponsorship level
ALTER TABLE Sponsorships ADD COLUMN tier VARCHAR(50);

-- 2. Add a column to record signed agreement file path
ALTER TABLE Sponsorships ADD COLUMN agreement_file VARCHAR(255);

-- 3. Change amount precision to allow larger sponsorships
ALTER TABLE Sponsorships MODIFY amount DECIMAL(14,2);

-- 4. Add NOT NULL constraint on sponsor_name
ALTER TABLE Sponsorships MODIFY sponsor_name VARCHAR(100) NOT NULL;

-- 5. Create index on event_name to speed event-specific sponsor lookups
CREATE INDEX idx_sponsor_event ON Sponsorships(event_name);

-- 6. Show all sponsors who contributed more than ₹1,00,000
SELECT sponsor_name, event_name, amount
FROM Sponsorships
WHERE amount > 100000;

-- 7. Create index on start_date for fast date-range queries
CREATE INDEX idx_sponsor_start ON Sponsorships(start_date);

-- 8. Add a column to track CSR contact person
ALTER TABLE Sponsorships ADD csr_contact VARCHAR(100);

-- 9. Create view of active sponsorships for reporting dashboards
CREATE VIEW Active_Sponsorships AS
SELECT sponsorship_id, sponsor_name, event_name, amount, status
FROM Sponsorships
WHERE status = 'Active';

-- 10. Top 3 events by total sponsorship amount
SELECT event_name, SUM(amount) AS total_amount
FROM Sponsorships
GROUP BY event_name
ORDER BY total_amount DESC
LIMIT 3;

-- 11. Distinct sponsor types available in the program
SELECT DISTINCT sponsor_type FROM Sponsorships;

-- 12. Add CHECK to ensure amount is non-negative
ALTER TABLE Sponsorships ADD CONSTRAINT chk_amount_nonneg CHECK (amount >= 0);

-- 13. Make contact_email mandatory (example change)
ALTER TABLE Sponsorships MODIFY contact_email VARCHAR(100) NOT NULL;

-- 14. Update sponsorship status to Completed after event finish
UPDATE Sponsorships SET status = 'Completed' WHERE end_date < CURDATE();

-- 15. Increase sponsorship amount by 10% for inflation adjustment (corporate deals)
UPDATE Sponsorships SET amount = amount * 1.10 WHERE sponsor_type = 'Corporate' AND start_date >= '2025-07-01';

-- 16. Mark sponsorship as paused (temporary)
UPDATE Sponsorships SET status = 'Paused' WHERE sponsor_name = 'Amazon India';

-- 17. Delete a sponsorship that was recorded in error
DELETE FROM Sponsorships WHERE sponsorship_id = 99;

-- 18. Nullify phone if sponsor requested removal of contact
UPDATE Sponsorships SET phone = NULL WHERE sponsor_name = 'ONGC';

-- 19. Set agreement_file path once contract is uploaded
UPDATE Sponsorships SET agreement_file = '/agreements/hdfc_kala_mela_2025.pdf' WHERE sponsorship_id = 1;

-- 20. Mark funds as disbursed once finance confirms
UPDATE Sponsorships SET disbursed = 1 WHERE sponsorship_id = 3;

-- 21. List all active sponsorships
SELECT * FROM Sponsorships WHERE status = 'Active';

-- 22. Top 5 sponsors by total committed amount (useful for recognition)
SELECT sponsor_name, SUM(amount) AS total_amount
FROM Sponsorships
GROUP BY sponsor_name
ORDER BY total_amount DESC
LIMIT 5;

-- 23. Total sponsorship amount pledged for 'Kala Mela 2025'
SELECT SUM(amount) AS total_for_event FROM Sponsorships WHERE event_name = 'Kala Mela 2025';

-- 24. Upcoming sponsorship starts in next 30 days
SELECT * FROM Sponsorships WHERE start_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY;

-- 25. Sponsors whose contracts end this month (for renewal outreach)
SELECT * FROM Sponsorships WHERE MONTH(end_date) = MONTH(CURDATE()) AND YEAR(end_date) = YEAR(CURDATE());

-- 26. Average sponsorship amount by sponsor_type (budget planning)
SELECT sponsor_type, ROUND(AVG(amount),2) AS avg_amount
FROM Sponsorships
GROUP BY sponsor_type;

-- 27. Sponsors with multiple active commitments
SELECT sponsor_name, COUNT(*) AS active_count
FROM Sponsorships
WHERE status = 'Active'
GROUP BY sponsor_name
HAVING active_count > 1;

-- 28. Sponsors who gave more than ₹100,000
SELECT sponsor_name, amount FROM Sponsorships WHERE amount > 100000 ORDER BY amount DESC;

-- 29. Show sponsorships with contact details
SELECT sponsor_name, contact_email, phone FROM Sponsorships;

-- 30. Event-wise sponsorship totals for Q3 2025 (Jul-Sep)
SELECT event_name, SUM(amount) AS total_sponsored
FROM Sponsorships
WHERE start_date BETWEEN '2025-07-01' AND '2025-09-30'
GROUP BY event_name;

-- 31. Sponsorships that are currently active by date (start <= today <= end)
SELECT * FROM Sponsorships WHERE start_date <= CURDATE() AND end_date >= CURDATE();

-- 32. Add UNIQUE constraint to (sponsor_name, event_name) to avoid duplicate deals
ALTER TABLE Sponsorships ADD CONSTRAINT uq_sponsor_event UNIQUE (sponsor_name, event_name);

-- 33. Set default sponsor_type to 'Corporate' for new rows
ALTER TABLE Sponsorships ALTER sponsor_type SET DEFAULT 'Corporate';

-- 34. Change phone data type to enforce digits only by length (example)
ALTER TABLE Sponsorships MODIFY phone VARCHAR(15);

-- 35. Add NOT NULL constraint on start_date
ALTER TABLE Sponsorships MODIFY start_date DATE NOT NULL;

-- 36. Sponsors who pledged more than the average sponsorship amount
SELECT sponsor_name, amount
FROM Sponsorships
WHERE amount > (SELECT AVG(amount) FROM Sponsorships);

-- 37. Sponsors who sponsored events that have expected_visitors > 10,000 (join via event_name -> Exhibitions.title)
SELECT DISTINCT s.sponsor_name
FROM Sponsorships s
WHERE s.event_name IN (
  SELECT title FROM Exhibitions WHERE expected_visitors > 10000
);

-- 38. Sponsors who sponsored at least one event in the same city as 'Kala Mela 2025'
SELECT DISTINCT sponsor_name
FROM Sponsorships
WHERE event_name IN (
  SELECT title FROM Exhibitions WHERE location = (SELECT location FROM Exhibitions WHERE title = 'Kala Mela 2025')
);

-- 39. Sponsors who have given multiple sponsorships (count > 1) — scalar subquery in WHERE
SELECT sponsor_name
FROM Sponsorships s1
WHERE (SELECT COUNT(*) FROM Sponsorships s2 WHERE s2.sponsor_name = s1.sponsor_name) > 1
GROUP BY sponsor_name;

-- 40. Sponsors with amount above the maximum donation from individual donors (compare org vs donor max)
SELECT sponsor_name, amount
FROM Sponsorships
WHERE amount > (SELECT MAX(donation_amount) FROM Donors);

-- 41. Join Sponsorships with Exhibitions to see which sponsor funds which event
SELECT s.sponsor_name, s.amount, e.title AS exhibition_title, e.location
FROM Sponsorships s
LEFT JOIN Exhibitions e ON s.event_name = e.title;

-- 42. Join with Donors table (if sponsors can also be donors) — identify overlaps
SELECT s.sponsor_name, d.name AS donor_name, s.amount
FROM Sponsorships s
LEFT JOIN Donors d ON LOWER(s.sponsor_name) = LOWER(d.name);

-- 43. Find sponsorships and related workshops (if event matches workshop title)
SELECT s.sponsor_name, w.title AS workshop_title, w.location
FROM Sponsorships s
LEFT JOIN Workshops w ON LOWER(s.event_name) LIKE CONCAT('%', LOWER(w.title), '%');

-- 44. Get sponsorships and total sales at the event
SELECT s.sponsor_name, s.event_name, SUM(sa.sale_price) AS total_sales
FROM Sponsorships s
LEFT JOIN Exhibitions ex ON s.event_name = ex.title
LEFT JOIN Exhibition_Artworks ea ON ex.exhibition_id = ea.exhibition_id
LEFT JOIN Artworks a ON ea.artwork_id = a.artwork_id
LEFT JOIN Sales sa ON a.artwork_id = sa.artwork_id
GROUP BY s.sponsor_name, s.event_name;

-- 45. Sponsors and the craft types showcased in events they sponsor
SELECT DISTINCT s.sponsor_name, c.craft_name
FROM Sponsorships s
JOIN Exhibitions e ON s.event_name = e.title
JOIN Exhibition_Artworks ea ON e.exhibition_id = ea.exhibition_id
JOIN Artworks a ON ea.artwork_id = a.artwork_id
JOIN Craft_Types c ON a.craft_type_id = c.craft_type_id;

-- 46. Sponsors who sponsored events that hosted workshops (cross-team planning)
SELECT DISTINCT s.sponsor_name, w.title AS workshop
FROM Sponsorships s
JOIN Exhibitions e ON s.event_name = e.title
JOIN Workshops w ON LOWER(w.location) LIKE CONCAT('%', LOWER(SUBSTRING_INDEX(e.location, ',', -1)), '%');

-- 47. Sponsors linked with Tools suppliers (if workshop uses tools from certain supplier locations)
SELECT s.sponsor_name, t.tool_name, t.manufacturer
FROM Sponsorships s
JOIN Workshops w ON LOWER(s.event_name) LIKE CONCAT('%', LOWER(w.title), '%')
JOIN Exhibition_Artworks ea ON LOWER(w.title) LIKE CONCAT('%', LOWER(ea.display_location), '%')
JOIN Artworks a ON ea.artwork_id = a.artwork_id
JOIN Tools t ON a.tool_used LIKE CONCAT('%', t.tool_name, '%');

-- 48. Sponsors and registration counts for the events they support
SELECT s.sponsor_name, s.event_name, COUNT(r.registration_id) AS registrations
FROM Sponsorships s
LEFT JOIN Workshops w ON LOWER(s.event_name) LIKE CONCAT('%', LOWER(w.title), '%')
LEFT JOIN Registrations r ON w.workshop_id = r.workshop_id
GROUP BY s.sponsor_name, s.event_name;

-- 49. Normalize sponsor names to uppercase for display badges
SELECT sponsorship_id, UPPER(sponsor_name) AS sponsor_badge FROM Sponsorships;

-- 50. Calculate sponsorship duration in days
SELECT sponsorship_id, sponsor_name, DATEDIFF(end_date, start_date) AS sponsorship_days FROM Sponsorships;

-- 51. Format amount with currency symbol for reports
SELECT sponsor_name, CONCAT('₹', FORMAT(amount,2)) AS formatted_amount FROM Sponsorships;

-- 52. Extract domain from contact_email for analytics (who are corporate domains)
SELECT sponsor_name, SUBSTRING_INDEX(contact_email, '@', -1) AS email_domain FROM Sponsorships;

-- 53. Rank sponsors by amount (highest first)
SELECT sponsor_name, amount, RANK() OVER (ORDER BY amount DESC) AS sponsor_rank FROM Sponsorships;

-- 54. Running total of sponsorships ordered by start_date
SELECT sponsorship_id, sponsor_name, amount,
       SUM(amount) OVER (ORDER BY start_date) AS running_total
FROM Sponsorships;

-- 55. NTILE to create 4 sponsor tiers based on amount
SELECT sponsor_name, amount, NTILE(4) OVER (ORDER BY amount DESC) AS amount_quartile FROM Sponsorships;

-- 56. Partition sum of amounts by sponsor_type
SELECT sponsor_type, sponsor_name, amount,
       SUM(amount) OVER (PARTITION BY sponsor_type) AS total_by_type
FROM Sponsorships;

-- 57. Sponsors who gave between ₹70,000 and ₹150,000
SELECT sponsor_name, amount FROM Sponsorships WHERE amount BETWEEN 70000 AND 150000;

-- 58. Sponsors not Corporate type
SELECT sponsor_name, sponsor_type FROM Sponsorships WHERE sponsor_type <> 'Corporate';

-- 59. Sponsors with missing phone or email (data cleanup)
SELECT sponsorship_id, sponsor_name FROM Sponsorships WHERE contact_email IS NULL OR phone IS NULL;

-- 60. Count sponsorships per status
SELECT status, COUNT(*) FROM Sponsorships GROUP BY status;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 13: Training_Programs
CREATE TABLE Training_Programs (
    program_id INT PRIMARY KEY, -- unique identifier for each training progress
    title VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    location VARCHAR(100),
    instructor VARCHAR(100),
    target_audience VARCHAR(100),
    fees DECIMAL(10,2) DEFAULT 0,
    capacity INT CHECK (capacity > 0)
);

-- Insert 20 records into Training_Programs table
INSERT INTO Training_Programs (program_id, title, description, start_date, end_date,location, instructor, target_audience, fees, capacity)
 VALUES
(1, 'Basics of Madhubani Art', 'Learn traditional Mithila painting techniques.', '2025-08-01', '2025-08-10', 'Darbhanga, Bihar', 'Anita Jha', 'Aspiring Folk Artists', 1000.00, 30),
(2, 'Advanced Warli Expressions', 'Hands-on training in Warli mural creation.', '2025-08-15', '2025-08-25', 'Thane, Maharashtra', 'Raghunath Shyam', 'Tribal Youth', 500.00, 25),
(3, 'Zardozi Embroidery Workshop', 'Traditional gold thread embroidery skills.', '2025-09-01', '2025-09-10', 'Lucknow, UP', 'Farzana Begum', 'Fashion Design Students', 1500.00, 20),
(4, 'Dhokra Metal Casting Basics', 'Learn the 4000-year-old lost wax technique.', '2025-09-05', '2025-09-12', 'Bastar, Chhattisgarh', 'Ramu Majhi', 'Artisans and Sculptors', 800.00, 15),
(5, 'Ajrakh Block Printing', 'Traditional indigo resist dyeing method.', '2025-09-10', '2025-09-20', 'Bhuj, Gujarat', 'Iqbal Khatri', 'Textile Artists', 1200.00, 20),
(6, 'Tanjore Painting Workshop', 'Gold foil-based South Indian painting course.', '2025-09-18', '2025-09-25', 'Chennai, Tamil Nadu', 'Meenakshi Ravi', 'Painting Enthusiasts', 1000.00, 25),
(7, 'Terracotta Toy Making', 'Hands-on workshop for traditional clay toys.', '2025-10-01', '2025-10-07', 'Kolkata, WB', 'Satyajit Pal', 'Pottery Students', 600.00, 20),
(8, 'Kalamkari Natural Dyeing', 'Techniques of storytelling through fabric.', '2025-10-05', '2025-10-15', 'Srikalahasti, Andhra Pradesh', 'Padmavati Devi', 'Women Weavers', 950.00, 30),
(9, 'Bamboo Craft Training', 'Skill development in bamboo-based products.', '2025-10-10', '2025-10-17', 'Guwahati, Assam', 'Bijoy Rabha', 'Rural Artisans', 500.00, 40),
(10, 'Pattachitra Scroll Painting', 'Traditional Odisha-based scroll art.', '2025-10-20', '2025-10-28', 'Raghurajpur, Odisha', 'Jaganath Mahapatra', 'Fine Arts Students', 700.00, 25),
(11, 'Lippan Art Mirror Workshop', 'Decorative mud-mirror wall art training.', '2025-11-01', '2025-11-07', 'Kutch, Gujarat', 'Kamla Rabari', 'Home Decor Artists', 400.00, 30),
(12, 'Sujni Embroidery Course', 'Story-based patch embroidery from Bihar.', '2025-11-10', '2025-11-18', 'Muzaffarpur, Bihar', 'Neelam Kumari', 'NGO Trainers', 650.00, 20),
(13, 'Bidriware Polishing Techniques', 'Metal inlay art from Karnataka.', '2025-11-15', '2025-11-22', 'Bidar, Karnataka', 'Salim Ustad', 'Craft Professionals', 850.00, 20),
(14, 'Chikankari Skills Training', 'Elegant Lucknowi embroidery workshop.', '2025-11-20', '2025-11-28', 'Lucknow, UP', 'Shabnam Khan', 'Fashion Students', 1000.00, 25),
(15, 'Weaving on Backstrap Looms', 'Tribal loom weaving techniques.', '2025-12-01', '2025-12-10', 'Aizawl, Mizoram', 'Lalhmingi Ralte', 'Tribal Women', 300.00, 35),
(16, 'Handmade Paper Workshop', 'Learn eco-friendly paper making.', '2025-12-05', '2025-12-12', 'Jaipur, Rajasthan', 'Rajveer Bhati', 'Eco-Craft Enthusiasts', 450.00, 20),
(17, 'Wood Carving & Relief Work', 'Traditional sculpting and wood detailing.', '2025-12-10', '2025-12-18', 'Puri, Odisha', 'Sudarshan Panda', 'Sculptors', 1200.00, 20),
(18, 'Traditional Toy Design', 'Channapatna wooden toy crafting.', '2025-12-20', '2025-12-27', 'Channapatna, Karnataka', 'Vishwanath Naik', 'Design Students', 600.00, 20),
(19, 'Handloom Skills Upgradation', 'Training in contemporary weaving methods.', '2026-01-02', '2026-01-10', 'Varanasi, UP', 'Meera Gupta', 'Young Weavers', 700.00, 30),
(20, 'Sustainable Craft Enterprise', 'Blending tradition with entrepreneurship.', '2026-01-05', '2026-01-15', 'Bangalore, Karnataka', 'Anil Patwardhan', 'Artisan Startups', 1500.00, 20);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Training_Programs;

-- to remove complete data from table
truncate table Training_Programs;

-- to delete complete attributes and records 
drop table Training_Programs;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Show all training programs held in Lucknow
SELECT title, instructor, start_date, end_date 
FROM Training_Programs
WHERE location LIKE '%Lucknow%';

-- 2. Show all programs taught by female instructors (name ending with 'a')
SELECT program_id, title, instructor, location
FROM Training_Programs
WHERE instructor LIKE '%a';

-- 3. List all programs with capacity more than 30
SELECT title, capacity, location 
FROM Training_Programs
WHERE capacity > 30;

-- 4. Display programs conducted in December 2025
SELECT program_id, title, location, start_date, end_date
FROM Training_Programs
WHERE start_date BETWEEN '2025-12-01' AND '2025-12-31';

-- 5. Count how many programs are planned in Gujarat
SELECT COUNT(*) AS total_programs_in_gujarat
FROM Training_Programs
WHERE location LIKE '%Gujarat%';

-- 6. Add a new column for program coordinator contact number
ALTER TABLE Training_Programs 
ADD coordinator_contact VARCHAR(15);

-- 7. Modify column fees to allow NULL values (some free workshops)
ALTER TABLE Training_Programs 
MODIFY fees DECIMAL(10,2) NULL;

-- 8. Rename column "fees" to "program_fee" for clarity
ALTER TABLE Training_Programs 
RENAME COLUMN fees TO program_fee;

-- 9. Delete old program records that ended before 2025-08-01
DELETE FROM Training_Programs
WHERE end_date < '2025-08-01';

-- 10. Increase fee of all Painting-related workshops by 10%
UPDATE Training_Programs
SET program_fee = program_fee * 1.10
WHERE title LIKE '%Painting%';

-- 11. List all programs happening in 2025 ordered by start_date
SELECT program_id, title, location, start_date
FROM Training_Programs
WHERE YEAR(start_date) = 2025
ORDER BY start_date ASC;

-- 12. Find all programs where fees are between 500 and 1000
SELECT title, location, program_fee
FROM Training_Programs
WHERE program_fee BETWEEN 500 AND 1000;

-- 13. Show programs conducted either in Bihar or Odisha
SELECT title, location, instructor
FROM Training_Programs
WHERE location LIKE '%Bihar%' OR location LIKE '%Odisha%';

-- 14. Display distinct instructors to avoid duplicates
SELECT DISTINCT instructor
FROM Training_Programs;

-- 15. Show all programs where capacity is NOT equal to 20
SELECT title, capacity
FROM Training_Programs
WHERE capacity <> 20;

-- 16. Find programs with maximum capacity available
SELECT title, capacity
FROM Training_Programs
WHERE capacity = (SELECT MAX(capacity) FROM Training_Programs);

-- 17. Find cheapest training program fee
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee = (SELECT MIN(program_fee) FROM Training_Programs);

-- 18. Count how many programs are free (program_fee IS NULL OR 0)
SELECT COUNT(*) AS free_programs
FROM Training_Programs
WHERE program_fee = 0 OR program_fee IS NULL;

-- 19. Create an index on location for faster location-based searches
CREATE INDEX idx_location ON Training_Programs(location);

-- 20. Update fees for "Advanced Warli Expressions" to 800
UPDATE Training_Programs
SET program_fee = 800
WHERE title = 'Advanced Warli Expressions';

-- 21. Reduce capacity by 5 for courses happening in Lucknow (due to hall renovation)
UPDATE Training_Programs
SET capacity = capacity - 5
WHERE location LIKE '%Lucknow%';

-- 22. Show all programs targeting "Students"
SELECT title, instructor, target_audience
FROM Training_Programs
WHERE target_audience LIKE '%Students%';

-- 23. Constraint – add NOT NULL to instructor column
ALTER TABLE Training_Programs
MODIFY instructor VARCHAR(100) NOT NULL;

-- 24. Constraint – set a unique constraint on title
ALTER TABLE Training_Programs
ADD CONSTRAINT unique_title UNIQUE (title);

-- 25. Find all programs whose duration is more than 7 days
SELECT title, DATEDIFF(end_date, start_date) AS duration_days
FROM Training_Programs
WHERE DATEDIFF(end_date, start_date) > 7;

-- 26. Function – calculate duration of programs
SELECT program_id, title,
       DATEDIFF(end_date, start_date) AS duration_days
FROM Training_Programs;

-- 27. Function – string manipulation (uppercase titles for brochure)
SELECT UPPER(title) AS brochure_title
FROM Training_Programs;

-- 28. Window Function – running total of capacity
SELECT title, start_date, capacity,
       SUM(capacity) OVER (ORDER BY start_date) AS running_capacity
FROM Training_Programs;

-- 29. Window Function – rank programs by fees
SELECT title, program_fee,
       RANK() OVER (ORDER BY program_fee DESC) AS fee_rank
FROM Training_Programs;

-- 30. Operator – IN (programs in Gujarat or Karnataka)
SELECT title, location
FROM Training_Programs
WHERE location IN ('Bhuj, Gujarat', 'Bidar, Karnataka', 'Bangalore, Karnataka');

-- 31. Operator – LIKE (programs with 'Embroidery' in title)
SELECT title, instructor
FROM Training_Programs
WHERE title LIKE '%Embroidery%';

-- 32. Operator – BETWEEN (fees between 500 and 1000)
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee BETWEEN 500 AND 1000;

-- 33. Clause – GROUP BY (avg fees per state)
SELECT SUBSTRING_INDEX(location, ',', -1) AS state, AVG(program_fee) AS avg_fees
FROM Training_Programs
GROUP BY state;

-- 34. Clause – HAVING (states with avg fees > 1000)
SELECT SUBSTRING_INDEX(location, ',', -1) AS state, AVG(program_fee) AS avg_fees
FROM Training_Programs
GROUP BY state
HAVING AVG(program_fee) > 1000;

-- 35. Subquery – programs with fees above average
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee > (SELECT AVG(program_fee) FROM Training_Programs);

-- 36. Subquery – programs by same instructor as Zardozi Workshop
SELECT title, instructor
FROM Training_Programs
WHERE instructor = (
    SELECT instructor FROM Training_Programs WHERE title = 'Zardozi Embroidery Workshop'
);

-- 37. Subquery – find programs with above-average fees
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee > (SELECT AVG(program_fee) FROM Training_Programs);

-- 38. Subquery – find programs happening in the same city as 'Lucknow, UP'
SELECT title, location
FROM Training_Programs
WHERE location = (SELECT location FROM Training_Programs WHERE title = 'Chikankari Skills Training');

-- 39. Subquery – fetch instructor with the highest fee program
SELECT instructor
FROM Training_Programs
WHERE program_fee = (SELECT MAX(program_fee) FROM Training_Programs);

-- 40. Subquery – programs shorter than the average duration
SELECT title, DATEDIFF(end_date, start_date) AS duration_days
FROM Training_Programs
WHERE DATEDIFF(end_date, start_date) < (
      SELECT AVG(DATEDIFF(end_date, start_date)) FROM Training_Programs);

-- 41. DDL – Add a new column for certification
ALTER TABLE Training_Programs
ADD certification VARCHAR(50) DEFAULT 'No';

-- 42. DDL – Modify fees column to allow higher precision
ALTER TABLE Training_Programs
MODIFY fees DECIMAL(12,2);

-- 43. DDL – Drop a column (if not needed)
ALTER TABLE Training_Programs
DROP COLUMN certification;

-- 44. DML – Update instructor name due to trainer replacement
UPDATE Training_Programs
SET instructor = 'Ramesh Joshi'
WHERE program_id = 23;

-- 45. DML – Delete program with low capacity (<=10)
DELETE FROM Training_Programs
WHERE capacity <= 10;

-- 46. Function – round fees to nearest hundred
SELECT title, ROUND(program_fee, -2) AS rounded_fee
FROM Training_Programs;

-- 47. Function – concatenate title and instructor
SELECT CONCAT(title, ' - ', instructor) AS course_details
FROM Training_Programs;

-- 48. Window Function – rank programs by fee
SELECT title, program_fee,
       RANK() OVER (ORDER BY program_fee DESC) AS fee_rank
FROM Training_Programs;

-- 49. Window Function – calculate running total of capacities
SELECT title, capacity,
       SUM(capacity) OVER (ORDER BY start_date) AS cumulative_capacity
FROM Training_Programs;

-- 50. Function – get month name of program start
SELECT title, MONTHNAME(start_date) AS start_month
FROM Training_Programs;

-- 51. Function – calculate total revenue (fees * capacity)
SELECT title, (program_fee * capacity) AS expected_revenue
FROM Training_Programs;

-- 52. Window Function – assign row numbers by start_date
SELECT title, start_date,
       ROW_NUMBER() OVER (ORDER BY start_date) AS row_num
FROM Training_Programs;

-- 53. Window Function – find max fee within each state
SELECT title, location, program_fee,
       MAX(program_fee) OVER (PARTITION BY SUBSTRING_INDEX(location, ',', -1)) AS max_fee_in_state
FROM Training_Programs;

-- 54. Operator – NOT IN (exclude Odisha programs)
SELECT title, location
FROM Training_Programs
WHERE location NOT IN ('Raghurajpur, Odisha', 'Puri, Odisha');

-- 55. Operator – OR (programs in either Rajasthan or Bihar)
SELECT title, location
FROM Training_Programs
WHERE location LIKE '%Rajasthan%' OR location LIKE '%Bihar%';

-- 56. Clause – ORDER BY (list programs by highest fees first)
SELECT title, program_fee
FROM Training_Programs
ORDER BY program_fee DESC;

-- 57. Clause – LIMIT (top 5 costliest programs)
SELECT title, program_fee
FROM Training_Programs
ORDER BY program_fee DESC
LIMIT 5;

-- 58. Clause – GROUP BY instructor (total programs per trainer)
SELECT instructor, COUNT(*) AS total_programs
FROM Training_Programs
GROUP BY instructor;

-- 59. Clause – HAVING (only instructors with more than 1 program)
SELECT instructor, COUNT(*) AS total_programs
FROM Training_Programs
GROUP BY instructor
HAVING COUNT(*) > 1;

-- 60. Operator – BETWEEN (programs with fees between 500 and 1200)
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee BETWEEN 500 AND 1200;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 14: Program_Enrollments
CREATE TABLE Program_Enrollments (
    enrollment_id INT PRIMARY KEY, -- unique identifier for each enrollment
    program_id INT,
    artisan_id INT,
    status VARCHAR(50) DEFAULT 'Enrolled',
    completion_status VARCHAR(50) DEFAULT 'Pending',
    remarks TEXT,
    attendance_percentage DECIMAL(5,2) CHECK (attendance_percentage >= 0 AND attendance_percentage <= 100),  -- New
    grade VARCHAR(10),  -- Final grade/certification score (e.g., A, B, Pass, Fail)
    feedback TEXT,  -- Feedback given by artisan after training
    FOREIGN KEY (program_id) REFERENCES Training_Programs(program_id),
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id)
);

-- Insert 20 records into Program_Enrollments table
INSERT INTO Program_Enrollments (enrollment_id, program_id, artisan_id, status, completion_status,remarks, attendance_percentage, grade, feedback) 
VALUES
(1, 1, 1, 'Enrolled', 'Completed', 'Completed with distinction.', 95.50, 'A', 'The Madhubani techniques were taught excellently.'),
(2, 2, 2, 'Enrolled', 'Completed', 'Great support for tribal art.', 88.00, 'B+', 'Loved the Warli sessions. Very authentic.'),
(3, 3, 3, 'Enrolled', 'Completed', 'Expert embroidery guidance.', 91.25, 'A', 'Instructor was very patient and skilled.'),
(4, 4, 4, 'Enrolled', 'Completed', 'Hands-on with real tools.', 85.00, 'B', 'Dhokra casting was new and exciting.'),
(5, 5, 5, 'Enrolled', 'Pending', 'Joined late due to travel.', 70.00, NULL, 'Waiting to complete final task.'),
(6, 6, 6, 'Enrolled', 'Completed', 'Highly artistic exposure.', 89.00, 'A-', 'Tanjore painting was a dream to learn.'),
(7, 7, 7, 'Enrolled', 'Completed', 'Made beautiful toys!', 92.00, 'A', 'Terracotta clay was great to handle.'),
(8, 8, 8, 'Enrolled', 'Completed', 'Color theory taught well.', 86.00, 'B+', 'Kalamkari helped me use natural dyes.'),
(9, 9, 9, 'Enrolled', 'Completed', 'Practical techniques daily.', 82.50, 'B', 'Loved the bamboo basket making.'),
(10, 10, 10, 'Enrolled', 'Completed', 'Learned storytelling art.', 90.00, 'A-', 'Scroll painting was engaging.'),
(11, 11, 11, 'Enrolled', 'Completed', 'Very creative session.', 93.00, 'A', 'Lippan art was fun with mirrors!'),
(12, 12, 12, 'Enrolled', 'Pending', 'Working on final patch.', 78.00, NULL, 'Still preparing Sujni design.'),
(13, 13, 13, 'Enrolled', 'Completed', 'Detailed work guidance.', 85.75, 'B+', 'Inlay polish tricks were useful.'),
(14, 14, 14, 'Enrolled', 'Completed', 'Learned modern stitch styles.', 88.25, 'B+', 'Great Chikankari practice.'),
(15, 15, 15, 'Enrolled', 'Completed', 'First weaving experience.', 80.00, 'B', 'The backstrap loom is amazing.'),
(16, 16, 16, 'Enrolled', 'Completed', 'Eco-friendly practice.', 95.00, 'A+', 'Will use handmade paper in my art.'),
(17, 17, 17, 'Enrolled', 'Completed', 'Challenging and fun.', 84.00, 'B', 'Wood carving needs precision.'),
(18, 18, 18, 'Enrolled', 'Completed', 'Toy making with purpose.', 90.50, 'A', 'Excited to start my toy business.'),
(19, 19, 19, 'Enrolled', 'Pending', 'Fell ill during session.', 62.00, NULL, 'Will complete next batch.'),
(20, 20, 20, 'Enrolled', 'Completed', 'Entrepreneurial insight.', 96.00, 'A+', 'Ready to launch my craft brand.');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Program_Enrollments;

-- to remove complete data from table
truncate table Program_Enrollments;

-- to delete complete attributes and records 
drop table Program_Enrollments;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column 'mode' to indicate Online/Offline program
ALTER TABLE Training_Programs 
ADD mode VARCHAR(20) DEFAULT 'Offline';

-- 2. Modify the fees column to allow larger values
ALTER TABLE Training_Programs 
MODIFY program_fee DECIMAL(12,2);

-- 3. Drop the remarks column from Program_Enrollments (if not needed anymore)
ALTER TABLE Program_Enrollments 
DROP COLUMN remarks;

-- 4. Rename column 'grade' to 'final_grade' in Program_Enrollments
ALTER TABLE Program_Enrollments 
RENAME COLUMN grade TO final_grade;

-- 5. Create an index on instructor for faster program searches
CREATE INDEX idx_instructor 
ON Training_Programs(instructor);

-- 6. Update fees of Warli program to 800 as govt subsidy applied
UPDATE Training_Programs 
SET program_fee = 800 
WHERE title = 'Advanced Warli Expressions';

-- 7. Delete an enrollment where artisan dropped out before starting
DELETE FROM Program_Enrollments 
WHERE enrollment_id = 5;

-- 8. Increase fees by 10% for all textile-related programs
UPDATE Training_Programs 
SET program_fee = program_fee * 1.10 
WHERE title LIKE '%Embroidery%' OR title LIKE '%Weaving%' OR title LIKE '%Printing%';

-- 9. Find programs costing more than 1000 and capacity less than 25
SELECT title, program_fee, capacity 
FROM Training_Programs 
WHERE program_fee > 1000 AND capacity < 25;

-- 10. List programs with fees between 500 and 1000
SELECT title, program_fee 
FROM Training_Programs 
WHERE program_fee BETWEEN 500 AND 1000;

-- 11. Retrieve all programs happening in Bihar
SELECT * 
FROM Training_Programs 
WHERE location LIKE '%Bihar%';

-- 12. Find all artisans who scored grade 'A' or higher
SELECT artisan_id, final_grade 
FROM Program_Enrollments 
WHERE final_grade IN ('A', 'A+');

-- 13. Show programs with capacity more than 30
SELECT program_id, title, capacity 
FROM Training_Programs 
WHERE capacity > 30;

-- 14. Get list of programs starting in December
SELECT title, start_date 
FROM Training_Programs 
WHERE MONTH(start_date) = 12;

-- 15. Retrieve enrollments where attendance < 80%
SELECT enrollment_id, artisan_id, attendance_percentage 
FROM Program_Enrollments 
WHERE attendance_percentage < 80;

-- 16. Show artisan IDs with their enrolled program titles (INNER JOIN)
SELECT e.artisan_id, p.title, e.final_grade
FROM Program_Enrollments e
INNER JOIN Training_Programs p 
ON e.program_id = p.program_id;

-- 17. List all programs and show if any artisan enrolled (LEFT JOIN)
SELECT p.title, e.artisan_id
FROM Training_Programs p
LEFT JOIN Program_Enrollments e 
ON p.program_id = e.program_id;

-- 18. Find artisans who have not yet completed their programs (RIGHT JOIN)
SELECT e.artisan_id, p.title, e.completion_status
FROM Training_Programs p
RIGHT JOIN Program_Enrollments e 
ON p.program_id = e.program_id
WHERE e.completion_status = 'Pending';

-- 19. Show all programs and enrollments (FULL OUTER JOIN equivalent using UNION)
SELECT p.program_id, p.title, e.artisan_id, e.final_grade
FROM Training_Programs p
LEFT JOIN Program_Enrollments e ON p.program_id = e.program_id
UNION
SELECT p.program_id, p.title, e.artisan_id, e.final_grade
FROM Training_Programs p
RIGHT JOIN Program_Enrollments e ON p.program_id = e.program_id;

-- 20. Find programs where artisan scored 'A' grade
SELECT e.artisan_id, p.title, e.final_grade
FROM Program_Enrollments e
JOIN Training_Programs p ON e.program_id = p.program_id
WHERE e.final_grade = 'A';

-- 21. Find the average fees of all training programs
SELECT AVG(program_fee) AS avg_fees 
FROM Training_Programs;

-- 22. Count how many artisans completed their programs
SELECT COUNT(*) AS completed_count 
FROM Program_Enrollments 
WHERE completion_status = 'Completed';

-- 23. Get the maximum and minimum capacity among programs
SELECT MAX(capacity) AS max_capacity, MIN(capacity) AS min_capacity
FROM Training_Programs;

-- 24. Find programs starting after today's date (using CURDATE function)
SELECT title, start_date 
FROM Training_Programs 
WHERE start_date > CURDATE();

-- 25. Display artisan feedback in uppercase (using string function UPPER)
SELECT artisan_id, UPPER(feedback) AS feedback_upper 
FROM Program_Enrollments;

-- 26. Rank programs by their fees (highest to lowest)
SELECT program_id, title, program_fee, 
       RANK() OVER (ORDER BY program_fee DESC) AS fee_rank
FROM Training_Programs;

-- 27. Show average attendance per program and compare each artisan’s attendance
SELECT program_id, artisan_id, attendance_percentage,
       AVG(attendance_percentage) OVER (PARTITION BY program_id) AS avg_attendance
FROM Program_Enrollments;

-- 28. Show running total of fees for programs by start date
SELECT title, start_date, program_fee,
       SUM(program_fee) OVER (ORDER BY start_date) AS running_total
FROM Training_Programs;

-- 29. Find highest attendance in each program (using MAX() OVER)
SELECT program_id, artisan_id, attendance_percentage,
       MAX(attendance_percentage) OVER (PARTITION BY program_id) AS max_attendance
FROM Program_Enrollments;

-- 30. Show artisans with row numbers based on program enrollment order
SELECT program_id, artisan_id,
       ROW_NUMBER() OVER (PARTITION BY program_id ORDER BY artisan_id) AS enrollment_order
FROM Program_Enrollments;

-- 31. Find artisans who scored A or A+ grade (using IN operator)
SELECT artisan_id, final_grade 
FROM Program_Enrollments 
WHERE final_grade IN ('A', 'A+');

-- 32. Get programs whose title contains 'Embroidery' (using LIKE)
SELECT program_id, title 
FROM Training_Programs 
WHERE title LIKE '%Embroidery%';

-- 33. Calculate total fees with 18% GST applied (arithmetic operator)
SELECT title, program_fee, (program_fee * 1.18) AS total_with_gst
FROM Training_Programs;

-- 34. Find number of artisans enrolled in each program
SELECT program_id, COUNT(*) AS total_artisans
FROM Program_Enrollments
GROUP BY program_id;

-- 35. Show only programs where more than 2 artisans scored grade 'A'
SELECT program_id, COUNT(*) AS a_count
FROM Program_Enrollments
WHERE final_grade = 'A'
GROUP BY program_id
HAVING COUNT(*) > 2;

-- 36. Order programs by start date (earliest first)
SELECT title, start_date
FROM Training_Programs
ORDER BY start_date ASC;

-- 37. List top 3 most expensive programs
SELECT title, program_fee
FROM Training_Programs
ORDER BY program_fee DESC
LIMIT 3;

-- 38. Find average attendance per program but only show programs with avg attendance > 85
SELECT program_id, AVG(attendance_percentage) AS avg_attendance
FROM Program_Enrollments
GROUP BY program_id
HAVING AVG(attendance_percentage) > 85;

-- 39. Add a NOT NULL constraint to instructor so it can’t be empty
ALTER TABLE Training_Programs 
MODIFY instructor VARCHAR(100) NOT NULL;

-- 40. Verify foreign key relationship between enrollments & programs
SELECT e.enrollment_id, e.program_id, p.title
FROM Program_Enrollments e
JOIN Training_Programs p ON e.program_id = p.program_id;

-- 41. Create a new user for training managers
CREATE USER 'training_manager'@'localhost' IDENTIFIED BY 'SecurePass123';

-- 42. Find programs with fees higher than average fee
SELECT title, program_fee
FROM Training_Programs
WHERE program_fee > (SELECT AVG(program_fee) FROM Training_Programs);

-- 43. List artisans who scored above average attendance
SELECT artisan_id, attendance_percentage
FROM Program_Enrollments
WHERE attendance_percentage > (SELECT AVG(attendance_percentage) FROM Program_Enrollments);

-- 44. Find the program(s) with the maximum capacity
SELECT title, capacity
FROM Training_Programs
WHERE capacity = (SELECT MAX(capacity) FROM Training_Programs);

-- 45. Get enrollments for programs taught by 'Anita Jha'
SELECT enrollment_id, artisan_id, final_grade
FROM Program_Enrollments
WHERE program_id IN (SELECT program_id FROM Training_Programs WHERE instructor = 'Anita Jha');

-- 46. List all instructors who conducted programs with at least one 'A+' grade student
SELECT DISTINCT instructor
FROM Training_Programs
WHERE program_id IN (
    SELECT program_id 
    FROM Program_Enrollments 
    WHERE final_grade = 'A+'
);

-- 47. Find programs where enrolled artisans had > 90% attendance
SELECT title
FROM Training_Programs tp
WHERE EXISTS (
    SELECT 1 FROM Program_Enrollments pe
    WHERE pe.program_id = tp.program_id AND pe.attendance_percentage > 90
);

-- 48. Find artisans whose grade is highest within their enrolled program
SELECT artisan_id, program_id, final_grade
FROM Program_Enrollments pe1
WHERE final_grade = (
    SELECT MAX(final_grade)
    FROM Program_Enrollments pe2
    WHERE pe1.program_id = pe2.program_id
);

-- 49. List programs where capacity is greater than average enrollment size
SELECT title, capacity
FROM Training_Programs tp
WHERE capacity > (
    SELECT COUNT(*) 
    FROM Program_Enrollments pe 
    WHERE pe.program_id = tp.program_id
);

-- 50. Get artisans enrolled in programs conducted in 'Lucknow, UP'
SELECT artisan_id
FROM Program_Enrollments
WHERE program_id IN (
    SELECT program_id FROM Training_Programs WHERE location = 'Lucknow, UP'
);

-- 51. Find programs where at least one artisan gave feedback containing 'great'
SELECT title
FROM Training_Programs
WHERE program_id IN (
    SELECT program_id 
    FROM Program_Enrollments 
    WHERE feedback LIKE '%great%'
);

-- 52. Show program title, artisan_id, and grade for artisans who scored 'A'
SELECT tp.title, pe.artisan_id, pe.final_grade
FROM Training_Programs tp
JOIN Program_Enrollments pe ON tp.program_id = pe.program_id
WHERE pe.final_grade = 'A';

-- 53. List instructors whose students all completed training (no 'Pending')
SELECT DISTINCT tp.instructor
FROM Training_Programs tp
WHERE NOT EXISTS (
    SELECT 1 
    FROM Program_Enrollments pe
    WHERE pe.program_id = tp.program_id AND pe.completion_status = 'Pending'
);

-- 54. Find artisans who enrolled in more than 1 program
SELECT artisan_id
FROM Program_Enrollments
GROUP BY artisan_id
HAVING COUNT(program_id) > 1;

-- 55. Rank programs by fee (highest to lowest)
SELECT title, program_fee,
       RANK() OVER (ORDER BY program_fee DESC) AS fee_rank
FROM Training_Programs;

-- 56. For each program, find artisan with highest attendance
SELECT program_id, artisan_id, attendance_percentage
FROM Program_Enrollments pe1
WHERE attendance_percentage = (
    SELECT MAX(pe2.attendance_percentage) 
    FROM Program_Enrollments pe2 
    WHERE pe1.program_id = pe2.program_id
);

-- 57. Calculate average fees by location
SELECT location, AVG(program_fee) AS avg_fees
FROM Training_Programs
GROUP BY location;

-- 58. Find programs starting in 2025 with capacity > 25
SELECT title, start_date, capacity
FROM Training_Programs
WHERE YEAR(start_date) = 2025 AND capacity > 25;

-- 59. Show artisans who completed training but gave no grade (NULL grade issue)
SELECT artisan_id, program_id, completion_status
FROM Program_Enrollments
WHERE completion_status = 'Completed' AND final_grade IS NULL;

-- 60. Generate a list of “Top Rated Programs” (average grade A or better)
SELECT tp.title, AVG(CASE final_grade 
                        WHEN 'A+' THEN 4 
                        WHEN 'A'  THEN 3.5 
                        WHEN 'A-' THEN 3 
                        WHEN 'B+' THEN 2.5 
                        WHEN 'B'  THEN 2 
                        ELSE 1 END) AS avg_grade_score
FROM Training_Programs tp
JOIN Program_Enrollments pe ON tp.program_id = pe.program_id
GROUP BY tp.title
HAVING avg_grade_score >= 3.5;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 15: Cultural_Events
CREATE TABLE Cultural_Events (
    event_id INT PRIMARY KEY, -- unique identifier for each event
    event_name VARCHAR(100) NOT NULL,
    date DATE,
    venue VARCHAR(100),
    organizer VARCHAR(100),
    theme VARCHAR(100),
    description TEXT,
    entry_fee DECIMAL(10,2),
    expected_attendance INT,
    status VARCHAR(50) DEFAULT 'Scheduled'
);

-- Insert 20 records into Cultural_Events table
INSERT INTO Cultural_Events (event_id, event_name, date, venue, organizer, theme,description, entry_fee, expected_attendance, status) 
VALUES
(1, 'Kala Mahotsav', '2025-08-15', 'India Habitat Centre, Delhi', 'Sanskriti Foundation', 'Folk Art & Music', 'A national-level celebration of traditional performing arts.', 100.00, 500, 'Scheduled'),
(2, 'Desi Haath Utsav', '2025-09-10', 'Ravindra Bhavan, Bhopal', 'Handicraft Board MP', 'Handmade Heritage', 'Showcasing tribal crafts and rural innovations.', 50.00, 300, 'Scheduled'),
(3, 'Lokrang Mela', '2025-10-02', 'Ramlila Maidan, Lucknow', 'UP Cultural Council', 'Folk Dances of India', 'Colorful dance festival from all Indian states.', 0.00, 800, 'Scheduled'),
(4, 'Warli Art Day', '2025-11-14', 'Tribal Museum, Pune', 'Adivasi Kala Mandal', 'Tribal Expressions', 'Interactive workshop and demo of Warli art.', 30.00, 200, 'Scheduled'),
(5, 'Madhubani Mahotsav', '2025-12-05', 'Darbhanga Town Hall, Bihar', 'Mithila Kala Samiti', 'Mithila Painting', 'An annual showcase of authentic Madhubani works.', 20.00, 350, 'Scheduled'),
(6, 'Kalaangan', '2025-12-25', 'Kala Bhavan, Ahmedabad', 'Gujarat Craft Council', 'Textile Traditions', 'Focus on Ajrakh, Bandhani & Patola.', 100.00, 600, 'Scheduled'),
(7, 'Rural Craft Mela', '2026-01-10', 'Janpath Haat, Delhi', 'Ministry of Rural Dev.', 'Handmade Stories', 'A platform for artisans to exhibit and sell.', 0.00, 1000, 'Scheduled'),
(8, 'Sanskriti Sankalan', '2026-02-02', 'Kala Academy, Goa', 'Goa Heritage Board', 'Cultural Fusion', 'Blend of coastal and classical Indian traditions.', 70.00, 450, 'Scheduled'),
(9, 'Tribal Trails', '2025-10-28', 'Danteshwari Ground, Jagdalpur', 'Tribal Affairs Dept.', 'Bastar Crafts', 'Celebration of tribal life, dance and art.', 25.00, 400, 'Scheduled'),
(10, 'Craft Connect', '2026-03-01', 'India Expo Mart, Noida', 'Crafts Council of India', 'Revive & Recreate', 'National artisans meet with buyers & NGOs.', 150.00, 1200, 'Scheduled'),
(11, 'Sufi Surangana', '2026-03-15', 'Hauz Khas Fort, Delhi', 'Sufi Foundation', 'Sacred Music', 'Evening of Qawwali and Sufi kalams.', 80.00, 500, 'Scheduled'),
(12, 'Rangrez Festival', '2025-11-01', 'Jantar Mantar, Jaipur', 'Rajasthan Kala Mandir', 'Natural Dyes & Prints', 'Live demo of Bandhej, Leheriya, Indigo art.', 60.00, 300, 'Scheduled'),
(13, 'Chikankari Fest', '2026-01-20', 'Begum Hazrat Mahal Park, Lucknow', 'Lucknow Crafts Guild', 'Awadhi Embroidery', 'Promotion of Chikan hand embroidery.', 40.00, 250, 'Scheduled'),
(14, 'Channapatna Toy Fair', '2026-02-18', 'NIMHANS Convention Centre, Bangalore', 'Toy Makers Co-op', 'Sustainable Toys', 'Colorful wooden toys from Karnataka.', 25.00, 350, 'Scheduled'),
(15, 'Odissi Nritya Utsav', '2025-12-12', 'Rabindra Mandap, Bhubaneswar', 'Odisha Sangeet Natak Akademi', 'Classical Dance', 'Graceful evening of Odissi performances.', 90.00, 400, 'Scheduled'),
(16, 'Terracotta Ties', '2026-01-05', 'Artisan Gallery, Kolkata', 'Terracotta Trust', 'Earth & Fire', 'Traditional clay sculpture exhibition.', 35.00, 300, 'Scheduled'),
(17, 'Kalamkari Kala Samagam', '2025-12-22', 'Vishakhapatnam Craft Centre', 'AP Heritage Council', 'Storytelling on Fabric', 'Natural dye paintings & narratives.', 50.00, 320, 'Scheduled'),
(18, 'Silken South', '2026-02-28', 'MGR Cultural Centre, Chennai', 'TN Silk Board', 'Temple Sarees', 'Silk heritage of Tamil Nadu showcased.', 120.00, 480, 'Scheduled'),
(19, 'Banarasi Bunkar Mela', '2026-03-10', 'Ravidas Park, Varanasi', 'Weavers Welfare Forum', 'Silk Weaves', 'Honouring traditional Banarasi weavers.', 20.00, 550, 'Scheduled'),
(20, 'Miniature Art Expo', '2026-03-20', 'Udaipur Art Hall', 'Rajasthan Art House', 'Tiny Traditions', 'Miniature painting demos and stalls.', 90.00, 380, 'Scheduled');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Cultural_Events;

-- to remove complete data from table
truncate table Cultural_Events;

-- to delete complete attributes and records 
drop table Cultural_Events;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for chief guest in Cultural_Events
ALTER TABLE Cultural_Events ADD chief_guest VARCHAR(100);

-- 2. Modify the length of venue field to handle longer names
ALTER TABLE Cultural_Events MODIFY venue VARCHAR(150);

-- 3. Rename column 'theme' to 'event_theme'
ALTER TABLE Cultural_Events CHANGE theme event_theme VARCHAR(100);

-- 4. Drop the description column if not needed
ALTER TABLE Cultural_Events DROP COLUMN description;

-- 5. Find events in Delhi OR Lucknow
SELECT event_name, venue
FROM Cultural_Events
WHERE venue LIKE '%Delhi%' OR venue LIKE '%Lucknow%';

-- 6. Show events not organized by any 'Council'
SELECT event_name, organizer
FROM Cultural_Events
WHERE organizer NOT LIKE '%Council%';

-- 7. Update the entry fee of 'Kala Mahotsav' due to increased costs
UPDATE Cultural_Events
SET entry_fee = 150.00
WHERE event_name = 'Kala Mahotsav';

-- 8. Find events costing more than ₹100 entry fee
SELECT event_name, entry_fee
FROM Cultural_Events
WHERE entry_fee > 100;

-- 9. Increase expected attendance of all Delhi events by 10%
UPDATE Cultural_Events
SET expected_attendance = expected_attendance * 1.10
WHERE venue LIKE '%Delhi%';

-- 10. Mark all events before today as 'Completed'
UPDATE Cultural_Events
SET status = 'Completed'
WHERE date < CURDATE();

-- 11. Show all upcoming cultural events
SELECT event_name, date, venue, status
FROM Cultural_Events
WHERE status = 'Scheduled';

-- 12. Find events with free entry
SELECT event_name, venue, date
FROM Cultural_Events
WHERE entry_fee = 0.00;

-- 13. List all events organized by government bodies (searching 'Dept.' or 'Board')
SELECT event_name, organizer
FROM Cultural_Events
WHERE organizer LIKE '%Dept.%' OR organizer LIKE '%Board%';

-- 14. Count how many events are planned per city
SELECT SUBSTRING_INDEX(venue, ',', -1) AS city, COUNT(*) AS total_events
FROM Cultural_Events
GROUP BY city;

-- 15. Find top 3 events with the highest expected attendance
SELECT event_name, expected_attendance
FROM Cultural_Events
ORDER BY expected_attendance DESC
LIMIT 3;

-- 16. List events happening in 2026
SELECT event_name, date
FROM Cultural_Events
WHERE YEAR(date) = 2026;

-- 17. Find events with entry fees between 20 and 80
SELECT event_name, entry_fee
FROM Cultural_Events
WHERE entry_fee BETWEEN 20 AND 80;

-- 18. Show events where chief guest is assigned
SELECT event_name, chief_guest
FROM Cultural_Events
WHERE chief_guest IS NOT NULL;

-- 19. Find distinct organizers who are conducting events
SELECT DISTINCT organizer
FROM Cultural_Events;

-- 20. Show events sorted first by year then by entry fee
SELECT event_name, date, entry_fee
FROM Cultural_Events
ORDER BY YEAR(date), entry_fee DESC;

-- 21. Find events where expected attendance > 2 * (entry_fee)
SELECT event_name, expected_attendance, entry_fee
FROM Cultural_Events
WHERE expected_attendance > (entry_fee * 2);

-- 22. Show events with either free entry OR expected attendance > 800
SELECT event_name, entry_fee, expected_attendance
FROM Cultural_Events
WHERE entry_fee = 0 OR expected_attendance > 800;

-- 23. Find the average entry fee of all cultural events
SELECT AVG(entry_fee) AS avg_fee
FROM Cultural_Events;

-- 24. Get the maximum expected attendance
SELECT MAX(expected_attendance) AS max_audience
FROM Cultural_Events;

-- 25. Show total revenue if all tickets are sold
SELECT SUM(entry_fee * expected_attendance) AS total_revenue
FROM Cultural_Events;

-- 26. Convert event names to UPPERCASE
SELECT UPPER(event_name) AS event_upper
FROM Cultural_Events;

-- 27. Find month of each event
SELECT event_name, MONTH(date) AS event_month
FROM Cultural_Events;

-- 28. Round entry fee to nearest 10
SELECT event_name, ROUND(entry_fee, -1) AS rounded_fee
FROM Cultural_Events;

-- 29. Show length of each event name
SELECT event_name, LENGTH(event_name) AS name_length
FROM Cultural_Events;

-- 30. Find number of days until each event
SELECT event_name, DATEDIFF(date, CURDATE()) AS days_left
FROM Cultural_Events;

-- 31. Concatenate event name and venue for display
SELECT CONCAT(event_name, ' @ ', venue) AS event_full
FROM Cultural_Events;

-- 32. Find minimum and maximum entry fee together
SELECT MIN(entry_fee) AS min_fee, MAX(entry_fee) AS max_fee
FROM Cultural_Events;

-- 33. Rank events by entry fee (highest to lowest)
SELECT event_name, entry_fee,
       RANK() OVER (ORDER BY entry_fee DESC) AS fee_rank
FROM Cultural_Events;

-- 34. Row number for each event ordered by date
SELECT event_name, date,
       ROW_NUMBER() OVER (ORDER BY date) AS event_order
FROM Cultural_Events;

-- 35. Running total of expected audience by date
SELECT event_name, expected_attendance,
       SUM(expected_attendance) OVER (ORDER BY date) AS running_total
FROM Cultural_Events;

-- 36. Partition events by status and rank by expected audience
SELECT event_name, status, expected_attendance,
       RANK() OVER (PARTITION BY status ORDER BY expected_attendance DESC) AS audience_rank
FROM Cultural_Events;

-- 37. Moving average of entry fee (3-event window)
SELECT event_name, entry_fee,
       AVG(entry_fee) OVER (ORDER BY date ROWS 2 PRECEDING) AS moving_avg_fee
FROM Cultural_Events;

-- 38. Count events by city (venue)
SELECT venue, COUNT(*) AS total_events
FROM Cultural_Events
GROUP BY venue;

-- 39. Find average entry fee per organizer
SELECT organizer, AVG(entry_fee) AS avg_fee
FROM Cultural_Events
GROUP BY organizer;

-- 40. Show only organizers with average entry fee > 80
SELECT organizer, AVG(entry_fee) AS avg_fee
FROM Cultural_Events
GROUP BY organizer
HAVING AVG(entry_fee) > 80;

-- 41. List top 5 events with highest attendance
SELECT event_name, expected_attendance
FROM Cultural_Events
ORDER BY expected_attendance DESC
LIMIT 5;

-- 42. Add NOT NULL constraint to organizer column
ALTER TABLE Cultural_Events
MODIFY organizer VARCHAR(100) NOT NULL;

-- 44. Add CHECK constraint: entry fee must be >= 0
ALTER TABLE Cultural_Events
ADD CONSTRAINT chk_fee CHECK (entry_fee >= 0);

-- 45. Add UNIQUE constraint on event_name
ALTER TABLE Cultural_Events
ADD CONSTRAINT unique_event UNIQUE (event_name);

-- 46. Drop UNIQUE constraint from event_name
ALTER TABLE Cultural_Events
DROP INDEX unique_event;

-- 47. Add DEFAULT constraint to status column
ALTER TABLE Cultural_Events
ALTER status SET DEFAULT 'Scheduled';

-- 48. Trigger to log every insert into Cultural_Events
CREATE TABLE Event_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_event_insert
AFTER INSERT ON Cultural_Events
FOR EACH ROW
INSERT INTO Event_Log(event_name, action)
VALUES (NEW.event_name, 'Inserted');

-- 49. Find events with entry fee higher than the average fee
SELECT event_name, entry_fee
FROM Cultural_Events
WHERE entry_fee > (SELECT AVG(entry_fee) FROM Cultural_Events);

-- 50. Get the event with the maximum expected audience
SELECT event_name, expected_attendance
FROM Cultural_Events
WHERE expected_attendance = (SELECT MAX(expected_attendance) FROM Cultural_Events);

-- 51. Find organizers who manage more than 1 event
SELECT organizer
FROM Cultural_Events
GROUP BY organizer
HAVING COUNT(*) > 1;

-- 52. Find events held in the same city as 'Kala Mahotsav'
SELECT event_name, venue
FROM Cultural_Events
WHERE venue = (SELECT venue FROM Cultural_Events WHERE event_name = 'Kala Mahotsav');

-- 53. Get events scheduled after 'Madhubani Mahotsav'
SELECT event_name, date
FROM Cultural_Events
WHERE date > (SELECT date FROM Cultural_Events WHERE event_name = 'Madhubani Mahotsav');

-- 54. Find the cheapest event(s)
SELECT event_name, entry_fee
FROM Cultural_Events
WHERE entry_fee = (SELECT MIN(entry_fee) FROM Cultural_Events);

-- 55. List events whose audience is above average
SELECT event_name, expected_attendance
FROM Cultural_Events
WHERE expected_attendance > (SELECT AVG(expected_attendance) FROM Cultural_Events);

-- 56. Show events with entry fee less than ALL Chennai events
SELECT event_name, entry_fee
FROM Cultural_Events
WHERE entry_fee < ALL (SELECT entry_fee FROM Cultural_Events WHERE venue LIKE '%Chennai%');

-- 57. Find events organized by organizers who also host in Delhi
SELECT event_name, organizer
FROM Cultural_Events
WHERE organizer IN (SELECT organizer FROM Cultural_Events WHERE venue LIKE '%Delhi%');

-- 58. Calculate potential revenue per organizer
SELECT organizer, SUM(entry_fee * expected_attendance) AS revenue
FROM Cultural_Events
GROUP BY organizer;

-- 59. Rank cities by number of events hosted
SELECT venue, COUNT(*) AS event_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS city_rank
FROM Cultural_Events
GROUP BY venue;

-- 60. Find the top 3 most expensive events
SELECT event_name, entry_fee
FROM Cultural_Events
ORDER BY entry_fee DESC
LIMIT 3;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 16: Event_Participants
CREATE TABLE Event_Participants (
    participant_id INT PRIMARY KEY, -- unique identifier for each participants
    event_id INT,
    artisan_id INT,
    participation_type VARCHAR(50),               
    feedback_score INT CHECK (feedback_score BETWEEN 1 AND 10),
    remarks TEXT,
    certificate_issued BOOLEAN DEFAULT FALSE,          -- Whether a certificate was given
    honorarium DECIMAL(10,2) DEFAULT 0.00,             -- Token amount paid
    attendance_status VARCHAR(20) DEFAULT 'Present',   -- Attendance confirmation
    FOREIGN KEY (event_id) REFERENCES Cultural_Events(event_id),
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id)
);

-- Insert 20 records into Event_Participants table
INSERT INTO Event_Participants (participant_id, event_id, artisan_id, participation_type,feedback_score, remarks, certificate_issued, honorarium, attendance_status) 
VALUES
(1, 1, 1, 'Exhibitor', 9, 'Displayed beautiful Madhubani paintings.', TRUE, 1500.00, 'Present'),
(2, 2, 2, 'Performer', 8, 'Performed Warli dance with group.', TRUE, 1000.00, 'Present'),
(3, 3, 3, 'Speaker', 10, 'Talked on revival of rural embroidery.', TRUE, 2000.00, 'Present'),
(4, 4, 4, 'Exhibitor', 7, 'Exhibited Dhokra brass sculptures.', FALSE, 750.00, 'Present'),
(5, 5, 5, 'Exhibitor', 9, 'Traditional Ajrakh block printing display.', TRUE, 1200.00, 'Present'),
(6, 6, 6, 'Speaker', 10, 'Delivered talk on Tanjore art history.', TRUE, 1800.00, 'Present'),
(7, 7, 7, 'Exhibitor', 8, 'Displayed terracotta miniatures.', FALSE, 900.00, 'Present'),
(8, 8, 8, 'Exhibitor', 9, 'Natural dye Kalamkari demo booth.', TRUE, 1300.00, 'Present'),
(9, 9, 9, 'Performer', 7, 'Tribal bamboo music performance.', FALSE, 700.00, 'Absent'),
(10, 10, 10, 'Speaker', 10, 'Shared journey in scroll storytelling art.', TRUE, 1600.00, 'Present'),
(11, 11, 11, 'Exhibitor', 8, 'Lippan mirror clay panels displayed.', TRUE, 1000.00, 'Present'),
(12, 12, 12, 'Exhibitor', 9, 'Sujni embroidery patches presented.', TRUE, 1100.00, 'Present'),
(13, 13, 13, 'Performer', 8, 'Live Bidri polishing show.', TRUE, 950.00, 'Present'),
(14, 14, 14, 'Exhibitor', 10, 'Displayed latest Chikankari pieces.', TRUE, 1250.00, 'Present'),
(15, 15, 15, 'Performer', 9, 'Wove a backstrap loom live.', FALSE, 500.00, 'Present'),
(16, 16, 16, 'Exhibitor', 10, 'Eco-friendly handmade paper products.', TRUE, 850.00, 'Present'),
(17, 17, 17, 'Speaker', 8, 'Conducted demo on wood relief work.', TRUE, 1500.00, 'Present'),
(18, 18, 18, 'Exhibitor', 7, 'Displayed Channapatna wooden toys.', FALSE, 600.00, 'Present'),
(19, 19, 19, 'Speaker', 10, 'Shared handloom journey in Banaras.', TRUE, 2000.00, 'Present'),
(20, 20, 20, 'Exhibitor', 9, 'Miniature painting live booth.', TRUE, 1100.00, 'Present');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Event_Participants;

-- to remove complete data from table
truncate table Event_Participants;

-- to delete complete attributes and records 
drop table Event_Participants;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column for participant's contact number
ALTER TABLE Event_Participants ADD contact_no VARCHAR(15);

-- 2. DDL: Modify honorarium to store higher amounts
ALTER TABLE Event_Participants MODIFY honorarium DECIMAL(12,2);

-- 3. DML: Update honorarium of absent participants to 0
UPDATE Event_Participants
SET honorarium = 0
WHERE attendance_status = 'Absent';

-- 4. DML: Delete participants with feedback_score less than 5
DELETE FROM Event_Participants
WHERE feedback_score < 5;

-- 5. DQL: Fetch all participants who are Speakers
SELECT participant_id, artisan_id, event_id
FROM Event_Participants
WHERE participation_type = 'Speaker';

-- 6. DQL: Get average feedback score of Exhibitors
SELECT AVG(feedback_score) AS avg_feedback
FROM Event_Participants
WHERE participation_type = 'Exhibitor';

-- 7. Order By: List all participants ordered by honorarium descending
SELECT participant_id, honorarium
FROM Event_Participants
ORDER BY honorarium DESC;

-- 8. Group By: Get count of participants by participation_type
SELECT participation_type, COUNT(*) AS total_participants
FROM Event_Participants
GROUP BY participation_type;

-- 9. Having: Find participation types where average honorarium > 1000
SELECT participation_type, AVG(honorarium) AS avg_hon
FROM Event_Participants
GROUP BY participation_type
HAVING AVG(honorarium) > 1000;

-- 10. Real-life clause: Find participants with feedback score >= 9
SELECT participant_id, feedback_score
FROM Event_Participants
WHERE feedback_score >= 9;

-- 11. Like: Find participants with participation_type ending with 'or'
SELECT participant_id, participation_type
FROM Event_Participants
WHERE participation_type LIKE '%or';

-- 12. Distinct: Find unique participation types
SELECT DISTINCT participation_type
FROM Event_Participants;

-- 13. IS NULL: Find participants without honorarium mentioned
SELECT participant_id, honorarium
FROM Event_Participants
WHERE honorarium IS NULL;

-- 14. Count: Find total participants present
SELECT COUNT(*) AS total_present
FROM Event_Participants
WHERE attendance_status = 'Present';

-- 15. INNER JOIN: Get artisan name with their participation type
SELECT a.name, ep.participation_type, ep.feedback_score
FROM Event_Participants ep
INNER JOIN Artisans a ON ep.artisan_id = a.artisan_id;

-- 16. LEFT JOIN: Show all events and their participants (even if no participant)
SELECT ce.event_name, ep.participant_id, ep.participation_type
FROM Cultural_Events ce
LEFT JOIN Event_Participants ep ON ce.event_id = ep.event_id;

-- 17. RIGHT JOIN: Show all artisans, even if they never participated
SELECT a.name, ep.event_id, ep.participation_type
FROM Event_Participants ep
RIGHT JOIN Artisans a ON ep.artisan_id = a.artisan_id;

-- 18. Self Join: Compare honorarium of participants in the same event
SELECT p1.participant_id AS p1_id, p2.participant_id AS p2_id, p1.honorarium, p2.honorarium
FROM Event_Participants p1
JOIN Event_Participants p2 ON p1.event_id = p2.event_id AND p1.participant_id < p2.participant_id;

-- 19. Operator (AND/OR): Fetch participants who are Exhibitors AND received certificates
SELECT participant_id, artisan_id
FROM Event_Participants
WHERE participation_type = 'Exhibitor' AND certificate_issued = TRUE;

-- 20. Operator (NOT): Find participants who are NOT Speakers
SELECT participant_id, participation_type
FROM Event_Participants
WHERE NOT participation_type = 'Speaker';

-- 21. Arithmetic Operator: Increase honorarium by 10% for all Speakers
SELECT participant_id, honorarium, honorarium * 1.1 AS new_honorarium
FROM Event_Participants
WHERE participation_type = 'Speaker';

-- 22. String Function: Get first 5 characters of participation type
SELECT participant_id, SUBSTRING(participation_type, 1, 5) AS short_type
FROM Event_Participants;

-- 23. String Function: Convert participation type to UPPERCASE
SELECT UPPER(participation_type) AS type_upper
FROM Event_Participants;

-- 24. Numeric Function: Round honorarium to nearest hundred
SELECT participant_id, honorarium, ROUND(honorarium, -2) AS rounded_honorarium
FROM Event_Participants;

-- 25. Aggregate Function: Find maximum honorarium given
SELECT MAX(honorarium) AS max_honorarium
FROM Event_Participants;

-- 26. Aggregate Function: Find minimum feedback score of performers
SELECT MIN(feedback_score) AS min_feedback
FROM Event_Participants
WHERE participation_type = 'Performer';

-- 27. Aggregate Function: Get total honorarium paid to Exhibitors
SELECT SUM(honorarium) AS total_honorarium
FROM Event_Participants
WHERE participation_type = 'Exhibitor';

-- 28. COALESCE: Replace NULL honorarium with 0
SELECT participant_id, COALESCE(honorarium, 0) AS honorarium_safe
FROM Event_Participants;

-- 29. CONCAT: Display artisan name with participation type
SELECT CONCAT(a.name, ' - ', ep.participation_type) AS artisan_role
FROM Event_Participants ep
JOIN Artisans a ON ep.artisan_id = a.artisan_id;

-- 30. Real-life check: Find participants who got both certificate and honorarium > 1000
SELECT participant_id, honorarium, certificate_issued
FROM Event_Participants
WHERE certificate_issued = TRUE AND honorarium > 1000;

-- 31. Real-life JOIN: Get event name, artisan name, and feedback score together
SELECT ce.event_name, a.name, ep.feedback_score
FROM Event_Participants ep
JOIN Cultural_Events ce ON ep.event_id = ce.event_id
JOIN Artisans a ON ep.artisan_id = a.artisan_id;

-- 32. ROW_NUMBER(): Assign row numbers to participants by event
SELECT event_id, participant_id,
       ROW_NUMBER() OVER(PARTITION BY event_id ORDER BY honorarium DESC) AS row_num
FROM Event_Participants;

-- 33. RANK(): Rank participants based on honorarium in each event
SELECT event_id, participant_id, honorarium,
       RANK() OVER(PARTITION BY event_id ORDER BY honorarium DESC) AS rank_pos
FROM Event_Participants;

-- 34. DENSE_RANK(): Handle ties in honorarium ranking
SELECT event_id, participant_id, honorarium,
       DENSE_RANK() OVER(PARTITION BY event_id ORDER BY honorarium DESC) AS dense_rank_pos
FROM Event_Participants;

-- 35. NTILE(): Divide participants into 4 groups based on honorarium
SELECT participant_id, honorarium,
       NTILE(4) OVER (ORDER BY honorarium DESC) AS quartile_group
FROM Event_Participants;

-- 36. LAG(): Compare each participant’s honorarium with the previous one
SELECT participant_id, honorarium,
       LAG(honorarium, 1) OVER (ORDER BY honorarium) AS previous_honorarium
FROM Event_Participants;

-- 37. LEAD(): Compare each participant’s honorarium with the next one
SELECT participant_id, honorarium,
       LEAD(honorarium, 1) OVER (ORDER BY honorarium) AS next_honorarium
FROM Event_Participants;

-- 38. CUME_DIST(): Find cumulative distribution of feedback scores
SELECT participant_id, feedback_score,
       CUME_DIST() OVER (ORDER BY feedback_score) AS cume_dist_value
FROM Event_Participants;

-- 39. Percentile (PERCENT_RANK): Find relative rank of feedback scores
SELECT participant_id, feedback_score,
       PERCENT_RANK() OVER (ORDER BY feedback_score) AS percentile_rank
FROM Event_Participants;

-- 40. SUM() OVER(): Running total of honorarium
SELECT participant_id, honorarium,
       SUM(honorarium) OVER (ORDER BY participant_id) AS running_total
FROM Event_Participants;

-- 41. AVG() OVER(): Average honorarium per participation type
SELECT participation_type, participant_id, honorarium,
       AVG(honorarium) OVER (PARTITION BY participation_type) AS avg_type_honorarium
FROM Event_Participants;

-- 42. Subquery: Find participants who earned above average honorarium
SELECT participant_id, honorarium
FROM Event_Participants
WHERE honorarium > (SELECT AVG(honorarium) FROM Event_Participants);

-- 43. Subquery: Get event names where more than 2 participants attended
SELECT event_name
FROM Cultural_Events
WHERE event_id IN (
  SELECT event_id
  FROM Event_Participants
  GROUP BY event_id
  HAVING COUNT(*) > 2
);

-- 44. Subquery with EXISTS: Find artisans who participated in at least one event
SELECT name
FROM Artisans a
WHERE EXISTS (
  SELECT 1 FROM Event_Participants ep WHERE ep.artisan_id = a.artisan_id
);

-- 45. Correlated Subquery: Find participants who have the maximum feedback in their event
SELECT participant_id, event_id, feedback_score
FROM Event_Participants ep1
WHERE feedback_score = (
  SELECT MAX(feedback_score)
  FROM Event_Participants ep2
  WHERE ep1.event_id = ep2.event_id
);

-- 46. Nested Subquery: Find event with the highest total honorarium paid
SELECT event_name
FROM Cultural_Events
WHERE event_id = (
  SELECT event_id
  FROM Event_Participants
  GROUP BY event_id
  ORDER BY SUM(honorarium) DESC
  LIMIT 1
);

-- 47. Constraint check – Add unique constraint to avoid duplicate artisan in the same event
ALTER TABLE Event_Participants
ADD CONSTRAINT unique_artisan_event UNIQUE (event_id, artisan_id);

-- 48. Clause – ORDER BY feedback score and honorarium
SELECT participant_id, feedback_score, honorarium
FROM Event_Participants
ORDER BY feedback_score DESC, honorarium DESC;

-- 49. Clause – GROUP BY participation type
SELECT participation_type, COUNT(*) AS total_count
FROM Event_Participants
GROUP BY participation_type;

-- 50. Clause – HAVING with condition
SELECT event_id, AVG(feedback_score) AS avg_score
FROM Event_Participants
GROUP BY event_id
HAVING AVG(feedback_score) > 8;

-- 51. Clause – DISTINCT artisans who performed
SELECT DISTINCT artisan_id
FROM Event_Participants
WHERE participation_type = 'Performer';

-- 52. Clause – LIMIT results for top 5 highest honorarium
SELECT participant_id, honorarium
FROM Event_Participants
ORDER BY honorarium DESC
LIMIT 5;

-- 53. Operator – BETWEEN for honorarium range
SELECT participant_id, honorarium
FROM Event_Participants
WHERE honorarium BETWEEN 800 AND 1500;

-- 54. Operator – IN for multiple participation types
SELECT participant_id, participation_type
FROM Event_Participants
WHERE participation_type IN ('Exhibitor', 'Speaker');

-- 55. Function – CONCAT artisan name with event name
SELECT CONCAT(a.name, ' - ', c.event_name) AS full_info
FROM Event_Participants ep
JOIN Artisans a ON ep.artisan_id = a.artisan_id
JOIN Cultural_Events c ON ep.event_id = c.event_id;

-- 56. Subquery – Participants with honorarium greater than event average
SELECT participant_id, honorarium
FROM Event_Participants ep
WHERE honorarium > (
  SELECT AVG(honorarium)
  FROM Event_Participants
  WHERE event_id = ep.event_id
);

-- 57. Subquery – Events where at least one artisan scored a perfect 10
SELECT event_name
FROM Cultural_Events
WHERE event_id IN (
  SELECT DISTINCT event_id
  FROM Event_Participants
  WHERE feedback_score = 10
);

-- 58. Subquery – Find top participant per event (highest honorarium)
SELECT ep.participant_id, ep.event_id, ep.honorarium
FROM Event_Participants ep
WHERE ep.honorarium = (
  SELECT MAX(honorarium)
  FROM Event_Participants
  WHERE event_id = ep.event_id
);

-- 59. Real life – Count how many artisans got certificates across events
SELECT c.event_name, COUNT(*) AS certified_participants
FROM Event_Participants ep
JOIN Cultural_Events c ON ep.event_id = c.event_id
WHERE certificate_issued = TRUE
GROUP BY c.event_name;

-- 60. Real life – Find event with the highest total honorarium paid
SELECT c.event_name, SUM(ep.honorarium) AS total_honorarium
FROM Event_Participants ep
JOIN Cultural_Events c ON ep.event_id = c.event_id
GROUP BY c.event_name
ORDER BY total_honorarium DESC
LIMIT 1;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 17: Research_Projects
CREATE TABLE Research_Projects (
    project_id INT PRIMARY KEY, -- unique identifier for each project
    title VARCHAR(100) NOT NULL,
    description TEXT,
    lead_researcher VARCHAR(100),
    start_date DATE,
    end_date DATE,
    funding_amount DECIMAL(10,2),
    focus_area VARCHAR(100),
    associated_craft VARCHAR(100),
    status VARCHAR(50) DEFAULT 'Ongoing'
);

-- Insert 20 records into Research_Projects table
INSERT INTO Research_Projects (project_id, title, description, lead_researcher, start_date,end_date, funding_amount, focus_area, associated_craft, status)
 VALUES
(1, 'Revival of Madhubani Motifs', 'A study on preserving traditional Mithila iconography.', 'Dr. Neha Jha', '2025-01-15', '2025-12-15', 500000.00, 'Folk Art Preservation', 'Madhubani', 'Ongoing'),
(2, 'Digitization of Warli Patterns', 'Creating a digital archive of tribal Warli art.', 'Dr. Prakash Patil', '2025-02-01', '2025-11-30', 450000.00, 'Digital Heritage', 'Warli', 'Ongoing'),
(3, 'Zardozi Embroidery Techniques', 'Exploration of lost stitches and designs.', 'Prof. Saira Khan', '2025-03-01', '2026-02-28', 600000.00, 'Textile Innovation', 'Zardozi', 'Ongoing'),
(4, 'Dhokra Casting Methods', 'Study of wax modeling and mold recycling.', 'Dr. Mahendra Bastar', '2024-10-10', '2025-09-10', 480000.00, 'Metal Craft Study', 'Dhokra', 'Ongoing'),
(5, 'Ajrakh Natural Dye Research', 'Testing new organic dyes in block printing.', 'Dr. Firoz Khatri', '2025-04-01', '2026-03-31', 550000.00, 'Sustainable Textiles', 'Ajrakh', 'Ongoing'),
(6, 'Tanjore Art Pigments', 'Documenting ancient gold leaf techniques.', 'Prof. Meenakshi Iyer', '2025-05-01', '2025-11-01', 400000.00, 'Art Material Studies', 'Tanjore Painting', 'Ongoing'),
(7, 'Traditional Terracotta Recipes', 'Experimenting with clay blends for toy making.', 'Dr. Satyajit Roy', '2025-02-15', '2025-12-01', 300000.00, 'Ceramic Research', 'Terracotta', 'Ongoing'),
(8, 'Narratives in Kalamkari', 'Studying storylines and iconography evolution.', 'Prof. Padmavati Rao', '2025-01-20', '2025-10-30', 470000.00, 'Visual Storytelling', 'Kalamkari', 'Ongoing'),
(9, 'Bamboo Craft Strength Testing', 'Mechanical tests for design and durability.', 'Dr. Bijoy Rabha', '2025-06-01', '2026-05-31', 520000.00, 'Eco Craft Research', 'Bamboo Weaving', 'Ongoing'),
(10, 'Pattachitra Paint Chemistry', 'Analysing natural binders and colors.', 'Dr. Jagannath Das', '2025-03-10', '2026-01-20', 430000.00, 'Pigment Study', 'Pattachitra', 'Ongoing'),
(11, 'Mirror Adhesives in Lippan Art', 'Testing clay types and mirror glue combos.', 'Dr. Kamla Rabari', '2025-05-20', '2026-04-30', 310000.00, 'Folk Technique Testing', 'Lippan Art', 'Ongoing'),
(12, 'Sujni as Visual Record', 'Tracking oral history through Sujni patches.', 'Prof. Neelam Kumari', '2025-07-01', '2026-06-30', 380000.00, 'Storytelling Textiles', 'Sujni', 'Ongoing'),
(13, 'Surface Techniques in Bidri', 'New polishing and silver inlay methods.', 'Dr. Salim Ustad', '2025-08-01', '2026-07-01', 650000.00, 'Metal Surface Study', 'Bidriware', 'Ongoing'),
(14, 'Evolution of Chikankari Patterns', 'From Awadhi courts to modern fashion.', 'Prof. Shabnam Ali', '2025-04-10', '2026-02-28', 420000.00, 'Cultural Stitching', 'Chikankari', 'Ongoing'),
(15, 'Tribal Loom Ergonomics', 'Designing better backstrap looms for artisans.', 'Dr. Lalhmingi Ralte', '2025-06-10', '2026-06-10', 480000.00, 'Craft Tools Research', 'Backstrap Weaving', 'Ongoing'),
(16, 'Handmade Paper Eco Impact', 'Measuring carbon footprint reduction.', 'Dr. Rajveer Bhati', '2025-03-05', '2025-12-05', 360000.00, 'Eco Studies', 'Handmade Paper', 'Ongoing'),
(17, 'Wood Carving Tools Study', 'Tool types vs finish in relief work.', 'Dr. Sudarshan Panda', '2025-02-10', '2025-12-10', 395000.00, 'Tool Efficiency', 'Wood Carving', 'Ongoing'),
(18, 'Channapatna Toy Safety Research', 'Testing for child safety in colors and shapes.', 'Dr. Vishwanath Naik', '2025-01-25', '2025-11-25', 450000.00, 'Toy Safety', 'Channapatna Toys', 'Ongoing'),
(19, 'Banarasi Weave Documentation', 'Digitally mapping Varanasi weaving clusters.', 'Prof. Meera Gupta', '2025-05-15', '2026-04-15', 610000.00, 'Weaver Studies', 'Banarasi Weaving', 'Ongoing'),
(20, 'Preserving Miniature Art Styles', 'A comparative study across Rajasthan.', 'Dr. Anil Patwardhan', '2025-07-01', '2026-06-30', 575000.00, 'Miniature Traditions', 'Miniature Painting', 'Ongoing');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Research_Projects;

-- to remove complete data from table
truncate table Research_Projects;

-- to delete complete attributes and records 
drop table Research_Projects;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add column to store partner institutions for each project.
ALTER TABLE Research_Projects ADD COLUMN partner_institution VARCHAR(200);

-- 2. Add column to record project PI email for contact.
ALTER TABLE Research_Projects ADD COLUMN lead_email VARCHAR(150);

-- 3. Modify funding_amount precision to support larger grants.
ALTER TABLE Research_Projects MODIFY funding_amount DECIMAL(14,2);

-- 4. Create an index on focus_area to speed lookups for similar projects.
CREATE INDEX idx_focus_area ON Research_Projects(focus_area);

-- 5. Add NOT NULL constraint on title to ensure titles always provided.
ALTER TABLE Research_Projects MODIFY title VARCHAR(100) NOT NULL;

-- 6. Add UNIQUE constraint on title to avoid duplicate project titles.
ALTER TABLE Research_Projects ADD CONSTRAINT uq_project_title UNIQUE (title);

-- 7. Create a lightweight view listing ongoing projects and lead contact.
CREATE VIEW Ongoing_Projects AS
SELECT project_id, title, lead_researcher, lead_email, start_date, end_date
FROM Research_Projects
WHERE status = 'Ongoing';

-- 8. Add column to tag projects by funding source (Govt/Private/Trust)
ALTER TABLE Research_Projects ADD COLUMN funding_source VARCHAR(50) DEFAULT 'Private';

-- 9. Delete a project that was duplicated by mistake
DELETE FROM Research_Projects WHERE project_id = 99;

-- 10. Set funding_source to 'Government' for projects funded by govt program
UPDATE Research_Projects SET funding_source = 'Government' WHERE project_id IN (4,13);

-- 11. Reduce funding_amount for a delayed project as penalty
UPDATE Research_Projects SET funding_amount = funding_amount - 20000 WHERE project_id = 7;

-- 12. Average project duration in days (end_date - start_date)
SELECT title, DATEDIFF(end_date, start_date) AS duration_days FROM Research_Projects;

-- 13. Projects that will end in next 90 days (for close-out planning)
SELECT project_id, title, end_date FROM Research_Projects WHERE end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 90 DAY);

-- 14. Show projects with missing lead email (data quality)
SELECT project_id, title FROM Research_Projects WHERE lead_email IS NULL;

-- 15. List projects started in Q1 of 2025
SELECT project_id, title, start_date FROM Research_Projects WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- 16. Projects with funding above average (uses subquery)
SELECT project_id, title, funding_amount
FROM Research_Projects
WHERE funding_amount > (SELECT AVG(funding_amount) FROM Research_Projects);

-- 17. Join Research_Projects with Craft_Types to show craft metadata (if craft names match)
SELECT rp.project_id, rp.title, c.craft_name, c.origin_state
FROM Research_Projects rp
LEFT JOIN Craft_Types c ON rp.associated_craft = c.craft_name;

-- 18. Join with Workshops to show projects that had associated workshops (text match)
SELECT rp.project_id, rp.title, w.title AS workshop_title, w.start_date
FROM Research_Projects rp
LEFT JOIN Workshops w ON rp.associated_craft LIKE CONCAT('%', w.title, '%');

-- 19. Join projects with Training_Programs to identify training outputs
SELECT rp.project_id, rp.title, tp.title AS training_title, tp.instructor
FROM Research_Projects rp
LEFT JOIN Training_Programs tp ON rp.associated_craft = tp.title OR rp.associated_craft LIKE CONCAT('%', tp.title, '%');

-- 20. Join with Program_Enrollments to count artisans trained under a project (if mapping exists)
SELECT rp.title, COUNT(DISTINCT pe.artisan_id) AS artisans_trained
FROM Research_Projects rp
LEFT JOIN Program_Enrollments pe ON rp.associated_craft = (SELECT associated_craft FROM Research_Projects WHERE project_id = rp.project_id)
GROUP BY rp.title;

-- 21. Join with Exhibitions to list events where project findings were presented
SELECT rp.title, e.title AS exhibition_title, e.start_date
FROM Research_Projects rp
LEFT JOIN Exhibitions e ON e.theme LIKE CONCAT('%', rp.associated_craft, '%');

-- 22. Join with Artworks to list artworks influenced by project research (heuristic join)
SELECT rp.title, a.title AS artwork_title, a.creation_date
FROM Research_Projects rp
JOIN Artworks a ON a.material_used LIKE CONCAT('%', rp.associated_craft, '%');

-- 23. Inner join projects and donors (donations to research) via Donors table if linked by title in remarks
SELECT rp.title, d.name, d.donation_amount
FROM Research_Projects rp
JOIN Donors d ON d.donor_message LIKE CONCAT('%', rp.title, '%');

-- 24. Aggregate join: total funding by focus_area and average funding
SELECT rp.focus_area, SUM(rp.funding_amount) AS total_by_focus, AVG(rp.funding_amount) AS avg_by_focus
FROM Research_Projects rp
GROUP BY rp.focus_area;

-- 25. Join with Sponsorships to find corporate sponsors for project dissemination events (text match)
SELECT rp.title, s.sponsor_name, s.amount
FROM Research_Projects rp
LEFT JOIN Sponsorships s ON s.event_name LIKE CONCAT('%', rp.associated_craft, '%');

-- 26. Find projects that had workshop sessions and how many participants registered (join multiple tables)
SELECT rp.title, w.title AS workshop, COUNT(r.registration_id) AS registrations
FROM Research_Projects rp
JOIN Workshops w ON w.craft_type_id IN (SELECT craft_type_id FROM Craft_Types WHERE craft_name = rp.associated_craft)
LEFT JOIN Registrations r ON r.workshop_id = w.workshop_id
GROUP BY rp.title, w.title;

-- 27. Cross-check projects whose lead_researcher is also listed as an artisan (possible practitioner-researcher)
SELECT rp.title, a.name AS artisan_name
FROM Research_Projects rp
JOIN Artisans a ON LOWER(rp.lead_researcher) LIKE CONCAT('%', LOWER(a.name), '%');

-- 28. Projects with related sales revenue (show if research led to sale of artworks)
SELECT rp.title, SUM(sa.sale_price) AS sale_revenue
FROM Research_Projects rp
LEFT JOIN Artworks aw ON aw.craft_type_id = (SELECT craft_type_id FROM Craft_Types WHERE craft_name = rp.associated_craft LIMIT 1)
LEFT JOIN Sales sa ON aw.artwork_id = sa.artwork_id
GROUP BY rp.title;

-- 29. Show project duration in days using DATEDIFF
SELECT project_id, title, DATEDIFF(end_date, start_date) AS duration_days FROM Research_Projects;

-- 30. Uppercase lead researcher names for badges
SELECT project_id, UPPER(lead_researcher) AS lead_upper FROM Research_Projects;

-- 31. Format funding amount with thousands separator for reports
SELECT project_id, CONCAT('₹', FORMAT(funding_amount,2)) AS formatted_funding FROM Research_Projects;

-- 32. Extract year of project start
SELECT project_id, title, YEAR(start_date) AS start_year FROM Research_Projects;

-- 33. Find projects that started within the last 6 months
SELECT project_id, title FROM Research_Projects WHERE start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 34. Use COALESCE to show a default partner institution
SELECT project_id, title, COALESCE(partner_institution, 'Independent') AS partner FROM Research_Projects;

-- 35. Calculate funding per month (funding_amount / months)
SELECT project_id, title, funding_amount / NULLIF(DATEDIFF(end_date, start_date) / 30, 0) AS funding_per_month FROM Research_Projects;

-- 36. String search: find projects with 'dye' in description (case-insensitive)
SELECT project_id, title FROM Research_Projects WHERE LOWER(description) LIKE '%dye%';

-- 37. Use CONCAT to create a short project label
SELECT project_id, CONCAT(LEFT(title,30), '...', ' [', associated_craft, ']') AS short_label FROM Research_Projects;

-- 38. Rank projects by funding amount
SELECT project_id, title, funding_amount, RANK() OVER (ORDER BY funding_amount DESC) AS fund_rank FROM Research_Projects;

-- 39. Running total of funding ordered by start_date (useful for fiscal reports)
SELECT project_id, title, funding_amount,
       SUM(funding_amount) OVER (ORDER BY start_date) AS cumulative_funding
FROM Research_Projects;

-- 40. Average funding by focus_area using window partition
SELECT project_id, title, focus_area, funding_amount,
       AVG(funding_amount) OVER (PARTITION BY focus_area) AS avg_focus_funding
FROM Research_Projects;

-- 41. NTILE to bucket projects into 4 funding quartiles
SELECT project_id, title, funding_amount, NTILE(4) OVER (ORDER BY funding_amount DESC) AS funding_quartile FROM Research_Projects;

-- 42. Lead researcher-wise running count of projects
SELECT lead_researcher, project_id,
       ROW_NUMBER() OVER (PARTITION BY lead_researcher ORDER BY start_date) AS researcher_project_no
FROM Research_Projects;

-- 43. Percentile rank of funding in the portfolio
SELECT project_id, title, PERCENT_RANK() OVER (ORDER BY funding_amount) AS funding_percentile FROM Research_Projects;

-- 44. Use BETWEEN to find projects with funding between 300k and 600k
SELECT project_id, title, funding_amount FROM Research_Projects WHERE funding_amount BETWEEN 300000 AND 600000;

-- 45. Use IN to find projects focusing on specific areas
SELECT project_id, title FROM Research_Projects WHERE focus_area IN ('Sustainable Textiles', 'Ceramic Research');

-- 46. HAVING: focus areas where total funding > 1,000,000
SELECT focus_area, SUM(funding_amount) AS tot
FROM Research_Projects
GROUP BY focus_area
HAVING SUM(funding_amount) > 1000000;

-- 47. Add CHECK to ensure funding_amount >= 0
ALTER TABLE Research_Projects ADD CONSTRAINT chk_funding_nonneg CHECK (funding_amount >= 0);

-- 48. Change status default to 'Proposed' for new entries (example)
ALTER TABLE Research_Projects ALTER status SET DEFAULT 'Proposed';

-- 49. Add NOT NULL constraint on associated_craft for projects that require craft mapping
ALTER TABLE Research_Projects MODIFY associated_craft VARCHAR(100) NOT NULL;

-- 50. Find projects whose title contains 'weave' or 'weaving' using REGEXP
SELECT project_id, title FROM Research_Projects WHERE title REGEXP 'weav|weaving';

-- 51. Subquery: Projects funded above the overall average (single-row subquery)
SELECT project_id, title, funding_amount
FROM Research_Projects
WHERE funding_amount > (SELECT AVG(funding_amount) FROM Research_Projects);

-- 52. Subquery IN: Projects associated with craft types that are 'Endangered' in Craft_Types table
SELECT project_id, title, associated_craft
FROM Research_Projects
WHERE associated_craft IN (SELECT craft_name FROM Craft_Types WHERE preservation_status = 'Endangered');

-- 53. Nested subquery: Projects whose lead_researcher has also led the most-funded project
SELECT title, lead_researcher
FROM Research_Projects
WHERE lead_researcher = (SELECT lead_researcher FROM Research_Projects ORDER BY funding_amount DESC LIMIT 1);

-- 54. Subquery with aggregation: Focus areas whose average funding is above portfolio average
SELECT focus_area
FROM (SELECT focus_area, AVG(funding_amount) AS avg_funding FROM Research_Projects GROUP BY focus_area) AS sub
WHERE sub.avg_funding > (SELECT AVG(funding_amount) FROM Research_Projects);

-- 55. Multi-level: Projects that overlap in time with a given project (e.g., project_id = 1)
SELECT rp2.project_id, rp2.title
FROM Research_Projects rp2
WHERE rp2.start_date <= (SELECT end_date FROM Research_Projects WHERE project_id = 1)
  AND rp2.end_date >= (SELECT start_date FROM Research_Projects WHERE project_id = 1)
  AND rp2.project_id <> 1;

-- 56. Subquery to find projects that resulted in at least one artwork sale (via Artworks -> Sales)
SELECT rp.title
FROM Research_Projects rp
WHERE EXISTS (
  SELECT 1 FROM Artworks a
  JOIN Sales s ON a.artwork_id = s.artwork_id
  JOIN Craft_Types ct ON a.craft_type_id = ct.craft_type_id
  WHERE ct.craft_name = rp.associated_craft
);

-- 57. Compare project funding to total sponsorship for events where findings were presented (joins + subquery)
SELECT rp.title, rp.funding_amount,
       (SELECT COALESCE(SUM(s.amount),0) FROM Sponsorships s WHERE s.event_name LIKE CONCAT('%', rp.associated_craft, '%')) AS related_sponsorship
FROM Research_Projects rp
ORDER BY rp.funding_amount DESC;

-- 58. Subquery: Find lead_researchers who have more than one project (HAVING inside subquery)
SELECT DISTINCT lead_researcher
FROM Research_Projects
WHERE lead_researcher IN (SELECT lead_researcher FROM Research_Projects GROUP BY lead_researcher HAVING COUNT(*) > 1);

-- 59. Subquery: Projects that have training outputs (count enrollments > 0)
SELECT rp.title
FROM Research_Projects rp
WHERE (SELECT COUNT(*) FROM Program_Enrollments pe WHERE pe.program_id IN (SELECT program_id FROM Training_Programs WHERE target_audience LIKE CONCAT('%', rp.associated_craft, '%'))) > 0;

-- 60. Scalar subquery: Show for each project the max sale price of artworks from that craft (NULL if none)
SELECT project_id, title,
  (SELECT MAX(sa.sale_price) FROM Sales sa JOIN Artworks a ON sa.artwork_id = a.artwork_id JOIN Craft_Types ct ON a.craft_type_id = ct.craft_type_id WHERE ct.craft_name = rp.associated_craft) AS max_artwork_sale
FROM Research_Projects rp;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 18: Publications
CREATE TABLE Publications (
    publication_id INT PRIMARY KEY, -- unique identifier for each publication
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publish_date DATE,
    project_id INT,
    type VARCHAR(50),
    language VARCHAR(50),
    file_url TEXT,
    summary TEXT,
    FOREIGN KEY (project_id) REFERENCES Research_Projects(project_id)
);

-- Insert 20 records into Publications table
INSERT INTO Publications (publication_id, title, author, publish_date, project_id,type, language, file_url, summary) 
VALUES
(1, 'The Revival of Mithila Motifs', 'Dr. Neha Jha', '2025-06-20', 1, 'Journal Article', 'Hindi', 'files/mithila_motifs.pdf', 'Analyzes recurring themes in Madhubani art.'),
(2, 'Digital Preservation of Warli Art', 'Dr. Prakash Patil', '2025-07-15', 2, 'Conference Paper', 'English', 'files/warli_digital.pdf', 'Study on digitizing tribal wall paintings.'),
(3, 'Threading Royalty: Zardozi Today', 'Prof. Saira Khan', '2025-08-10', 3, 'Research Report', 'Urdu', 'files/zardozi_report.pdf', 'Field research on surviving zardozi centers.'),
(4, 'Dhokra Craft Techniques in Bastar', 'Dr. Mahendra Bastar', '2025-09-01', 4, 'Field Study', 'Hindi', 'files/dhokra_bastar.pdf', 'Detailed account of lost-wax casting methods.'),
(5, 'Ajrakh Prints and Natural Dyes', 'Dr. Firoz Khatri', '2025-09-25', 5, 'Research Paper', 'Gujarati', 'files/ajrakh_dyes.pdf', 'Explores sustainable dye use in Ajrakh craft.'),
(6, 'Gold Leaf Techniques in Tanjore Art', 'Prof. Meenakshi Iyer', '2025-10-05', 6, 'Monograph', 'Tamil', 'files/tanjore_gold.pdf', 'Documenting pigment layers in Tanjore painting.'),
(7, 'Reviving Terracotta Traditions', 'Dr. Satyajit Roy', '2025-10-20', 7, 'Case Study', 'Bengali', 'files/terracotta_study.pdf', 'Examines recipes and baking practices.'),
(8, 'Kalamkari as Visual Storytelling', 'Prof. Padmavati Rao', '2025-11-02', 8, 'Journal Article', 'Telugu', 'files/kalamkari_story.pdf', 'Focus on narrative elements in Kalamkari.'),
(9, 'Strength & Design in Bamboo Crafts', 'Dr. Bijoy Rabha', '2025-11-18', 9, 'Technical Report', 'Assamese', 'files/bamboo_strength.pdf', 'Reports strength testing on bamboo products.'),
(10, 'Natural Pigments in Pattachitra', 'Dr. Jagannath Das', '2025-12-01', 10, 'Research Paper', 'Odia', 'files/pattachitra_pigments.pdf', 'Chemical analysis of traditional pigments.'),
(11, 'Mirror Techniques in Lippan Art', 'Dr. Kamla Rabari', '2025-12-15', 11, 'Workshop Guide', 'Gujarati', 'files/lippan_mirrors.pdf', 'Instructional guide for Lippan mirrorwork.'),
(12, 'Sujni and Oral Histories', 'Prof. Neelam Kumari', '2026-01-05', 12, 'Book Chapter', 'Hindi', 'files/sujni_oral.pdf', 'Sujni as a textile archive for folk tales.'),
(13, 'Silver Inlay Methods in Bidriware', 'Dr. Salim Ustad', '2026-01-20', 13, 'Research Article', 'Urdu', 'files/bidri_silver.pdf', 'Techniques of polishing and silver inlay.'),
(14, 'Awadhi Style in Chikankari', 'Prof. Shabnam Ali', '2026-02-02', 14, 'Research Summary', 'Hindi', 'files/chikankari_awadh.pdf', 'Cultural transition of motifs over time.'),
(15, 'Loom Ergonomics for Tribal Weavers', 'Dr. Lalhmingi Ralte', '2026-02-15', 15, 'Field Report', 'Mizo', 'files/loom_ergonomics.pdf', 'Improving design for tribal backstrap looms.'),
(16, 'Eco Impact of Handmade Paper', 'Dr. Rajveer Bhati', '2026-03-01', 16, 'Environment Report', 'Hindi', 'files/handmade_eco.pdf', 'Carbon footprint study of handmade paper.'),
(17, 'Tool Types in Wood Carving', 'Dr. Sudarshan Panda', '2026-03-12', 17, 'Research Brief', 'Odia', 'files/woodcarving_tools.pdf', 'Study on finish vs tool variation.'),
(18, 'Safe Play: Channapatna Toys', 'Dr. Vishwanath Naik', '2026-03-25', 18, 'Safety Report', 'Kannada', 'files/toy_safety.pdf', 'Test results on toy coating and design.'),
(19, 'Banarasi Weaves Digital Mapping', 'Prof. Meera Gupta', '2026-04-05', 19, 'Documentation Report', 'Hindi', 'files/banarasi_mapping.pdf', 'Geographic data on weaving clusters.'),
(20, 'Miniature Painting Styles of Rajasthan', 'Dr. Anil Patwardhan', '2026-04-20', 20, 'Journal Article', 'Marathi', 'files/miniature_styles.pdf', 'Comparison of Kishangarh, Udaipur, and Bundi schools.');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Publications;

-- to remove complete data from table
truncate table Publications;

-- to delete complete attributes and records 
drop table Publications;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1️. DDL: Add a new column for citation count (helps track how many times publication cited)
ALTER TABLE Publications ADD citation_count INT DEFAULT 0;

-- 2️. DDL: Modify column type for file_url (to support larger links if stored in cloud)
ALTER TABLE Publications MODIFY file_url VARCHAR(255);

-- 3. DDL: Rename column type to publication_type for better clarity
ALTER TABLE Publications RENAME COLUMN type TO publication_type;

-- 4. DML: Update citation count for a particular publication
UPDATE Publications SET citation_count = citation_count + 5 WHERE publication_id = 1;

-- 5. DML: Delete a publication if withdrawn by the author
DELETE FROM Publications WHERE publication_id = 5;

-- 6. DQL: Find all publications after Jan 2026
SELECT title, publish_date FROM Publications WHERE publish_date > '2026-01-01';

-- 7. Clause: Use ORDER BY to list publications from latest to oldest
SELECT title, publish_date FROM Publications ORDER BY publish_date DESC;

-- 8. Clause: Use LIKE to find publications about "Art"
SELECT * FROM Publications WHERE title LIKE '%Art%';

-- 9. Clause: Use IN to filter publications in Hindi or Urdu
SELECT * FROM Publications WHERE language IN ('Hindi', 'Urdu');

-- 1️0. Clause: Use BETWEEN to get publications from Feb 2026 to Apr 2026
SELECT * FROM Publications WHERE publish_date BETWEEN '2026-02-01' AND '2026-04-30';

-- 1️1. Clause: Use LIMIT to fetch top 5 recent publications
SELECT * FROM Publications ORDER BY publish_date DESC LIMIT 5;

-- 1️2. Constraint: Add UNIQUE constraint on title to avoid duplicate publications
ALTER TABLE Publications ADD CONSTRAINT unique_title UNIQUE (title);

-- 1️3. Constraint: Add CHECK to ensure citation_count is never negative
ALTER TABLE Publications ADD CONSTRAINT check_citation CHECK (citation_count >= 0);

-- 14. LIMIT: Get top 3 most recent publications
SELECT title, publish_date
FROM Publications
ORDER BY publish_date DESC
LIMIT 3;

-- 15. Add a CHECK constraint to ensure citation_count >= 0
ALTER TABLE Publications
ADD CONSTRAINT chk_citation CHECK (citation_count >= 0);

-- 16. Drop a constraint (example: remove chk_citation if not needed)
ALTER TABLE Publications
DROP CONSTRAINT chk_citation;

-- 17. Find publications with citation_count above overall average
SELECT title, citation_count
FROM Publications
WHERE citation_count > (SELECT AVG(citation_count) FROM Publications);

-- 18. Find the most cited publication (subquery with MAX)
SELECT title, citation_count
FROM Publications
WHERE citation_count = (SELECT MAX(citation_count) FROM Publications);

-- 19. Get publications linked to projects with funding > 500000
SELECT title, project_id
FROM Publications
WHERE project_id IN (
    SELECT project_id FROM Research_Projects WHERE funding_amount > 500000
);

-- 20. Find authors who published more than 1 paper
SELECT author
FROM Publications
GROUP BY author
HAVING COUNT(*) > 1;

-- 21. Get latest publication per project
SELECT project_id, title, publish_date
FROM Publications p
WHERE publish_date = (
    SELECT MAX(p2.publish_date)
    FROM Publications p2
    WHERE p.project_id = p2.project_id
);

-- 22. Find average citation_count per language
SELECT language, AVG(citation_count) AS avg_citations
FROM Publications
GROUP BY language;

-- 23. List authors with their total publications
SELECT author, COUNT(*) AS total_pubs
FROM Publications
GROUP BY author;

-- 24. Find top 3 projects with maximum publications
SELECT project_id, COUNT(*) AS total_pubs
FROM Publications
GROUP BY project_id
ORDER BY total_pubs DESC
LIMIT 3;

-- 25. Show publications and their project funding
SELECT p.title, r.funding_amount
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id;

-- 26. Find percentage contribution of each publication’s citations to total citations
SELECT title, citation_count,
       (citation_count * 100.0 / (SELECT SUM(citation_count) FROM Publications)) AS percent_contribution
FROM Publications;

-- 27. Use CASE to categorize publications by citation_count
SELECT title, citation_count,
CASE
   WHEN citation_count >= 100 THEN 'Highly Cited'
   WHEN citation_count BETWEEN 50 AND 99 THEN 'Moderately Cited'
   ELSE 'Low Cited'
END AS citation_category
FROM Publications;

-- 28. Use EXISTS: Find projects that already have at least 1 publication
SELECT project_id, title
FROM Research_Projects r
WHERE EXISTS (SELECT 1 FROM Publications p WHERE p.project_id = r.project_id);

-- 29. Correlated Subquery: Find publications that are the earliest in their project
SELECT title, publish_date, project_id
FROM Publications p1
WHERE publish_date = (
   SELECT MIN(p2.publish_date)
   FROM Publications p2
   WHERE p1.project_id = p2.project_id
);

-- 30. Real-life query: Count how many publications are in each language
SELECT language, COUNT(*) AS total_publications
FROM Publications
GROUP BY language;

-- 31. JOIN: Show publication title along with related project name
SELECT p.title
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id;

-- 3️2. JOIN: List all projects with their publications (including those without publications)
SELECT r.title, p.title
FROM Research_Projects r
LEFT JOIN Publications p ON r.project_id = p.project_id;

-- 3️3. JOIN with WHERE: Publications in Hindi along with project names
SELECT p.title, r.title
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id
WHERE p.language = 'Hindi';

-- 3️4. Function: Count total publications in the database
SELECT COUNT(*) AS total_publications FROM Publications;

-- 3️5. Function: Get earliest publication date (oldest research)
SELECT MIN(publish_date) AS first_publication FROM Publications;

-- 3️6. Function: Get most recent publication date
SELECT MAX(publish_date) AS latest_publication FROM Publications;

-- 3️7. Function: Average citation count across all publications
SELECT AVG(citation_count) AS avg_citations FROM Publications;

-- 3️8. Function: Length of longest publication title
SELECT MAX(LENGTH(title)) AS longest_title_length FROM Publications;

-- 3️9. Function: Display title in uppercase for indexing in catalog
SELECT UPPER(title) AS title_upper FROM Publications;

-- 4️0. Function: Get first 10 characters of title (abbreviation for library catalog)
SELECT LEFT(title, 10) AS short_title FROM Publications;

-- 4️1. Rank publications by citation_count (highest first)
SELECT publication_id, title, citation_count,
       RANK() OVER (ORDER BY citation_count DESC) AS rank_by_citations
FROM Publications;

-- 4️2. Dense Rank by publish_date (oldest to newest)
SELECT title, publish_date,
       DENSE_RANK() OVER (ORDER BY publish_date ASC) AS pub_order
FROM Publications;

-- 4️3. Row Number: Assign a unique row number to each publication
SELECT title, ROW_NUMBER() OVER (ORDER BY publication_id) AS row_num
FROM Publications;

-- 4️4. NTILE: Divide publications into 4 groups based on publish_date
SELECT title, publish_date,
       NTILE(4) OVER (ORDER BY publish_date) AS quarter_group
FROM Publications;

-- 4️5. Lag: Compare current citation_count with previous one
SELECT title, citation_count,
       LAG(citation_count, 1) OVER (ORDER BY publish_date) AS prev_citation
FROM Publications;

-- 4️6. Lead: Predict next publication’s citation_count
SELECT title, citation_count,
       LEAD(citation_count, 1) OVER (ORDER BY publish_date) AS next_citation
FROM Publications;

-- 4️7. Moving Average citations across 3 publications
SELECT title, citation_count,
       AVG(citation_count) OVER (ORDER BY publish_date ROWS 2 PRECEDING) AS moving_avg
FROM Publications;

-- 48. Cumulative sum of citations (running total)
SELECT title, citation_count,
       SUM(citation_count) OVER (ORDER BY publish_date) AS cumulative_citations
FROM Publications;

-- 49. Comparison: Find publications with more than 100 citations
SELECT title, citation_count
FROM Publications
WHERE citation_count > 100;

-- 5️0. Logical: Get Hindi OR Gujarati publications
SELECT title, language
FROM Publications
WHERE language = 'Hindi' OR language = 'Gujarati';

-- 5️1. Between: Publications published between Jan and June 2025
SELECT title, publish_date
FROM Publications
WHERE publish_date BETWEEN '2025-01-01' AND '2025-06-30';

-- 5️2. IN: Publications in English, Hindi, or Tamil
SELECT title, language
FROM Publications
WHERE language IN ('English', 'Hindi', 'Tamil');

-- 5️3. LIKE: Search for titles containing 'Art'
SELECT title
FROM Publications
WHERE title LIKE '%Art%';

-- 5️4. IS NULL: Find publications without file links
SELECT title
FROM Publications
WHERE file_url IS NULL;

-- 5️5. DISTINCT: List all distinct languages of publications
SELECT DISTINCT(language) FROM Publications;

-- 5️6. GROUP BY: Count publications per language
SELECT language, COUNT(*) AS total_pubs
FROM Publications
GROUP BY language;

-- 5️7. HAVING: Show only languages with more than 2 publications
SELECT language, COUNT(*) AS total_pubs
FROM Publications
GROUP BY language
HAVING COUNT(*) > 2;

-- 5️8. ORDER BY: Show publications sorted by publish_date (latest first)
SELECT title, publish_date
FROM Publications
ORDER BY publish_date DESC;

-- 59. Find the project with the highest funded publication
SELECT r.title AS project_title, p.title AS publication_title, r.funding_amount
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id
WHERE r.funding_amount = (SELECT MAX(funding_amount) FROM Research_Projects);

-- 60. Window Function + Subquery: Rank publications per project by citation_count
SELECT project_id, title, citation_count,
       RANK() OVER (PARTITION BY project_id ORDER BY citation_count DESC) AS rank_in_project
FROM Publications;

-- -----------------------------------------------------------------------------------------------------------------------

-- Table 19: Volunteers
CREATE TABLE Volunteers (
    volunteer_id INT PRIMARY KEY, -- unique identifier for each volunteer
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 16),
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    joined_date DATE,
    area_of_interest VARCHAR(100),
    availability_status VARCHAR(50) DEFAULT 'Available'
);

-- Insert 20 records into Volunteers table
INSERT INTO Volunteers (volunteer_id, name, age, gender, contact_number, email,address, joined_date, area_of_interest, availability_status)
 VALUES
(1, 'Aarav Mehta', 22, 'Male', '9876543210', 'aarav.mehta@gmail.com', 'Mumbai, Maharashtra', '2024-11-10', 'Handicraft Promotion', 'Available'),
(2, 'Priya Sharma', 24, 'Female', '9821345678', 'priya.sharma@yahoo.com', 'Delhi', '2024-12-01', 'Folk Dance Coordination', 'Available'),
(3, 'Riya Das', 20, 'Female', '9934567821', 'riya.das@rediffmail.com', 'Kolkata, West Bengal', '2025-01-05', 'Tribal Art Workshops', 'Unavailable'),
(4, 'Karan Singh', 27, 'Male', '9845098450', 'karan.singh@gmail.com', 'Jaipur, Rajasthan', '2025-02-10', 'Event Management', 'Available'),
(5, 'Sneha Iyer', 21, 'Female', '9765432189', 'sneha.iyer@outlook.com', 'Chennai, Tamil Nadu', '2025-02-25', 'Textile Crafts', 'Available'),
(6, 'Vikram Patil', 25, 'Male', '9912345678', 'vikram.patil@gmail.com', 'Pune, Maharashtra', '2025-03-03', 'Photography & Documentation', 'Unavailable'),
(7, 'Meera Joseph', 23, 'Female', '9801234567', 'meera.joseph@gmail.com', 'Kochi, Kerala', '2025-03-15', 'Museum Tours', 'Available'),
(8, 'Ravi Ranjan', 26, 'Male', '9798765432', 'ravi.ranjan@gmail.com', 'Patna, Bihar', '2025-04-01', 'Craft Stalls & Sales', 'Available'),
(9, 'Anjali Gupta', 22, 'Female', '9812349856', 'anjali.gupta@gmail.com', 'Varanasi, UP', '2025-04-20', 'Traditional Painting', 'Available'),
(10, 'Aditya Rao', 19, 'Male', '9870192837', 'aditya.rao@gmail.com', 'Bengaluru, Karnataka', '2025-05-05', 'Workshop Assistance', 'Available'),
(11, 'Sonal Chauhan', 18, 'Female', '9812346789', 'sonal.chauhan@yahoo.com', 'Bhopal, MP', '2025-05-12', 'Folk Song Recording', 'Available'),
(12, 'Mohit Verma', 29, 'Male', '9823456712', 'mohit.verma@live.com', 'Chandigarh', '2025-06-01', 'Volunteer Coordination', 'Unavailable'),
(13, 'Neha Kumari', 20, 'Female', '9900123456', 'neha.kumari@gmail.com', 'Ranchi, Jharkhand', '2025-06-10', 'Craft Cataloging', 'Available'),
(14, 'Rajeev Menon', 24, 'Male', '9809988776', 'rajeev.menon@gmail.com', 'Thiruvananthapuram', '2025-06-15', 'Handloom Documentation', 'Available'),
(15, 'Tanvi Desai', 22, 'Female', '9874563210', 'tanvi.desai@gmail.com', 'Ahmedabad, Gujarat', '2025-06-20', 'Traditional Dyeing', 'Available'),
(16, 'Amitabh Kashyap', 23, 'Male', '9812458963', 'amitabh.kashyap@gmail.com', 'Raipur, Chhattisgarh', '2025-06-25', 'Craft Tool Inventory', 'Unavailable'),
(17, 'Divya Pillai', 19, 'Female', '9870098771', 'divya.pillai@gmail.com', 'Kozhikode, Kerala', '2025-06-28', 'Terracotta Crafts', 'Available'),
(18, 'Yash Raj', 21, 'Male', '9901234567', 'yash.raj@gmail.com', 'Lucknow, UP', '2025-07-01', 'Stage Decoration', 'Available'),
(19, 'Kritika Goyal', 20, 'Female', '9823141592', 'kritika.goyal@gmail.com', 'Ambala, Haryana', '2025-07-02', 'Photography & Film', 'Available'),
(20, 'Tushar Dubey', 22, 'Male', '9912347890', 'tushar.dubey@gmail.com', 'Indore, MP', '2025-07-03', 'Paper Craft & Origami', 'Available');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Volunteers;

-- to remove complete data from table
truncate table Volunteers;

-- to delete complete attributes and records 
drop table Volunteers;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Modify email to be UNIQUE (each volunteer must have unique email)
ALTER TABLE Volunteers 
ADD CONSTRAINT unique_email UNIQUE (email);

-- 2. DDL: Drop a column if no longer required
ALTER TABLE Volunteers 
DROP COLUMN emergency_contact;

-- 3. DML: Update availability when volunteer is on leave
UPDATE Volunteers 
SET availability_status = 'Unavailable'
WHERE volunteer_id = 7;

-- 4. DQL: Select volunteers interested in Photography
SELECT name, contact_number 
FROM Volunteers 
WHERE area_of_interest LIKE '%Photography%';

-- 5. DQL: List female volunteers older than 20
SELECT name, age 
FROM Volunteers 
WHERE gender = 'Female' AND age > 20;

-- 6. List all female volunteers who are available
SELECT volunteer_id, name, age, area_of_interest, availability_status
FROM Volunteers
WHERE gender = 'Female' AND availability_status = 'Available';

-- 7. Find volunteers who joined after June 2025
SELECT volunteer_id, name, joined_date, area_of_interest
FROM Volunteers
WHERE joined_date > '2025-06-01';

-- 8. Show the names and contact details of volunteers interested in Photography
SELECT name, contact_number, email, area_of_interest
FROM Volunteers
WHERE area_of_interest LIKE '%Photography%';

-- 9. DQL + Clause: Order volunteers by joining date (oldest first)
SELECT name, joined_date 
FROM Volunteers 
ORDER BY joined_date ASC;

-- 10. DQL + Clause: Count volunteers by status
SELECT availability_status, COUNT(*) AS total_volunteers
FROM Volunteers 
GROUP BY availability_status;

-- 11. Operator: Find volunteers between ages 20 and 25
SELECT name, age 
FROM Volunteers 
WHERE age BETWEEN 20 AND 25;

-- 12. Operator: Volunteers from Delhi OR Mumbai
SELECT name, address 
FROM Volunteers 
WHERE address LIKE '%Delhi%' OR address LIKE '%Mumbai%';

-- 13. Aggregate Function: Count total volunteers
SELECT COUNT(*) AS total_volunteers
FROM Volunteers;

-- 14. Function: Get the average age of volunteers
SELECT AVG(age) AS average_age 
FROM Volunteers;

-- 15. Function: Convert volunteer names to uppercase
SELECT UPPER(name) AS upper_case_names 
FROM Volunteers;

-- 16. Window Function: Rank volunteers by age
SELECT name, age, RANK() OVER (ORDER BY age DESC) AS age_rank
FROM Volunteers;

-- 17. Window Function: Running total of volunteers by join date
SELECT name, joined_date, 
       COUNT(*) OVER (ORDER BY joined_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM Volunteers;

-- 18. Subquery: Find volunteers older than the average age
SELECT name, age 
FROM Volunteers 
WHERE age > (SELECT AVG(age) FROM Volunteers);

-- 19. Subquery: Get volunteers from the same city as 'Aarav Mehta'
SELECT name, address 
FROM Volunteers 
WHERE address = (SELECT address FROM Volunteers WHERE name = 'Aarav Mehta');

-- 20. Join: Get volunteers and their participated events (real-life cross join with Event_Participants)
SELECT v.name, v.area_of_interest, e.participation_type, e.feedback_score
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id; -- Assuming volunteers can be artisans too

-- 21. Left Join: List all volunteers with their events (show volunteers even if they didn’t participate)
SELECT v.name, e.event_id, e.participation_type
FROM Volunteers v
LEFT JOIN Event_Participants e ON v.volunteer_id = e.artisan_id;

-- 22. Right Join: Show only events and their volunteers
SELECT e.event_id, v.name, e.participation_type
FROM Volunteers v
RIGHT JOIN Event_Participants e ON v.volunteer_id = e.artisan_id;

-- 23. Aggregate Function: Average age of volunteers
SELECT AVG(age) AS avg_age
FROM Volunteers;

-- 24. Aggregate Function: Max age of volunteers
SELECT MAX(age) AS max_age
FROM Volunteers;

-- 25. Aggregate Function: Min age of volunteers
SELECT MIN(age) AS min_age
FROM Volunteers;

-- 26. Aggregate Function: Count volunteers by availability status
SELECT availability_status, COUNT(*) AS count_status
FROM Volunteers
GROUP BY availability_status;

-- 27. Advanced Join: Volunteers with events and feedback above 8
SELECT v.name, e.event_id, e.feedback_score
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
WHERE e.feedback_score > 8;

-- 28. Nested Subquery: Volunteers who joined after the earliest join date
SELECT name, joined_date
FROM Volunteers
WHERE joined_date > (SELECT MIN(joined_date) FROM Volunteers);

-- 29. Nested Subquery: Volunteers whose age is higher than average of available volunteers
SELECT name, age
FROM Volunteers
WHERE age > (SELECT AVG(age) FROM Volunteers WHERE availability_status = 'Available');

-- 30. LIKE Clause: Volunteers interested in Photography
SELECT name, area_of_interest
FROM Volunteers
WHERE area_of_interest LIKE '%Photography%';

-- 31. Subquery: Volunteers whose age is above average
SELECT name, age 
FROM Volunteers
WHERE age > (SELECT AVG(age) FROM Volunteers);

-- 32. Subquery with IN: Volunteers interested in Photography or Stage
SELECT name, area_of_interest 
FROM Volunteers
WHERE area_of_interest IN (SELECT DISTINCT area_of_interest FROM Volunteers WHERE area_of_interest LIKE '%Photography%' OR area_of_interest LIKE '%Stage%');

-- 33. Subquery with EXISTS: Volunteers with email in Gmail
SELECT name, email 
FROM Volunteers v
WHERE EXISTS (SELECT 1 FROM Volunteers WHERE email LIKE '%@gmail.com%' AND volunteer_id = v.volunteer_id);

-- 34. Operator: Volunteers NOT in Delhi
SELECT name, address 
FROM Volunteers
WHERE address NOT LIKE '%Delhi%';

-- 35. Operator: Volunteers available AND age < 25
SELECT name, age, availability_status 
FROM Volunteers
WHERE availability_status = 'Available' AND age < 25;

-- 36. Function: Length of volunteer names
SELECT name, LENGTH(name) AS name_length
FROM Volunteers;

-- 37. Function: Concatenate name and area of interest
SELECT CONCAT(name, ' - ', area_of_interest) AS volunteer_profile
FROM Volunteers;

-- 38. Function: Get joining month
SELECT name, MONTH(joined_date) AS joining_month
FROM Volunteers;

-- 39. Window Function: Row number by joined date
SELECT name, joined_date, ROW_NUMBER() OVER (ORDER BY joined_date) AS row_num
FROM Volunteers;

-- 40. BETWEEN Clause: Volunteers age between 20 and 25
SELECT name, age
FROM Volunteers
WHERE age BETWEEN 20 AND 25;

-- 41. ORDER BY: List volunteers by joining date ascending
SELECT name, joined_date
FROM Volunteers
ORDER BY joined_date ASC;

-- 42. ORDER BY: List volunteers by age descending
SELECT name, age
FROM Volunteers
ORDER BY age DESC;

-- 43. DISTINCT Clause: Get unique areas of interest
SELECT DISTINCT area_of_interest
FROM Volunteers;

-- 44. Real-life CASE: Categorize volunteers by age group
SELECT name, age,
CASE
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 25 THEN 'Young Adult'
    ELSE 'Adult'
END AS age_group
FROM Volunteers;

-- 45. Nested Subquery with IN: Volunteers who participated in events with feedback > 9
SELECT name
FROM Volunteers
WHERE volunteer_id IN (
    SELECT artisan_id
    FROM Event_Participants
    WHERE feedback_score > 9
);

-- 46. EXISTS Clause: Volunteers who have participated in at least one event
SELECT name
FROM Volunteers v
WHERE EXISTS (
    SELECT 1 FROM Event_Participants e
    WHERE e.artisan_id = v.volunteer_id
);

-- 47. Operator AND/OR: Volunteers in Delhi or Mumbai and age < 25
SELECT name, address, age
FROM Volunteers
WHERE (address LIKE '%Delhi%' OR address LIKE '%Mumbai%') AND age < 25;

-- 48. Window Function: Volunteer rank by age
SELECT name, age, RANK() OVER (ORDER BY age DESC) AS age_rank
FROM Volunteers;

-- 49. Window Function: Cumulative count of volunteers by joining date
SELECT name, joined_date, COUNT(*) OVER (ORDER BY joined_date) AS cumulative_volunteers
FROM Volunteers;

-- 50. DML UPDATE: Change availability status of a volunteer
UPDATE Volunteers
SET availability_status = 'Unavailable'
WHERE volunteer_id = 3;

-- 51. DML UPDATE: Assign area of interest to a volunteer
UPDATE Volunteers
SET area_of_interest = 'Exhibition Setup'
WHERE volunteer_id = 10;

-- 52. Multi-table JOIN: Volunteers with event names they participated in
SELECT v.name, c.event_name, e.participation_type, e.feedback_score
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
JOIN Cultural_Events c ON e.event_id = c.event_id;

-- 53. Multi-table JOIN with condition: Volunteers with high feedback events
SELECT v.name, c.event_name, e.feedback_score
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
JOIN Cultural_Events c ON e.event_id = c.event_id
WHERE e.feedback_score >= 9;

-- 54. Nested Subquery: Volunteers who participated in the most attended event
SELECT name
FROM Volunteers
WHERE volunteer_id IN (
    SELECT artisan_id
    FROM Event_Participants
    WHERE event_id = (
        SELECT event_id
        FROM Cultural_Events
        ORDER BY expected_attendance DESC
        LIMIT 1
    )
);

-- 55. CASE with JOIN: Classify volunteers based on number of events
SELECT v.name, COUNT(e.event_id) AS events_participated,
CASE
    WHEN COUNT(e.event_id) = 0 THEN 'Inactive'
    WHEN COUNT(e.event_id) BETWEEN 1 AND 3 THEN 'Active'
    ELSE 'Super Active'
END AS activity_level
FROM Volunteers v
LEFT JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
GROUP BY v.name;

-- 56. Window Function: Rank volunteers by total honorarium received
SELECT v.name, SUM(e.honorarium) AS total_honorarium,
RANK() OVER (ORDER BY SUM(e.honorarium) DESC) AS honorarium_rank
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
GROUP BY v.name;

-- 57. Operator IN: Volunteers in specific cities
SELECT name, address
FROM Volunteers
WHERE address IN ('Delhi', 'Mumbai', 'Chennai');

-- 58. Operator NOT IN: Volunteers NOT interested in Photography
SELECT name, area_of_interest
FROM Volunteers
WHERE area_of_interest NOT IN ('Photography & Documentation', 'Photography & Film');

-- 59. Data Type & Conversion Example: Show age as string
SELECT name, CAST(age AS CHAR) AS age_string
FROM Volunteers;

-- 60. Real-life analytics: Top 3 volunteers by number of events participated
SELECT v.name, COUNT(e.event_id) AS events_count
FROM Volunteers v
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
GROUP BY v.name
ORDER BY events_count DESC
LIMIT 3;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 20: Volunteer_Assignments
CREATE TABLE Volunteer_Assignments (
    assignment_id INT PRIMARY KEY, -- unique identifier for each assignment
    volunteer_id INT,
    task_title VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE,
    assigned_by VARCHAR(100),
    status VARCHAR(50) DEFAULT 'Assigned',
    feedback TEXT,
    FOREIGN KEY (volunteer_id) REFERENCES Volunteers(volunteer_id)
);

-- Insert 20 records into Volunteer_Assignments table
INSERT INTO Volunteer_Assignments (assignment_id, volunteer_id, task_title, description, start_date,end_date, assigned_by, status, feedback) 
VALUES
(1, 1, 'Set Up Craft Stalls', 'Assist in stall layout and decoration at Kala Mahotsav.', '2025-08-10', '2025-08-15', 'Event Coordinator', 'Completed', 'Very proactive and creative.'),
(2, 2, 'Folk Dance Backstage', 'Support performers during costume changes.', '2025-09-08', '2025-09-10', 'Cultural Head', 'Completed', 'Managed well under pressure.'),
(3, 3, 'Workshop Registration', 'Handle registrations for Warli art workshop.', '2025-10-01', '2025-10-03', 'Workshop In-Charge', 'Completed', 'Great with people and punctual.'),
(4, 4, 'Lighting Setup', 'Support lighting technician for tribal dance event.', '2025-10-15', '2025-10-17', 'Tech Supervisor', 'Completed', 'Handled with confidence.'),
(5, 5, 'Textile Display Arrangement', 'Organize and label textile exhibit at Kalaangan.', '2025-12-20', '2025-12-25', 'Curator', 'Completed', 'Excellent eye for detail.'),
(6, 6, 'Photo Documentation', 'Capture live moments from the Lokrang event.', '2026-01-05', '2026-01-10', 'Media Team Lead', 'In Progress', 'Initial photos submitted.'),
(7, 7, 'Gallery Tour Guide', 'Guide visitors at the Lippan art exhibition.', '2026-01-15', '2026-01-17', 'Exhibition Director', 'Assigned', ''),
(8, 8, 'Booth Management', 'Manage visitors and artisans at bamboo crafts booth.', '2026-02-01', '2026-02-05', 'Event Admin', 'Assigned', ''),
(9, 9, 'Pattachitra Sales', 'Assist in sale and wrapping of artwork.', '2025-12-25', '2025-12-30', 'Sales Head', 'Completed', 'Very polite with customers.'),
(10, 10, 'Workshop Coordination', 'Distribute materials and maintain schedule.', '2026-03-01', '2026-03-03', 'Training Coordinator', 'Assigned', ''),
(11, 11, 'Music Stage Support', 'Assist in mic and instrument setup for folk bands.', '2025-11-10', '2025-11-12', 'Sound Engineer', 'Completed', 'Fast learner.'),
(12, 12, 'Volunteer Scheduling', 'Create roster for craft festival helpers.', '2025-12-01', '2025-12-05', 'HR Desk', 'In Progress', 'Awaiting final list.'),
(13, 13, 'Craft Catalog Entry', 'Enter product details into database.', '2025-12-15', '2025-12-20', 'Data Manager', 'Assigned', ''),
(14, 14, 'Backstage Supervision', 'Monitor participants behind the curtain.', '2026-02-10', '2026-02-12', 'Stage Manager', 'Assigned', ''),
(15, 15, 'Dye Demo Setup', 'Arrange and label natural dyes for demo.', '2025-11-20', '2025-11-22', 'Craft Head', 'Completed', 'Neat and well arranged.'),
(16, 16, 'Tool Inventory Check', 'Cross-check and count tools at woodcraft workshop.', '2025-12-28', '2025-12-30', 'Store Manager', 'Assigned', ''),
(17, 17, 'Clay Booth Assistance', 'Support terracotta artisans with customer queries.', '2026-01-15', '2026-01-17', 'Craft Booth Lead', 'Completed', 'Handled multiple customers well.'),
(18, 18, 'Event Decoration', 'Decorate venue with traditional fabrics and lamps.', '2026-03-15', '2026-03-18', 'Cultural Lead', 'Assigned', ''),
(19, 19, 'Event Filming', 'Shoot and edit highlights for media uploads.', '2026-03-20', '2026-03-22', 'Media Manager', 'In Progress', 'Footage under review.'),
(20, 20, 'Origami Workshop Aid', 'Assist children in paper craft activity.', '2026-03-25', '2026-03-26', 'Activity Head', 'Completed', 'Engaging and patient with kids.');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Volunteer_Assignments;

-- to remove complete data from table
truncate table Volunteer_Assignments;

-- to delete complete attributes and records 
drop table Volunteer_Assignments;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DML UPDATE: Update assignment status
UPDATE Volunteer_Assignments
SET status = 'Completed', feedback = 'Excellent performance'
WHERE assignment_id = 6;

-- 2. DML DELETE: Remove an outdated assignment
DELETE FROM Volunteer_Assignments
WHERE assignment_id = 21;

-- 3. JOIN: Show volunteer names with their assignments
SELECT v.name, va.task_title, va.status
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id;

-- 4. JOIN with multiple tables: Volunteer assignments with event names
SELECT v.name, va.task_title, c.event_name, va.status
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
JOIN Event_Participants e ON v.volunteer_id = e.artisan_id
JOIN Cultural_Events c ON e.event_id = c.event_id;

-- 5. Aggregation: Count number of assignments per volunteer
SELECT volunteer_id, COUNT(*) AS total_assignments
FROM Volunteer_Assignments
GROUP BY volunteer_id;

-- 6. Nested Subquery: Volunteers assigned more than average number of tasks
SELECT name
FROM Volunteers
WHERE volunteer_id IN (
    SELECT volunteer_id
    FROM Volunteer_Assignments
    GROUP BY volunteer_id
    HAVING COUNT(*) > (
        SELECT AVG(total_count) FROM (
            SELECT COUNT(*) AS total_count
            FROM Volunteer_Assignments
            GROUP BY volunteer_id
        ) AS sub
    )
);

-- 7. Window Function: Rank volunteers by number of assignments
SELECT volunteer_id, COUNT(*) AS task_count,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_assignments
FROM Volunteer_Assignments
GROUP BY volunteer_id;

-- 8. CASE Statement: Label volunteers as Busy or Free based on assignments
SELECT v.name, COUNT(va.assignment_id) AS total_tasks,
CASE
    WHEN COUNT(va.assignment_id) >= 5 THEN 'Busy'
    ELSE 'Available'
END AS workload_status
FROM Volunteers v
LEFT JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
GROUP BY v.name;

-- 9. Operator IN: Assignments assigned by Event Coordinator or Cultural Head
SELECT * FROM Volunteer_Assignments
WHERE assigned_by IN ('Event Coordinator', 'Cultural Head');

-- 10. Subquery: Volunteers assigned to tasks in events with >500 attendees
SELECT v.name, va.task_title
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
WHERE va.volunteer_id IN (
    SELECT e.artisan_id
    FROM Event_Participants e
    JOIN Cultural_Events c ON e.event_id = c.event_id
    WHERE c.expected_attendance > 500
);

-- 11. Aggregate & HAVING: Volunteers with more than 2 assignments
SELECT volunteer_id, COUNT(*) AS assignment_count
FROM Volunteer_Assignments
GROUP BY volunteer_id
HAVING COUNT(*) > 2;

-- 12. Window Function: Number assignments per volunteer with running total
SELECT volunteer_id, assignment_id, COUNT(*) OVER (PARTITION BY volunteer_id ORDER BY start_date) AS running_count
FROM Volunteer_Assignments;

-- 13. Real-life DQL: Volunteers who assisted in 'Workshop' or 'Exhibition'
SELECT v.name, va.task_title
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
WHERE va.task_title LIKE '%Workshop%' OR va.task_title LIKE '%Exhibition%';

-- 14. JOIN & Filter: Volunteer assignments with event details
SELECT v.name, va.task_title, c.event_name, c.date
FROM Volunteer_Assignments va
JOIN Volunteers v ON va.volunteer_id = v.volunteer_id
JOIN Event_Participants e ON e.artisan_id = v.volunteer_id
JOIN Cultural_Events c ON e.event_id = c.event_id;

-- 15. Subquery in SELECT: Show number of events each volunteer participated in
SELECT v.name,
       (SELECT COUNT(*)
        FROM Event_Participants e
        WHERE e.artisan_id = v.volunteer_id) AS events_participated
FROM Volunteers v;

-- 16. Using COALESCE & IFNULL: Show volunteer feedback or 'Pending'
SELECT name, COALESCE(feedback, 'Pending') AS feedback_status
FROM Volunteer_Assignments
JOIN Volunteers ON Volunteers.volunteer_id = Volunteer_Assignments.volunteer_id;

-- 17. Date function: Upcoming assignments in next 7 days
SELECT task_title, start_date
FROM Volunteer_Assignments
WHERE start_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY);

-- 18. Conditional aggregation: Count completed vs assigned tasks
SELECT volunteer_id,
       SUM(CASE WHEN status='Completed' THEN 1 ELSE 0 END) AS completed_tasks,
       SUM(CASE WHEN status='Assigned' THEN 1 ELSE 0 END) AS assigned_tasks
FROM Volunteer_Assignments
GROUP BY volunteer_id;

-- 19. IN operator: Assignments by certain coordinators
SELECT * FROM Volunteer_Assignments
WHERE assigned_by IN ('Event Coordinator','Stage Manager','Cultural Head');

-- 20. BETWEEN operator: Tasks in Jan-Mar 2026
SELECT * FROM Volunteer_Assignments
WHERE start_date BETWEEN '2026-01-01' AND '2026-03-31';

-- 21. ORDER BY: Volunteers with most assignments
SELECT v.name, COUNT(va.assignment_id) AS total_assignments
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
GROUP BY v.name
ORDER BY total_assignments DESC;

-- 22. LEFT JOIN: Show all volunteers even if no assignments
SELECT v.name, va.task_title
FROM Volunteers v
LEFT JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id;

-- 23. RIGHT JOIN: Show all assignments even if volunteer details missing
SELECT va.assignment_id, v.name
FROM Volunteer_Assignments va
RIGHT JOIN Volunteers v ON va.volunteer_id = v.volunteer_id;

-- 24. EXISTS: Volunteers with at least one completed assignment
SELECT name
FROM Volunteers v
WHERE EXISTS (
    SELECT 1 FROM Volunteer_Assignments va
    WHERE va.volunteer_id = v.volunteer_id AND va.status='Completed'
);

-- 25. DML: Update volunteer availability based on completed assignments
UPDATE Volunteers v
SET availability_status = 'Available'
WHERE volunteer_id IN (
    SELECT volunteer_id
    FROM Volunteer_Assignments
    GROUP BY volunteer_id
    HAVING SUM(CASE WHEN status='Assigned' THEN 1 ELSE 0 END) = 0
);

-- 26. Aggregate Function: Average feedback score per volunteer
SELECT volunteer_id, AVG(LENGTH(feedback)) AS avg_feedback_length
FROM Volunteer_Assignments
GROUP BY volunteer_id;

-- 27. COUNT with DISTINCT: Count of volunteers per area of interest
SELECT area_of_interest, COUNT(DISTINCT volunteer_id) AS num_volunteers
FROM Volunteers
GROUP BY area_of_interest;

-- 28. Real-life JOIN: Volunteers with their assignments and event info
SELECT v.name, va.task_title, c.event_name, c.date
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
JOIN Event_Participants ep ON ep.artisan_id = v.volunteer_id
JOIN Cultural_Events c ON c.event_id = ep.event_id;

-- 29. Subquery with IN: Volunteers who worked in 'Kala Mahotsav'
SELECT name
FROM Volunteers
WHERE volunteer_id IN (
    SELECT volunteer_id
    FROM Volunteer_Assignments va
    JOIN Event_Participants ep ON ep.artisan_id = va.volunteer_id
    WHERE ep.event_id = 1
);

-- 30. String Function: Volunteers with last name 'Sharma'
SELECT name, SUBSTRING_INDEX(name,' ',-1) AS last_name
FROM Volunteers
WHERE SUBSTRING_INDEX(name,' ',-1)='Sharma';

-- 31. CASE Function: Categorize volunteers by age
SELECT name, age,
CASE 
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 25 THEN 'Young Adult'
    ELSE 'Adult'
END AS age_group
FROM Volunteers;

-- 32. JOIN + ORDER BY: Volunteers with assignments sorted by start_date
SELECT v.name, va.task_title, va.start_date
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
ORDER BY va.start_date ASC;

-- 33. LEFT JOIN + IS NULL: Volunteers not assigned to any task
SELECT v.name
FROM Volunteers v
LEFT JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
WHERE va.assignment_id IS NULL;

-- 34. RIGHT JOIN: Show all assignments even if volunteer data missing
SELECT va.task_title, v.name
FROM Volunteer_Assignments va
RIGHT JOIN Volunteers v ON va.volunteer_id = v.volunteer_id;

-- 35. Subquery in SELECT: Show latest assignment end_date per volunteer
SELECT name, 
       (SELECT MAX(end_date) 
        FROM Volunteer_Assignments 
        WHERE volunteer_id = v.volunteer_id) AS last_assignment_end
FROM Volunteers v;

-- 36. Complex Join: Volunteers, assignments, and their feedback for events with >500 attendees
SELECT v.name, va.task_title, va.feedback, c.event_name
FROM Volunteers v
JOIN Volunteer_Assignments va ON v.volunteer_id = va.volunteer_id
JOIN Event_Participants ep ON ep.artisan_id = v.volunteer_id
JOIN Cultural_Events c ON ep.event_id = c.event_id
WHERE c.expected_attendance > 500;

-- 37. Subquery with EXISTS: Volunteers with at least one assignment in 2026
SELECT name
FROM Volunteers v
WHERE EXISTS (
    SELECT 1
    FROM Volunteer_Assignments va
    WHERE va.volunteer_id = v.volunteer_id AND YEAR(start_date)=2026
);

-- 38. DDL: Alter Research_Projects to add a new column for project rating
ALTER TABLE Research_Projects
ADD COLUMN project_rating DECIMAL(3,2) DEFAULT 0.0;

-- 39. DML: Update project status to 'Completed' if end_date is past
UPDATE Research_Projects
SET status = 'Completed'
WHERE end_date < CURRENT_DATE;

-- 40. DELETE: Remove publications without associated project
DELETE FROM Publications
WHERE project_id NOT IN (SELECT project_id FROM Research_Projects);

-- 41. Aggregate Function: Total funding per focus_area
SELECT focus_area, SUM(funding_amount) AS total_funding
FROM Research_Projects
GROUP BY focus_area;

-- 42. COUNT with JOIN: Number of publications per researcher
SELECT lead_researcher, COUNT(p.publication_id) AS num_publications
FROM Research_Projects r
LEFT JOIN Publications p ON r.project_id = p.project_id
GROUP BY lead_researcher;

-- 43. JOIN: List publications with project title and researcher
SELECT p.title, p.author, r.title AS project_title, r.lead_researcher
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id;

-- 44. Subquery: Projects with funding greater than average funding
SELECT project_id, title, funding_amount
FROM Research_Projects
WHERE funding_amount > (SELECT AVG(funding_amount) FROM Research_Projects);

-- 45. Window Function: Rank projects by funding
SELECT project_id, title, funding_amount,
       RANK() OVER (ORDER BY funding_amount DESC) AS funding_rank
FROM Research_Projects;

-- 46. Scalar Function: Uppercase project titles
SELECT UPPER(title) AS project_title_upper
FROM Research_Projects;

-- 47. Date Function: Projects starting in 2025
SELECT title, start_date
FROM Research_Projects
WHERE YEAR(start_date) = 2025;

-- 48. Subquery: Publications for projects in 'Textile Innovation'
SELECT title, author
FROM Publications
WHERE project_id IN (
    SELECT project_id
    FROM Research_Projects
    WHERE focus_area = 'Textile Innovation'
);

-- 49. JOIN + ORDER BY: Publications sorted by publish_date
SELECT p.title, p.author, r.title AS project_title, p.publish_date
FROM Publications p
JOIN Research_Projects r ON p.project_id = r.project_id
ORDER BY p.publish_date ASC;

-- 50. LEFT JOIN: All projects and their publications (even if no publication)
SELECT r.title AS project_title, p.title AS publication_title
FROM Research_Projects r
LEFT JOIN Publications p ON r.project_id = p.project_id;

-- 51. Subquery in SELECT: Latest publication date per project
SELECT title,
       (SELECT MAX(publish_date) FROM Publications p WHERE p.project_id = r.project_id) AS latest_publication
FROM Research_Projects r;

-- 52. Subquery + Aggregate: Projects with publications count > 3
SELECT title, 
       (SELECT COUNT(*) FROM Publications p WHERE p.project_id = r.project_id) AS pub_count
FROM Research_Projects r
WHERE (SELECT COUNT(*) FROM Publications p WHERE p.project_id = r.project_id) > 3;

-- 53. DQL: List volunteers who are currently available and interested in 'Handicraft Promotion'
SELECT name, area_of_interest
FROM Volunteers
WHERE availability_status = 'Available' AND area_of_interest LIKE '%Handicraft%';

-- 54. DML: Mark volunteer assignments as 'Completed' if end_date < today
UPDATE Volunteer_Assignments
SET status = 'Completed'
WHERE end_date < CURRENT_DATE;

-- 55. DQL + JOIN: Get all volunteers assigned to 'Kala Mahotsav' event
SELECT v.name, va.task_title, c.event_name
FROM Volunteer_Assignments va
JOIN Volunteers v ON va.volunteer_id = v.volunteer_id
JOIN Cultural_Events c ON va.task_title LIKE CONCAT('%', c.event_name, '%');

-- 56. Aggregate: Average feedback score of all event participants
SELECT AVG(feedback_score) AS avg_feedback
FROM Event_Participants;

-- 57. Subquery: Find volunteers who have more assignments than average
SELECT name, (SELECT COUNT(*) FROM Volunteer_Assignments va WHERE va.volunteer_id = v.volunteer_id) AS total_assignments
FROM Volunteers v
WHERE (SELECT COUNT(*) FROM Volunteer_Assignments va WHERE va.volunteer_id = v.volunteer_id) >
      (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM Volunteer_Assignments GROUP BY volunteer_id) AS sub);

-- 58. Window Function: Rank projects by funding_amount
SELECT project_id, title, funding_amount,
       RANK() OVER (ORDER BY funding_amount DESC) AS funding_rank
FROM Research_Projects;

-- 59. Subquery + DQL: Publications linked to projects in 'Folk Art Preservation'
SELECT title, author
FROM Publications
WHERE project_id IN (
    SELECT project_id
    FROM Research_Projects
    WHERE focus_area = 'Folk Art Preservation'
);

-- 60. Join + Operator: List participants with honorarium > 1000
SELECT ep.participant_id, a.name AS artisan_name, ep.honorarium
FROM Event_Participants ep
JOIN Artisans a ON ep.artisan_id = a.artisan_id
WHERE ep.honorarium > 1000;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 21: Media_Coverage
CREATE TABLE Media_Coverage (
    media_id INT PRIMARY KEY, -- unique identifier for each media coverage
    title VARCHAR(150) NOT NULL,
    media_type VARCHAR(50),  -- e.g., Newspaper, TV, Online
    published_date DATE,
    covered_event VARCHAR(100),
    link TEXT,
    reporter_name VARCHAR(100),
    summary TEXT,
    region VARCHAR(50),
    language VARCHAR(50)
);

-- Insert 20 records into Media_Coverage table
INSERT INTO Media_Coverage (media_id, title, media_type, published_date, covered_event,link, reporter_name, summary, region, language)
 VALUES
(1, 'Kalamkari Revival Workshop Lights Up Vijayawada', 'Newspaper', '2025-01-15', 'Kalamkari Awareness Camp', 'https://artnews.in/kalamkari-vijayawada', 'Sonal Rao', 'Highlight on renewed interest in natural dyeing techniques.', 'Andhra Pradesh', 'Telugu'),
(2, 'Folk Dance Festival Inaugurated in Bhopal', 'TV', '2025-02-01', 'Lok Nritya Mahotsav', 'https://ddnews.in/loknritya', 'Rajeev Tiwari', 'A week-long celebration of tribal dance forms.', 'Madhya Pradesh', 'Hindi'),
(3, 'Lippan Art Exhibition Draws Huge Crowd in Bhuj', 'Online', '2025-03-05', 'Lippan Kala Mela', 'https://artsutra.com/lippan-bhuj', 'Neha Patel', 'Traditional mud mirror art showcased by artisans.', 'Gujarat', 'Gujarati'),
(4, 'Terracotta Crafts Shine at Purulia Fair', 'Newspaper', '2025-03-10', 'Purulia Craft Fair', 'https://dailybengal.com/purulia-craft', 'Ritwik Ghosh', 'Live demos and folk songs mark opening.', 'West Bengal', 'Bengali'),
(5, 'Sujni Embroidery Revival Documented in Bihar', 'TV', '2025-04-20', 'Sujni Reawakening Program', 'https://etvbihar.tv/sujni-revival', 'Kritika Jha', 'Women-led initiatives revive storytelling stitchwork.', 'Bihar', 'Hindi'),
(6, 'Channapatna Toy Artisans Honored at Expo', 'Online', '2025-05-12', 'Toy Makers Meet', 'https://indiatoday.in/channapatna-expo', 'Pranav Iyer', 'Focus on eco-friendly paints and export growth.', 'Karnataka', 'Kannada'),
(7, 'Dhokra Metal Art Gains UNESCO Attention', 'Newspaper', '2025-05-30', 'Dhokra Heritage Event', 'https://thehindu.com/dhokra-bastar', 'Bhaskar Naik', 'Tribal casting showcased at state-level meet.', 'Chhattisgarh', 'Hindi'),
(8, 'Miniature Painting Festival Kicks Off in Udaipur', 'Online', '2025-06-10', 'Rajasthan Rang', 'https://artindepth.in/miniature-udaipur', 'Anjali Rathore', 'Showcasing Rajput and Mughal influences.', 'Rajasthan', 'Hindi'),
(9, 'Banarasi Weavers Featured in Craft Summit', 'TV', '2025-06-25', 'Banarasi Silk Showcase', 'https://newsnation.in/banarasi', 'Sameer Pandey', 'Generational weaving families demonstrate techniques.', 'Uttar Pradesh', 'Hindi'),
(10, 'Madhubani Wall Art Transforms Railway Station', 'Newspaper', '2025-07-05', 'Art for Public Spaces', 'https://timesofindia.com/madhubani-station', 'Poonam Mishra', 'Station walls painted with vibrant folk stories.', 'Bihar', 'Hindi'),
(11, 'Ajrakh Block Printing Live at National Craft Fair', 'Online', '2025-07-15', 'National Handloom Week', 'https://craftbazaar.in/ajrakh-demo', 'Faisal Khatri', 'Live demonstration by master printers from Kutch.', 'Gujarat', 'Gujarati'),
(12, 'Tanjore Painting Demo Held at Chennai Museum', 'TV', '2025-07-20', 'Art Demo Day', 'https://pttv.in/tanjore-live', 'Lavanya Narayan', 'Gold leaf layering process shown to public.', 'Tamil Nadu', 'Tamil'),
(13, 'Handmade Paper Festival Promotes Eco Living', 'Online', '2025-08-05', 'Green Craft Carnival', 'https://theleaf.in/paper-fest', 'Aditi Sharma', 'Sustainable craft products and workshops featured.', 'Himachal Pradesh', 'Hindi'),
(14, 'Pattachitra Scrolls Narrate New Stories', 'Newspaper', '2025-08-20', 'Katha Kala Sammelan', 'https://odishaartwatch.in/pattachitra', 'Binod Behera', 'Modern tales illustrated using ancient scroll technique.', 'Odisha', 'Odia'),
(15, 'Wood Relief Craft Demo in Nagaland Gets Applause', 'TV', '2025-09-01', 'North East Craft Week', 'https://netv.in/wood-carving-demo', 'Temjen Jamir', 'Fusion of tribal motifs and modern design.', 'Nagaland', 'English'),
(16, 'Craft Bazaar in Kerala Features Tribal Masks', 'Online', '2025-09-15', 'Ethnic Crafts Fest', 'https://manoramaonline.com/tribal-masks', 'Joseph Mathew', 'Booths with bamboo, coconut, and palm crafts.', 'Kerala', 'Malayalam'),
(17, 'Folk Music Archive Project Announced in Lucknow', 'Newspaper', '2025-10-01', 'Folk Tune Collection Drive', 'https://lokmat.in/folk-archive', 'Ravi Saxena', 'Field recording of dying regional songs begins.', 'Uttar Pradesh', 'Hindi'),
(18, 'Craft Scholarship Winners Honored in Shillong', 'TV', '2025-10-10', 'Craft Youth Awards', 'https://meghalive.in/craft-awards', 'Wansuk Nongrum', 'Young artisans awarded by cultural ministry.', 'Meghalaya', 'English'),
(19, 'Bidriware Shines at Hyderabad Craft Walk', 'Online', '2025-10-25', 'Deccan Kala Yatra', 'https://crafttour.in/bidri-hyd', 'Zahra Khan', 'Silver inlay craft gets spotlight at city walk.', 'Telangana', 'Urdu'),
(20, 'Craft Students’ Art Show at Delhi Haat', 'Newspaper', '2025-11-01', 'Young Hands Fest', 'https://hindustantimes.com/students-craft', 'Ankita Dey', 'Crafts by college students gain attention.', 'Delhi', 'English');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Media_Coverage;

-- to remove complete data from table
truncate table Media_Coverage;

-- to delete complete attributes and records 
drop table Media_Coverage;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column to track number of views on each media coverage
ALTER TABLE Media_Coverage ADD COLUMN view_count INT DEFAULT 0;

-- 2. DDL: Modify reporter_name to ensure it's NOT NULL
ALTER TABLE Media_Coverage MODIFY reporter_name VARCHAR(100) NOT NULL;

-- 3. Function + Real-life: Show first 20 chars of summary (preview text)
SELECT title, SUBSTRING(summary, 1, 20) AS preview_text
FROM Media_Coverage;

-- 4. DQL: List top 5 most recent reports
SELECT title, published_date
FROM Media_Coverage
ORDER BY published_date DESC
LIMIT 5;

-- 5. DML: Increase view_count by 100 for all Online media coverages
UPDATE Media_Coverage
SET view_count = view_count + 100
WHERE media_type = 'Online';

-- 6. DML: Delete outdated coverage before 2025-03-01
DELETE FROM Media_Coverage
WHERE published_date < '2025-03-01';

-- 7. DQL: Select all English language media reports
SELECT media_id, title, reporter_name
FROM Media_Coverage
WHERE language = 'English';

-- 8. DQL: Find all reports covered in Bihar
SELECT title, media_type, published_date
FROM Media_Coverage
WHERE region = 'Bihar';

-- 9. Clause: Get all coverages ordered by published_date (most recent first)
SELECT title, published_date
FROM Media_Coverage
ORDER BY published_date DESC;

-- 10. Clause: Count total reports per region
SELECT region, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY region;

-- 11. Clause: Find regions with more than 2 reports (HAVING example)
SELECT region, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY region
HAVING COUNT(*) > 2;

-- 12. Operator: Find reports either in Hindi or English
SELECT title, language
FROM Media_Coverage
WHERE language IN ('Hindi', 'English');

-- 13. Operator: Get reports that are NOT Online
SELECT title, media_type
FROM Media_Coverage
WHERE media_type <> 'Online';

-- 14. Function: Get the month of each published_date
SELECT title, MONTH(published_date) AS publish_month
FROM Media_Coverage;

-- 15. Function: Convert all titles to UPPERCASE
SELECT UPPER(title) AS upper_title
FROM Media_Coverage;

-- 16. Function: Find character length of each reporter_name
SELECT reporter_name, CHAR_LENGTH(reporter_name) AS name_length
FROM Media_Coverage;

-- 17. DQL: Show all Online reports published after July 2025
SELECT title, media_type, published_date
FROM Media_Coverage
WHERE media_type = 'Online' AND published_date > '2025-07-01';

-- 18. DQL: Find all coverages where summary mentions the word 'revive'
SELECT title, summary
FROM Media_Coverage
WHERE summary LIKE '%revive%';

-- 19. Join: Get all volunteer assignments linked with media coverage events (real-life: media covered volunteer events)
SELECT m.title, m.covered_event, v.task_title, v.status
FROM Media_Coverage m
JOIN Volunteer_Assignments v
ON m.covered_event = v.task_title;

-- 20. Left Join: Get all media coverages, even if no volunteer assignment exists
SELECT m.title, v.task_title
FROM Media_Coverage m
LEFT JOIN Volunteer_Assignments v
ON m.covered_event = v.task_title;

-- 21. Subquery: Find media reports published after the earliest published_date
SELECT title, published_date
FROM Media_Coverage
WHERE published_date > (SELECT MIN(published_date) FROM Media_Coverage);

-- 22. Subquery with IN: Get all reports by reporters from Bihar region
SELECT title, reporter_name
FROM Media_Coverage
WHERE reporter_name IN (SELECT reporter_name FROM Media_Coverage WHERE region = 'Bihar');

-- 23. Subquery in FROM: Count reports per media_type
SELECT media_type, report_count
FROM (
  SELECT media_type, COUNT(*) AS report_count
  FROM Media_Coverage
  GROUP BY media_type
) AS sub;

-- 24. Function: Find the average report title length (useful for media analytics)
SELECT AVG(CHAR_LENGTH(title)) AS avg_title_length
FROM Media_Coverage;

-- 25. Function: Find the earliest and latest media coverage
SELECT MIN(published_date) AS first_report, MAX(published_date) AS latest_report
FROM Media_Coverage;

-- 26. Function + Real Life: Total reports in Hindi language
SELECT COUNT(*) AS hindi_reports
FROM Media_Coverage
WHERE language = 'Hindi';

-- 27. Window Function: Rank media reports by published_date (latest first)
SELECT title, published_date,
RANK() OVER (ORDER BY published_date DESC) AS rank_by_date
FROM Media_Coverage;

-- 28. Window Function: Count reports per region with running total
SELECT region, COUNT(*) AS total_reports,
SUM(COUNT(*)) OVER (ORDER BY region) AS running_total
FROM Media_Coverage
GROUP BY region;

-- 29. Window Function: Find reporter contribution % share
SELECT reporter_name, COUNT(*) AS total_reports,
ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM Media_Coverage
GROUP BY reporter_name;

-- 30. Operator: Reports published between June and September 2025
SELECT title, published_date
FROM Media_Coverage
WHERE published_date BETWEEN '2025-06-01' AND '2025-09-30';

-- 31. Operator: Find all reports where reporter_name starts with 'S'
SELECT title, reporter_name
FROM Media_Coverage
WHERE reporter_name LIKE 'S%';

-- 32. Update a record violating constraint (should fail if title set to NULL)
UPDATE Media_Coverage SET title = NULL WHERE media_id = 23;

-- 33. Clause: Order media reports by published_date
SELECT media_id, title, published_date
FROM Media_Coverage
ORDER BY published_date ASC;

-- 34. Clause: Group reports by media_type
SELECT media_type, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY media_type;

-- 35. Clause with HAVING: Show only languages with more than 3 reports
SELECT language, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY language
HAVING COUNT(*) > 3;

-- 36. Join with WHERE: Link Event_Participants and Media_Coverage (real-life: events covered by media)
SELECT m.title, m.covered_event, e.participation_type, e.remarks
FROM Media_Coverage m
JOIN Event_Participants e
ON m.covered_event = e.participation_type
WHERE e.feedback_score >= 8;

-- 37. Inner Join across 3 tables: Media Coverage, Volunteers, Assignments
SELECT m.title, v.volunteer_id, a.task_title, a.status
FROM Media_Coverage m
JOIN Volunteer_Assignments a
ON m.covered_event = a.task_title
JOIN Volunteers v
ON a.volunteer_id = v.volunteer_id;

-- 38. Subquery with EXISTS: Find all reporters who covered any Bihar events
SELECT reporter_name
FROM Media_Coverage m
WHERE EXISTS (
  SELECT 1 FROM Media_Coverage sub
  WHERE sub.region = 'Bihar' AND sub.reporter_name = m.reporter_name
);

-- 39. Subquery with NOT EXISTS: Find languages not used in any report
SELECT DISTINCT language
FROM Media_Coverage m1
WHERE NOT EXISTS (
  SELECT 1 FROM Media_Coverage m2
  WHERE m2.language = m1.language AND m2.language IS NULL
);

-- 40. Operator: Find media reports with word "Festival" in title
SELECT media_id, title
FROM Media_Coverage
WHERE title LIKE '%Festival%';

-- 41. Operator: Reports published before July 2025
SELECT title, published_date
FROM Media_Coverage
WHERE published_date < '2025-07-01';

-- 42. Real Life Query: Find most covered region
SELECT region, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY region
ORDER BY total_reports DESC
LIMIT 1;

-- 43. Real Life Query: Find top 2 reporters with maximum coverage
SELECT reporter_name, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY reporter_name
ORDER BY total_reports DESC
LIMIT 2;

-- 44. Window Function: Rank languages by total report count
SELECT language, COUNT(*) AS total_reports,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_reports
FROM Media_Coverage
GROUP BY language;

-- 45. Window Function: Find cumulative report count by publish order
SELECT title, published_date,
COUNT(*) OVER (ORDER BY published_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_reports
FROM Media_Coverage;

-- 46. Real Life Function: Extract year from published_date
SELECT title, YEAR(published_date) AS report_year
FROM Media_Coverage;

-- 47. Real Life Function: Convert title to uppercase for press archive formatting
SELECT UPPER(title) AS formatted_title
FROM Media_Coverage;

-- 48. Subquery (scalar): Find the earliest report published
SELECT title, published_date
FROM Media_Coverage
WHERE published_date = (SELECT MIN(published_date) FROM Media_Coverage);

-- 49. Subquery (multi-row): Find reporters who published in both 'Online' and 'TV'
SELECT DISTINCT reporter_name
FROM Media_Coverage
WHERE reporter_name IN (
    SELECT reporter_name FROM Media_Coverage WHERE media_type = 'Online'
) 
AND reporter_name IN (
    SELECT reporter_name FROM Media_Coverage WHERE media_type = 'TV'
);

-- 50. Subquery with aggregation: Find the region with max coverage
SELECT region, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY region
HAVING COUNT(*) = (
    SELECT MAX(report_count) FROM (
        SELECT COUNT(*) AS report_count FROM Media_Coverage GROUP BY region
    ) AS sub
);

-- 51. Clause with BETWEEN: Reports published between March and June 2025
SELECT title, published_date
FROM Media_Coverage
WHERE published_date BETWEEN '2025-03-01' AND '2025-06-30';

-- 52. Clause with IN: Show only reports from Rajasthan, Bihar, or Odisha
SELECT title, region
FROM Media_Coverage
WHERE region IN ('Rajasthan', 'Bihar', 'Odisha');

-- 53. Real Life: Find all online reports after July 2025
SELECT title, media_type, published_date
FROM Media_Coverage
WHERE media_type = 'Online' AND published_date > '2025-07-01';

-- 54. Operator (<>): Find reports that are NOT in English
SELECT title, language
FROM Media_Coverage
WHERE language <> 'English';

-- 55. Function: Show month names of published reports
SELECT title, MONTHNAME(published_date) AS month_published
FROM Media_Coverage;

-- 56. Function: Character length of report titles
SELECT title, CHAR_LENGTH(title) AS title_length
FROM Media_Coverage;

-- 57. Window Function: Percentage of reports by each media_type
SELECT media_type, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage_share
FROM Media_Coverage
GROUP BY media_type;

-- 58. Real Life Query: Find reports that promoted festivals (title containing "Festival")
SELECT title, region, published_date
FROM Media_Coverage
WHERE title LIKE '%Festival%';

-- 59. Real Life Query: Top 3 languages used in media reports
SELECT language, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY language
ORDER BY total_reports DESC
LIMIT 3;

-- 60. Final Real Life Insight: Generate yearly media coverage stats
SELECT YEAR(published_date) AS year, COUNT(*) AS total_reports
FROM Media_Coverage
GROUP BY YEAR(published_date)
ORDER BY year;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 22: Government_Schemes
CREATE TABLE Government_Schemes (
    scheme_id INT PRIMARY KEY, -- unique identifier for each scheme
    scheme_name VARCHAR(150) NOT NULL UNIQUE,
    department VARCHAR(100),
    launch_year INT,
    eligibility_criteria TEXT,
    benefits TEXT,
    application_link TEXT,
    duration VARCHAR(50),
    contact_info VARCHAR(100),
    status VARCHAR(50) DEFAULT 'Active'
);

-- Insert 20 records into Government_Schemes table
INSERT INTO Government_Schemes (scheme_id, scheme_name, department, launch_year, eligibility_criteria,benefits, application_link, duration, contact_info, status)
VALUES
(1, 'Guru Shishya Parampara Scheme', 'Ministry of Culture', 2003, 'Traditional art masters and apprentices.', 'Financial assistance for art training.', 'https://indiaculture.gov.in/guru-shishya', '3 years', 'culture@gov.in', 'Active'),
(2, 'Ambedkar Hastshilp Vikas Yojana', 'Development Commissioner (Handicrafts)', 2001, 'SC/ST craft artisans and SHGs.', 'Skill development, marketing, raw material support.', 'https://handicrafts.nic.in/ahvy', 'Ongoing', 'dc.handicrafts@gov.in', 'Active'),
(3, 'Scheme for Financial Assistance for Cultural Activities', 'Ministry of Culture', 2010, 'Registered cultural NGOs.', 'Grant for organizing events, festivals, workshops.', 'https://indiaculture.gov.in/funding', '1 year', 'support@indiaculture.gov.in', 'Active'),
(4, 'SFURTI Scheme', 'MSME Ministry', 2005, 'Traditional industries and artisan clusters.', 'Common facility centers, skill upgradation, branding.', 'https://sfurti.msme.gov.in', '5 years', 'sfurti@dcmsme.gov.in', 'Active'),
(5, 'Mega Cluster Development', 'Textiles Ministry', 2014, 'Artisan-based clusters in weaving/handicrafts.', 'Infrastructure, training, e-commerce support.', 'https://texmin.nic.in/megacluster', '5 years', 'clusters@texmin.nic.in', 'Active'),
(6, 'National Handloom Development Programme', 'Ministry of Textiles', 2015, 'Handloom weavers.', 'Looms, tools, marketing assistance.', 'https://handloom.nic.in/nhdp', 'Annual', 'weaverhelp@handloom.in', 'Active'),
(7, 'Marketing and Service Scheme (MSS)', 'TRIFED, MoTA', 2006, 'ST artisans and craftspeople.', 'Participation in fairs, exhibitions, sales.', 'https://trifed.tribal.gov.in', 'Project-wise', 'support@trifed.gov.in', 'Active'),
(8, 'National Culture Fund', 'Ministry of Culture', 1996, 'Private/public partnerships.', 'Support for heritage conservation and crafts.', 'https://indiaculture.gov.in/ncf', 'Project based', 'ncf@culture.gov.in', 'Active'),
(9, 'Handicrafts Promotion Scheme', 'Ministry of Textiles', 2012, 'Registered artisans and SHGs.', 'Promotion campaigns, brand building.', 'https://handicrafts.nic.in/promotion', '3 years', 'promotion@dc-handicrafts.gov.in', 'Active'),
(10, 'Prahari Gram Yojana', 'Khadi & Village Industries Commission', 2017, 'Artisans in border villages.', 'Support for craft-based livelihoods.', 'https://kviconline.gov.in/pgy', '2 years', 'kvic-info@kvic.gov.in', 'Active'),
(11, 'Ustad Scheme', 'Ministry of Minority Affairs', 2015, 'Minority community artisans.', 'Skill development, capacity building.', 'https://minorityaffairs.gov.in/ustad', '3 years', 'ustad@nic.in', 'Active'),
(12, 'Craftsmen Welfare Fund', 'DC Handicrafts', 2007, 'Craft artisans with artisan card.', 'Health, life insurance, pension.', 'https://handicrafts.gov.in/welfare', 'Annual', 'welfare@handicrafts.nic.in', 'Active'),
(13, 'Craft Incubation Centers', 'MSME & NIFT', 2018, 'Craft startups and design students.', 'Mentorship, space, technical tools.', 'https://nift.ac.in/incubation', '2 years', 'incubation@nift.ac.in', 'Active'),
(14, 'Skill India for Artisans', 'NSDC', 2016, 'Artisans and rural youths.', 'Craft-based skilling and certification.', 'https://skillindia.gov.in/artisan', '1–6 months', 'info@nsdcindia.org', 'Active'),
(15, 'Artisan Credit Card Scheme', 'NABARD', 2012, 'Individual registered artisans.', 'Collateral-free working capital up to ₹2 lakh.', 'https://nabard.org/creditcard', '3 years renewable', 'support@nabard.org', 'Active'),
(16, 'Digital India for Crafts', 'MeitY', 2019, 'Artisan collectives.', 'Training on e-commerce, digital marketing.', 'https://meity.gov.in/digitalcrafts', 'Ongoing', 'info@digitalindia.gov.in', 'Active'),
(17, 'GI Tagging Support Program', 'Department for Promotion of Industry & Internal Trade', 2005, 'Traditional artisan clusters.', 'Support for GI registration and awareness.', 'https://dpiit.gov.in/gi', '5 years', 'gi-help@dpiit.gov.in', 'Active'),
(18, 'One District One Product (ODOP)', 'Government of India', 2020, 'District-level artisans and producers.', 'Branding, packaging, export promotion.', 'https://odop.gov.in', 'Ongoing', 'odop-support@goi.in', 'Active'),
(19, 'Shilp Guru Awards', 'DC Handicrafts', 2001, 'Master artisans with 20+ years of excellence.', 'National award with ₹2 lakh reward.', 'https://handicrafts.nic.in/awards', 'Annual', 'awards@handicrafts.gov.in', 'Active'),
(20, 'Mati Kala Board Yojana', 'Uttar Pradesh Govt.', 2018, 'Terracotta & pottery artisans.', 'Training, raw material, exhibition participation.', 'https://matikalaboard.up.gov.in', '2 years', 'info@matikala.up.gov.in', 'Active');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Government_Schemes;

-- to remove complete data from table
truncate table Government_Schemes;

-- to delete complete attributes and records 
drop table Government_Schemes;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column for scheme budget (useful for financial reports)
ALTER TABLE Government_Schemes ADD COLUMN budget_amount DECIMAL(12,2);

-- 2. DDL: Modify scheme_name length to allow longer titles
ALTER TABLE Government_Schemes MODIFY scheme_name VARCHAR(200);

-- 3. Constraint: Add DEFAULT to duration for ongoing schemes
ALTER TABLE Government_Schemes MODIFY duration VARCHAR(50) DEFAULT 'Ongoing';

-- 4. DML: Update the duration of Skill India for Artisans (real life change)
UPDATE Government_Schemes
SET duration = '1 year renewable'
WHERE scheme_name = 'Skill India for Artisans';

-- 5. Clause: Select all active schemes launched after 2015
SELECT scheme_name, launch_year, status
FROM Government_Schemes
WHERE status = 'Active' AND launch_year > 2015;

-- 6. Operator: Find schemes launched before 2010
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year < 2010;

-- 7. Clause with BETWEEN: Schemes launched between 2010 and 2020
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year BETWEEN 2010 AND 2020;

-- 8. Clause with ORDER BY: List schemes ordered by launch_year (latest first)
SELECT scheme_name, launch_year
FROM Government_Schemes
ORDER BY launch_year DESC;

-- 9. Clause with DISTINCT: List all unique departments running schemes
SELECT DISTINCT department FROM Government_Schemes;

-- 10. Real Life: Show schemes with online applications only
SELECT scheme_name, application_link
FROM Government_Schemes
WHERE application_link LIKE 'http%';

-- 11. Real Life: Count total active schemes per ministry
SELECT department, COUNT(*) AS total_active
FROM Government_Schemes
WHERE status = 'Active'
GROUP BY department;

-- 12. Function: Get the length of each scheme name (useful for formatting reports)
SELECT scheme_name, LENGTH(scheme_name) AS name_length
FROM Government_Schemes;

-- 13. Function: Convert all scheme names to uppercase for display
SELECT UPPER(scheme_name) AS scheme_title, department
FROM Government_Schemes;

-- 14. Function: Extract year from launch_year (already integer, but demonstrating)
SELECT scheme_name, YEAR(CURDATE()) - launch_year AS scheme_age
FROM Government_Schemes;

-- 15. Aggregate: Count total schemes by department
SELECT department, COUNT(*) AS total_schemes
FROM Government_Schemes
GROUP BY department;

-- 16. Aggregate: Average launch year for all schemes
SELECT AVG(launch_year) AS avg_launch_year
FROM Government_Schemes;

-- 17. Aggregate with HAVING: Departments with more than 2 schemes
SELECT department, COUNT(*) AS total
FROM Government_Schemes
GROUP BY department
HAVING COUNT(*) > 2;

-- 18. Real Life: Find how many schemes are currently ongoing (status = Active)
SELECT COUNT(*) AS active_schemes
FROM Government_Schemes
WHERE status = 'Active';

-- 19. Real Life: Find top 5 recently launched schemes
SELECT scheme_name, launch_year
FROM Government_Schemes
ORDER BY launch_year DESC
LIMIT 5;

-- 20. Join (Self Join Example): Compare schemes launched in the same year
SELECT a.scheme_name AS scheme1, b.scheme_name AS scheme2, a.launch_year
FROM Government_Schemes a
JOIN Government_Schemes b
ON a.launch_year = b.launch_year AND a.scheme_id < b.scheme_id;

-- 21. Subquery: Find schemes launched after the average launch year
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year > (SELECT AVG(launch_year) FROM Government_Schemes);

-- 22. Subquery: List departments that launched more than 3 schemes
SELECT DISTINCT department
FROM Government_Schemes
WHERE department IN (
  SELECT department
  FROM Government_Schemes
  GROUP BY department
  HAVING COUNT(*) > 3
);

-- 23. Real Life Subquery: Get latest scheme launched by Ministry of Culture
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year = (
  SELECT MAX(launch_year)
  FROM Government_Schemes
  WHERE department = 'Ministry of Culture'
);

-- 24. Operator with Functions: Show all schemes where scheme_name length > 25
SELECT scheme_name, LENGTH(scheme_name) AS title_length
FROM Government_Schemes
WHERE LENGTH(scheme_name) > 25;

-- 25. Real Life: Show all schemes that are "Annual" duration type
SELECT scheme_name, department
FROM Government_Schemes
WHERE duration LIKE '%Annual%';

-- 26. Real Life: Find top 3 ministries with maximum active schemes
SELECT department, COUNT(*) AS active_count
FROM Government_Schemes
WHERE status = 'Active'
GROUP BY department
ORDER BY active_count DESC
LIMIT 3;

-- 27. Real Life Report: Show scheme name and status with a message
SELECT scheme_name,
       CONCAT(scheme_name, ' is currently ', status) AS status_message
FROM Government_Schemes;

-- 28. Window Function: Rank schemes based on launch_year (latest first)
SELECT scheme_name, launch_year,
       RANK() OVER (ORDER BY launch_year DESC) AS launch_rank
FROM Government_Schemes;

-- 29. Window Function: Row number per department
SELECT department, scheme_name, 
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY launch_year) AS row_num
FROM Government_Schemes;

-- 30. Window Function: Dense rank on launch year
SELECT scheme_name, launch_year,
       DENSE_RANK() OVER (ORDER BY launch_year ASC) AS year_rank
FROM Government_Schemes;

-- 31. Window Function: Count how many schemes each department has
SELECT department, scheme_name,
       COUNT(*) OVER (PARTITION BY department) AS dept_total
FROM Government_Schemes;

-- 32. Window Function: Find previous scheme launched using LAG
SELECT scheme_name, launch_year,
       LAG(scheme_name) OVER (ORDER BY launch_year) AS previous_scheme
FROM Government_Schemes;

-- 33. Window Function: Find next scheme launched using LEAD
SELECT scheme_name, launch_year,
       LEAD(scheme_name) OVER (ORDER BY launch_year) AS next_scheme
FROM Government_Schemes;

-- 34. Running Total: Cumulative schemes launched over years
SELECT scheme_name, launch_year,
       COUNT(*) OVER (ORDER BY launch_year) AS cumulative_count
FROM Government_Schemes;

-- 35. Percent Rank: Distribution of launch years
SELECT scheme_name, launch_year,
       PERCENT_RANK() OVER (ORDER BY launch_year) AS perc_rank
FROM Government_Schemes;

-- 36. NTILE: Divide schemes into 4 groups by launch year
SELECT scheme_name, launch_year,
       NTILE(4) OVER (ORDER BY launch_year) AS quartile_group
FROM Government_Schemes;

-- 37. Subquery: Find schemes launched in the same year as 'SFURTI Scheme'
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year = (
  SELECT launch_year FROM Government_Schemes WHERE scheme_name = 'SFURTI Scheme'
);

-- 38. Subquery: Schemes older than 'Ustad Scheme'
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year < (
  SELECT launch_year FROM Government_Schemes WHERE scheme_name = 'Ustad Scheme'
);

-- 39. Subquery: Schemes launched in the same department as 'Craft Incubation Centers'
SELECT scheme_name, department
FROM Government_Schemes
WHERE department = (
  SELECT department FROM Government_Schemes WHERE scheme_name = 'Craft Incubation Centers'
);

-- 40. Real Life: Find all schemes launched before Digital India (2019)
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year < (
  SELECT launch_year FROM Government_Schemes WHERE scheme_name = 'Digital India for Crafts'
);

-- 41. Subquery with IN: Find schemes from ministries with only 1 scheme
SELECT scheme_name, department
FROM Government_Schemes
WHERE department IN (
  SELECT department
  FROM Government_Schemes
  GROUP BY department
  HAVING COUNT(*) = 1
);

-- 42. Real Life Join (Self-Join): Match schemes from same department but different years
SELECT a.scheme_name AS scheme_1, b.scheme_name AS scheme_2, a.department
FROM Government_Schemes a
JOIN Government_Schemes b
ON a.department = b.department AND a.scheme_id < b.scheme_id;

-- 43. Real Life Analysis: Find how many schemes per status
SELECT status, COUNT(*) AS total
FROM Government_Schemes
GROUP BY status;

-- 44. Real Life: Find schemes launched between 2010 and 2020
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year BETWEEN 2010 AND 2020;

-- 45. Real Life: Schemes with 'Credit' in their name
SELECT scheme_name, benefits
FROM Government_Schemes
WHERE scheme_name LIKE '%Credit%';

-- 46. Real Life: Schemes launched by NABARD
SELECT scheme_name, launch_year, benefits
FROM Government_Schemes
WHERE department LIKE '%NABARD%';

-- 47. Real Life Report: Show scheme name with custom message
SELECT CONCAT(scheme_name, ' launched in ', launch_year, ' by ', department) AS full_info
FROM Government_Schemes;

-- 48. Add a NOT NULL constraint to contact_info (ensuring govt contact is always present)
ALTER TABLE Government_Schemes
MODIFY contact_info VARCHAR(100) NOT NULL;

-- 49. Add a CHECK constraint to ensure launch_year >= 1990
ALTER TABLE Government_Schemes
ADD CONSTRAINT chk_launch_year CHECK (launch_year >= 1990);

-- 50. Drop the CHECK constraint (simulate policy update)
ALTER TABLE Government_Schemes
DROP CONSTRAINT chk_launch_year;

-- 51. Add a DEFAULT value for status column
ALTER TABLE Government_Schemes
ALTER COLUMN status SET DEFAULT 'Active';

-- 52. Create a Trigger to log whenever a new scheme is inserted
CREATE TABLE Scheme_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    scheme_id INT,
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_scheme_insert
AFTER INSERT ON Government_Schemes
FOR EACH ROW
INSERT INTO Scheme_Log (scheme_id, action)
VALUES (NEW.scheme_id, 'INSERTED');

-- 53. Subquery: Find latest launched scheme
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year = (SELECT MAX(launch_year) FROM Government_Schemes);

-- 54. Subquery: Find earliest launched scheme
SELECT scheme_name, launch_year
FROM Government_Schemes
WHERE launch_year = (SELECT MIN(launch_year) FROM Government_Schemes);

-- 55. Subquery with EXISTS: Check if Ministry of Culture has schemes
SELECT 'Yes, Ministry of Culture has schemes'
WHERE EXISTS (SELECT 1 FROM Government_Schemes WHERE department LIKE '%Culture%');

-- 56. Case Statement: Label schemes as 'Old' or 'New'
SELECT scheme_name, launch_year,
       CASE WHEN launch_year < 2010 THEN 'Old Scheme' ELSE 'New Scheme' END AS scheme_type
FROM Government_Schemes;

-- 57. Real Life Report: Show schemes with short vs long duration
SELECT scheme_name, duration,
       CASE WHEN duration LIKE '%year%' THEN 'Long Term' ELSE 'Short Term' END AS duration_type
FROM Government_Schemes;

-- 58. Real Life Analysis: Count schemes per decade
SELECT (launch_year DIV 10) * 10 AS decade, COUNT(*) AS total_schemes
FROM Government_Schemes
GROUP BY decade
ORDER BY decade;

-- 59. Real Life Report: List schemes with formatted info
SELECT CONCAT(scheme_name, ' (', launch_year, ') - ', department) AS scheme_overview
FROM Government_Schemes;

-- 60. Final Subquery: Find department with the maximum number of schemes
SELECT department, COUNT(*) AS scheme_count
FROM Government_Schemes
GROUP BY department
HAVING COUNT(*) = (
  SELECT MAX(dept_count) 
  FROM (
    SELECT COUNT(*) AS dept_count 
    FROM Government_Schemes 
    GROUP BY department
  ) AS sub
);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 23: Artisan_Feedback
CREATE TABLE Artisan_Feedback (
    feedback_id INT PRIMARY KEY, -- unique identifier for each feedback 
    artisan_id INT,
    workshop_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    suggestion TEXT,
    liked_most VARCHAR(100),                  -- What artisan liked the most
    improvement_area VARCHAR(100),            -- Area artisan wants improved
    instructor_rating INT CHECK (instructor_rating BETWEEN 1 AND 5),  -- New
    facility_rating INT CHECK (facility_rating BETWEEN 1 AND 5),      -- New
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id),
    FOREIGN KEY (workshop_id) REFERENCES Workshops(workshop_id)
);

-- Insert 20 records into Artisan_Feedback table
INSERT INTO Artisan_Feedback (feedback_id, artisan_id, workshop_id, rating, comments, suggestion,liked_most, improvement_area, instructor_rating, facility_rating)
 VALUES
(1, 1, 1, 5, 'Excellent workshop on Madhubani techniques.', 'More practice sessions.', 'Live demo', 'Time management', 5, 4),
(2, 2, 1, 4, 'Good explanation and examples.', 'Include certificate distribution.', 'Hands-on activities', 'Venue size', 4, 3),
(3, 3, 2, 5, 'Loved the Pattachitra painting sessions.', 'Add translation in local language.', 'Friendly trainer', 'More tools', 5, 4),
(4, 4, 2, 3, 'It was okay but a bit long.', 'Shorten the duration.', 'Craft material', 'Timing of breaks', 3, 4),
(5, 5, 3, 4, 'Venue was clean and well organized.', 'More local case studies.', 'Venue & instructor', 'More visuals', 4, 4),
(6, 6, 3, 5, 'Great experience with Warli art.', 'Share workshop slides later.', 'Interactive learning', 'Projector quality', 5, 5),
(7, 7, 4, 3, 'Trainer spoke too fast.', 'More visuals would help.', 'Art samples', 'Audio clarity', 2, 3),
(8, 8, 4, 4, 'Good initiative for rural artisans.', 'Conduct follow-up sessions.', 'Art discussions', 'Air circulation', 4, 4),
(9, 9, 5, 5, 'I learned new skills in clay modeling.', 'Provide materials post-session.', 'Craft practice', 'Seating comfort', 5, 4),
(10, 10, 5, 4, 'Enjoyed the bamboo basket workshop.', 'Make it two days long.', 'Traditional knowledge', 'Fan availability', 4, 4),
(11, 11, 6, 5, 'Amazing environment and guidance.', 'Conduct in other regions too.', 'Personal guidance', 'Hall size', 5, 5),
(12, 12, 6, 3, 'Bit confusing at start.', 'Pre-session orientation needed.', 'Group interaction', 'Toilet facilities', 3, 3),
(13, 13, 7, 4, 'Informative, especially about terracotta.', 'Give booklets.', 'Clay demo', 'Tool availability', 4, 4),
(14, 14, 7, 5, 'Really good learning session.', 'Repeat every quarter.', 'Trainer energy', 'Light arrangement', 5, 5),
(15, 15, 8, 4, 'Good team and facilities.', 'Need better chairs.', 'Instructor attitude', 'Comfort', 4, 3),
(16, 16, 8, 3, 'Quite useful but tiring.', 'Provide snacks.', 'Practical knowledge', 'Breaks', 3, 3),
(17, 17, 9, 5, 'Motivated me to do more craftwork.', 'Start evening batches.', 'Craft exposure', 'Seating', 5, 5),
(18, 18, 9, 4, 'Clear and engaging session.', 'Add certificate.', 'Examples shown', 'Water supply', 4, 4),
(19, 19, 10, 5, 'Excellent for beginners.', 'Include advanced batch too.', 'Materials used', 'Fan speed', 5, 5),
(20, 20, 10, 3, 'Average session, could be improved.', 'More handouts.', 'Friendly staff', 'Air circulation', 3, 3);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Artisan_Feedback;

-- to remove complete data from table
truncate table Artisan_Feedback;

-- to delete complete attributes and records 
drop table Artisan_Feedback;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Rename a column (suggestion -> recommendations)
ALTER TABLE Artisan_Feedback
RENAME COLUMN suggestion TO recommendations;

-- 2. Manimum instructor_rating
SELECT Min(instructor_rating) FROM Artisan_Feedback;

-- 3. String function: feedback with 'Excellent'
SELECT lower(comments) FROM Artisan_Feedback WHERE comments LIKE '%Excellent%';

-- 4. Change datatype of comments to VARCHAR(500)
ALTER TABLE Artisan_Feedback
MODIFY comments VARCHAR(500);

-- 5. Add a UNIQUE constraint on feedback_id (already primary but just example)
ALTER TABLE Artisan_Feedback
ADD CONSTRAINT unique_feedback UNIQUE (feedback_id);

-- 6. Drop the UNIQUE constraint
ALTER TABLE Artisan_Feedback
DROP INDEX unique_feedback;

-- 7. Create an index on rating for faster queries
CREATE INDEX idx_rating ON Artisan_Feedback(rating);

-- 8. Drop the index
DROP INDEX idx_rating ON Artisan_Feedback;

-- 9. Update a feedback comment
UPDATE Artisan_Feedback
SET comments = 'Amazing clay modeling workshop!'
WHERE feedback_id = 9;

-- 10. Delete a feedback (if duplicate found)
DELETE FROM Artisan_Feedback
WHERE feedback_id = 20;

-- 11. Increase all facility_rating by 1 (max 5)
UPDATE Artisan_Feedback
SET facility_rating = LEAST(facility_rating + 1, 5);

-- 12. Set all NULL comments to 'No comments provided'
UPDATE Artisan_Feedback
SET comments = 'No comments provided'
WHERE comments IS NULL;

-- 13. Restore deleted data from backup
INSERT INTO Artisan_Feedback
SELECT * FROM Artisan_Feedback_Backup WHERE feedback_id=20;

-- 14. Increase rating of artisans who gave facility_rating = 5
UPDATE Artisan_Feedback
SET rating = 5
WHERE facility_rating = 5;

-- 15. INNER JOIN feedback with artisan details
SELECT a.name, f.rating, f.comments
FROM Artisan_Feedback f
INNER JOIN Artisans a ON f.artisan_id = a.artisan_id;

-- 16. LEFT JOIN workshops with feedback
SELECT w.title, f.rating
FROM Workshops w
LEFT JOIN Artisan_Feedback f ON w.workshop_id = f.workshop_id;

-- 17. RIGHT JOIN artisans with feedback
SELECT a.artisan_name, f.rating
FROM Artisans a
RIGHT JOIN Artisan_Feedback f ON a.artisan_id = f.artisan_id;

-- 18. JOIN with condition – high ratings
SELECT a.name, f.rating
FROM Artisans a
JOIN Artisan_Feedback f ON a.artisan_id = f.artisan_id
WHERE f.rating = 5;

-- 19. Feedback count per workshop
SELECT w.title, COUNT(f.feedback_id) AS total_feedback
FROM Workshops w
LEFT JOIN Artisan_Feedback f ON w.workshop_id = f.workshop_id
GROUP BY w.title;

-- 20. AVG rating per workshop
SELECT w.workshop_name, AVG(f.rating) AS avg_rating
FROM Workshops w
JOIN Artisan_Feedback f ON w.workshop_id = f.workshop_id
GROUP BY w.workshop_name;

-- 21. Find artisans who gave instructor_rating < 3
SELECT a.name, f.instructor_rating
FROM Artisan_Feedback f
JOIN Artisans a ON f.artisan_id = a.artisan_id
WHERE f.instructor_rating < 3;

-- 22. Workshops where artisans asked for 'snacks'
SELECT w.title, f.comments
FROM Workshops w
JOIN Artisan_Feedback f ON w.workshop_id = f.workshop_id
WHERE f.recommendations LIKE '%snacks%';

-- 23. List artisans with workshop names
SELECT a.name, w.title, f.rating
FROM Artisan_Feedback f
JOIN Artisans a ON f.artisan_id = a.artisan_id
JOIN Workshops w ON f.workshop_id = w.workshop_id;

-- 24. Find average rating
SELECT AVG(rating) AS avg_rating FROM Artisan_Feedback;

-- 25. Maximum instructor_rating
SELECT MAX(instructor_rating) FROM Artisan_Feedback;

-- 26. Count how many feedbacks are 5-star
SELECT COUNT(*) FROM Artisan_Feedback WHERE rating = 5;

-- 27. String function: feedback with 'Excellent'
SELECT UPPER(comments) FROM Artisan_Feedback WHERE comments LIKE '%Excellent%';

-- 28. Length of comments
SELECT feedback_id, LENGTH(comments) AS comment_length
FROM Artisan_Feedback;

-- 29. Use CONCAT for report
SELECT CONCAT('Artisan ', artisan_id, ' rated ', rating, '/5') AS feedback_summary
FROM Artisan_Feedback;

-- 30. Use ROUND on average rating
SELECT ROUND(AVG(rating),2) FROM Artisan_Feedback;

-- 31. Use ABS difference between instructor and facility rating
SELECT feedback_id, ABS(instructor_rating - facility_rating) AS rating_diff
FROM Artisan_Feedback;

-- 32. Modulo operator – even feedback_id
SELECT feedback_id FROM Artisan_Feedback WHERE feedback_id % 2 = 0;

-- 33. BETWEEN operator – ratings 3 to 4
SELECT * FROM Artisan_Feedback WHERE rating BETWEEN 3 AND 4;

-- 34. IN operator – select only artisans 1,2,3
SELECT * FROM Artisan_Feedback WHERE artisan_id IN (1,2,3);

-- 35. LIKE operator – comments with 'clay'
SELECT * FROM Artisan_Feedback WHERE comments LIKE '%clay%';

-- 36. NOT LIKE – exclude bamboo workshops
SELECT * FROM Artisan_Feedback WHERE comments NOT LIKE '%bamboo%';

-- 37. COALESCE – handle null recommendations
SELECT feedback_id, COALESCE(recommendations,'No suggestion') AS final_suggestion
FROM Artisan_Feedback;

-- 38. GROUP BY workshop_id
SELECT workshop_id, AVG(rating) FROM Artisan_Feedback GROUP BY workshop_id;

-- 39. HAVING – avg rating > 4
SELECT workshop_id, AVG(rating) as avg_rate
FROM Artisan_Feedback
GROUP BY workshop_id
HAVING avg_rate > 4;

-- 40. LIMIT top 5 feedbacks
SELECT * FROM Artisan_Feedback ORDER BY rating DESC LIMIT 5;

-- 41. DISTINCT artisans who gave feedback
SELECT DISTINCT artisan_id FROM Artisan_Feedback;

-- 42. Subquery: artisans with above avg rating
SELECT artisan_id, rating
FROM Artisan_Feedback
WHERE rating > (SELECT AVG(rating) FROM Artisan_Feedback);

-- 43. Subquery: workshop with max avg rating
SELECT workshop_id
FROM Artisan_Feedback
GROUP BY workshop_id
ORDER BY AVG(rating) DESC
LIMIT 1;

-- 44. EXISTS – find if feedback exists for artisan 5
SELECT 'Yes, Feedback exists'
WHERE EXISTS (SELECT 1 FROM Artisan_Feedback WHERE artisan_id=5);

-- 45. NOT EXISTS – artisans with no feedback
SELECT a.name
FROM Artisans a
WHERE NOT EXISTS (SELECT 1 FROM Artisan_Feedback f WHERE a.artisan_id=f.artisan_id);

-- 46. Nested subquery – top rated artisan
SELECT artisan_id, rating
FROM Artisan_Feedback
WHERE rating = (SELECT MAX(rating) FROM Artisan_Feedback);

-- 47. Rank artisans by rating
SELECT artisan_id, rating, RANK() OVER (ORDER BY rating DESC) AS rank_position
FROM Artisan_Feedback;

-- 48. Dense rank by facility_rating
SELECT artisan_id, facility_rating, DENSE_RANK() OVER (ORDER BY facility_rating DESC) AS rank_dense
FROM Artisan_Feedback;

-- 49. Row number by feedback_id
SELECT feedback_id, ROW_NUMBER() OVER (ORDER BY feedback_id) AS row_no
FROM Artisan_Feedback;

-- 50. Running total of ratings
SELECT feedback_id, rating,
       SUM(rating) OVER (ORDER BY feedback_id) AS running_total
FROM Artisan_Feedback;

-- 51. Moving average of rating
SELECT feedback_id, rating,
       AVG(rating) OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Artisan_Feedback;

-- 52. Partition by workshop
SELECT workshop_id, artisan_id, rating,
       RANK() OVER (PARTITION BY workshop_id ORDER BY rating DESC) AS rank_in_workshop
FROM Artisan_Feedback;

-- 53. Lead function – next artisan rating
SELECT feedback_id, rating,
       LEAD(rating) OVER (ORDER BY feedback_id) AS next_rating
FROM Artisan_Feedback;

-- 54. Lag function – previous artisan rating
SELECT feedback_id, rating,
       LAG(rating) OVER (ORDER BY feedback_id) AS prev_rating
FROM Artisan_Feedback;

-- 55. Max rating per workshop (window)
SELECT workshop_id, rating,
       MAX(rating) OVER (PARTITION BY workshop_id) AS max_in_workshop
FROM Artisan_Feedback;

-- 56. Count feedback per workshop using window
SELECT workshop_id, COUNT(*) OVER (PARTITION BY workshop_id) AS feedback_count
FROM Artisan_Feedback;

-- 57. Trigger to auto log feedback insert
CREATE TABLE Feedback_Log (
   log_id INT AUTO_INCREMENT PRIMARY KEY,
   feedback_id INT,
   action VARCHAR(50),
   log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_feedback_insert
AFTER INSERT ON Artisan_Feedback
FOR EACH ROW
INSERT INTO Feedback_Log (feedback_id, action) VALUES (NEW.feedback_id, 'Inserted');

-- 58. Real life report – feedback summary
SELECT workshop_id, AVG(rating) AS avg_rating, AVG(instructor_rating) AS avg_instructor, AVG(facility_rating) AS avg_facility
FROM Artisan_Feedback
GROUP BY workshop_id;

-- 59. Real life – artisans who gave low facility rating
SELECT artisan_id, workshop_id, facility_rating
FROM Artisan_Feedback
WHERE facility_rating < 3;

-- 60. Real life – top 3 artisans by rating & instructor feedback
SELECT artisan_id, rating, instructor_rating
FROM Artisan_Feedback
ORDER BY rating DESC, instructor_rating DESC
LIMIT 3;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 24: Preservation_Techniques
CREATE TABLE Preservation_Techniques (
    technique_id INT PRIMARY KEY, -- unique identifier for each technique
    name VARCHAR(100) NOT NULL,
    description TEXT,
    used_in_craft VARCHAR(100),
    effectiveness_score INT CHECK (effectiveness_score BETWEEN 1 AND 10),
    equipment_needed TEXT,
    duration_days INT,
    success_rate DECIMAL(5,2),
    origin_place VARCHAR(100),
    is_traditional BOOLEAN DEFAULT TRUE
);

-- Insert 20 records into Preservation_Techniques table
INSERT INTO Preservation_Techniques (technique_id, name, description, used_in_craft, effectiveness_score,equipment_needed, duration_days, success_rate, origin_place, is_traditional) 
VALUES
(1, 'Neem Smoke Fumigation', 'Uses neem leaves smoke to protect organic crafts from insects.', 'Wood Carving', 8, 'Clay pot, dried neem leaves', 3, 89.5, 'Rajasthan', TRUE),
(2, 'Lime Coating', 'Applying lime over terracotta items to preserve them from weathering.', 'Terracotta', 7, 'Lime powder, water brush', 2, 81.3, 'West Bengal', TRUE),
(3, 'Herbal Oil Polishing', 'Using mustard oil and herbs to polish wooden crafts.', 'Wood Craft', 9, 'Mustard oil, neem oil, cloth', 1, 93.2, 'Odisha', TRUE),
(4, 'Banana Leaf Wrapping', 'Preservation of textiles using banana leaves to prevent moisture.', 'Handloom', 6, 'Banana leaves, ropes', 2, 77.8, 'Tamil Nadu', TRUE),
(5, 'Lac Sealing', 'Sealing miniature paintings with lac for gloss and durability.', 'Miniature Painting', 8, 'Lac stick, heat source', 1, 85.6, 'Rajasthan', TRUE),
(6, 'Aloe Vera Paste Treatment', 'Aloe paste applied to dry leaves or handmade paper to prevent cracking.', 'Leaf Art', 7, 'Fresh aloe, grinder, brush', 1, 82.1, 'Kerala', TRUE),
(7, 'Sun-Drying Technique', 'Traditional drying in controlled sunlight to preserve paints and dyes.', 'Madhubani Painting', 6, 'Flat surface, shade net', 2, 76.4, 'Bihar', TRUE),
(8, 'Cow Dung Coating', 'Natural insecticide and insulator used on clay murals.', 'Lippan Art', 7, 'Cow dung, hay, brush', 2, 79.9, 'Gujarat', TRUE),
(9, 'Charcoal Storage', 'Using charcoal powder to absorb moisture in art storage.', 'Metal Crafts', 8, 'Charcoal dust, cloth bags', 3, 88.7, 'Jharkhand', TRUE),
(10, 'Coconut Oil Rubbing', 'Coconut oil applied to masks and bamboo products for shine and longevity.', 'Mask Making', 9, 'Coconut oil, cloth', 1, 92.4, 'Assam', TRUE),
(11, 'Mud Encasement', 'Wrapping pottery in damp mud for temperature control.', 'Earthenware', 6, 'River clay, rope, box', 4, 75.5, 'Uttar Pradesh', TRUE),
(12, 'Ash Filtering', 'Protects ancient paper documents by filtering with fine ash.', 'Palm Leaf Manuscripts', 7, 'Fine ash, sieve, gloves', 3, 80.3, 'Odisha', TRUE),
(13, 'Indigo Coating', 'Using indigo leaves to strengthen natural dyes on cloth.', 'Ajrakh Print', 8, 'Indigo leaves, basin, gloves', 5, 87.9, 'Gujarat', TRUE),
(14, 'Turmeric Wash', 'Prevents fungal growth on fabrics using turmeric water.', 'Handwoven Sarees', 6, 'Haldi powder, bucket, cloth', 1, 78.8, 'Maharashtra', TRUE),
(15, 'Bee Wax Layering', 'Used for brass crafts to retain sheen.', 'Brass Items', 9, 'Beeswax, heat plate, cloth', 2, 91.7, 'Madhya Pradesh', TRUE),
(16, 'Boiled Tamarind Solution', 'Used for polishing and disinfecting bamboo craft.', 'Bamboo Weaving', 7, 'Tamarind pulp, brush', 2, 83.1, 'Tripura', TRUE),
(17, 'Clay Pot Storage', 'Natural humidifiers for textile and paper crafts.', 'Textiles', 5, 'Clay pots, cotton lining', 3, 74.5, 'Karnataka', TRUE),
(18, 'Copper Sulphate Spray', 'Mild spray used to avoid fungal infection on wooden crafts.', 'Wood Sculpture', 6, 'Spray bottle, solution', 1, 79.6, 'Nagaland', FALSE),
(19, 'Camphor Storage', 'Camphor used to protect delicate items from pests.', 'Silk Textiles', 8, 'Camphor balls, box', 2, 88.4, 'Varanasi', TRUE),
(20, 'Jaggery Vinegar Mix', 'Natural polishing agent for brass and copper.', 'Utensils & Ornaments', 7, 'Jaggery, vinegar, cloth', 1, 84.2, 'Punjab', TRUE);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Preservation_Techniques;

-- to remove complete data from table
truncate table Preservation_Techniques;

-- to delete complete attributes and records 
drop table Preservation_Techniques;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column to track last_review_date for technique validation
ALTER TABLE Preservation_Techniques
ADD COLUMN last_review_date DATE;

-- 2. DDL: Change is_traditional to NOT NULL with default TRUE
ALTER TABLE Preservation_Techniques
MODIFY is_traditional BOOLEAN NOT NULL DEFAULT TRUE;

-- 3. Constraint: Ensure effectiveness_score is integer between 1 and 10 (already exists but show alternate)
ALTER TABLE Preservation_Techniques
ADD CONSTRAINT chk_effectiveness_range CHECK (effectiveness_score BETWEEN 1 AND 10);

-- 4. Aggregate + HAVING: origin places with avg success_rate > 85
SELECT origin_place, ROUND(AVG(success_rate),2) AS avg_success
FROM Preservation_Techniques
GROUP BY origin_place
HAVING AVG(success_rate) > 85;

-- 5. Real-life: Techniques with short duration but high success (duration <=2 and success_rate >=90)
SELECT technique_id, name, duration_days, success_rate
FROM Preservation_Techniques
WHERE duration_days <= 2 AND success_rate >= 90;

-- 6. Subquery: Find techniques whose success_rate is equal to max success_rate
SELECT * FROM Preservation_Techniques
WHERE success_rate = (SELECT MAX(success_rate) FROM Preservation_Techniques);

-- 7. Window: lag/lead to compare previous and next technique success_rate
SELECT technique_id, name, success_rate,
       LAG(success_rate) OVER (ORDER BY success_rate) AS prev_success,
       LEAD(success_rate) OVER (ORDER BY success_rate) AS next_success
FROM Preservation_Techniques;

-- 8. Real-life: Find techniques that are ancient (is_traditional = TRUE) and effective (effectiveness_score >=8)
SELECT technique_id, name, effectiveness_score, success_rate
FROM Preservation_Techniques
WHERE is_traditional = TRUE AND effectiveness_score >= 8;

-- 9. Use JSON or complex data type simulation: if equipment_needed stored as comma-separated list, find techniques needing 'brush'
SELECT technique_id, name, equipment_needed
FROM Preservation_Techniques
WHERE equipment_needed LIKE '%brush%';

-- 10. DML: Update success_rate after re-evaluation
UPDATE Preservation_Techniques
SET success_rate = 90.0, last_review_date = '2025-08-15'
WHERE technique_id = 1; -- Neem Smoke Fumigation

-- 11. DQL: Get techniques with effectiveness >=8 sorted by success_rate descending
SELECT technique_id, name, effectiveness_score, success_rate
FROM Preservation_Techniques
WHERE effectiveness_score >= 8
ORDER BY success_rate DESC;

-- 12. Operator: Techniques NOT traditional
SELECT name, is_traditional FROM Preservation_Techniques
WHERE is_traditional = FALSE;

-- 13. Operator & LIKE: Techniques with 'oil' or 'oil' in description
SELECT technique_id, name
FROM Preservation_Techniques
WHERE LOWER(description) LIKE '%oil%';

-- 14. Clause: Count techniques by origin_place
SELECT origin_place, COUNT(*) AS technique_count
FROM Preservation_Techniques
GROUP BY origin_place;

-- 15. Data type check: Show techniques where duration_days IS NULL (missing data)
SELECT technique_id, name FROM Preservation_Techniques
WHERE duration_days IS NULL;

-- 16. Use BETWEEN: techniques with success_rate between 80 and 90
SELECT name, success_rate FROM Preservation_Techniques
WHERE success_rate BETWEEN 80 AND 90;

-- 17. Real-life: Show techniques effective for wooden crafts (Wood Carving / Wood Sculpture)
SELECT * FROM Preservation_Techniques
WHERE used_in_craft LIKE '%Wood%';

-- 18. DML bulk update: Increase effectiveness_score by 1 for techniques reviewed this year
UPDATE Preservation_Techniques
SET effectiveness_score = LEAST(effectiveness_score + 1, 10)
WHERE YEAR(last_review_date) = YEAR(CURDATE());

-- 19. DQL: Show top 5 techniques by success_rate
SELECT technique_id, name, success_rate
FROM Preservation_Techniques
ORDER BY success_rate DESC
LIMIT 5;

-- 20. Real-life: Find techniques that require heat (description contains 'heat' or equipment includes 'heat')
SELECT technique_id, name, equipment_needed, description
FROM Preservation_Techniques
WHERE LOWER(description) LIKE '%heat%' OR LOWER(equipment_needed) LIKE '%heat%';

-- 21. Window: Average duration per origin_place and show per row
SELECT technique_id, name, origin_place, duration_days,
       AVG(duration_days) OVER (PARTITION BY origin_place) AS avg_duration_by_place
FROM Preservation_Techniques;

-- 22. Subquery: Techniques with success_rate greater than average success_rate
SELECT technique_id, name, success_rate
FROM Preservation_Techniques
WHERE success_rate > (SELECT AVG(success_rate) FROM Preservation_Techniques);

-- 23. Subquery: Techniques originating from places that have more than 1 technique
SELECT technique_id, name, origin_place
FROM Preservation_Techniques
WHERE origin_place IN (
  SELECT origin_place FROM Preservation_Techniques GROUP BY origin_place HAVING COUNT(*) > 1
);

-- 24. Real-life: Techniques suitable for museums (success_rate >= 85 and traditional)
SELECT technique_id, name, success_rate
FROM Preservation_Techniques
WHERE success_rate >= 85 AND is_traditional = TRUE;

-- 25. Data type conversion: Show success_rate as percentage string
SELECT name, CONCAT(CAST(success_rate AS CHAR), '%') AS success_pct FROM Preservation_Techniques;

-- 26. Aggregation: Average duration_days and avg success_rate by used_in_craft
SELECT used_in_craft, AVG(duration_days) AS avg_duration, ROUND(AVG(success_rate),2) AS avg_success
FROM Preservation_Techniques
GROUP BY used_in_craft;

-- 27. Nested subquery: Techniques with effectiveness above the department median (example median calc)
SELECT technique_id, name, effectiveness_score
FROM Preservation_Techniques
WHERE effectiveness_score > (
  SELECT AVG(e1.effectiveness_score) FROM (
    SELECT effectiveness_score FROM Preservation_Techniques ORDER BY effectiveness_score LIMIT 5
  ) e1
);

-- 28. Multi-column ORDER: prioritize effectiveness then success_rate
SELECT technique_id, name, effectiveness_score, success_rate
FROM Preservation_Techniques
ORDER BY effectiveness_score DESC, success_rate DESC;

-- 29. NOT EXISTS: origin places without any traditional technique (all is_traditional = FALSE)
SELECT DISTINCT origin_place
FROM Preservation_Techniques p1
WHERE NOT EXISTS (
  SELECT 1 FROM Preservation_Techniques p2
  WHERE p1.origin_place = p2.origin_place AND p2.is_traditional = TRUE
);

-- 30. Real-life filter: Fast treatments (duration_days <= 1)
SELECT name, used_in_craft, duration_days FROM Preservation_Techniques
WHERE duration_days <= 1;

-- 31. Percentile (approx): show success_rate percentile per technique
SELECT technique_id, name, success_rate,
       NTILE(100) OVER (ORDER BY success_rate) AS percentile_rank
FROM Preservation_Techniques;

-- 32. Subquery in SELECT: Add rank of success_rate (scalar subquery)
SELECT technique_id, name, success_rate,
  (SELECT COUNT(*) + 1 FROM Preservation_Techniques p2 WHERE p2.success_rate > p1.success_rate) AS success_rank
FROM Preservation_Techniques p1;

-- 33. Real-life: Find techniques from 'Rajasthan' or 'Gujarat' — major craft hubs
SELECT technique_id, name, origin_place
FROM Preservation_Techniques
WHERE origin_place IN ('Rajasthan','Gujarat');

-- 34. Use COALESCE to provide default equipment text
SELECT technique_id, name, COALESCE(equipment_needed,'Standard tools') AS equipment
FROM Preservation_Techniques;

-- 35. Correlated subquery: techniques whose success_rate is higher than other techniques from same origin_place average
SELECT technique_id, name, success_rate, origin_place
FROM Preservation_Techniques p
WHERE success_rate > (
  SELECT AVG(success_rate) FROM Preservation_Techniques WHERE origin_place = p.origin_place
);

-- 36. Real-life: Techniques to recommend for textile storage (used_in_craft contains 'Textile' or 'Silk')
SELECT technique_id, name, used_in_craft
FROM Preservation_Techniques
WHERE used_in_craft LIKE '%Textile%' OR used_in_craft LIKE '%Silk%';

-- 37. DML: Mark older techniques for review that haven't been reviewed in 2 years
UPDATE Preservation_Techniques
SET last_review_date = NULL
WHERE last_review_date < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 38. DQL + ORDER: List techniques with longest duration_days first
SELECT technique_id, name, duration_days FROM Preservation_Techniques
ORDER BY duration_days DESC;

-- 39. Advanced subquery: Find technique(s) with maximum effectiveness_score per used_in_craft
SELECT p.*
FROM Preservation_Techniques p
WHERE (p.used_in_craft, p.effectiveness_score) IN (
  SELECT used_in_craft, MAX(effectiveness_score)
  FROM Preservation_Techniques
  GROUP BY used_in_craft
);

-- 40. Real-life: Recommend low-equipment techniques for field workshops (equipment_needed small or NULL)
SELECT technique_id, name, equipment_needed
FROM Preservation_Techniques
WHERE equipment_needed IS NULL OR CHAR_LENGTH(TRIM(equipment_needed)) < 30;

-- 41. Window: Rank techniques by effectiveness_score (highest = 1)
SELECT technique_id, name, effectiveness_score,
       RANK() OVER (ORDER BY effectiveness_score DESC) AS eff_rank
FROM Preservation_Techniques;

-- 42. Window: Dense rank techniques by success_rate
SELECT technique_id, name, success_rate,
       DENSE_RANK() OVER (ORDER BY success_rate DESC) AS success_dense_rank
FROM Preservation_Techniques;

-- 43. Window: Row number partitioned by origin_place to see examples per place
SELECT origin_place, technique_id, name,
       ROW_NUMBER() OVER (PARTITION BY origin_place ORDER BY success_rate DESC) AS rn_by_place
FROM Preservation_Techniques;

-- 44. Window: Moving average of success_rate over ordered technique_id
SELECT technique_id, name, success_rate,
       AVG(success_rate) OVER (ORDER BY technique_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_success
FROM Preservation_Techniques;

-- 45. Window: Cumulative count by origin_place (how many techniques recorded so far)
SELECT origin_place, technique_id,
       COUNT(*) OVER (PARTITION BY origin_place ORDER BY technique_id) AS cumulative_by_place
FROM Preservation_Techniques;

-- 46. Aggregate: Average success_rate by is_traditional flag
SELECT is_traditional, ROUND(AVG(success_rate),2) AS avg_success
FROM Preservation_Techniques
GROUP BY is_traditional;

-- 47. Window + AVG: average success_rate across all techniques shown alongside each technique
SELECT technique_id, name, success_rate,
       AVG(success_rate) OVER () AS overall_avg_success
FROM Preservation_Techniques;

-- 48. Data cleanup: Fix negative duration_days entries by setting to NULL and logging
UPDATE Preservation_Techniques
SET duration_days = NULL
WHERE duration_days < 0;

-- 49. Add a CHECK constraint on success_rate between 0 and 100 (percent)
ALTER TABLE Preservation_Techniques
ADD CONSTRAINT chk_success_rate CHECK (success_rate >= 0 AND success_rate <= 100);

-- 50. Subquery: Find origin places with best average success_rate
SELECT origin_place, ROUND(AVG(success_rate),2) AS avg_success
FROM Preservation_Techniques
GROUP BY origin_place
HAVING AVG(success_rate) = (
  SELECT MAX(avg_s) FROM (
    SELECT AVG(success_rate) AS avg_s FROM Preservation_Techniques GROUP BY origin_place
  ) AS t
);

-- 51. Real-life: Find lowest effectiveness techniques to target for improvement
SELECT technique_id, name, effectiveness_score
FROM Preservation_Techniques
ORDER BY effectiveness_score ASC
LIMIT 5;

-- 52. Real-life: Show techniques that are traditional but have success_rate < 80 (need training)
SELECT technique_id, name, success_rate, origin_place
FROM Preservation_Techniques
WHERE is_traditional = TRUE AND success_rate < 80;

-- 53. Use CASE: categorize technique maturity based on success_rate
SELECT technique_id, name, success_rate,
CASE
  WHEN success_rate >= 90 THEN 'Excellent'
  WHEN success_rate >= 80 THEN 'Good'
  WHEN success_rate >= 70 THEN 'Fair'
  ELSE 'Needs Improvement'
END AS maturity_category
FROM Preservation_Techniques;

-- 54. Complex subquery: list techniques whose success_rate > avg success_rate of their used_in_craft group
SELECT technique_id, name, used_in_craft, success_rate
FROM Preservation_Techniques p
WHERE success_rate > (
  SELECT AVG(success_rate) FROM Preservation_Techniques WHERE used_in_craft = p.used_in_craft
);

-- 55. Create view: quick lookup of high-performing short-duration techniques
CREATE VIEW vw_high_short AS
SELECT technique_id, name, used_in_craft, success_rate, duration_days
FROM Preservation_Techniques
WHERE success_rate >= 85 AND duration_days <= 2;

-- 56. Query the view
SELECT * FROM vw_high_short;

-- 57. Performance: create composite index on (used_in_craft, success_rate) for fast lookups
CREATE INDEX idx_craft_success ON Preservation_Techniques(used_in_craft, success_rate);

-- 58. Real-life: Send alerts for techniques needing review (last_review_date null or older than 3 years)
SELECT technique_id, name, last_review_date
FROM Preservation_Techniques
WHERE last_review_date IS NULL OR last_review_date < DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

-- 59. DML: Bulk update success_rate after pilot program (increase by 2%)
UPDATE Preservation_Techniques
SET success_rate = ROUND(success_rate * 1.02,2)
WHERE technique_id IN (1,3,10); -- example IDs from pilot

-- 60. Final analytics: Top 3 origin places by average success_rate
SELECT origin_place, ROUND(AVG(success_rate),2) AS avg_success
FROM Preservation_Techniques
GROUP BY origin_place
ORDER BY avg_success DESC
LIMIT 3;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 25: User_Login
CREATE TABLE User_Login (
    user_id INT PRIMARY KEY, -- unique identifier for each login
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(50) CHECK (role IN ('Admin', 'Artisan', 'Researcher', 'Volunteer')),
    last_login DATETIME,
    status VARCHAR(20) DEFAULT 'Active',
    email VARCHAR(100) UNIQUE,
    contact_number VARCHAR(15),
    profile_completed BOOLEAN DEFAULT FALSE,
    security_question VARCHAR(100),         -- for password recovery
    security_answer_hash VARCHAR(255),      -- hashed answer
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP -- account creation timestamp
);

-- Insert 20 records into User_Login table
INSERT INTO User_Login (user_id, username, password_hash, role, last_login, status,email, contact_number, profile_completed, security_question,security_answer_hash, created_at)
 VALUES
(1, 'aartiverma', 'hash_123', 'Artisan', '2025-07-01 10:30:00', 'Active', 'aarti.verma@gmail.com', '9876543210', TRUE, 'Your birth city?', 'hash_mumbai', '2024-12-01 09:00:00'),
(2, 'rajesh_meena', 'hash_124', 'Artisan', '2025-07-02 09:15:00', 'Active', 'rajesh.meena@yahoo.com', '9823456781', FALSE, 'Favorite color?', 'hash_blue', '2025-01-05 10:45:00'),
(3, 'admin_suman', 'hash_125', 'Admin', '2025-07-03 08:55:00', 'Active', 'suman.admin@gov.in', '9001234567', TRUE, 'Pet’s name?', 'hash_tiger', '2024-11-20 11:30:00'),
(4, 'divyapatil', 'hash_126', 'Volunteer', '2025-06-29 14:00:00', 'Active', 'divya.patil@ngo.org', '7890123456', TRUE, 'Favorite book?', 'hash_mahabharat', '2025-01-10 08:30:00'),
(5, 'manoj_k', 'hash_127', 'Researcher', '2025-07-01 12:30:00', 'Active', 'manoj.kumar@research.in', '7984561230', TRUE, 'Your school name?', 'hash_stmary', '2025-02-15 14:40:00'),
(6, 'deepaksharma', 'hash_128', 'Artisan', '2025-06-25 11:00:00', 'Active', 'deepak.sharma@gmail.com', '9871236540', TRUE, 'Birth city?', 'hash_jaipur', '2025-03-01 10:10:00'),
(7, 'megha_goyal', 'hash_129', 'Volunteer', '2025-06-30 13:20:00', 'Active', 'megha.goyal@vol.org', '9991122334', TRUE, 'Best friend’s name?', 'hash_nisha', '2025-02-01 09:05:00'),
(8, 'kartik_r', 'hash_130', 'Researcher', '2025-07-02 16:00:00', 'Active', 'kartik.rana@uni.edu', '9773344556', FALSE, 'First school?', 'hash_dps', '2025-03-05 08:25:00'),
(9, 'nidhi.m', 'hash_131', 'Artisan', '2025-06-28 09:30:00', 'Active', 'nidhi.mishra@gmail.com', '9654321876', TRUE, 'Mother’s maiden name?', 'hash_sen', '2025-01-25 07:55:00'),
(10, 'rahul_d', 'hash_132', 'Admin', '2025-07-04 17:00:00', 'Active', 'rahul.deshmukh@gov.in', '9090909090', TRUE, 'Favorite food?', 'hash_biryani', '2024-12-10 12:20:00'),
(11, 'priyasingh', 'hash_133', 'Volunteer', '2025-07-01 18:45:00', 'Active', 'priya.singh@ngo.org', '9012345678', TRUE, 'Best friend’s name?', 'hash_ravi', '2025-01-18 11:11:00'),
(12, 'sandeep_k', 'hash_134', 'Artisan', '2025-07-03 08:00:00', 'Active', 'sandeep.khanna@gmail.com', '9765432101', FALSE, 'Favorite animal?', 'hash_elephant', '2025-03-12 10:30:00'),
(13, 'anusha_p', 'hash_135', 'Researcher', '2025-06-30 14:40:00', 'Active', 'anusha.pillai@arts.in', '9876012345', TRUE, 'High school name?', 'hash_kvs', '2025-02-25 09:00:00'),
(14, 'yogita_j', 'hash_136', 'Volunteer', '2025-06-29 13:15:00', 'Active', 'yogita.joshi@vol.org', '9654312345', TRUE, 'Mother’s birth city?', 'hash_nagpur', '2025-04-01 08:45:00'),
(15, 'ishaan.s', 'hash_137', 'Artisan', '2025-07-03 10:10:00', 'Active', 'ishaan.shah@gmail.com', '9753124680', TRUE, 'Nickname?', 'hash_bunty', '2025-02-20 07:30:00'),
(16, 'komal_b', 'hash_138', 'Artisan', '2025-06-27 09:45:00', 'Active', 'komal.bhatt@gmail.com', '9823012345', TRUE, 'Your favorite flower?', 'hash_rose', '2025-03-10 08:50:00'),
(17, 'arvind_admin', 'hash_139', 'Admin', '2025-07-02 07:00:00', 'Active', 'arvind.singh@gov.in', '9988776655', TRUE, 'Favorite hobby?', 'hash_painting', '2024-12-05 06:30:00'),
(18, 'farhan_n', 'hash_140', 'Volunteer', '2025-06-30 15:30:00', 'Active', 'farhan.nazir@help.org', '9678452100', TRUE, 'Favorite city?', 'hash_delhi', '2025-01-30 11:45:00'),
(19, 'riya_m', 'hash_141', 'Researcher', '2025-07-01 11:55:00', 'Active', 'riya.malhotra@research.in', '9876543098', TRUE, 'Favorite singer?', 'hash_lata', '2025-03-14 10:10:00'),
(20, 'chetan_g', 'hash_142', 'Artisan', '2025-07-04 12:30:00', 'Active', 'chetan.gupta@gmail.com', '9988123456', TRUE, 'Your dream job?', 'hash_teacher', '2025-03-01 12:00:00');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM User_Login;

-- to remove complete data from table
truncate table User_Login;

-- to delete complete attributes and records 
drop table User_Login;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column for password reset token
ALTER TABLE User_Login ADD COLUMN reset_token VARCHAR(100);

-- 2. Operator: Find usernames starting with 'a'
SELECT username
FROM User_Login
WHERE username LIKE 'a%';

-- 3. Clause: Find roles having more than 4 users
SELECT role, COUNT(*) 
FROM User_Login
GROUP BY role
HAVING COUNT(*) > 4;

-- 4. Clause: Order users by last login (most recent first)
SELECT username, last_login
FROM User_Login
ORDER BY last_login DESC;

-- 5. Function: Extract month of account creation
SELECT username, MONTH(created_at) AS created_month
FROM User_Login;

-- 6. Function: Find length of each username
SELECT username, LENGTH(username) AS name_length
FROM User_Login;

-- 7. Function: Count total admins
SELECT COUNT(*) AS total_admins
FROM User_Login
WHERE role = 'Admin';

-- 8. Join (Self Join): Find users with the same role
SELECT u1.username AS user1, u2.username AS user2, u1.role
FROM User_Login u1
JOIN User_Login u2 ON u1.role = u2.role AND u1.user_id < u2.user_id;

-- 9. Window Function: Find cumulative count of accounts by creation date
SELECT username, created_at,
COUNT(*) OVER (ORDER BY created_at) AS cumulative_users
FROM User_Login;

-- 10. Subquery: Find users created before the first Admin
SELECT username, created_at
FROM User_Login
WHERE created_at < (
    SELECT MIN(created_at) 
    FROM User_Login
    WHERE role = 'Admin'
);

-- 11. Show artisans along with researchers (useful for pairing collaborations)
SELECT a.username AS artisan_name, r.username AS researcher_name
FROM User_Login a
JOIN User_Login r ON a.user_id < r.user_id
WHERE a.role = 'Artisan' AND r.role = 'Researcher';

-- 12. List all admins and volunteers together for reporting hierarchy
SELECT u1.username AS admin, u2.username AS volunteer
FROM User_Login u1
JOIN User_Login u2 ON u1.role = 'Admin' AND u2.role = 'Volunteer';

-- 13. Find users who share the same last login date (real-life = system concurrency check)
SELECT u1.username, u2.username, DATE(u1.last_login) AS login_date
FROM User_Login u1
JOIN User_Login u2 
  ON DATE(u1.last_login) = DATE(u2.last_login) AND u1.user_id <> u2.user_id;

-- 14. Match artisans and volunteers created on the same date (collaboration potential)
SELECT a.username AS artisan, v.username AS volunteer, a.created_at
FROM User_Login a
JOIN User_Login v ON DATE(a.created_at) = DATE(v.created_at)
WHERE a.role = 'Artisan' AND v.role = 'Volunteer';

-- 15. Find total number of users registered per role
SELECT role, COUNT(*) AS total_users
FROM User_Login
GROUP BY role;

-- 16. Find latest login for each role
SELECT role, MAX(last_login) AS last_login_time
FROM User_Login
GROUP BY role;

-- 17. Calculate average number of days since account creation
SELECT AVG(DATEDIFF(CURDATE(), created_at)) AS avg_account_age
FROM User_Login;

-- 18. Find length of each username (useful for data validation)
SELECT username, LENGTH(username) AS name_length
FROM User_Login;

-- 19. Rank users based on most recent login (activity ranking)
SELECT username, role, last_login,
       RANK() OVER (ORDER BY last_login DESC) AS login_rank
FROM User_Login;

-- 20. Find oldest and newest account per role using window functions
SELECT username, role, created_at,
       FIRST_VALUE(created_at) OVER (PARTITION BY role ORDER BY created_at) AS oldest,
       LAST_VALUE(created_at) OVER (PARTITION BY role ORDER BY created_at 
                                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS newest
FROM User_Login;

-- 21. Show running count of logins by account creation date
SELECT username, created_at,
       COUNT(*) OVER (ORDER BY created_at) AS running_total
FROM User_Login;

-- 22. Compare each user’s login time with the previous user
SELECT username, last_login,
       LAG(last_login) OVER (ORDER BY last_login) AS previous_login
FROM User_Login;

-- 23. Calculate difference between each user’s login and the next login
SELECT username, last_login,
       LEAD(last_login) OVER (ORDER BY last_login) AS next_login,
       TIMESTAMPDIFF(MINUTE, last_login, LEAD(last_login) OVER (ORDER BY last_login)) AS gap_minutes
FROM User_Login;

-- 24. Find users whose email is Gmail or Yahoo (OR operator)
SELECT username, email
FROM User_Login
WHERE email LIKE '%gmail.com' OR email LIKE '%yahoo.com';

-- 25. Find users not having completed profile (NOT operator)
SELECT username, role
FROM User_Login
WHERE NOT profile_completed;

-- 26. Check if users registered in Jan OR March (IN operator)
SELECT username, created_at
FROM User_Login
WHERE MONTH(created_at) IN (1, 3);

-- 27. Find all users whose role is not Admin or Researcher
SELECT username, role
FROM User_Login
WHERE role NOT IN ('Admin', 'Researcher');

-- 28. Compare if last_login is greater than created_at (date comparison)
SELECT username, role
FROM User_Login
WHERE last_login > created_at;

-- 29. Find only first 5 users registered (LIMIT clause, real-life: preview new accounts)
SELECT username, created_at
FROM User_Login
ORDER BY created_at ASC
LIMIT 5;

-- 30. Find users created between Jan and March 2025 (BETWEEN clause, real-life: quarterly report)
SELECT username, created_at
FROM User_Login
WHERE created_at BETWEEN '2025-01-01' AND '2025-03-31';

-- 31. Show usernames containing 'admin' (LIKE clause, real-life: finding admin accounts)
SELECT username, role
FROM User_Login
WHERE username LIKE '%admin%';

-- 32. Find roles that have more than 3 users (HAVING clause, real-life: active community check)
SELECT role, COUNT(*) AS total_users
FROM User_Login
GROUP BY role
HAVING COUNT(*) > 3;

-- 33. Get distinct roles available in the system (DISTINCT clause, real-life: role summary)
SELECT DISTINCT role
FROM User_Login;

-- 34. Show duplicate emails if any (real-life: duplicate account detection)
SELECT email, COUNT(*) AS count
FROM User_Login
GROUP BY email
HAVING COUNT(*) > 1;

-- 35. Verify phone numbers with wrong length (real-life: contact validation)
SELECT username, contact_number
FROM User_Login
WHERE LENGTH(contact_number) < 10;

-- 36. Find users who logged in after the average last_login time (subquery + real-life activity check)
SELECT username, last_login
FROM User_Login
WHERE last_login > (SELECT AVG(last_login) FROM User_Login);

-- 37. Get users who registered before the earliest admin (subquery real-life: early adopters)
SELECT username, created_at
FROM User_Login
WHERE created_at < (SELECT MIN(created_at) FROM User_Login WHERE role = 'Admin');

-- 38. Find all users whose role matches the role of 'aarti.verma' (subquery real-life: peer search)
SELECT username, role
FROM User_Login
WHERE role = (SELECT role FROM User_Login WHERE username = 'aartiverma');

-- 39. Show the most recent login per role (subquery instead of GROUP BY, real-life: activity report)
SELECT username, role, last_login
FROM User_Login u
WHERE last_login = (
    SELECT MAX(last_login) 
    FROM User_Login 
    WHERE role = u.role
);

-- 40. Find users who share the same security question as 'rahul_d' (real-life: security review)
SELECT username, security_question
FROM User_Login
WHERE security_question = (
    SELECT security_question 
    FROM User_Login 
    WHERE username = 'rahul_d'
);

-- 41. List users whose account creation time is later than the average account creation (subquery real-life: new joiners)
SELECT username, created_at
FROM User_Login
WHERE created_at > (
    SELECT AVG(UNIX_TIMESTAMP(created_at)) 
    FROM User_Login
);

-- 42. Find users who logged in before the latest researcher login (subquery)
SELECT username, last_login
FROM User_Login
WHERE last_login < (
    SELECT MAX(last_login) 
    FROM User_Login 
    WHERE role = 'Researcher'
);

-- 43. Find users created on the same date as 'suman.admin' (real-life: batch account creation)
SELECT username, created_at
FROM User_Login
WHERE created_at = (
    SELECT created_at FROM User_Login WHERE username = 'admin_suman'
);

-- 44. Get oldest account based on created_at (real-life: first registered user)
SELECT username, created_at
FROM User_Login
WHERE created_at = (
    SELECT MIN(created_at) FROM User_Login
);

-- 45. Find users whose login time is above the average per role (correlated subquery)
SELECT username, role, last_login
FROM User_Login u
WHERE last_login > (
    SELECT AVG(UNIX_TIMESTAMP(last_login))
    FROM User_Login
    WHERE role = u.role
);

-- 46. Self-join: Find users who share same role (real-life: role collaboration)
SELECT u1.username AS user1, u2.username AS user2, u1.role
FROM User_Login u1
JOIN User_Login u2 ON u1.role = u2.role AND u1.user_id < u2.user_id;

-- 47. Left join with subquery: Show all users and their latest login time (real-life: login summary)
SELECT u.username, u.role, l.last_login
FROM User_Login u
LEFT JOIN (
    SELECT role, MAX(last_login) AS last_login
    FROM User_Login
    GROUP BY role
) l ON u.role = l.role;

-- 48. Cross join: Generate all possible role-user combinations (real-life: audit simulation)
SELECT u.username, r.role
FROM User_Login u
CROSS JOIN (SELECT DISTINCT role FROM User_Login) r;

-- 49. Rank users by login time per role (real-life: top active members by role)
SELECT username, role, last_login,
       RANK() OVER (PARTITION BY role ORDER BY last_login DESC) AS rank_within_role
FROM User_Login;

-- 50. Running total of users created over time (real-life: growth chart)
SELECT username, created_at,
       COUNT(*) OVER (ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_users
FROM User_Login;

-- 51. Dense rank on roles by account creation (real-life: early adopters)
SELECT username, role, created_at,
       DENSE_RANK() OVER (PARTITION BY role ORDER BY created_at ASC) AS early_user_rank
FROM User_Login;

-- 52. Show difference in login times between consecutive logins per role (real-life: activity gap)
SELECT username, role, last_login,
       TIMESTAMPDIFF(MINUTE, LAG(last_login) OVER (PARTITION BY role ORDER BY last_login), last_login) AS gap_minutes
FROM User_Login;

-- 53. Find all artisans OR researchers (OR operator, real-life: filtering professionals)
SELECT username, role
FROM User_Login
WHERE role = 'Artisan' OR role = 'Researcher';

-- 54. Find all admins AND active status (AND operator, real-life: active admin list)
SELECT username, role
FROM User_Login
WHERE role = 'Admin' AND status = 'Active';

-- 55. Find users NOT volunteers (NOT operator, real-life: exclude volunteers)
SELECT username, role
FROM User_Login
WHERE NOT role = 'Volunteer';

-- 56. Use arithmetic operator: Calculate days since account creation (real-life: account age)
SELECT username, DATEDIFF(NOW(), created_at) AS account_age_days
FROM User_Login;

-- 57. Use comparison operators: Find accounts older than 180 days (real-life: long-standing members)
SELECT username, created_at
FROM User_Login
WHERE DATEDIFF(NOW(), created_at) > 180;

-- 58. Get top 3 most recently created accounts per role (window + subquery, real-life: onboarding trend)
SELECT username, role, created_at
FROM (
  SELECT username, role, created_at,
         ROW_NUMBER() OVER (PARTITION BY role ORDER BY created_at DESC) AS rn
  FROM User_Login
) t
WHERE rn <= 3;

-- 59. Find users with same contact number (real-life: duplicate mobile issue)
SELECT contact_number, GROUP_CONCAT(username) AS users
FROM User_Login
GROUP BY contact_number
HAVING COUNT(*) > 1;

-- 60. Find the percentage of completed profiles per role (real-life: adoption check)
SELECT role,
       ROUND(SUM(CASE WHEN profile_completed THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS completion_rate
FROM User_Login
GROUP BY role;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 26: Raw_Material_Suppliers
CREATE TABLE Raw_Material_Suppliers (
    supplier_id INT PRIMARY KEY, -- unique identifier for each supplier
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    material_type VARCHAR(100),
    region VARCHAR(100),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    years_of_service INT,
    status VARCHAR(20) DEFAULT 'Active'
);

-- Insert 20 records into Raw_Material_Suppliers table
INSERT INTO Raw_Material_Suppliers (supplier_id, name, contact_number, email, address,material_type, region, rating, years_of_service, status) 
VALUES
(1, 'Ramesh Traders', '9876543210', 'ramesh.traders@gmail.com', 'Sadar Bazar, Delhi', 'Bamboo', 'Delhi', 4, 12, 'Active'),
(2, 'Banerjee Co.', '9823456781', 'banerjee.co@kol.com', 'Salt Lake, Kolkata', 'Cotton Yarn', 'West Bengal', 5, 15, 'Active'),
(3, 'Kumar Art Supplies', '9001234567', 'kumar.art@crafts.in', 'Sowcarpet, Chennai', 'Natural Dyes', 'Tamil Nadu', 4, 10, 'Active'),
(4, 'Deshmukh Associates', '7890123456', 'deshmukh.assoc@gmail.com', 'Shivaji Nagar, Pune', 'Clay', 'Maharashtra', 3, 8, 'Active'),
(5, 'Tribal Woods', '7984561230', 'tribal.woods@jh.in', 'Ranchi Main Road, Ranchi', 'Saal Wood', 'Jharkhand', 5, 14, 'Active'),
(6, 'Panchal Metals', '9871236540', 'panchal.metals@ahm.com', 'Maninagar, Ahmedabad', 'Brass Sheets', 'Gujarat', 4, 11, 'Active'),
(7, 'Herbal Prints', '9991122334', 'herbal.prints@jaipur.in', 'Johari Bazaar, Jaipur', 'Vegetable Dyes', 'Rajasthan', 5, 9, 'Active'),
(8, 'Srinivas Textiles', '9773344556', 'srinivas.tex@coimbatore.com', 'RS Puram, Coimbatore', 'Silk Threads', 'Tamil Nadu', 5, 17, 'Active'),
(9, 'Mishra Handicrafts', '9654321876', 'mishra.handicrafts@varanasi.in', 'Lahurabir, Varanasi', 'Banarasi Fabric', 'Uttar Pradesh', 4, 13, 'Active'),
(10, 'Eastern Clay Works', '9090909090', 'eastern.clay@assam.in', 'Silchar Industrial Area, Assam', 'Terracotta Clay', 'Assam', 3, 7, 'Active'),
(11, 'Bhuj Kutir Mart', '9012345678', 'bhuj.kutir@gujarat.com', 'Near White Rann, Bhuj', 'Mirror & Beads', 'Gujarat', 4, 6, 'Active'),
(12, 'Saini Paints', '9765432101', 'saini.paints@bikaner.com', 'Station Road, Bikaner', 'Lac Colors', 'Rajasthan', 3, 8, 'Active'),
(13, 'Padma Coir', '9876012345', 'padma.coir@kerala.in', 'Alappuzha Beach Road, Kerala', 'Coir Fiber', 'Kerala', 5, 20, 'Active'),
(14, 'Khanna Metals', '9654312345', 'khanna.metals@punjab.com', 'Amritsar Old Market', 'Copper Wires', 'Punjab', 4, 9, 'Active'),
(15, 'Saha Shell Works', '9753124680', 'saha.shell@odisha.com', 'Puri Jagannath Lane', 'Sea Shells', 'Odisha', 4, 12, 'Active'),
(16, 'Chauhan Stone Traders', '9823012345', 'chauhan.stone@udaipur.com', 'Hiran Magri, Udaipur', 'Marble Blocks', 'Rajasthan', 4, 15, 'Active'),
(17, 'Northeast Weaves', '9988776655', 'ne.weaves@meghalaya.in', 'Shillong Market', 'Eri Silk', 'Meghalaya', 5, 7, 'Active'),
(18, 'Lakshmi Paper', '9678452100', 'lakshmi.paper@madurai.com', 'Periyar Road, Madurai', 'Handmade Paper', 'Tamil Nadu', 3, 5, 'Active'),
(19, 'Tibetan Art Base', '9876543098', 'tibetan.art@himachal.in', 'McLeod Ganj, Dharamshala', 'Natural Resin', 'Himachal Pradesh', 5, 6, 'Active'),
(20, 'Ghosh Dyes', '9988123456', 'ghosh.dyes@shantiniketan.com', 'Bolpur, Shantiniketan', 'Alizarin Dye', 'West Bengal', 4, 10, 'Active');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Raw_Material_Suppliers;

-- to remove complete data from table
truncate table Raw_Material_Suppliers;

-- to delete complete attributes and records 
drop table Raw_Material_Suppliers;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Add a new column for GST number (real-life: supplier tax tracking)
ALTER TABLE Raw_Material_Suppliers ADD gst_number VARCHAR(20);

-- 2. DDL: Modify column size for contact_number (real-life: international numbers)
ALTER TABLE Raw_Material_Suppliers MODIFY contact_number VARCHAR(20);

-- 3. DDL: Rename column material_type to material_category (real-life: better clarity)
ALTER TABLE Raw_Material_Suppliers RENAME COLUMN material_type TO material_category;

-- 4. DDL: Drop a column if not needed (real-life: data optimization)
ALTER TABLE Raw_Material_Suppliers DROP COLUMN address;

-- 5. DDL: Create index on region (real-life: faster region-based searches)
CREATE INDEX idx_region ON Raw_Material_Suppliers(region);

-- 6. OPERATOR: Use IN to get suppliers from Rajasthan, Kerala, and Tamil Nadu
SELECT name, region
FROM Raw_Material_Suppliers
WHERE region IN ('Rajasthan', 'Kerala', 'Tamil Nadu');

-- 7. DML: Update supplier rating (real-life: feedback after quality audit)
UPDATE Raw_Material_Suppliers
SET rating = 5
WHERE supplier_id = 4;

-- 8. DML: Deactivate a supplier who is no longer active (real-life: blacklist vendor)
UPDATE Raw_Material_Suppliers
SET status = 'Inactive'
WHERE supplier_id = 18;

-- 9. DML: Delete supplier with duplicate email (real-life: clean up bad data)
DELETE FROM Raw_Material_Suppliers
WHERE email = 'duplicate@example.com';

-- 10. SUBQUERY: Find suppliers whose service years are above the average
SELECT name, years_of_service
FROM Raw_Material_Suppliers
WHERE years_of_service > (SELECT AVG(years_of_service) FROM Raw_Material_Suppliers);

-- 11. OPERATOR: Use BETWEEN to filter suppliers with rating between 3 and 5
SELECT name, rating
FROM Raw_Material_Suppliers
WHERE rating BETWEEN 3 AND 5;

-- 12. OPERATOR: Use LIKE to find suppliers dealing with ‘Silk’
SELECT name, material_category
FROM Raw_Material_Suppliers
WHERE material_category LIKE '%Silk%';

-- 13. Constraint: Ensure status only has 'Active' or 'Inactive'
ALTER TABLE Raw_Material_Suppliers
ADD CONSTRAINT chk_status CHECK (status IN ('Active','Inactive'));

-- 14. SELECT: Get all active suppliers from Tamil Nadu (real-life: sourcing silk)
SELECT name, material_category, region
FROM Raw_Material_Suppliers
WHERE region = 'Tamil Nadu' AND status = 'Active';

-- 15. SELECT: Find suppliers with more than 10 years of service (real-life: experienced vendors)
SELECT name, years_of_service
FROM Raw_Material_Suppliers
WHERE years_of_service > 10;

-- 16. SELECT: Sort suppliers by rating and years_of_service (real-life: best vendors first)
SELECT name, rating, years_of_service
FROM Raw_Material_Suppliers
ORDER BY rating DESC, years_of_service DESC;

-- 17. SELECT + LIKE: Find suppliers dealing in “Silk” (real-life: searching raw silk vendors)
SELECT name, material_category
FROM Raw_Material_Suppliers
WHERE material_category LIKE '%Silk%';

-- 18. SELECT + BETWEEN: Find suppliers with rating between 3 and 5 (real-life: quality assurance)
SELECT name, rating
FROM Raw_Material_Suppliers
WHERE rating BETWEEN 3 AND 5;

-- 19. SELECT + IN: Find suppliers from Rajasthan, Gujarat, and Punjab (real-life: north-west vendors)
SELECT name, region
FROM Raw_Material_Suppliers
WHERE region IN ('Rajasthan','Gujarat','Punjab');

-- 20. Aggregate: Count suppliers per region (real-life: supplier distribution check)
SELECT region, COUNT(*) AS total_suppliers
FROM Raw_Material_Suppliers
GROUP BY region;

-- 21. DDL: Add a new column for GST number since suppliers must provide it
ALTER TABLE Raw_Material_Suppliers
ADD gst_number VARCHAR(20);

-- 22. DDL: Drop an unused column if no longer needed (e.g., address column archived elsewhere)
ALTER TABLE Raw_Material_Suppliers
DROP COLUMN address;

-- 23. DML: Update supplier rating after a recent quality audit
UPDATE Raw_Material_Suppliers
SET rating = 5
WHERE supplier_id = 10;

-- 24. DML: Mark inactive suppliers if their years_of_service < 5
UPDATE Raw_Material_Suppliers
SET status = 'Inactive'
WHERE years_of_service < 5;

-- 25. JOIN (with Workshops): Find which raw material suppliers operate in the same state as a workshop location
SELECT r.name AS supplier, r.region, w.title AS workshop
FROM Raw_Material_Suppliers r
JOIN Workshops w ON w.location LIKE CONCAT('%', r.region, '%');

-- 26. FUNCTION: Find average years of service of suppliers in Tamil Nadu
SELECT AVG(years_of_service) AS avg_service
FROM Raw_Material_Suppliers
WHERE region = 'Tamil Nadu';

-- 27. FUNCTION: Get total suppliers grouped by rating
SELECT rating, COUNT(*) AS supplier_count
FROM Raw_Material_Suppliers
GROUP BY rating
ORDER BY rating DESC;

-- 28. CLAUSE: Show top 5 suppliers with the longest years of service
SELECT name, years_of_service
FROM Raw_Material_Suppliers
ORDER BY years_of_service DESC
LIMIT 5;

-- 29. CLAUSE: Find suppliers who are not from Delhi or Gujarat
SELECT name, region
FROM Raw_Material_Suppliers
WHERE region NOT IN ('Delhi', 'Gujarat');

-- 30. CLAUSE: Get suppliers ordered by region and then by years of service
SELECT name, region, years_of_service
FROM Raw_Material_Suppliers
ORDER BY region ASC, years_of_service DESC;

-- 31. FUNCTION: Find the maximum service years for each region
SELECT region, MAX(years_of_service) AS max_service
FROM Raw_Material_Suppliers
GROUP BY region;

-- 32. FUNCTION: Count how many suppliers provide each type of material
SELECT material_category, COUNT(*) AS total_suppliers
FROM Raw_Material_Suppliers
GROUP BY material_category;

-- 33. SUBQUERY: Find suppliers from regions where avg rating > 4
SELECT name, region, rating
FROM Raw_Material_Suppliers
WHERE region IN (
    SELECT region
    FROM Raw_Material_Suppliers
    GROUP BY region
    HAVING AVG(rating) > 4
);

-- 34. OPERATOR: Use IS NULL (for cases where email might be missing)
SELECT name
FROM Raw_Material_Suppliers
WHERE email IS NULL;

-- 35. OPERATOR: Use NOT LIKE to exclude suppliers dealing with Dyes
SELECT name, material_category
FROM Raw_Material_Suppliers
WHERE material_ NOT LIKE '%Dye%';

-- 36. DML: Increase years_of_service by 1 for all active suppliers
UPDATE Raw_Material_Suppliers
SET years_of_service = years_of_service + 1
WHERE status = 'Active';

-- 37. DML: Delete suppliers who are inactive and have less than 3 years of service
DELETE FROM Raw_Material_Suppliers
WHERE status = 'Inactive' AND years_of_service < 3;

-- 38. JOIN (with Craft_Types): Find suppliers of raw materials used in crafts
SELECT s.name AS supplier, s.material_category, c.craft_name
FROM Raw_Material_Suppliers s
JOIN Craft_Types c ON c.description LIKE CONCAT('%', s.material_category, '%');

-- 39. WINDOW FUNCTION: Rank suppliers within each region by rating
SELECT name, region, rating,
       RANK() OVER (PARTITION BY region ORDER BY rating DESC) AS rank_in_region
FROM Raw_Material_Suppliers;

-- 40. WINDOW FUNCTION: Running total of suppliers by years_of_service
SELECT name, years_of_service,
       SUM(1) OVER (ORDER BY years_of_service) AS running_total
FROM Raw_Material_Suppliers;

-- 41. CLAUSE: Find suppliers whose years_of_service are above 10 and rating >= 4
SELECT name, years_of_service, rating
FROM Raw_Material_Suppliers
WHERE years_of_service > 10 AND rating >= 4;

-- 42. CLAUSE: Find distinct regions where suppliers are located
SELECT DISTINCT region
FROM Raw_Material_Suppliers;

-- 43. FUNCTION: Get minimum rating supplier from each state
SELECT region, MIN(rating) AS min_rating
FROM Raw_Material_Suppliers
GROUP BY region;

-- 44. SUBQUERY: Find suppliers who have the highest rating in their region
SELECT name, region, rating
FROM Raw_Material_Suppliers s
WHERE rating = (
    SELECT MAX(rating)
    FROM Raw_Material_Suppliers
    WHERE region = s.region
);

-- 45. OPERATOR: Use CASE to classify suppliers by rating category
SELECT name, rating,
       CASE
           WHEN rating = 5 THEN 'Excellent'
           WHEN rating = 4 THEN 'Good'
           WHEN rating = 3 THEN 'Average'
           ELSE 'Low'
       END AS rating_category
FROM Raw_Material_Suppliers;

-- 46. CLAUSE: Find suppliers located in Tamil Nadu or Rajasthan
SELECT name, region, material_category
FROM Raw_Material_Suppliers
WHERE region IN ('Tamil Nadu', 'Rajasthan');

-- 47. CLAUSE: Get suppliers whose service years are between 5 and 12
SELECT name, years_of_service
FROM Raw_Material_Suppliers
WHERE years_of_service BETWEEN 5 AND 12;

-- 48. FUNCTION: Average years of service per material type
SELECT material_category, AVG(years_of_service) AS avg_service
FROM Raw_Material_Suppliers
GROUP BY material_category;

-- 49. FUNCTION: Find suppliers with names converted to uppercase
SELECT UPPER(name) AS supplier_name_upper, region
FROM Raw_Material_Suppliers;

-- 50. SUBQUERY: Find suppliers who have more years of service than the average
SELECT name, years_of_service
FROM Raw_Material_Suppliers
WHERE years_of_service > (
    SELECT AVG(years_of_service)
    FROM Raw_Material_Suppliers
);

-- 51. SUBQUERY: Suppliers with the same rating as 'Tribal Woods'
SELECT name, rating
FROM Raw_Material_Suppliers
WHERE rating = (
    SELECT rating
    FROM Raw_Material_Suppliers
    WHERE name = 'Tribal Woods'
);

-- 52. OPERATOR: Get suppliers where material_type contains 'Silk'
SELECT name, material_category
FROM Raw_Material_Suppliers
WHERE material_category LIKE '%Silk%';

-- 53. OPERATOR: Suppliers not from Delhi or Kolkata
SELECT name, region
FROM Raw_Material_Suppliers
WHERE region NOT IN ('Delhi', 'West Bengal');

-- 54. DML: Update rating of suppliers from Assam by +1 (but max 5)
UPDATE Raw_Material_Suppliers
SET rating = CASE WHEN rating < 5 THEN rating + 1 ELSE 5 END
WHERE region = 'Assam';

-- 55. DML: Mark suppliers with < 5 years of service as 'Inactive'
UPDATE Raw_Material_Suppliers
SET status = 'Inactive'
WHERE years_of_service < 5;

-- 56. JOIN: Combine suppliers and user logins (admins managing them)
SELECT u.username, s.name AS supplier, s.region
FROM Raw_Material_Suppliers s
JOIN User_Login u ON u.role = 'Admin';

-- 57. WINDOW FUNCTION: Show suppliers with row_number based on service years
SELECT name, years_of_service,
       ROW_NUMBER() OVER (ORDER BY years_of_service DESC) AS service_rank
FROM Raw_Material_Suppliers;

-- 58. WINDOW FUNCTION: Average rating within each region (per supplier)
SELECT name, region, rating,
       AVG(rating) OVER (PARTITION BY region) AS region_avg_rating
FROM Raw_Material_Suppliers;

-- 59. CLAUSE: Find suppliers whose name starts with 'S'
SELECT name, region
FROM Raw_Material_Suppliers
WHERE name LIKE 'S%';

-- 60. CLAUSE + FUNCTION: Count suppliers per status (Active vs Inactive)
SELECT status, COUNT(*) AS total_suppliers
FROM Raw_Material_Suppliers
GROUP BY status;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 27: Collaborations
CREATE TABLE Collaborations (
    collab_id INT PRIMARY KEY, -- unique identification for each collaboration
    partner_name VARCHAR(100),
    type VARCHAR(50) CHECK (type IN ('NGO', 'Government', 'Corporate')),
    start_date DATE,
    end_date DATE,
    project_theme VARCHAR(100),
    funding_amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Ongoing',
    contact_email VARCHAR(100),
    remarks TEXT
);

-- Insert 20 records into Collaborations table
INSERT INTO Collaborations (collab_id, partner_name, type, start_date, end_date,project_theme, funding_amount, status, contact_email, remarks) 
VALUES
(1, 'Kala Setu Foundation', 'NGO', '2024-01-15', '2025-01-15', 'Block Printing Revival', 500000.00, 'Ongoing', 'info@kalasetu.org', 'Supported rural women artisans.'),
(2, 'Ministry of Textiles', 'Government', '2023-06-01', '2024-06-01', 'Craft Cluster Modernization', 1000000.00, 'Completed', 'contact@texmin.nic.in', 'Cluster support in Varanasi.'),
(3, 'Tata Trusts', 'Corporate', '2022-08-10', '2023-12-31', 'Bamboo Craft Development', 750000.00, 'Completed', 'support@tatatrusts.org', 'Worked with tribal artisans in Assam.'),
(4, 'Sanskriti India', 'NGO', '2024-02-05', '2025-02-05', 'Terracotta Awareness Program', 300000.00, 'Ongoing', 'admin@sanskriti.in', 'Workshops in West Bengal.'),
(5, 'Khadi & Village Industries Commission', 'Government', '2024-03-01', '2025-03-01', 'Khadi Weaving Promotion', 900000.00, 'Ongoing', 'kvic@india.gov.in', 'Looms and training provided.'),
(6, 'Reliance Foundation', 'Corporate', '2023-04-20', '2024-04-20', 'Handloom Digital Market', 850000.00, 'Completed', 'csr@reliance.org', 'Online portal built for weavers.'),
(7, 'Craft Roots NGO', 'NGO', '2024-05-10', '2025-05-10', 'Natural Dye Training', 200000.00, 'Ongoing', 'connect@craftroots.in', 'Conducting dye workshops.'),
(8, 'Ministry of Culture', 'Government', '2023-11-01', '2024-11-01', 'Tribal Art Revival', 1100000.00, 'Ongoing', 'culture@nic.in', 'Documentation of tribal motifs.'),
(9, 'Infosys Foundation', 'Corporate', '2023-01-01', '2024-12-31', 'Craft Education Program', 600000.00, 'Completed', 'csr@infosys.org', 'Targeted youth training.'),
(10, 'Lok Kala Samiti', 'NGO', '2023-09-15', '2024-09-15', 'Folk Art Exhibition Tour', 250000.00, 'Ongoing', 'contact@lokkala.org', 'Organizing exhibitions in 5 states.'),
(11, 'Ministry of MSME', 'Government', '2022-07-01', '2023-07-01', 'Artisan Credit Support', 1200000.00, 'Completed', 'msme@nic.in', 'Low-interest loans provided.'),
(12, 'Adani Foundation', 'Corporate', '2024-01-10', '2025-01-10', 'Artisan Livelihood Support', 700000.00, 'Ongoing', 'support@adani.org', 'Health insurance for artisans.'),
(13, 'Jivika Trust', 'NGO', '2023-03-20', '2024-03-20', 'Hand Embroidery Upliftment', 400000.00, 'Completed', 'info@jivika.org', 'Focused on Bihar clusters.'),
(14, 'TRIFED', 'Government', '2023-12-01', '2024-12-01', 'Tribal Handicraft Expo', 950000.00, 'Ongoing', 'trifed@tribal.gov.in', 'National tribal exhibition circuit.'),
(15, 'HCL Foundation', 'Corporate', '2024-04-01', '2025-04-01', 'E-commerce for Artisans', 680000.00, 'Ongoing', 'foundation@hcl.com', 'Building e-market tools.'),
(16, 'Kalaghar Collective', 'NGO', '2023-10-10', '2024-10-10', 'Local Craft Mapping', 150000.00, 'Ongoing', 'admin@kalaghar.org', 'GIS-based mapping of artisans.'),
(17, 'Handicrafts Development Board', 'Government', '2024-02-20', '2025-02-20', 'Skill Recognition for Craftsmen', 550000.00, 'Ongoing', 'handicraft@nic.in', 'Issuing digital certificates.'),
(18, 'Wipro Foundation', 'Corporate', '2022-06-01', '2023-06-01', 'Craft Schools in Rural Areas', 870000.00, 'Completed', 'csr@wipro.org', 'Funded 3 schools.'),
(19, 'Nirmala Kala Sanstha', 'NGO', '2024-01-25', '2025-01-25', 'Women-led Craft Businesses', 280000.00, 'Ongoing', 'info@nirmala.org', 'Training 80+ SHG groups.'),
(20, 'Ministry of Tourism', 'Government', '2023-05-01', '2024-05-01', 'Craft Tourism Promotion', 1000000.00, 'Completed', 'tourism@india.gov.in', 'Linked crafts to local tourism.');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Collaborations;

-- to remove complete data from table
truncate table Collaborations;

-- to delete complete attributes and records 
drop table Collaborations;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. DDL: Modify funding_amount to increase precision
ALTER TABLE Collaborations
MODIFY funding_amount DECIMAL(12,2);

-- 2. DDL: Drop remarks column (if no longer required)
ALTER TABLE Collaborations
DROP COLUMN remarks;

-- 3. DML: Update funding amount for NGO projects by +10%
UPDATE Collaborations
SET funding_amount = funding_amount * 1.10
WHERE type = 'NGO';

-- 4. DML: Delete collaborations marked as Completed before 2023
DELETE FROM Collaborations
WHERE status = 'Completed' AND end_date < '2023-01-01';

-- 5. Show all ongoing collaborations with NGOs
SELECT collab_id, partner_name, project_theme, funding_amount, end_date
FROM Collaborations
WHERE type = 'NGO' AND status = 'Ongoing';

-- 6. Find the total funding amount provided by Corporate partners
SELECT SUM(funding_amount) AS total_corporate_funding
FROM Collaborations
WHERE type = 'Corporate';

-- 7. List collaborations that ended before 2024
SELECT collab_id, partner_name, type, project_theme, end_date
FROM Collaborations
WHERE end_date < '2024-01-01';

-- 8. Find the partner and theme of the collaboration with the highest funding
SELECT partner_name, project_theme, funding_amount
FROM Collaborations
WHERE funding_amount = (SELECT MAX(funding_amount) FROM Collaborations);

-- 9. CLAUSE: List collaborations with funding above 800000
SELECT partner_name, project_theme, funding_amount
FROM Collaborations
WHERE funding_amount > 800000;

-- 10. CLAUSE: Show projects starting between Jan 2023 and Dec 2023
SELECT partner_name, project_theme, start_date
FROM Collaborations
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 11. FUNCTION: Find average funding for corporate projects
SELECT AVG(funding_amount) AS avg_corporate_funding
FROM Collaborations
WHERE type = 'Corporate';

-- 12. FUNCTION: Count total NGO collaborations
SELECT COUNT(*) AS ngo_collabs
FROM Collaborations
WHERE type = 'NGO';

-- 13. FUNCTION: Display partner names in uppercase
SELECT UPPER(partner_name) AS partner_caps
FROM Collaborations;

-- 14. OPERATOR: List projects where theme contains 'Craft'
SELECT partner_name, project_theme
FROM Collaborations
WHERE project_theme LIKE '%Craft%';

-- 15. OPERATOR: Find collaborations that are not Ongoing
SELECT partner_name, status
FROM Collaborations
WHERE status <> 'Ongoing';

-- 16. SUBQUERY: Find projects with funding greater than the average
SELECT partner_name, funding_amount
FROM Collaborations
WHERE funding_amount > (
    SELECT AVG(funding_amount) FROM Collaborations
);

-- 17. SUBQUERY: Find collaborations that have same type as 'Tata Trusts'
SELECT partner_name, type
FROM Collaborations
WHERE type = (
    SELECT type FROM Collaborations WHERE partner_name = 'Tata Trusts'
);

-- 18. WINDOW FUNCTION: Rank collaborations by funding amount (highest first)
SELECT partner_name, project_theme, funding_amount,
       RANK() OVER (ORDER BY funding_amount DESC) AS fund_rank
FROM Collaborations;

-- 19. WINDOW FUNCTION: Calculate average funding per collaboration type
SELECT partner_name, type, funding_amount,
       AVG(funding_amount) OVER (PARTITION BY type) AS avg_type_funding
FROM Collaborations;

-- 20. CONSTRAINT: Add a constraint that funding must be at least 100000
ALTER TABLE Collaborations
ADD CONSTRAINT chk_min_funding CHECK (funding_amount >= 100000);

-- 21. Find the maximum funding amount
SELECT MAX(funding_amount) AS MaxFunding FROM Collaborations;

-- 22. Find the minimum funding amount
SELECT MIN(funding_amount) AS MinFunding FROM Collaborations;

-- 23. Average funding amount for all NGO projects
SELECT AVG(funding_amount) AS AvgNGOFunding 
FROM Collaborations
WHERE type='NGO';

-- 24. Count total collaborations per type
SELECT type, COUNT(*) AS total_collaborations
FROM Collaborations
GROUP BY type;

-- 25. Convert project_theme to uppercase
SELECT UPPER(project_theme) AS ProjectThemeUpper
FROM Collaborations;

-- 26. Convert partner_name to lowercase
SELECT LOWER(partner_name) AS PartnerLower FROM Collaborations;

-- 27. Get length of project_theme string
SELECT project_theme, LENGTH(project_theme) AS ThemeLength
FROM Collaborations;

-- 28. Concatenate partner_name and project_theme
SELECT CONCAT(partner_name, ' - ', project_theme) AS CollaborationInfo
FROM Collaborations;

-- 29. Rank collaborations by funding_amount
SELECT partner_name, project_theme, funding_amount,
       RANK() OVER (ORDER BY funding_amount DESC) AS RankFunding
FROM Collaborations;

-- 30. Dense rank by funding per collaboration type
SELECT partner_name, type, funding_amount,
       DENSE_RANK() OVER (PARTITION BY type ORDER BY funding_amount DESC) AS DenseRankType
FROM Collaborations;

-- 31. Running total of funding_amount
SELECT collab_id, partner_name, funding_amount,
       SUM(funding_amount) OVER (ORDER BY start_date) AS RunningTotal
FROM Collaborations;

-- 32. Row number per collaboration type
SELECT partner_name, type,
       ROW_NUMBER() OVER (PARTITION BY type ORDER BY funding_amount DESC) AS RowNum
FROM Collaborations;

-- 33. Moving average of funding over last 3 collaborations
SELECT collab_id, partner_name, funding_amount,
       AVG(funding_amount) OVER (ORDER BY start_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvgFunding
FROM Collaborations;

-- 34. Find collaborations with funding > 700000
SELECT partner_name, funding_amount
FROM Collaborations
WHERE funding_amount > 700000;

-- 35. Find collaborations funded between 300000 and 800000
SELECT partner_name, funding_amount
FROM Collaborations
WHERE funding_amount BETWEEN 300000 AND 800000;

-- 36. Find collaborations with 'Artisan' in project_theme
SELECT partner_name, project_theme
FROM Collaborations
WHERE project_theme LIKE '%Artisan%';

-- 37. Logical operators: NGOs or Corporates with funding > 500000
SELECT partner_name, type, funding_amount
FROM Collaborations
WHERE (type='NGO' OR type='Corporate') AND funding_amount > 500000;

-- 38. Select collaborations that are Ongoing
SELECT partner_name, status FROM Collaborations WHERE status='Ongoing';

-- 39. Select distinct types of collaborations
SELECT DISTINCT type FROM Collaborations;

-- 40. Order collaborations by start_date descending
SELECT partner_name, start_date FROM Collaborations ORDER BY start_date DESC;

-- 41. Limit top 5 funded collaborations
SELECT partner_name, funding_amount
FROM Collaborations
ORDER BY funding_amount DESC
LIMIT 5;

-- 42. Select collaborations where partner_name starts with 'M'
SELECT partner_name FROM Collaborations WHERE partner_name LIKE 'M%';

-- 43. Select collaborations with NULL remarks
SELECT partner_name, remarks FROM Collaborations WHERE remarks IS NULL;

-- 44. Group by type and show max funding per type
SELECT type, MAX(funding_amount) AS MaxFunding
FROM Collaborations
GROUP BY type;

-- 45. Group by type and show total funding
SELECT type, SUM(funding_amount) AS TotalFunding
FROM Collaborations
GROUP BY type;

-- 46. Trigger to log insertions into a separate table
CREATE TABLE Collab_Log (log_id INT AUTO_INCREMENT PRIMARY KEY, collab_id INT, action VARCHAR(20), action_time DATETIME);
CREATE TRIGGER trg_insert_log
AFTER INSERT ON Collaborations
FOR EACH ROW
INSERT INTO Collab_Log(collab_id, action, action_time) VALUES (NEW.collab_id, 'INSERT', NOW());

-- 47. Ensure funding_amount cannot be zero
ALTER TABLE Collaborations ADD CONSTRAINT chk_funding CHECK(funding_amount > 0);

-- 48. Ensure project_theme is not empty
ALTER TABLE Collaborations MODIFY project_theme VARCHAR(100) NOT NULL;

-- 49. Add UNIQUE constraint on partner_name + project_theme
ALTER TABLE Collaborations ADD CONSTRAINT uniq_collab UNIQUE(partner_name, project_theme);

-- 50. Ensure type is only NGO, Government, Corporate
ALTER TABLE Collaborations ADD CONSTRAINT chk_type CHECK(type IN ('NGO','Government','Corporate'));

-- 51. Find collaborations with funding higher than average funding
SELECT partner_name, funding_amount
FROM Collaborations
WHERE funding_amount > (SELECT AVG(funding_amount) FROM Collaborations);

-- 52. Find collaborations that started after the earliest start date of NGO
SELECT partner_name, start_date
FROM Collaborations
WHERE start_date > (SELECT MIN(start_date) FROM Collaborations WHERE type='NGO');

-- 53. Find partners working on 'E-commerce' projects
SELECT partner_name
FROM Collaborations
WHERE collab_id IN (SELECT collab_id FROM Collaborations WHERE project_theme LIKE '%E-commerce%');

-- 54. Find collaborations with max funding
SELECT partner_name, funding_amount
FROM Collaborations
WHERE funding_amount = (SELECT MAX(funding_amount) FROM Collaborations);

-- 55. Count collaborations per type using subquery
SELECT type,
       (SELECT COUNT(*) FROM Collaborations C2 WHERE C2.type = C1.type) AS CountPerType
FROM Collaborations C1
GROUP BY type;

-- 56. Inner join to show admin responsible for each collaboration
SELECT c.partner_name, c.project_theme, u.username AS Admin
FROM Collaborations c
JOIN User_Login u ON u.user_id = 3;  -- assume admin_id 3 manages all

-- 57. Left join to find collaborations even if admin info missing
SELECT c.partner_name, c.project_theme, u.username
FROM Collaborations c
LEFT JOIN User_Login u ON u.user_id = 3;

-- 58. Right join example (find all admins even if no collaboration)
SELECT u.username, c.project_theme
FROM User_Login u
RIGHT JOIN Collaborations c ON u.user_id = 3;

-- 59. Cross join to show all combinations of project themes and collaboration types
SELECT c1.project_theme, c2.type
FROM Collaborations c1
CROSS JOIN Collaborations c2;

-- 60. Self join to find collaborations with same type and overlapping dates
SELECT a.partner_name AS Collab1, b.partner_name AS Collab2, a.type
FROM Collaborations a
JOIN Collaborations b ON a.type = b.type AND a.collab_id <> b.collab_id
WHERE a.start_date <= b.end_date AND a.end_date >= b.start_date;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 28: Export_Orders
CREATE TABLE Export_Orders (
    export_id INT PRIMARY KEY, -- unique identifier for each order
    artwork_id INT,
    buyer_country VARCHAR(100),
    buyer_name VARCHAR(100),
    order_date DATE,
    export_date DATE,
    price DECIMAL(10,2),
    shipping_status VARCHAR(50) DEFAULT 'In Progress',
    delivery_partner VARCHAR(100),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id)
);

-- Insert 20 records into Export_Orders table
INSERT INTO Export_Orders (export_id, artwork_id, buyer_country, buyer_name, order_date,export_date, price, shipping_status, delivery_partner)
 VALUES
(1, 1, 'USA', 'Emily Watson', '2024-01-05', '2024-01-20', 12500.00, 'Delivered', 'DHL Express'),
(2, 2, 'UK', 'Oliver Smith', '2024-02-10', '2024-02-25', 8600.00, 'Delivered', 'FedEx'),
(3, 3, 'Canada', 'Sophie Clarke', '2024-03-15', '2024-03-30', 10200.50, 'Delivered', 'Blue Dart International'),
(4, 4, 'France', 'Pierre Dubois', '2024-04-01', '2024-04-16', 11999.99, 'In Transit', 'UPS'),
(5, 5, 'Germany', 'Lena Müller', '2024-04-20', '2024-05-05', 13400.00, 'Delivered', 'DHL Express'),
(6, 6, 'Japan', 'Haruto Tanaka', '2024-05-10', '2024-05-25', 11050.00, 'In Progress', 'EMS India'),
(7, 7, 'Australia', 'Jack Wilson', '2024-06-01', '2024-06-15', 9800.00, 'Delivered', 'Aramex'),
(8, 8, 'Italy', 'Giulia Rossi', '2024-06-18', '2024-07-03', 8900.00, 'Shipped', 'FedEx'),
(9, 9, 'Singapore', 'David Lee', '2024-07-02', '2024-07-17', 7200.00, 'In Progress', 'Delhivery International'),
(10, 10, 'UAE', 'Fatima Noor', '2024-07-05', '2024-07-20', 9300.00, 'Shipped', 'Blue Dart Express'),
(11, 11, 'Sweden', 'Eva Andersson', '2024-03-25', '2024-04-09', 10800.00, 'Delivered', 'DHL'),
(12, 12, 'South Africa', 'Nelson Dlamini', '2024-05-02', '2024-05-17', 9900.00, 'In Progress', 'India Post International'),
(13, 13, 'Netherlands', 'Tom Jansen', '2024-04-12', '2024-04-27', 8700.00, 'Delivered', 'UPS'),
(14, 14, 'USA', 'Rachel Adams', '2024-06-22', '2024-07-07', 14000.00, 'In Transit', 'FedEx'),
(15, 15, 'Brazil', 'Lucas Oliveira', '2024-06-30', '2024-07-15', 10250.00, 'In Progress', 'DHL'),
(16, 16, 'New Zealand', 'Amelia Harris', '2024-05-28', '2024-06-12', 9550.00, 'Delivered', 'Aramex'),
(17, 17, 'Norway', 'Erik Larsen', '2024-07-01', '2024-07-16', 8850.00, 'Shipped', 'FedEx'),
(18, 18, 'Russia', 'Anastasia Petrova', '2024-03-10', '2024-03-25', 12000.00, 'Delivered', 'Blue Dart'),
(19, 19, 'USA', 'Jonathan King', '2024-07-03', '2024-07-18', 9600.00, 'In Transit', 'DHL Express'),
(20, 20, 'Germany', 'Markus Weber', '2024-06-15', '2024-07-01', 10700.00, 'In Progress', 'Delhivery International');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Export_Orders;

-- to remove complete data from table
truncate table Export_Orders;

-- to delete complete attributes and records 
drop table Export_Orders;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add new column for payment_status
ALTER TABLE Export_Orders ADD COLUMN payment_status VARCHAR(50) DEFAULT 'Pending';

-- 2. Modify price column to allow up to 2 decimal points (already DECIMAL(10,2), example)
ALTER TABLE Export_Orders MODIFY price DECIMAL(12,2);

-- 3. Drop a column no longer needed
ALTER TABLE Export_Orders DROP COLUMN delivery_partner;

-- 4. Get total number of export orders
SELECT COUNT(*) AS total_orders 
FROM Export_Orders;

-- 5. Find the highest order price
SELECT MAX(price) AS highest_price 
FROM Export_Orders;

-- 6. Find the lowest order price
SELECT MIN(price) AS lowest_price 
FROM Export_Orders;

-- 7. Calculate total revenue from all delivered orders
SELECT SUM(price) AS total_delivered_revenue 
FROM Export_Orders 
WHERE shipping_status = 'Delivered';

-- 8. Show all orders shipped via 'FedEx'
SELECT export_id, buyer_name, buyer_country, price 
FROM Export_Orders 
WHERE delivery_partner = 'FedEx';

-- 9. List orders between April 2024 and June 2024
SELECT * 
FROM Export_Orders 
WHERE order_date BETWEEN '2024-04-01' AND '2024-06-30';

-- 10. Show buyer name and price for orders above 12,000
SELECT buyer_name, price 
FROM Export_Orders 
WHERE price > 12000;

-- 11. Update shipping status to 'Delivered'
UPDATE Export_Orders
SET shipping_status = 'Delivered'
WHERE export_id = 6;

-- 12. Update price for a specific buyer
UPDATE Export_Orders
SET price = 13500.00
WHERE buyer_name = 'Emily Watson';

-- 13. Delete a canceled export order
DELETE FROM Export_Orders
WHERE export_id = 20;

-- 14. Orders from USA or Canada
SELECT * FROM Export_Orders WHERE buyer_country IN ('USA','Canada');

-- 15. Orders with buyer name starting with 'E'
SELECT * FROM Export_Orders WHERE buyer_name LIKE 'E%';

-- 16. Ensure order_date is not null
ALTER TABLE Export_Orders MODIFY order_date DATE NOT NULL;

-- 17. Select specific columns
SELECT buyer_name, buyer_country, price, shipping_status FROM Export_Orders;

-- 18. Filter orders with price > 10000
SELECT * FROM Export_Orders WHERE price > 10000;

-- 19. Orders shipped to USA
SELECT * FROM Export_Orders WHERE buyer_country = 'USA';

-- 20. Orders in progress
SELECT * FROM Export_Orders WHERE shipping_status = 'In Progress';

-- 21. Price greater than 10000
SELECT * FROM Export_Orders WHERE price > 10000;

-- 22. Price between 9000 and 12000
SELECT * FROM Export_Orders WHERE price BETWEEN 9000 AND 12000;

-- 23. Orders not delivered yet
SELECT * FROM Export_Orders WHERE shipping_status <> 'Delivered';

-- 24. Count total export orders
SELECT COUNT(*) AS TotalOrders FROM Export_Orders;

-- 25. Average price of all exports
SELECT AVG(price) AS AvgPrice FROM Export_Orders;

-- 26. Rank exports by price within each buyer_country
SELECT export_id, buyer_country, price,
       RANK() OVER(PARTITION BY buyer_country ORDER BY price DESC) AS price_rank
FROM Export_Orders;

-- 27. Row number for all exports ordered by order_date
SELECT export_id, buyer_name, order_date,
       ROW_NUMBER() OVER(ORDER BY order_date) AS row_num
FROM Export_Orders;

-- 28. Cumulative sum of price by buyer_country
SELECT export_id, buyer_country, price,
       SUM(price) OVER(PARTITION BY buyer_country ORDER BY order_date) AS cumulative_price
FROM Export_Orders;

-- 29. Moving average of last 3 exports by price
SELECT export_id, price,
       AVG(price) OVER(ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Export_Orders;

-- 30. Add unique constraint for artwork_id + buyer_country
ALTER TABLE Export_Orders ADD CONSTRAINT uq_artwork_buyer UNIQUE (artwork_id, buyer_country);

-- 31. Add CHECK for export_date >= order_date
ALTER TABLE Export_Orders ADD CONSTRAINT chk_export_date CHECK (export_date >= order_date);

-- 32. Modify shipping_status default
ALTER TABLE Export_Orders ALTER COLUMN shipping_status SET DEFAULT 'Pending';

-- 33. Ensure price is positive (already done, example)
ALTER TABLE Export_Orders ADD CONSTRAINT chk_price_positive CHECK(price > 0);

-- 34. Orders with price greater than average price
SELECT * FROM Export_Orders
WHERE price > (SELECT AVG(price) FROM Export_Orders);

-- 35. Export orders with max price
SELECT * FROM Export_Orders
WHERE price = (SELECT MAX(price) FROM Export_Orders);

-- 36. Orders where buyer_country has more than 2 exports
SELECT * FROM Export_Orders
WHERE buyer_country IN (
    SELECT buyer_country
    FROM Export_Orders
    GROUP BY buyer_country
    HAVING COUNT(*) > 2
);

-- 37. Orders shipped before March 2024
SELECT * FROM Export_Orders
WHERE export_date < (SELECT MIN(order_date) FROM Export_Orders WHERE order_date >= '2024-03-01');

-- 38. Orders priced higher than price of export_id=5
SELECT * FROM Export_Orders
WHERE price > (SELECT price FROM Export_Orders WHERE export_id=5);

-- 39. Total export value per buyer_country
SELECT buyer_country, SUM(price) AS total_export_value
FROM Export_Orders
GROUP BY buyer_country;

-- 40. Count of orders per shipping_status
SELECT shipping_status, COUNT(*) AS orders_count
FROM Export_Orders
GROUP BY shipping_status;

-- 41. Countries with total export > 30000
SELECT buyer_country, SUM(price) AS total_price
FROM Export_Orders
GROUP BY buyer_country
HAVING SUM(price) > 30000;

-- 42. Max price per country
SELECT buyer_country, MAX(price) AS max_price
FROM Export_Orders
GROUP BY buyer_country;

-- 43. Average price for delivered orders
SELECT AVG(price) AS avg_delivered_price
FROM Export_Orders
WHERE shipping_status='Delivered';

-- 44. Categorize orders based on price
SELECT export_id, buyer_name, price,
       CASE
           WHEN price >= 12000 THEN 'High'
           WHEN price >= 9000 THEN 'Medium'
           ELSE 'Low'
       END AS price_category
FROM Export_Orders;

-- 45. Update shipping_status based on export_date
UPDATE Export_Orders
SET shipping_status = CASE
    WHEN export_date <= CURDATE() THEN 'Delivered'
    ELSE 'In Progress'
END;

-- 46. Update shipping_status for orders shipped today
UPDATE Export_Orders
SET shipping_status = 'Delivered'
WHERE export_date = CURDATE();

-- 47. Delete cancelled export orders (real-life scenario)
DELETE FROM Export_Orders
WHERE shipping_status='Cancelled';

-- 48. Increase price by 5% for all exports to USA
UPDATE Export_Orders
SET price = price * 1.05
WHERE buyer_country='USA';

-- 49. Mark delayed orders as 'Delayed' in shipping_status
UPDATE Export_Orders
SET shipping_status='Delayed'
WHERE export_date < CURDATE() AND shipping_status <> 'Delivered';

-- 50. Calculate total price per buyer using SUM()
SELECT buyer_name, SUM(price) AS total_spent
FROM Export_Orders
GROUP BY buyer_name;

-- 51. Count number of exports per buyer_country
SELECT buyer_country, COUNT(*) AS total_exports
FROM Export_Orders
GROUP BY buyer_country;

-- 52. Find earliest and latest export dates
SELECT MIN(export_date) AS earliest_export, MAX(export_date) AS latest_export
FROM Export_Orders;

-- 53. Round prices to nearest integer
SELECT export_id, price, ROUND(price) AS rounded_price
FROM Export_Orders;

-- 54. Convert price to string with CONCAT for invoice display
SELECT export_id, CONCAT('USD ', price) AS invoice_price
FROM Export_Orders;

-- 55. Select distinct buyer countries
SELECT DISTINCT buyer_country FROM Export_Orders;

-- 56. Select first 5 exports by order_date
SELECT * FROM Export_Orders
ORDER BY order_date
LIMIT 5;

-- 57. Exports with price > average price (HAVING)
SELECT buyer_country, AVG(price) AS avg_price
FROM Export_Orders
GROUP BY buyer_country
HAVING AVG(price) > 10000;

-- 58. Exports not yet delivered (WHERE + ORDER BY)
SELECT * FROM Export_Orders
WHERE shipping_status <> 'Delivered'
ORDER BY export_date ASC;

-- 59. Count exports per delivery partner using GROUP BY
SELECT delivery_partner, COUNT(*) AS total_orders
FROM Export_Orders
GROUP BY delivery_partner;

-- 60. Find exports whose price is higher than the average price for their buyer_country
SELECT eo.export_id, eo.buyer_name, eo.buyer_country, eo.price
FROM Export_Orders eo
JOIN (
    SELECT buyer_country, AVG(price) AS avg_price
    FROM Export_Orders
    GROUP BY buyer_country
) AS country_avg
ON eo.buyer_country = country_avg.buyer_country
WHERE eo.price > country_avg.avg_price
ORDER BY eo.buyer_country, eo.price DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 29: Emergency_Grants
CREATE TABLE Emergency_Grants (
    grant_id INT PRIMARY KEY, -- unique identifier for each grant
    artisan_id INT,
    grant_type VARCHAR(100),
    amount DECIMAL(10,2),
    reason TEXT,
    approved_by VARCHAR(100),
    approval_date DATE,
    status VARCHAR(20) DEFAULT 'Approved',
    FOREIGN KEY (artisan_id) REFERENCES Artisans(artisan_id)
);

-- Insert 20 records into Emergency_Grants table
INSERT INTO Emergency_Grants (grant_id, artisan_id, grant_type, amount, reason,approved_by, approval_date, status) 
VALUES
(1, 1, 'Medical Aid', 15000.00, 'Hospitalization due to illness', 'KVIC Board', '2024-01-10', 'Approved'),
(2, 2, 'Flood Relief', 20000.00, 'Workshop damaged in Assam floods', 'Craft Ministry', '2024-02-05', 'Approved'),
(3, 3, 'Fire Damage Recovery', 18000.00, 'Tools and stock lost in fire', 'Local District Collector', '2024-03-15', 'Approved'),
(4, 4, 'COVID-19 Support', 10000.00, 'Loss of income during lockdown', 'Handicrafts Development Dept.', '2023-12-01', 'Approved'),
(5, 5, 'Livelihood Support', 12000.00, 'Severe drought affected work', 'NGO KalaSetu', '2024-04-18', 'Approved'),
(6, 6, 'Cyclone Relief', 22000.00, 'Shelter and studio damaged in Odisha', 'Disaster Response Cell', '2024-05-01', 'Approved'),
(7, 7, 'Medical Emergency', 16000.00, 'Heart surgery funding', 'Artisan Welfare Board', '2024-03-08', 'Approved'),
(8, 8, 'Livestock Loss', 14000.00, 'Goats used for wool production died', 'Animal Husbandry Board', '2024-02-20', 'Approved'),
(9, 9, 'Housing Damage', 19000.00, 'Severe monsoon damaged house', 'Gram Panchayat', '2024-01-28', 'Approved'),
(10, 10, 'Tool Replacement', 13000.00, 'Lost tools due to theft', 'Craftsmen Relief Fund', '2024-04-02', 'Approved'),
(11, 11, 'Workshop Fire', 21000.00, 'Wood carving unit burnt in accident', 'Emergency Fund Council', '2024-05-15', 'Approved'),
(12, 12, 'Crop Failure', 11000.00, 'Cotton supply disruption impacted work', 'Agricultural Relief Dept.', '2024-03-25', 'Approved'),
(13, 13, 'Natural Disaster Aid', 25000.00, 'Flash floods destroyed craft materials', 'State Relief Committee', '2024-06-10', 'Approved'),
(14, 14, 'Medical Surgery', 17000.00, 'Son needed urgent surgery', 'Welfare NGO', '2024-05-30', 'Approved'),
(15, 15, 'Accident Recovery', 15000.00, 'Artisan injured in road accident', 'KVIC Health Wing', '2024-04-12', 'Approved'),
(16, 16, 'Seasonal Unemployment', 10000.00, 'Work stopped due to extreme heat', 'Local NGO', '2024-06-20', 'Approved'),
(17, 17, 'Earthquake Support', 23000.00, 'Damaged craft workshop in Sikkim', 'Disaster Cell', '2024-05-18', 'Approved'),
(18, 18, 'Medical Bills', 14500.00, 'Diabetes and long-term medication cost', 'Artisan Health Board', '2024-06-05', 'Approved'),
(19, 19, 'Tool Subsidy', 9000.00, 'Requested new dyeing tools after flood', 'Craft Aid Department', '2024-06-28', 'Approved'),
(20, 20, 'Raw Material Loss', 13500.00, 'Materials spoiled due to humidity', 'Village Admin Office', '2024-07-01', 'Approved');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Emergency_Grants;

-- to remove complete data from table
truncate table Emergency_Grants;

-- to delete complete attributes and records 
drop table Emergency_Grants;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Alter table to add a column for grant_currency
ALTER TABLE Emergency_Grants
ADD grant_currency VARCHAR(10) DEFAULT 'INR';

-- 2. Modify amount to allow higher values
ALTER TABLE Emergency_Grants
MODIFY amount DECIMAL(12,2);

-- 3. Drop remarks column if needed
ALTER TABLE Emergency_Grants
DROP COLUMN reason;

-- 4. Rename grant_type column to emergency_type
ALTER TABLE Emergency_Grants
RENAME COLUMN grant_type TO emergency_type;

-- 5. Create index on artisan_id for faster lookup
CREATE INDEX idx_artisan ON Emergency_Grants(artisan_id);

-- 6. Update status to 'Pending' for grants approved this month
UPDATE Emergency_Grants
SET status='Pending'
WHERE approval_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 7. Delete emergency grants for duplicate entries (example)
DELETE FROM Emergency_Grants
WHERE grant_id NOT IN (
    SELECT MIN(grant_id)
    FROM Emergency_Grants
    GROUP BY artisan_id, emergency_type
);

-- 8. Increase amount by 10% for medical emergencies
UPDATE Emergency_Grants
SET amount = amount * 1.1
WHERE emergency_type='Medical Aid';

-- 9. Mark all grants older than 1 year as 'Closed'
UPDATE Emergency_Grants
SET status='Closed'
WHERE approval_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 10. Update grant type to 'Emergency Medical Aid' for all Medical Aid grants
UPDATE Emergency_Grants
SET emergency_type='Emergency Medical Aid'
WHERE emergency_type='Medical Aid';

-- 11. Delete grants with zero amount (if mistakenly entered)
DELETE FROM Emergency_Grants
WHERE amount = 0;

-- 12. Increase all Flood Relief grants by 5%
UPDATE Emergency_Grants
SET amount = amount * 1.05
WHERE emergency_type='Flood Relief';

-- 13. Join with Artworks table to see grants related to specific artisan's artworks
SELECT eg.grant_id, a.name, aw.artwork_id, eg.amount
FROM Emergency_Grants eg
JOIN Artisans a ON eg.artisan_id = a.artisan_id
JOIN Artworks aw ON a.artisan_id = aw.artisan_id;

-- 14. Join with Artisans table to get artisan names for each grant
SELECT eg.grant_id, a.name, eg.emergency_type, eg.amount, eg.status
FROM Emergency_Grants eg
JOIN Artisans a ON eg.artisan_id = a.artisan_id;

-- 15. Join with User_Login to find admin who approved grant
SELECT eg.grant_id, eg.emergency_type, ul.username AS approved_by
FROM Emergency_Grants eg
JOIN User_Login ul ON eg.approved_by = ul.username;

-- 16. Left join to see all artisans even if they have no grants
SELECT a.artisan_id, a.name, eg.grant_id
FROM Artisans a
LEFT JOIN Emergency_Grants eg ON a.artisan_id = eg.artisan_id;

-- 17. Total grants given to all artisans
SELECT SUM(amount) AS total_grants FROM Emergency_Grants;

-- 18. Average grant amount per emergency type
SELECT emergency_type, AVG(amount) AS avg_grant
FROM Emergency_Grants
GROUP BY emergency_type;

-- 19. Maximum grant given for Medical Aid
SELECT MAX(amount) AS max_medical_aid
FROM Emergency_Grants
WHERE emergency_type='Medical Aid';

-- 20. Minimum grant for Flood Relief
SELECT MIN(amount) AS min_flood_relief
FROM Emergency_Grants
WHERE emergency_type='Flood Relief';

-- 21. Count of grants approved by each admin
SELECT approved_by, COUNT(*) AS total_approved
FROM Emergency_Grants
GROUP BY approved_by;

-- 22. Running total of grants ordered by approval date
SELECT grant_id, amount,
       SUM(amount) OVER (ORDER BY approval_date) AS running_total
FROM Emergency_Grants;

-- 23. Row number per emergency type
SELECT grant_id, artisan_id, emergency_type,
       ROW_NUMBER() OVER (PARTITION BY emergency_type ORDER BY amount DESC) AS rn
FROM Emergency_Grants;

-- 24. Grants with amount > 20000
SELECT * FROM Emergency_Grants
WHERE amount > 20000;

-- 25. Grants approved by KVIC or Craft Ministry
SELECT * FROM Emergency_Grants
WHERE approved_by IN ('KVIC Board','Craft Ministry');

-- 26. Grants between 10000 and 20000
SELECT * FROM Emergency_Grants
WHERE amount BETWEEN 10000 AND 20000;

-- 27. Grants NOT approved by NGOs
SELECT * FROM Emergency_Grants
WHERE approved_by NOT LIKE '%NGO%';

-- 28. Distinct emergency types
SELECT DISTINCT emergency_type FROM Emergency_Grants;

-- 29. Number of grants per emergency type
SELECT emergency_type, COUNT(*) AS total
FROM Emergency_Grants
GROUP BY emergency_type;

-- 30. Emergency types with average grant > 15000
SELECT emergency_type, AVG(amount) AS avg_amount
FROM Emergency_Grants
GROUP BY emergency_type
HAVING AVG(amount) > 15000;

-- 31. List grants ordered by amount descending
SELECT * FROM Emergency_Grants
ORDER BY amount DESC;

-- 32. Grants greater than average grant
SELECT * FROM Emergency_Grants
WHERE amount > (SELECT AVG(amount) FROM Emergency_Grants);

-- 33. Artisans who received max grant
SELECT artisan_id, amount
FROM Emergency_Grants
WHERE amount = (SELECT MAX(amount) FROM Emergency_Grants);

-- 34. Grants approved by same person who approved Medical Aid
SELECT * FROM Emergency_Grants
WHERE approved_by = (SELECT approved_by
                     FROM Emergency_Grants
                     WHERE emergency_type='Medical Aid'
                     LIMIT 1);

-- 35. Left join to see artisans without any grants
SELECT a.name, eg.grant_id
FROM Artisans a
LEFT JOIN Emergency_Grants eg ON a.artisan_id = eg.artisan_id
WHERE eg.grant_id IS NULL;

-- 36. Inner join with Export_Orders to check if grant helped in export projects
SELECT eg.grant_id, a.name, eo.buyer_country, eo.price
FROM Emergency_Grants eg
JOIN Artisans a ON eg.artisan_id = a.artisan_id
JOIN Export_Orders eo ON a.artisan_id = eo.artwork_id;

-- 37. Cumulative sum of grants for each artisan
SELECT artisan_id, grant_id, amount,
       SUM(amount) OVER (PARTITION BY artisan_id ORDER BY approval_date) AS cumulative_amount
FROM Emergency_Grants;

-- 38. Moving average of grant amounts over last 3 grants
SELECT grant_id, amount,
       AVG(amount) OVER (ORDER BY approval_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Emergency_Grants;

-- 39. Total grants received by each artisan
SELECT artisan_id, SUM(amount) AS total_grants
FROM Emergency_Grants
GROUP BY artisan_id;

-- 40. Grants approved in 2024
SELECT * FROM Emergency_Grants
WHERE YEAR(approval_date) = 2024;

-- 41. Calculate remaining days to end of current year for each grant
SELECT grant_id, DATEDIFF('2024-12-31', approval_date) AS days_remaining
FROM Emergency_Grants;

-- 42. Rank grants by amount per emergency_type
SELECT grant_id, emergency_type, amount,
       RANK() OVER (PARTITION BY emergency_type ORDER BY amount DESC) AS grant_rank
FROM Emergency_Grants;

-- 43. Row number for grants within each approver
SELECT grant_id, approved_by, amount,
       ROW_NUMBER() OVER (PARTITION BY approved_by ORDER BY amount DESC) AS rn
FROM Emergency_Grants;

-- 44. Percentage of total grant amount per artisan
SELECT artisan_id, amount,
       amount * 100.0 / SUM(amount) OVER () AS pct_of_total
FROM Emergency_Grants;

-- 45. Join with Artisans and Export_Orders to see if grants affected exports
SELECT eg.grant_id, a.name, eo.buyer_country, eo.price
FROM Emergency_Grants eg
JOIN Artisans a ON eg.artisan_id = a.artisan_id
LEFT JOIN Export_Orders eo ON a.artisan_id = eo.artwork_id;

-- 46. Inner join to see grants approved by specific approver and corresponding export orders
SELECT eg.grant_id, a.name, eo.export_id, eo.buyer_country
FROM Emergency_Grants eg
JOIN Artisans a ON eg.artisan_id = a.artisan_id
JOIN Export_Orders eo ON a.artisan_id = eo.artwork_id
WHERE eg.approved_by='KVIC Board';

-- 47. Grants where amount > average grant amount per emergency_type
SELECT * FROM Emergency_Grants
WHERE amount > (
    SELECT AVG(amount) 
    FROM Emergency_Grants AS eg2
    WHERE eg2.emergency_type = Emergency_Grants.emergency_type
);

-- 48. Artisans who received grants but no export orders
SELECT artisan_id
FROM Emergency_Grants
WHERE artisan_id NOT IN (SELECT artwork_id FROM Export_Orders);

-- 49. Grants approved by the same approver who approved largest grant
SELECT * FROM Emergency_Grants
WHERE approved_by = (SELECT approved_by FROM Emergency_Grants ORDER BY amount DESC LIMIT 1);

-- 50. Count grants approved by each approver to check for workload
SELECT approved_by, COUNT(*) AS total_approved
FROM Emergency_Grants
GROUP BY approved_by;

-- 51. Grants greater than 15000 AND approved by 'Craft Ministry'
SELECT * FROM Emergency_Grants
WHERE amount > 15000 AND approved_by='Craft Ministry';

-- 52. Grants less than 12000 OR of type 'Medical Aid'
SELECT * FROM Emergency_Grants
WHERE amount < 12000 OR emergency_type='Medical Aid';

-- 53. Grants not approved by KVIC
SELECT * FROM Emergency_Grants
WHERE approved_by <> 'KVIC Board';

-- 54. Grants with amount divisible by 5000
SELECT * FROM Emergency_Grants
WHERE MOD(amount, 5000) = 0;

-- 55. Find artisans who received grants above average
SELECT artisan_id, amount
FROM Emergency_Grants
WHERE amount > (SELECT AVG(amount) FROM Emergency_Grants);

-- 56. Find grants for artisan with max total grants
SELECT * FROM Emergency_Grants
WHERE artisan_id = (
    SELECT artisan_id
    FROM Emergency_Grants
    GROUP BY artisan_id
    ORDER BY SUM(amount) DESC
    LIMIT 1
);

-- 57. Find grants approved by same approver who approved largest grant
SELECT * FROM Emergency_Grants
WHERE approved_by = (
    SELECT approved_by
    FROM Emergency_Grants
    WHERE amount = (SELECT MAX(amount) FROM Emergency_Grants)
);

-- 58. Count of grants per artisan
SELECT artisan_id, COUNT(*) AS total_grants
FROM Emergency_Grants
GROUP BY artisan_id;

-- 59. Average grant amount per approver > 15000
SELECT approved_by, AVG(amount) AS avg_grant
FROM Emergency_Grants
GROUP BY approved_by
HAVING AVG(amount) > 15000;

-- 60. Conditional display: High, Medium, Low grants
SELECT grant_id, amount,
       CASE
           WHEN amount >= 20000 THEN 'High'
           WHEN amount >= 15000 THEN 'Medium'
           ELSE 'Low'
       END AS grant_level
FROM Emergency_Grants;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Table 30: Online_Courses
CREATE TABLE Online_Courses (
    course_id INT PRIMARY KEY, -- unique identifier for each course
    title VARCHAR(100),
    instructor VARCHAR(100),
    duration_weeks INT,
    mode VARCHAR(50) CHECK (mode IN ('Self-paced', 'Live')),
    certification_provided BOOLEAN,
    language VARCHAR(50),
    enroll_link TEXT,
    status VARCHAR(20) DEFAULT 'Available'
);

-- Insert 20 records into Online_Courses table
INSERT INTO Online_Courses (course_id, title, instructor, duration_weeks, mode,certification_provided, language, enroll_link, status)
 VALUES
(1, 'Basics of Madhubani Painting', 'Meera Jha', 4, 'Self-paced', TRUE, 'Hindi', 'https://courses.artpreserve.in/madhubani101', 'Available'),
(2, 'Advanced Terracotta Techniques', 'Rajiv Kumar', 6, 'Live', TRUE, 'English', 'https://courses.artpreserve.in/terracotta-adv', 'Available'),
(3, 'Phad Painting Essentials', 'Nandini Sharma', 3, 'Self-paced', FALSE, 'Hindi', 'https://courses.artpreserve.in/phad', 'Available'),
(4, 'Lacquer Work on Wood', 'Amol Borkar', 5, 'Live', TRUE, 'English', 'https://courses.artpreserve.in/lacquerwork', 'Available'),
(5, 'Warli Art for Beginners', 'Sunita Patil', 2, 'Self-paced', FALSE, 'Marathi', 'https://courses.artpreserve.in/warli-basics', 'Available'),
(6, 'Digital Marketing for Artisans', 'Pooja Mishra', 4, 'Live', TRUE, 'English', 'https://courses.artpreserve.in/digimarket', 'Available'),
(7, 'Craft Entrepreneurship Basics', 'Sanjay Mehta', 3, 'Self-paced', TRUE, 'Hindi', 'https://courses.artpreserve.in/craftbiz', 'Available'),
(8, 'Textile Block Printing', 'Renu Gupta', 6, 'Live', TRUE, 'Hindi', 'https://courses.artpreserve.in/blockprint', 'Available'),
(9, 'Handloom Weaving Intro', 'Kalyani Ramesh', 5, 'Self-paced', FALSE, 'Tamil', 'https://courses.artpreserve.in/handloom101', 'Available'),
(10, 'Etsy Store Setup for Indian Artisans', 'Nikhil Sen', 3, 'Live', TRUE, 'English', 'https://courses.artpreserve.in/etsysetup', 'Available'),
(11, 'Natural Dyeing Techniques', 'Varsha Iyer', 4, 'Self-paced', TRUE, 'English', 'https://courses.artpreserve.in/naturaldye', 'Available'),
(12, 'Chikankari Embroidery Workshop', 'Shabana Parveen', 2, 'Live', FALSE, 'Urdu', 'https://courses.artpreserve.in/chikankari', 'Available'),
(13, 'Marketing Handmade Goods Online', 'Abhay Tiwari', 4, 'Self-paced', TRUE, 'Hindi', 'https://courses.artpreserve.in/onlinebiz', 'Available'),
(14, 'Mirror Work Embroidery Masterclass', 'Bhavna Joshi', 5, 'Live', TRUE, 'Gujarati', 'https://courses.artpreserve.in/mirrorart', 'Available'),
(15, 'Sustainable Craft Practices', 'Neelam Das', 3, 'Self-paced', TRUE, 'English', 'https://courses.artpreserve.in/sustaincraft', 'Available'),
(16, 'Traditional Pottery & Glazing', 'Rakesh Maurya', 6, 'Live', TRUE, 'Hindi', 'https://courses.artpreserve.in/potterycraft', 'Available'),
(17, 'Handmade Paper Techniques', 'Snehal Desai', 3, 'Self-paced', FALSE, 'Marathi', 'https://courses.artpreserve.in/paperart', 'Available'),
(18, 'Leather Puppetry & Painting', 'Vikram Reddy', 4, 'Live', TRUE, 'Telugu', 'https://courses.artpreserve.in/leatherart', 'Available'),
(19, 'Online Sales for Folk Artists', 'Kritika Yadav', 4, 'Self-paced', TRUE, 'Hindi', 'https://courses.artpreserve.in/sellfolk', 'Available'),
(20, 'Craft Photography for Instagram', 'Manoj Kalra', 2, 'Live', FALSE, 'English', 'https://courses.artpreserve.in/craftphoto', 'Available');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- to display/retrieve table data
SELECT * FROM Online_Courses;

-- to remove complete data from table
truncate table Online_Courses;

-- to delete complete attributes and records 
drop table Online_Courses;

-- -------------------------------------------------------------------------- Queries ----------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- 1. Add a new column for course ratings
ALTER TABLE Online_Courses ADD COLUMN rating DECIMAL(3,2);

-- 2. Modify the column to allow NULLs
ALTER TABLE Online_Courses MODIFY COLUMN rating DECIMAL(3,2) NULL;

-- 3. Drop the column rating if not needed
ALTER TABLE Online_Courses DROP COLUMN rating;

-- 4. Update course status after enrollment is closed
UPDATE Online_Courses
SET status = 'Closed'
WHERE course_id = 10;

-- 5. Delete a course no longer offered
DELETE FROM Online_Courses
WHERE course_id = 5;

-- 6. Bulk update: mark all Live courses with certification
UPDATE Online_Courses
SET certification_provided = TRUE
WHERE mode = 'Live';

-- 7. List all available courses
SELECT * FROM Online_Courses
WHERE status = 'Available';

-- 8. Courses taught by a specific instructor
SELECT * FROM Online_Courses
WHERE instructor = 'Meera Jha';

-- 9. Courses longer than 4 weeks
SELECT title, duration_weeks
FROM Online_Courses
WHERE duration_weeks > 4;

-- 10. Self-paced courses offering certification
SELECT * FROM Online_Courses
WHERE mode = 'Self-paced' AND certification_provided = TRUE;

-- 11. Courses taught in Hindi
SELECT title, instructor FROM Online_Courses
WHERE language = 'Hindi';

-- 12. Courses sorted by duration descending
SELECT * FROM Online_Courses
ORDER BY duration_weeks DESC;

-- 13. Count of courses per language
SELECT language, COUNT(*) AS total_courses
FROM Online_Courses
GROUP BY language;

-- 14. Maximum course duration
SELECT MAX(duration_weeks) AS longest_course
FROM Online_Courses;

-- 15. Average course duration
SELECT AVG(duration_weeks) AS avg_duration
FROM Online_Courses;

-- 16. Courses with duration between 3 and 5 weeks
SELECT * FROM Online_Courses
WHERE duration_weeks BETWEEN 3 AND 5;

-- 17. Courses not offering certification
SELECT * FROM Online_Courses
WHERE certification_provided = FALSE;

-- 18. Courses not in Hindi language
SELECT * FROM Online_Courses
WHERE language <> 'Hindi';

-- 19. Courses either Self-paced or taught by Meera Jha
SELECT * FROM Online_Courses
WHERE mode = 'Self-paced' OR instructor = 'Meera Jha';

-- 20. Courses not available and mode is Live
SELECT * FROM Online_Courses
WHERE status != 'Available' AND mode = 'Live';

-- 21. Join Online_Courses with Collaborations (example: instructor linked to partner)
SELECT oc.title, c.partner_name, c.project_theme
FROM Online_Courses oc
LEFT JOIN Collaborations c ON oc.instructor LIKE CONCAT('%', c.partner_name, '%');

-- 22. Join Online_Courses with Export_Orders for marketing courses
SELECT oc.title, eo.buyer_country, eo.price
FROM Online_Courses oc
LEFT JOIN Export_Orders eo ON oc.course_id = eo.export_id;

-- 23. Rank courses by duration
SELECT title, duration_weeks,
       RANK() OVER (ORDER BY duration_weeks DESC) AS duration_rank
FROM Online_Courses;

-- 24. Row number for courses per instructor
SELECT title, instructor,
       ROW_NUMBER() OVER (PARTITION BY instructor ORDER BY duration_weeks DESC) AS rn
FROM Online_Courses;

-- 25. Running total of course duration (example: weekly planning)
SELECT title, duration_weeks,
       SUM(duration_weeks) OVER (ORDER BY course_id) AS cumulative_weeks
FROM Online_Courses;

-- 26. Total number of courses
SELECT COUNT(*) AS total_courses
FROM Online_Courses;

-- 27. Average duration of live courses
SELECT AVG(duration_weeks) AS avg_live_duration
FROM Online_Courses
WHERE mode = 'Live';

-- 28. Convert duration to days
SELECT title, duration_weeks * 7 AS duration_days
FROM Online_Courses;

-- 29. Courses by instructors teaching more than 2 courses
SELECT * FROM Online_Courses
WHERE instructor IN (
    SELECT instructor FROM Online_Courses
    GROUP BY instructor
    HAVING COUNT(*) > 2
);

-- 30. Courses longer than average duration
SELECT * FROM Online_Courses
WHERE duration_weeks > (SELECT AVG(duration_weeks) FROM Online_Courses);

-- 31. Update duration of a specific course
UPDATE Online_Courses
SET duration_weeks = 6
WHERE title = 'Basics of Madhubani Painting';

-- 32. Delete a course that is no longer available
DELETE FROM Online_Courses
WHERE status = 'Unavailable';

-- 33. Update courses to provide certification automatically for English courses
UPDATE Online_Courses
SET certification_provided = TRUE
WHERE language = 'English';

-- 34. Count total number of courses
SELECT COUNT(*) AS total_courses FROM Online_Courses;

-- 35. Average duration of courses
SELECT AVG(duration_weeks) AS avg_duration FROM Online_Courses;

-- 36. Running total of course durations
SELECT title, duration_weeks,
       SUM(duration_weeks) OVER (ORDER BY course_id) AS running_total_duration
FROM Online_Courses;

-- 37. Row number per mode
SELECT title, mode,
       ROW_NUMBER() OVER (PARTITION BY mode ORDER BY course_id) AS row_num
FROM Online_Courses;

-- 38. Rank courses by duration within each language
SELECT title, language, duration_weeks,
       RANK() OVER (PARTITION BY language ORDER BY duration_weeks DESC) AS rank_within_language
FROM Online_Courses;

-- 39. Add UNIQUE constraint to course title
ALTER TABLE Online_Courses
ADD CONSTRAINT unique_course_title UNIQUE(title);

-- 40. Add NOT NULL constraint to instructor
ALTER TABLE Online_Courses
MODIFY instructor VARCHAR(100) NOT NULL;

-- 41. Check constraint: duration should be positive
ALTER TABLE Online_Courses
ADD CONSTRAINT chk_duration CHECK (duration_weeks > 0);

-- 42. Number of courses per instructor
SELECT instructor, COUNT(*) AS total_courses
FROM Online_Courses
GROUP BY instructor;

-- 43. Lowercase instructors' names
SELECT LOWER(instructor) AS lowercase_instructor FROM Online_Courses;

-- 44. Courses grouped by mode with average duration
SELECT mode, AVG(duration_weeks) AS avg_duration
FROM Online_Courses
GROUP BY mode;

-- 45. Courses ordered by language and then by duration descending
SELECT * FROM Online_Courses
ORDER BY language ASC, duration_weeks DESC;

-- 46. Courses longer than the shortest Live course
SELECT * FROM Online_Courses
WHERE duration_weeks > (
    SELECT MIN(duration_weeks) FROM Online_Courses WHERE mode = 'Live'
);

-- 47. Courses taught in the language of the longest course
SELECT * FROM Online_Courses
WHERE language = (
    SELECT language FROM Online_Courses
    ORDER BY duration_weeks DESC LIMIT 1
);

-- 48. Courses with duration equal to the average of all courses
SELECT * FROM Online_Courses
WHERE duration_weeks = (
    SELECT ROUND(AVG(duration_weeks)) FROM Online_Courses
);

-- 49. Cumulative count of courses per language
SELECT title, language,
       COUNT(*) OVER (PARTITION BY language ORDER BY course_id) AS cumulative_count
FROM Online_Courses;

-- 50. Rank instructors by number of courses
SELECT instructor,
       RANK() OVER (ORDER BY COUNT(course_id) DESC) AS instructor_rank
FROM Online_Courses
GROUP BY instructor;

-- 51. Dense rank of courses by duration
SELECT title, duration_weeks,
       DENSE_RANK() OVER (ORDER BY duration_weeks DESC) AS duration_dense_rank
FROM Online_Courses;

-- 52. List courses available for English speakers
SELECT title, instructor, language FROM Online_Courses
WHERE language = 'English' AND status = 'Available';

-- 53. Self-paced courses with certification for artisans
SELECT title, enroll_link
FROM Online_Courses
WHERE mode = 'Self-paced' AND certification_provided = TRUE;

-- 54. Courses suitable for international students (English + Live)
SELECT title, instructor, enroll_link
FROM Online_Courses
WHERE language = 'English' AND mode = 'Live';

-- 55. Count courses by mode
SELECT mode, COUNT(*) AS total_courses
FROM Online_Courses
GROUP BY mode;

-- 56. Maximum duration per language
SELECT language, MAX(duration_weeks) AS max_duration
FROM Online_Courses
GROUP BY language;

-- 57. Minimum duration for self-paced courses
SELECT MIN(duration_weeks) AS min_duration
FROM Online_Courses
WHERE mode = 'Self-paced';

-- 58. Courses longer than the average duration
SELECT * FROM Online_Courses
WHERE duration_weeks > (SELECT AVG(duration_weeks) FROM Online_Courses);

-- 59. Courses with duration equal to the longest Self-paced course
SELECT * FROM Online_Courses
WHERE duration_weeks = (
    SELECT MAX(duration_weeks) FROM Online_Courses WHERE mode = 'Self-paced'
);

-- 60. Update status of a course after completion
UPDATE Online_Courses
SET status = 'Completed'
WHERE course_id = 2;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
