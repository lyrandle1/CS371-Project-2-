use mysql;

DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance (
  attendence_id int(11) NOT NULL,
  response_datetime varchar(25) DEFAULT NULL,
  employee_id int(11) DEFAULT NULL,
  response_type_id int(11) DEFAULT NULL,
  meeting_id int(11) DEFAULT NULL,
  attendance_status int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS attendance_statuses;
CREATE TABLE attendance_statuses (
  attendence_status_id int(11) NOT NULL,
  attendence_status_nam varchar(25) DEFAULT NULL
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  Employee_ID int(11) NOT NULL,
  usrFirst_name varchar(25) DEFAULT NULL,
  usrSecond_name varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS meetings;
CREATE TABLE meetings (
  meeting_id int(11) NOT NULL,
  meeting_name varchar(25) DEFAULT NULL,
  meeting_description varchar(25) DEFAULT NULL,
  meeting_datetime date DEFAULT NULL,
  meeting_duration varchar(25) DEFAULT NULL,
  meeting_status_id int(11) DEFAULT NULL,
  meeting_room_id int(11) DEFAULT NULL,
  organizer_id int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS meeting_status;
CREATE TABLE meeting_status (
  meeting_status_id int(11) NOT NULL,
  meeting_status_name varchar(25) DEFAULT NULL
);

DROP TABLE IF EXISTS response_types;
CREATE TABLE response_types (
  response_type_id int(11) NOT NULL,
  response_name varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
  room_id int(11) NOT NULL,
  capacity varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
