create table application_degrees (
        application_id int8 not null,
        name varchar(255),
        school varchar(255),
        year int4
    );

    create table applications (
        id int8 not null,
        current_job_institution varchar(255),
        current_job_title varchar(255),
        current_job_year int4,
        submit_date timestamp,
        applicant_id int8,
        cv_id int8,
        job_id int8,
        research_statement_id int8,
        teaching_statement_id int8,
        primary key (id)
    );

    create table authorities (
        user_id int8 not null,
        role varchar(255)
    );

    create table files (
        id int8 not null,
        data bytea,
        date timestamp,
        name varchar(255),
        size int8,
        type varchar(255),
        owner_id int8,
        primary key (id)
    );

    create table job_committee_members (
        job_id int8 not null,
        user_id int8 not null
    );

    create table jobs (
        id int8 not null,
        close_date timestamp,
        description varchar(255),
        publish_date timestamp,
        title varchar(255),
        committee_chair_id int8,
        primary key (id)
    );

    create table reviews (
        id int8 not null,
        comments varchar(255),
        date timestamp,
        rank int4,
        reviewer_id int8,
        round_id int8,
        primary key (id)
    );

    create table rounds (
        id int8 not null,
        round_index int4 not null,
        passed boolean not null,
        application_id int8,
        primary key (id)
    );

    create table users (
        id int8 not null,
        address varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255) not null,
        phone varchar(255),
        enabled boolean not null,
        primary key (id)
    );

    alter table applications 
        add constraint UK_64ys5tle1oyk7oolbnglyrws3 unique (job_id, applicant_id);

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table application_degrees 
        add constraint FK_p23g7k8rypw0ba1ekhgytb5g 
        foreign key (application_id) 
        references applications;

    alter table applications 
        add constraint FK_lmcomkxa52fc4kw1pgin4ov1i 
        foreign key (applicant_id) 
        references users;

    alter table applications 
        add constraint FK_45fx5ileqp86itptlqie2vwp0 
        foreign key (cv_id) 
        references files;

    alter table applications 
        add constraint FK_3k2w7gtt3v412p8xhjmrfdjqo 
        foreign key (job_id) 
        references jobs;

    alter table applications 
        add constraint FK_5wuipr3kwue77u3x0x6xfqnaa 
        foreign key (research_statement_id) 
        references files;

    alter table applications 
        add constraint FK_lp9a5ppf6ye4dedegq72a32t4 
        foreign key (teaching_statement_id) 
        references files;

    alter table authorities 
        add constraint FK_s21btj9mlob1djhm3amivbe5e 
        foreign key (user_id) 
        references users;

    alter table files 
        add constraint FK_5ok1awgnfwcf01537ylbycyq1 
        foreign key (owner_id) 
        references users;

    alter table job_committee_members 
        add constraint FK_8i1xpob5ig8dunf8go0gceh4b 
        foreign key (user_id) 
        references users;

    alter table job_committee_members 
        add constraint FK_d12kbfko72rgnlcp96meiykvv 
        foreign key (job_id) 
        references jobs;

    alter table jobs 
        add constraint FK_4gbcg6sweyjppsfb9tw4fk1yp 
        foreign key (committee_chair_id) 
        references users;

    alter table reviews 
        add constraint FK_bnaf4eil2cek30ntv43920vu 
        foreign key (reviewer_id) 
        references users;

    alter table reviews 
        add constraint FK_lrodxjcqcl3wfmb4bkhvrxolx 
        foreign key (round_id) 
        references rounds;

    alter table rounds 
        add constraint FK_38dtvawacp71xvc1dpfrpapin 
        foreign key (application_id) 
        references applications;

 
    create sequence hibernate_sequence minvalue 100;



INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (1, 'Azusa ave', 'admin@localhost.localdomain', 'Cy', 'Sun', 'abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (2, 'Green st', 'reviewer1@localhost.localdomain', 'Sam', 'Gell', 'abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (3, 'Blue st', 'reviewer2@localhost.localdomain', 'Jane', 'Bin', 'abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (4, 'Long beach', 'reviewer3@localhost.localdomain', 'Ross', 'Doee','abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (5, 'Vincent ave', 'reviewer4@localhost.localdomain', 'Joe', 'Pinto','abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (6, 'Covina', 'applicant1@localhost.localdomain', 'John', 'Dell','abcd', '12345', true);

INSERT INTO users(
            id, address, email, first_name, last_name, password, phone, enabled)
    VALUES (7, 'La', 'applicant2@localhost.localdomain', 'Peter', 'Ponting','abcd', '12345', true);
	
    
INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (1, '2015-09-14', 'Tenure-Track Faculty Position (Start Fall 2015)', '2015-07-14', 'Tenure-Track Faculty Position (Start Fall 2015)', 2);

INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (2, '2016-09-14', 'Tenure-Track Faculty Position (Start Fall 2016)', '2016-07-14', 'Tenure-Track Faculty Position (Start Fall 2016)', 3);
    
INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (3, '2015-12-21', 'Software Developer', '2015-06-14', 'Software Developer', 4);
    
INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (4, '2015-10-19', 'Project Manager', '2015-07-25', 'Project Manager', 5);

INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (5, '2015-08-01', 'Sr. Consultant', null, 'Sr. Consultant', 2);
    
INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (6, null, 'Software Tester', '2015-07-28', 'Software Tester', 3);

INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (7, '2015-08-10', 'Sr. Architect', '2015-06-10', 'Sr. Architect', 4);

INSERT INTO jobs(
            id, close_date, description, publish_date, title, committee_chair_id)
    VALUES (8, '2015-11-14', 'Designer', '2015-07-28', 'Designer', 5);


INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (1, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (1, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (1, 4);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (2, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (2, 4);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (2, 5);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (3, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (3, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (3, 4);
    
    
INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (4, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (4, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (4, 5);
    
    
INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (5, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (5, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (5, 4);
    
    
INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (6, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (6, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (6, 4);
    
INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (7, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (7, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (7, 4);
    
INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (8, 2);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (8, 3);

INSERT INTO job_committee_members(
            job_id, user_id)
    VALUES (8, 5);
    
	
INSERT INTO authorities(
            user_id, role)
    VALUES (1, 'ROLE_ADMIN');

INSERT INTO authorities(
            user_id, role)
    VALUES (2, 'ROLE_REVIEWER');

INSERT INTO authorities(
            user_id, role)
    VALUES (3, 'ROLE_REVIEWER');

INSERT INTO authorities(
            user_id, role)
    VALUES (4, 'ROLE_REVIEWER');

INSERT INTO authorities(
            user_id, role)
    VALUES (5, 'ROLE_REVIEWER');
	
INSERT INTO applications(
            id, current_job_institution, current_job_title, current_job_year, 
            submit_date, applicant_id, cv_id, job_id, research_statement_id, 
            teaching_statement_id)
    VALUES (1, 'infy', 'ta', 2015, 
            '2015-07-15', 6,null, 1, null, 
            null);


INSERT INTO applications(
            id, current_job_institution, current_job_title, current_job_year, 
            submit_date, applicant_id, cv_id, job_id, research_statement_id, 
            teaching_statement_id)
    VALUES (2, 'cts', 'la', 2015, 
            '2015-07-14', 7, null, 1, null, 
            null);
            
INSERT INTO application_degrees(
            application_id, name, school, year)
    VALUES (1, 'MS', 'CSU', 2014);
    
INSERT INTO application_degrees(
            application_id, name, school, year)
    VALUES (2, 'MIS', 'SCU', 2012);