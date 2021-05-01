use mysql;

DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance (
  attendence_id int(4) NOT NULL,
  response_datetime varchar(9) DEFAULT NULL,
  employee_id int(4) DEFAULT NULL,
  response_type_id char(1) DEFAULT NULL,
  meeting_id int(4) DEFAULT NULL,
  attendance_status char(1) DEFAULT NULL
);

DROP TABLE IF EXISTS attendance_statuses;
CREATE TABLE attendance_statuses (
  attendence_status_id int(4) NOT NULL,
  attendence_status_nam varchar(25) DEFAULT NULL
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  Employee_ID int(4) NOT NULL,
  usrFirst_name varchar(25) DEFAULT NULL,
  usrSecond_name varchar(25) DEFAULT NULL
);

DROP TABLE IF EXISTS meetings;
CREATE TABLE meetings (
  meeting_id int(4) NOT NULL,
  meeting_name varchar(25) DEFAULT NULL,
  meeting_description varchar(25) DEFAULT NULL,
  meeting_datetime varchar(8) DEFAULT NULL,
  meeting_duration varchar(25) DEFAULT NULL,
  meeting_status_id int(4) DEFAULT NULL,
  meeting_room_id int(4) DEFAULT NULL,
  organizer_id int(4) DEFAULT NULL
);

DROP TABLE IF EXISTS meeting_status;
CREATE TABLE meeting_status (
  meeting_status_id int(11) NOT NULL,
  meeting_status_name varchar(25) DEFAULT NULL
);

DROP TABLE IF EXISTS response_types;
CREATE TABLE response_types (
  response_type_id int(1) NOT NULL,
  response_name char(25) DEFAULT NULL
);

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
  room_id int(3) NOT NULL,
  capacity int(3) DEFAULT NULL
);

ALTER TABLE attendance
  ADD PRIMARY KEY (attendence_id),
  ADD KEY fkattendenceempid (employee_id),
  ADD KEY addfkresponsetypeid (response_type_id),
  ADD KEY fkmeetingid (meeting_id),
  ADD KEY fkattendencetstusid (attendance_status);

ALTER TABLE attendance_statuses
  ADD PRIMARY KEY (attendence_status_id);

ALTER TABLE employee
  ADD KEY (Employee_ID);

ALTER TABLE meetings
  ADD PRIMARY KEY (meeting_id),
  ADD KEY FK_meeting_status (meeting_status_id),
  ADD KEY FK_meeting_roomid (meeting_room_id),
  ADD KEY organizer_id (organizer_id);

ALTER TABLE meeting_status
  ADD PRIMARY KEY (meeting_status_id);

ALTER TABLE response_types
  ADD PRIMARY KEY (response_type_id);

ALTER TABLE rooms
  ADD PRIMARY KEY (room_id),
  ADD UNIQUE KEY roomid (room_id);

ALTER TABLE meetings
  MODIFY meeting_id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE rooms
  MODIFY room_id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE attendance
  ADD CONSTRAINT addfkresponsetypeid FOREIGN KEY (response_type_id) REFERENCES response_types (response_type_id) ON DELETE CASCADE,
  ADD CONSTRAINT fkattendenceempid FOREIGN KEY (employee_id) REFERENCES employee (Employee_ID) ON DELETE CASCADE,
  ADD CONSTRAINT fkattendenceststusid FOREIGN KEY (attendance_status) REFERENCES attendance_statuses (attendence_status_id),
  ADD CONSTRAINT fkattendencetstusid FOREIGN KEY (attendance_status) REFERENCES attendance_statuses (attendence_status_id),
  ADD CONSTRAINT fkmeetingid FOREIGN KEY (meeting_id) REFERENCES meetings (meeting_id) ON DELETE CASCADE;

ALTER TABLE meetings
  ADD CONSTRAINT FK_meeting_roomid FOREIGN KEY (meeting_room_id) REFERENCES rooms (room_id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_meeting_status FOREIGN KEY (meeting_status_id) REFERENCES meeting_status (meeting_status_id) ON DELETE CASCADE,
  ADD CONSTRAINT meetings_ibfk_1 FOREIGN KEY (organizer_id) REFERENCES employee (Employee_ID) ON DELETE CASCADE;
  
INSERT INTO attendance(attendence_id, response_datetime, employee_id,
response_type_id, meeting_id, attendance_status) VALUES (1111, '01/01/00', 0001, 'Y', 0011, 'Y');
 
INSERT INTO attendance(attendence_id, response_datetime, employee_id,
response_type_id, meeting_id, attendance_status) VALUES (2222, '02/02/00', 0002, 'Y', 0022, 'Y');
 
INSERT INTO attendance(attendence_id, response_datetime, employee_id,
response_type_id, meeting_id, attendance_status) VALUES (3333, '03/03/00', 0003, 'Y', 0033, 'Y');
 
INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (1000, 'yes');

INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (2000, 'yes');

INSERT INTO attendance_statuses(attendence_status_id, attendence_status_nam) VALUES (3000, 'yes');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0001, 'Jacob', 'Skinner');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0002, 'Alyssa', 'Smith');

INSERT INTO employee(Employee_ID, usrFirst_name, usrSecond_name) VALUES (0003, 'Tanner', 'Coate');

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration, meeting_status_id,
meeting_room_id, organizer_id) VALUES (0011, 'meeting 1', 'salary changes', '01/10/00', '60 m', 0110, 1111, 0010);

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration, meeting_status_id,
meeting_room_id, organizer_id) 
VALUES (0022, 'meeting 2', 'terminations', '02/20/00', '60 m', 0220, 2222, 0020);

INSERT INTO meetings(meeting_id, meeting_name, meeting_description, meeting_datetime, meeting_duration, meeting_status_id,
meeting_room_id, organizer_id) 
VALUES (0033, 'meeting 3', 'new hires', '03/30/00', '60 m', 0330, 3333, 0030);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0110, 0100);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0220, 0200);

INSERT INTO meeting_status( meeting_status_id, meeting_status_name) VALUES ( 0330, 0300);

INSERT INTO response_types( response_type_id, response_name) VALUES (1, 'yes');

INSERT INTO response_types( response_type_id, response_name) VALUES (2, 'yes');

INSERT INTO response_types( response_type_id, response_name) VALUES (3, 'yes');

INSERT INTO rooms(room_id, capacity) VALUES (1, 50);

INSERT INTO rooms(room_id, capacity) VALUES (2, 35);

INSERT INTO rooms(room_id, capacity) VALUES (3, 60);

