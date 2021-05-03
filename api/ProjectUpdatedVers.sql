create database project2;

use project2;

DROP TABLE IF EXISTS attendance_statuses;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS meeting_status;
DROP TABLE IF EXISTS response_types;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS meetings;
DROP TABLE IF EXISTS attendance;

CREATE TABLE if not exists attendance_statuses (
  attendence_status_id int(4) NOT NULL primary key,
  attendence_status_nam varchar(25) DEFAULT NULL
);


CREATE TABLE if not exists employee (
  Employee_ID int(4) NOT NULL primary key,
  usrFirst_name varchar(25) DEFAULT NULL,
  usrSecond_name varchar(25) DEFAULT NULL
);

    

CREATE TABLE if not exists meeting_status (
  meeting_status_id int(11) NOT NULL primary key,
  meeting_status_name varchar(25) DEFAULT NULL
);


CREATE TABLE if not exists response_types (
  response_type_id int(1) NOT NULL primary key,
  response_name char(25) DEFAULT NULL
);


CREATE TABLE if not exists rooms (
  room_id int(3) NOT NULL primary key,
  capacity int(3) DEFAULT NULL
);


CREATE TABLE if not exists meetings (
  meeting_id int(4) NOT NULL primary key,
  meeting_name varchar(25) DEFAULT NULL,
  meeting_description varchar(25) DEFAULT NULL,
  meeting_datetime datetime DEFAULT NULL,
  meeting_duration varchar(25) DEFAULT NULL,
  meeting_status_id int(4) DEFAULT NULL,
  meeting_room_id int(4) DEFAULT NULL,
  organizer_id int(4) DEFAULT NULL,
  CONSTRAINT FK_meeting_roomid FOREIGN KEY (meeting_room_id) REFERENCES 
  rooms (room_id),
  CONSTRAINT FK_meeting_status FOREIGN KEY (meeting_status_id) REFERENCES 
  meeting_status (meeting_status_id),
  CONSTRAINT meetings_ibfk_1 FOREIGN KEY (organizer_id) REFERENCES 
  employee (Employee_ID)
);


CREATE TABLE if not exists attendance (
  attendence_id int(4) NOT NULL primary key,
  response_datetime datetime,
  employee_id int(4),
  response_type_id int(1),
  meeting_id int(4),
  attendance_status_id int(4),
  CONSTRAINT fkresponsetypeid FOREIGN KEY (response_type_id) REFERENCES 
  response_types (response_type_id),
  CONSTRAINT fkattendenceempid FOREIGN KEY (employee_id) REFERENCES 
  employee (Employee_ID),
  CONSTRAINT fkattendenceststusid FOREIGN KEY (attendance_status_id) REFERENCES 
  attendance_statuses (attendence_status_id) ON DELETE RESTRICT,
  CONSTRAINT fkmeetingid FOREIGN KEY (meeting_id) REFERENCES 
  meetings (meeting_id)
);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0110, 0100);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0220, 0200);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0330, 0300);

INSERT INTO response_types( response_type_id, response_name) VALUES (1, 'yes');

INSERT INTO response_types( response_type_id, response_name) VALUES (2, 'yes');

INSERT INTO response_types( response_type_id, response_name) VALUES (3, 'yes');

INSERT INTO rooms(room_id, capacity) VALUES (1, 50);

INSERT INTO rooms(room_id, capacity) VALUES (2, 35);

INSERT INTO rooms(room_id, capacity) VALUES (3, 60);

INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (1000, 'yes');

INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (2000, 'yes');

INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (3000, 'yes');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0001, 'Jacob', 'Skinner');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0002, 'Alyssa', 'Smith');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0003, 'Tanner', 'Coate');

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration) 
VALUES (0011, 'meeting 1', 'salary changes', '2000-3-3 12:33', '60 m');

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration) 
VALUES (0022, 'meeting 2', 'terminations', '2020-4-1 15:33', '60 m');

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration) 
VALUES (0033, 'meeting 3', 'new hires', '2015-6-7 15:33', '60 m');

INSERT INTO attendance(attendence_id, response_datetime) VALUES (1111, '1995-10-10 06:43');
 
INSERT INTO attendance(attendence_id, response_datetime) VALUES (2222, '2003-06-10 09:12');
 
INSERT INTO attendance(attendence_id, response_datetime) VALUES (3333, '2009-04-20 07:55');
 
