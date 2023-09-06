-- create table departments
CREATE TABLE departments (
    id uuid NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255),
    active boolean DEFAULT true,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- create table users
CREATE TABLE users (
    id int,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    gender ENUM('male', 'female'),
    contact varchar(255),
    country_code varchar(255),
    phone_number varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

-- create table programs
CREATE TABLE programs (
    id int NOT NULL,
    name varchar(255),
    description varchar(255),
    department_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    PRIMARY KEY (id)
)

-- create table students
CREATE TABLE students (
    id int,
    name varchar(255),
    entry_year int,
    data_of_birth DATE,
    gender ENUM('male', 'female'),
    status varchar(255) DEFAULT 'active',
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    department_id int,
    program_id int,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (program_id) REFERENCES programs(id),
    PRIMARY KEY (id)
)

-- create table courses
CREATE TABLE courses (
    id int,
    name varchar(255),
    code varchar(255),
    description varchar(255),
    duration int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    department_id int,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    PRIMARY KEY (id)
)

-- create table student_courses
CREATE TABLE student_courses (
    id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    student_id int,
    course_id int,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    PRIMARY KEY (id)
)

-- create table instructors
CREATE TABLE instructors (
    id int,
    name varchar(255),
    experience int,
    title varchar(255),
    gender enum('male', 'female'),
    contact varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
)

-- create table admin
CREATE TABLE admin (
    id int,
    name varchar(255),
    role varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
)

-- create table instructor_courses
CREATE TABLE instructor_courses (
    id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    instructor_id int,
    course_id int,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    PRIMARY KEY (id)
)

-- INSERT INTO table1 
-- (field1, field2) 
-- VALUES (value1, value2);

-- insert into departments
insert into departments 
(id, name, description, active) 
values (1, 'SOE', 'School Of Engineering', true)

-- insert into departments
insert into departments 
(id, name, description, active) 
values (2, 'SOP', 'School Of Product', true)

-- insert into departments
insert into departments 
(id, name, description, active) 
values (3, 'SOD', 'School Of Data', true)


-- select all departments
select * from departments

-- update a department
update departments 
set name = 'SOD' 
where id = 3

-- delete a department
delete from departments
where id = 3

-- select all departments based on column name
select id, name, description from departments 
where active = true or name = 'SOP'

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (1, 'NodeJS', 'Backend Engineering Nodejs', 2)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (2, 'Python', 'Backend Engineering Python', 1)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (3, 'Ruby', 'Backend Engineering Ruby', 1)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (4, 'Product Design', 'Design', 2)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (5, 'Product Management', 'Management', 2)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (6, 'Data Science', 'Data', 3)

-- inserting into programs table
insert into programs 
(id, name, description, department_id) 
values (7, 'Data Analysis', 'Data', 3)

-- select all programs based on department id(joins)
select * from programs join departments on departments.id = programs.department_id

