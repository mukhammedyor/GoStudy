CREATE DATABASE study;

CREATE TABLE states (
    state_id bigserial not null PRIMARY KEY,
    state_name CHARACTER VARYING(64)
);

CREATE TABLE regions (
    region_id bigserial not null PRIMARY key,
    region_name CHARACTER VARYING(64),
    state_ref_id int not null REFERENCES states(state_id)
);

CREATE TABLE courses (
    course_id bigserial not null PRIMARY KEY,
    course_name CHARACTER VARYING(64),
    state_ref_id int not null REFERENCES states(state_id),
    region_ref_id int not null REFERENCES regions(region_id)
);

CREATE TABLE educationCenters (
    education_id bigserial not null PRIMARY KEY,
    education_name CHARACTER VARYING(64),
    state_ref_id int not null REFERENCES states(state_id),  
    region_ref_id int not null REFERENCES regions(region_id),
    course_ref_id int not null REFERENCES courses(course_id)
);

-- select 
--     s.state_name, r.region_name, c.course_name, e.education_name
-- from regions r 
-- natural join states s 
-- natural join courses c 
-- natural join educationCenters e;


INSERT INTO states (state_name) VALUES ('Tashkent'); 
INSERT INTO states (state_name) VALUES ('Andijon');
INSERT INTO states (state_name) VALUES ('Farg`ona');

INSERT INTO regions (region_name, state_ref_id) VALUES ('Chilonzor', 1);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Shayxontohur', 1);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Yakkasaroy', 1);


INSERT INTO regions (region_name, state_ref_id) VALUES ('Asaka', 2);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Shahrixon', 2);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Oltinko`l', 2);

INSERT INTO regions (region_name, state_ref_id) VALUES ('Qo`qon', 3);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Bag`dod', 3);
INSERT INTO regions (region_name, state_ref_id) VALUES ('Rishton', 3);

--Toshkent
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('English', 1, 1);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Arab Tili', 1, 1);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('IT', 1, 2);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Sun`iy Intellekt', 1, 2);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Arab Tili', 1, 3);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Turk Tili', 1, 3);

--Andijon
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Arab Tili', 2, 4);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('English', 2, 4);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Robotatexnika', 2, 5);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('IT ', 2, 5);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Arab Tili', 2, 6);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Turk Tili', 2, 6);

--Fargona
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Engliah', 3, 7);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Turk Tili', 3, 7);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('IT', 3, 8);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Arab Tili', 3, 8);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('Turk Tili', 3, 9);
INSERT INTO courses (course_name, state_ref_id, region_ref_id) VALUES ('English', 3, 9);

--chilonzor 
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Cambridge', 1, 1, 1);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Tompson School', 1, 1, 1);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Tompson School', 1, 1, 2);

--shayxontohur 

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('PDP', 1, 2, 3);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Najot Ta`lim', 1, 2, 3);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Najot Ta`lim', 1, 2, 4);

--yakkasaroy 
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Registon', 1, 3, 5);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Registon', 1, 3, 6);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Everest',  1, 3, 6);

--asaka 
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Target', 2, 4, 7);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('English with Tim', 2, 4, 7);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('English with Tim', 2, 4, 8);

--shaxrixon 

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Robocode', 2, 5, 9);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Intellekt', 2, 5, 9);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Robocode', 2, 5, 10);

--oltinkol 

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Everest', 2, 6, 11);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Everest', 2, 6, 11);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Friends School', 2, 6, 12);

--qoqon

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('London School', 3, 7, 13);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Friends School', 3, 7, 14);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('London School', 3, 7, 14);

--bagdod 

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Najot Ta`lim', 3, 8, 15);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Najot Ta`lim', 3, 8, 15);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('London School', 3, 8, 16);

--rishton 

INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Everest', 3, 8, 17);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Everest', 3, 8, 18);
INSERT INTO educationCenters (education_name, state_ref_id, region_ref_id, course_ref_id) VALUES ('Cambridge', 3, 8, 18);


-- select 
--     s.state_name, r.region_name, c.course_name, e.education_name
-- from regions r 
-- natural join states s
-- natural join courses c
-- natural join educationCenters e;