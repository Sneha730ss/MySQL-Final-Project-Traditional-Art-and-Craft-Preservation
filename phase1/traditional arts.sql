-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE Traditional_art_craft_preservation;

-- to work on it, you need to use it first
USE Traditional_art_craft_preservation;

-- delete database
-- DROP DATABASE Traditional_art_craft_preservation;

-- ---------------------------------------- Database Analysis ----------------------------------------
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
-- --------------------------------------- Table Related Queries --------------------------------------

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

-- to display/retrieve table data
SELECT * FROM Artisans;               

-- to remove complete data from table
truncate table Artisans;

-- to delete complete attributes and records 
drop table Artisans;

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

-- to display/retrieve table data
SELECT * FROM Craft_Types;

-- to remove complete data from table
truncate table Craft_Types;

-- to delete complete attributes and records 
drop table Craft_Types;

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

-- to display/retrieve table data
SELECT * FROM Workshops;

-- to remove complete data from table
truncate table Workshops;

-- to delete complete attributes and records 
drop table Workshops;

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

-- to display/retrieve table data
SELECT * FROM Registrations;

-- to remove complete data from table
truncate table Registrations;

-- to delete complete attributes and records 
drop table Registrations;

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

-- to display/retrieve table data
SELECT * FROM Materials;

-- to remove complete data from table
truncate table Materials;

-- to delete complete attributes and records 
drop table Materials;

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

-- to display/retrieve table data
SELECT * FROM Tools;

-- to remove complete data from table
truncate table Tools;

-- to delete complete attributes and records 
drop table Tools;

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

-- to display/retrieve table data
SELECT * FROM Artworks;

-- to remove complete data from table
truncate table Artworks;

-- to delete complete attributes and records 
drop table Artworks;

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

-- to display/retrieve table data
SELECT * FROM Sales;

-- to remove complete data from table
truncate table Sales;

-- to delete complete attributes and records 
drop table Sales;

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

-- to display/retrieve table data
SELECT * FROM Exhibitions;

-- to remove complete data from table
truncate table Exhibitions;

-- to delete complete attributes and records 
drop table Exhibitions;

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

-- to display/retrieve table data
SELECT * FROM Exhibition_Artworks;

-- to remove complete data from table
truncate table Exhibition_Artworks;

-- to delete complete attributes and records 
drop table Exhibition_Artworks;

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

-- to display/retrieve table data
SELECT * FROM Donors;

-- to remove complete data from table
truncate table Donors;

-- to delete complete attributes and records 
drop table Donors;

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

-- to display/retrieve table data
SELECT * FROM Sponsorships;

-- to remove complete data from table
truncate table Sponsorships;

-- to delete complete attributes and records 
drop table Sponsorships;

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

-- to display/retrieve table data
SELECT * FROM Training_Programs;

-- to remove complete data from table
truncate table Training_Programs;

-- to delete complete attributes and records 
drop table Training_Programs;

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

-- to display/retrieve table data
SELECT * FROM Program_Enrollments;

-- to remove complete data from table
truncate table Program_Enrollments;

-- to delete complete attributes and records 
drop table Program_Enrollments;

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

-- to display/retrieve table data
SELECT * FROM Cultural_Events;

-- to remove complete data from table
truncate table Cultural_Events;

-- to delete complete attributes and records 
drop table Cultural_Events;

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

-- to display/retrieve table data
SELECT * FROM Event_Participants;

-- to remove complete data from table
truncate table Event_Participants;

-- to delete complete attributes and records 
drop table Event_Participants;

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

-- to display/retrieve table data
SELECT * FROM Research_Projects;

-- to remove complete data from table
truncate table Research_Projects;

-- to delete complete attributes and records 
drop table Research_Projects;

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

-- to display/retrieve table data
SELECT * FROM Publications;

-- to remove complete data from table
truncate table Publications;

-- to delete complete attributes and records 
drop table Publications;

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

-- to display/retrieve table data
SELECT * FROM Volunteers;

-- to remove complete data from table
truncate table Volunteers;

-- to delete complete attributes and records 
drop table Volunteers;

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

-- to display/retrieve table data
SELECT * FROM Volunteer_Assignments;

-- to remove complete data from table
truncate table Volunteer_Assignments;

-- to delete complete attributes and records 
drop table Volunteer_Assignments;

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

-- to display/retrieve table data
SELECT * FROM Media_Coverage;

-- to remove complete data from table
truncate table Media_Coverage;

-- to delete complete attributes and records 
drop table Media_Coverage;

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

-- to display/retrieve table data
SELECT * FROM Government_Schemes;

-- to remove complete data from table
truncate table Government_Schemes;

-- to delete complete attributes and records 
drop table Government_Schemes;

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

-- to display/retrieve table data
SELECT * FROM Artisan_Feedback;

-- to remove complete data from table
truncate table Artisan_Feedback;

-- to delete complete attributes and records 
drop table Artisan_Feedback;

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

-- to display/retrieve table data
SELECT * FROM Preservation_Techniques;

-- to remove complete data from table
truncate table Preservation_Techniques;

-- to delete complete attributes and records 
drop table Preservation_Techniques;

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

-- to display/retrieve table data
SELECT * FROM User_Login;

-- to remove complete data from table
truncate table User_Login;

-- to delete complete attributes and records 
drop table User_Login;

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

-- to display/retrieve table data
SELECT * FROM Raw_Material_Suppliers;

-- to remove complete data from table
truncate table Raw_Material_Suppliers;

-- to delete complete attributes and records 
drop table Raw_Material_Suppliers;

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

-- to display/retrieve table data
SELECT * FROM Collaborations;

-- to remove complete data from table
truncate table Collaborations;

-- to delete complete attributes and records 
drop table Collaborations;

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

-- to display/retrieve table data
SELECT * FROM Export_Orders;

-- to remove complete data from table
truncate table Export_Orders;

-- to delete complete attributes and records 
drop table Export_Orders;

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

-- to display/retrieve table data
SELECT * FROM Emergency_Grants;

-- to remove complete data from table
truncate table Emergency_Grants;

-- to delete complete attributes and records 
drop table Emergency_Grants;

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

-- to display/retrieve table data
SELECT * FROM Online_Courses;

-- to remove complete data from table
truncate table Online_Courses;

-- to delete complete attributes and records 
drop table Online_Courses;

