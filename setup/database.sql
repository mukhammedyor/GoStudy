-- CREATE DATABASE study;

CREATE TABLE states (
    state_id bigserial not null PRIMARY KEY,
    state_name CHARACTER VARYING(64)
);

CREATE TABLE regions (
    region_id bigserial not null PRIMARY key,
    region_name CHARACTER VARYING(64),
    state_id int not null REFERENCES states(state_id)
);

CREATE TABLE educationCenters  (
    education_id bigserial not null PRIMARY KEY,
    edu_name CHARACTER VARYING(64),
    address varchar(128) not null,
    region_id int not null REFERENCES regions(region_id)
);

CREATE TABLE courses (
    course_id bigserial not null PRIMARY KEY,
    course_name CHARACTER VARYING(64), 
    education_id int not null REFERENCES educationCenters(education_id)
);

-- CREATE TABLE branches (
-- 	branch_id bigserial not null PRIMARY KEY,
-- 	branch_name CHARACTER VARYING(64),
-- 	region_id int not null REFERENCES regions(region_id),
-- 	is_main  boolean default false
-- );

-- CREATE TABLE images (
--     image_id bigserial not null PRIMARY KEY,
--     image_path VARCHAR(128) not null,
--     education_id int not null REFERENCES educationCenters(education_id)
-- );





INSERT INTO states (state_name) VALUES ('Tashkent');  
INSERT INTO states (state_name) VALUES ('Andijon'); 

INSERT INTO regions (region_name, state_id) VALUES ('Chilonzor', 1);  
INSERT INTO regions (region_name, state_id) VALUES ('Shayxontohur', 1);  
INSERT INTO regions (region_name, state_id) VALUES ('Olmazor', 1);  
 
INSERT INTO regions (region_name, state_id) VALUES ('Asaka', 2);   
INSERT INTO regions (region_name, state_id) VALUES ('Shahrixon', 2);  
INSERT INTO regions (region_name, state_id) VALUES ('Oltinko`l', 2);  


INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('Najot Talim', 'Shayxontohur, Xadra Maydoni', 2);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('PDP', 'Shayxontohur, Zarqayraq ko`chasi', 2);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('Najot Talim', 'Olmazor, Kichik halqa yo`li 72A ', 3);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('Cambridge', 'Chilonzor metro', 1);

INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('RoboCode', 'Asaka shahar', 4);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('Target',   'Asaka shahar', 4);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('RoboCode','Shahrixon shahar', 5);
INSERT INTO educationCenters (edu_name, address, region_id) VALUES ('Everest', 'Oltinko`l shahar', 6);


INSERT INTO courses (course_name, education_id) VALUES ('Web Dasturlash', 1);
INSERT INTO courses (course_name, education_id) VALUES ('SMM', 1);
INSERT INTO courses (course_name, education_id) VALUES ('Web Dasturlash', 2);
INSERT INTO courses (course_name, education_id) VALUES ('Suniy Intellekt', 2);
INSERT INTO courses (course_name, education_id) VALUES ('Web Dasturlash', 3);
INSERT INTO courses (course_name, education_id) VALUES ('SMM', 3);
INSERT INTO courses (course_name, education_id) VALUES ('General English', 4);

INSERT INTO courses (course_name, education_id) VALUES ('Robototexnika', 5);
INSERT INTO courses (course_name, education_id) VALUES ('General English', 6);
INSERT INTO courses (course_name, education_id) VALUES ('Robototexnika', 7);
INSERT INTO courses (course_name, education_id) VALUES ('IELTS', 8);

-- INSERT INTO	 branches (branch_name, region_id, is_main) VALUES ('Najot Talim', 3, true);
-- INSERT INTO  branches (branch_name, region_id, is_main) VALUES ('Najot Talim', 2, false);
-- INSERT INTO  branches (branch_name, region_id, is_main) VALUES ('PDP', 2, true);
-- INSERT INTO  branches (branch_name, region_id, is_main) VALUES ('Cambridge', 1, true);

-- INSERT INTO branches (branch_name, region_id, is_main) VALUES ('RoboCode', 4, true);
-- INSERT INTO branches (branch_name, region_id, is_main) VALUES ('Target', 4, true);
-- INSERT INTO branches (branch_name, region_id, is_main) VALUES ('RoboCode', 5, false);
-- INSERT INTO branches (branch_name, region_id, is_main) VALUES ('Everest', 6, true);

	select 
        s.state_id, s.state_name, r.region_id, r.region_name, r.state_id, e.education_id, e.edu_name, e.address, e.region_id,
        c.course_id, c.course_name, c.education_id
    from regions r
    INNER join states s on s.state_id = r.state_id
    INNER join educationCenters e on e.region_id = r.region_id
    INNER join courses c on c.education_id = e.education_id;


    select 
        r.region_id, r.region_name, e.education_id, e.region_id, c.course_name
    from courses c 
    inner join educationCenters e on e.education_id = c.education_id
    inner join regions r on r.region_id = e.education_id;

-- select r.region_name, e.edu_name, c.course_name
-- from regions r
-- natural join educationCenters e
-- natural join courses c
-- offset 0 fetch first 1 row only;